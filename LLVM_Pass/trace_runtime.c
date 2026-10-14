#include <errno.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static FILE *trace_file;
static FILE *opcode_file;
static uint64_t edge_count;
static uint64_t edge_limit = 20000000ULL;
static uint64_t frame_count;
static uint64_t frame_limit = 2;
static int initialized;
static int closed;
static char trace_filename[4096];

static uint64_t read_uint_env(const char *name, uint64_t fallback) {
    const char *s = getenv(name);
    if (!s || !*s)
        return fallback;
    errno = 0;
    char *end = NULL;
    unsigned long long value = strtoull(s, &end, 10);
    if (errno || end == s || *end != '\0') {
        fprintf(stderr, "Invalid %s: %s\n", name, s);
        exit(2);
    }
    return (uint64_t)value;
}

static void trace_finish(void) {
    if (closed || !initialized)
        return;
    closed = 1;
    if (trace_file) {
        if (fclose(trace_file)) {
            perror(trace_filename);
        }
        trace_file = NULL;
    }
    if (opcode_file) {
        fclose(opcode_file);
        opcode_file = NULL;
    }
    fprintf(stderr, "TRACE: %" PRIu64 " edges; %" PRIu64
                    " completed flushes; %s\n",
            edge_count, frame_count, trace_filename);
}

static void trace_init(void) {
    if (initialized)
        return;
    initialized = 1;
    edge_limit = read_uint_env("TRACE_MAX_EDGES", edge_limit);
    frame_limit = read_uint_env("TRACE_FRAMES", frame_limit);
    const char *dir = getenv("TRACE_DIR");
    if (!dir || !*dir)
        dir = ".";
    char map_filename[4096];
    int n1 = snprintf(trace_filename, sizeof(trace_filename),
                      "%s/trace.bin", dir);
    int n2 = snprintf(map_filename, sizeof(map_filename),
                      "%s/opcodes.tsv", dir);
    if (n1 <= 0 || (size_t)n1 >= sizeof(trace_filename) ||
        n2 <= 0 || (size_t)n2 >= sizeof(map_filename)) {
        fputs("TRACE_DIR path is too long\n", stderr);
        exit(2);
    }
    trace_file = fopen(trace_filename, "wb");
    opcode_file = fopen(map_filename, "w");
    if (!trace_file || !opcode_file) {
        perror("trace output");
        exit(2);
    }
    // Reduce the overhead of recording millions of events.
    setvbuf(trace_file, NULL, _IOFBF, 1 << 20);
    setvbuf(opcode_file, NULL, _IOFBF, 1 << 16);
    if (atexit(trace_finish) != 0)
        exit(2);
}

void __trace_register_opcode(uint32_t opcode, const char *name) {
    trace_init();
    if (fprintf(opcode_file, "%" PRIu32 "\t%s\n", opcode, name) < 0) {
        perror("opcode dictionary");
        exit(2);
    }
}

void __trace_edge(uint32_t user, uint32_t operand) {
    trace_init();
    const uint32_t pair[2] = {user, operand};
    if (fwrite(pair, sizeof(pair), 1, trace_file) != 1) {
        perror("trace.bin");
        exit(2);
    }
    ++edge_count;
    if (edge_limit && edge_count >= edge_limit)
        exit(0);
}

void __trace_after_flush(void) {
    trace_init();
    ++frame_count;
    if (frame_limit && frame_count >= frame_limit)
        exit(0);
}

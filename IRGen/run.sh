#!/usr/bin/env bash
# Run from anywhere: bash IRGen/run.sh [profile|jit|interp] (from repo root)
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(dirname "$DIR")"
BUILD="$DIR/build"
RESULTS="$DIR/results"
CLANG="${CLANG:-clang-18}"
LLVM_CONFIG="${LLVM_CONFIG:-llvm-config-18}"
MODE="${1:-profile}"
FRAMES="${IRGEN_FRAMES:-2}"
mkdir -p "$RESULTS"
if [[ ! -f "$ROOT/app.c" ]]; then
  echo "ERROR: copy IRGen/ under the root of the llvm_course repository (beside app.c)" >&2
  exit 2
fi
if [[ "$MODE" == profile ]]; then
  echo '[1/4] Build LLVM tools'
  cmake -S "$DIR" -B "$BUILD" -DLLVM_DIR="$("$LLVM_CONFIG" --cmakedir)" -DCMAKE_BUILD_TYPE=Release
  cmake --build "$BUILD" -j 2

  echo '[2/4] Generate optimized LLVM IR from ONLY app.c'
  "$CLANG" -O2 -S -emit-llvm -include "$DIR/sim_prototypes.h" "$ROOT/app.c" -o "$RESULTS/app_full.ll"

  echo '[3/4] Execute profiling IR to find called functions (native callbacks)'
  "$BUILD/app_ir_gen" instrument "$RESULTS/app_full.ll" "$RESULTS/app_profile.ll"
  IRGEN_FRAMES="$FRAMES" IRGEN_CALLED="$RESULTS/called_ids.txt" \
    "$BUILD/ir_runner_headless" jit "$RESULTS/app_profile.ll"

  echo '[4/4] Generate final IR with ONLY executed function definitions'
  "$BUILD/app_ir_gen" prune "$RESULTS/app_full.ll" \
    "$RESULTS/called_ids.txt" "$RESULTS/app_generated.ll"
  echo "Done. Generated IR: $RESULTS/app_generated.ll"
  echo "Render using: bash IRGen/run.sh jit"
elif [[ "$MODE" == jit || "$MODE" == interp ]]; then
  if [[ ! -f "$RESULTS/app_generated.ll" ]]; then
    echo 'Generate IR first: bash IRGen/run.sh profile' >&2
    exit 2
  fi
  if [[ ! -x "$BUILD/ir_runner_sdl" ]]; then
    echo 'SDL runner not built. Install libsdl2-dev; rerun: bash IRGen/run.sh profile' >&2
    echo "Headless fallback: IRGEN_FRAMES=$FRAMES $BUILD/ir_runner_headless $MODE $RESULTS/app_generated.ll" >&2
    exit 2
  fi
  IRGEN_FRAMES="$FRAMES" "$BUILD/ir_runner_sdl" "$MODE" "$RESULTS/app_generated.ll"
else
  echo "Usage: bash IRGen/run.sh [profile|jit|interp]" >&2
  exit 2
fi

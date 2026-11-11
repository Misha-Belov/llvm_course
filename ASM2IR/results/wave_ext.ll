source_filename = "wave.external"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"

define void @wave_main(ptr %registers, ptr %memory) {
pc0:
  %0 = call i32 @emu_MOV(ptr %memory, i32 0, i32 0, i32 0)
  %1 = getelementptr i32, ptr %registers, i32 0
  store i32 %0, ptr %1, align 4
  br label %pc1

pc1:
  %2 = call i32 @emu_MOV(ptr %memory, i32 73728, i32 0, i32 0)
  %3 = getelementptr i32, ptr %registers, i32 1
  store i32 %2, ptr %3, align 4
  br label %pc2

pc2:
  %4 = call i32 @emu_MOV(ptr %memory, i32 147456, i32 0, i32 0)
  %5 = getelementptr i32, ptr %registers, i32 2
  store i32 %4, ptr %5, align 4
  br label %pc3

pc3:
  %6 = call i32 @emu_MOV(ptr %memory, i32 0, i32 0, i32 0)
  %7 = getelementptr i32, ptr %registers, i32 3
  store i32 %6, ptr %7, align 4
  br label %pc4

pc4:
  %8 = call i32 @emu_MOV(ptr %memory, i32 0, i32 0, i32 0)
  %9 = getelementptr i32, ptr %registers, i32 4
  store i32 %8, ptr %9, align 4
  br label %pc5

pc5:
  %10 = getelementptr i32, ptr %registers, i32 4
  %11 = load i32, ptr %10, align 4
  %12 = call i32 @emu_ST(ptr %memory, i32 0, i32 %11, i32 0)
  br label %pc6

pc6:
  %13 = getelementptr i32, ptr %registers, i32 4
  %14 = load i32, ptr %13, align 4
  %15 = call i32 @emu_ADD(ptr %memory, i32 %14, i32 1, i32 0)
  %16 = getelementptr i32, ptr %registers, i32 4
  store i32 %15, ptr %16, align 4
  br label %pc7

pc7:
  %17 = getelementptr i32, ptr %registers, i32 4
  %18 = load i32, ptr %17, align 4
  %19 = icmp slt i32 %18, 221184
  br i1 %19, label %pc5, label %pc8

pc8:
  %20 = getelementptr i32, ptr %registers, i32 3
  %21 = load i32, ptr %20, align 4
  %22 = call i32 @emu_REM(ptr %memory, i32 %21, i32 70, i32 0)
  %23 = getelementptr i32, ptr %registers, i32 4
  store i32 %22, ptr %23, align 4
  br label %pc9

pc9:
  %24 = getelementptr i32, ptr %registers, i32 4
  %25 = load i32, ptr %24, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %pc42, label %pc10

pc10:
  %27 = call i32 @emu_RAND(ptr %memory, i32 0, i32 0, i32 0)
  %28 = getelementptr i32, ptr %registers, i32 4
  store i32 %27, ptr %28, align 4
  br label %pc11

pc11:
  %29 = getelementptr i32, ptr %registers, i32 4
  %30 = load i32, ptr %29, align 4
  %31 = call i32 @emu_REM(ptr %memory, i32 %30, i32 368, i32 0)
  %32 = getelementptr i32, ptr %registers, i32 4
  store i32 %31, ptr %32, align 4
  br label %pc12

pc12:
  %33 = getelementptr i32, ptr %registers, i32 4
  %34 = load i32, ptr %33, align 4
  %35 = call i32 @emu_ADD(ptr %memory, i32 %34, i32 8, i32 0)
  %36 = getelementptr i32, ptr %registers, i32 4
  store i32 %35, ptr %36, align 4
  br label %pc13

pc13:
  %37 = call i32 @emu_RAND(ptr %memory, i32 0, i32 0, i32 0)
  %38 = getelementptr i32, ptr %registers, i32 5
  store i32 %37, ptr %38, align 4
  br label %pc14

pc14:
  %39 = getelementptr i32, ptr %registers, i32 5
  %40 = load i32, ptr %39, align 4
  %41 = call i32 @emu_REM(ptr %memory, i32 %40, i32 176, i32 0)
  %42 = getelementptr i32, ptr %registers, i32 5
  store i32 %41, ptr %42, align 4
  br label %pc15

pc15:
  %43 = getelementptr i32, ptr %registers, i32 5
  %44 = load i32, ptr %43, align 4
  %45 = call i32 @emu_ADD(ptr %memory, i32 %44, i32 8, i32 0)
  %46 = getelementptr i32, ptr %registers, i32 5
  store i32 %45, ptr %46, align 4
  br label %pc16

pc16:
  %47 = call i32 @emu_MOV(ptr %memory, i32 -6, i32 0, i32 0)
  %48 = getelementptr i32, ptr %registers, i32 7
  store i32 %47, ptr %48, align 4
  br label %pc17

pc17:
  %49 = call i32 @emu_MOV(ptr %memory, i32 -6, i32 0, i32 0)
  %50 = getelementptr i32, ptr %registers, i32 6
  store i32 %49, ptr %50, align 4
  br label %pc18

pc18:
  %51 = getelementptr i32, ptr %registers, i32 6
  %52 = load i32, ptr %51, align 4
  %53 = getelementptr i32, ptr %registers, i32 6
  %54 = load i32, ptr %53, align 4
  %55 = call i32 @emu_MUL(ptr %memory, i32 %52, i32 %54, i32 0)
  %56 = getelementptr i32, ptr %registers, i32 8
  store i32 %55, ptr %56, align 4
  br label %pc19

pc19:
  %57 = getelementptr i32, ptr %registers, i32 7
  %58 = load i32, ptr %57, align 4
  %59 = getelementptr i32, ptr %registers, i32 7
  %60 = load i32, ptr %59, align 4
  %61 = call i32 @emu_MUL(ptr %memory, i32 %58, i32 %60, i32 0)
  %62 = getelementptr i32, ptr %registers, i32 14
  store i32 %61, ptr %62, align 4
  br label %pc20

pc20:
  %63 = getelementptr i32, ptr %registers, i32 8
  %64 = load i32, ptr %63, align 4
  %65 = getelementptr i32, ptr %registers, i32 14
  %66 = load i32, ptr %65, align 4
  %67 = call i32 @emu_ADD(ptr %memory, i32 %64, i32 %66, i32 0)
  %68 = getelementptr i32, ptr %registers, i32 8
  store i32 %67, ptr %68, align 4
  br label %pc21

pc21:
  %69 = getelementptr i32, ptr %registers, i32 8
  %70 = load i32, ptr %69, align 4
  %71 = icmp slt i32 36, %70
  br i1 %71, label %pc38, label %pc22

pc22:
  %72 = getelementptr i32, ptr %registers, i32 4
  %73 = load i32, ptr %72, align 4
  %74 = getelementptr i32, ptr %registers, i32 6
  %75 = load i32, ptr %74, align 4
  %76 = call i32 @emu_ADD(ptr %memory, i32 %73, i32 %75, i32 0)
  %77 = getelementptr i32, ptr %registers, i32 9
  store i32 %76, ptr %77, align 4
  br label %pc23

pc23:
  %78 = getelementptr i32, ptr %registers, i32 5
  %79 = load i32, ptr %78, align 4
  %80 = getelementptr i32, ptr %registers, i32 7
  %81 = load i32, ptr %80, align 4
  %82 = call i32 @emu_ADD(ptr %memory, i32 %79, i32 %81, i32 0)
  %83 = getelementptr i32, ptr %registers, i32 10
  store i32 %82, ptr %83, align 4
  br label %pc24

pc24:
  %84 = getelementptr i32, ptr %registers, i32 9
  %85 = load i32, ptr %84, align 4
  %86 = icmp sle i32 %85, 0
  br i1 %86, label %pc38, label %pc25

pc25:
  %87 = getelementptr i32, ptr %registers, i32 9
  %88 = load i32, ptr %87, align 4
  %89 = icmp sle i32 383, %88
  br i1 %89, label %pc38, label %pc26

pc26:
  %90 = getelementptr i32, ptr %registers, i32 10
  %91 = load i32, ptr %90, align 4
  %92 = icmp sle i32 %91, 0
  br i1 %92, label %pc38, label %pc27

pc27:
  %93 = getelementptr i32, ptr %registers, i32 10
  %94 = load i32, ptr %93, align 4
  %95 = icmp sle i32 191, %94
  br i1 %95, label %pc38, label %pc28

pc28:
  %96 = getelementptr i32, ptr %registers, i32 8
  %97 = load i32, ptr %96, align 4
  %98 = call i32 @emu_SUB(ptr %memory, i32 36, i32 %97, i32 0)
  %99 = getelementptr i32, ptr %registers, i32 11
  store i32 %98, ptr %99, align 4
  br label %pc29

pc29:
  %100 = getelementptr i32, ptr %registers, i32 11
  %101 = load i32, ptr %100, align 4
  %102 = call i32 @emu_MULDIV(ptr %memory, i32 %101, i32 1800, i32 37)
  %103 = getelementptr i32, ptr %registers, i32 11
  store i32 %102, ptr %103, align 4
  br label %pc30

pc30:
  %104 = getelementptr i32, ptr %registers, i32 10
  %105 = load i32, ptr %104, align 4
  %106 = call i32 @emu_MUL(ptr %memory, i32 %105, i32 384, i32 0)
  %107 = getelementptr i32, ptr %registers, i32 12
  store i32 %106, ptr %107, align 4
  br label %pc31

pc31:
  %108 = getelementptr i32, ptr %registers, i32 12
  %109 = load i32, ptr %108, align 4
  %110 = getelementptr i32, ptr %registers, i32 9
  %111 = load i32, ptr %110, align 4
  %112 = call i32 @emu_ADD(ptr %memory, i32 %109, i32 %111, i32 0)
  %113 = getelementptr i32, ptr %registers, i32 12
  store i32 %112, ptr %113, align 4
  br label %pc32

pc32:
  %114 = getelementptr i32, ptr %registers, i32 0
  %115 = load i32, ptr %114, align 4
  %116 = getelementptr i32, ptr %registers, i32 12
  %117 = load i32, ptr %116, align 4
  %118 = call i32 @emu_LD(ptr %memory, i32 %115, i32 %117, i32 0)
  %119 = getelementptr i32, ptr %registers, i32 13
  store i32 %118, ptr %119, align 4
  br label %pc33

pc33:
  %120 = getelementptr i32, ptr %registers, i32 13
  %121 = load i32, ptr %120, align 4
  %122 = getelementptr i32, ptr %registers, i32 11
  %123 = load i32, ptr %122, align 4
  %124 = call i32 @emu_ADD(ptr %memory, i32 %121, i32 %123, i32 0)
  %125 = getelementptr i32, ptr %registers, i32 13
  store i32 %124, ptr %125, align 4
  br label %pc34

pc34:
  %126 = getelementptr i32, ptr %registers, i32 0
  %127 = load i32, ptr %126, align 4
  %128 = getelementptr i32, ptr %registers, i32 12
  %129 = load i32, ptr %128, align 4
  %130 = getelementptr i32, ptr %registers, i32 13
  %131 = load i32, ptr %130, align 4
  %132 = call i32 @emu_ST(ptr %memory, i32 %127, i32 %129, i32 %131)
  br label %pc35

pc35:
  %133 = getelementptr i32, ptr %registers, i32 1
  %134 = load i32, ptr %133, align 4
  %135 = getelementptr i32, ptr %registers, i32 12
  %136 = load i32, ptr %135, align 4
  %137 = call i32 @emu_LD(ptr %memory, i32 %134, i32 %136, i32 0)
  %138 = getelementptr i32, ptr %registers, i32 13
  store i32 %137, ptr %138, align 4
  br label %pc36

pc36:
  %139 = getelementptr i32, ptr %registers, i32 13
  %140 = load i32, ptr %139, align 4
  %141 = getelementptr i32, ptr %registers, i32 11
  %142 = load i32, ptr %141, align 4
  %143 = call i32 @emu_ADD(ptr %memory, i32 %140, i32 %142, i32 0)
  %144 = getelementptr i32, ptr %registers, i32 13
  store i32 %143, ptr %144, align 4
  br label %pc37

pc37:
  %145 = getelementptr i32, ptr %registers, i32 1
  %146 = load i32, ptr %145, align 4
  %147 = getelementptr i32, ptr %registers, i32 12
  %148 = load i32, ptr %147, align 4
  %149 = getelementptr i32, ptr %registers, i32 13
  %150 = load i32, ptr %149, align 4
  %151 = call i32 @emu_ST(ptr %memory, i32 %146, i32 %148, i32 %150)
  br label %pc38

pc38:
  %152 = getelementptr i32, ptr %registers, i32 6
  %153 = load i32, ptr %152, align 4
  %154 = call i32 @emu_ADD(ptr %memory, i32 %153, i32 1, i32 0)
  %155 = getelementptr i32, ptr %registers, i32 6
  store i32 %154, ptr %155, align 4
  br label %pc39

pc39:
  %156 = getelementptr i32, ptr %registers, i32 6
  %157 = load i32, ptr %156, align 4
  %158 = icmp sle i32 %157, 6
  br i1 %158, label %pc18, label %pc40

pc40:
  %159 = getelementptr i32, ptr %registers, i32 7
  %160 = load i32, ptr %159, align 4
  %161 = call i32 @emu_ADD(ptr %memory, i32 %160, i32 1, i32 0)
  %162 = getelementptr i32, ptr %registers, i32 7
  store i32 %161, ptr %162, align 4
  br label %pc41

pc41:
  %163 = getelementptr i32, ptr %registers, i32 7
  %164 = load i32, ptr %163, align 4
  %165 = icmp sle i32 %164, 6
  br i1 %165, label %pc17, label %pc42

pc42:
  %166 = call i32 @emu_MOV(ptr %memory, i32 0, i32 0, i32 0)
  %167 = getelementptr i32, ptr %registers, i32 4
  store i32 %166, ptr %167, align 4
  br label %pc43

pc43:
  %168 = call i32 @emu_MOV(ptr %memory, i32 0, i32 0, i32 0)
  %169 = getelementptr i32, ptr %registers, i32 6
  store i32 %168, ptr %169, align 4
  br label %pc44

pc44:
  %170 = call i32 @emu_MOV(ptr %memory, i32 0, i32 0, i32 0)
  %171 = getelementptr i32, ptr %registers, i32 5
  store i32 %170, ptr %171, align 4
  br label %pc45

pc45:
  %172 = getelementptr i32, ptr %registers, i32 1
  %173 = load i32, ptr %172, align 4
  %174 = getelementptr i32, ptr %registers, i32 6
  %175 = load i32, ptr %174, align 4
  %176 = call i32 @emu_LD(ptr %memory, i32 %173, i32 %175, i32 0)
  %177 = getelementptr i32, ptr %registers, i32 7
  store i32 %176, ptr %177, align 4
  br label %pc46

pc46:
  %178 = getelementptr i32, ptr %registers, i32 7
  %179 = load i32, ptr %178, align 4
  %180 = icmp sle i32 %179, 1000
  br i1 %180, label %pc48, label %pc47

pc47:
  %181 = call i32 @emu_MOV(ptr %memory, i32 1000, i32 0, i32 0)
  %182 = getelementptr i32, ptr %registers, i32 7
  store i32 %181, ptr %182, align 4
  br label %pc48

pc48:
  %183 = getelementptr i32, ptr %registers, i32 7
  %184 = load i32, ptr %183, align 4
  %185 = icmp sle i32 -1000, %184
  br i1 %185, label %pc50, label %pc49

pc49:
  %186 = call i32 @emu_MOV(ptr %memory, i32 -1000, i32 0, i32 0)
  %187 = getelementptr i32, ptr %registers, i32 7
  store i32 %186, ptr %187, align 4
  br label %pc50

pc50:
  %188 = getelementptr i32, ptr %registers, i32 7
  %189 = load i32, ptr %188, align 4
  %190 = icmp slt i32 %189, 0
  br i1 %190, label %pc58, label %pc51

pc51:
  %191 = getelementptr i32, ptr %registers, i32 7
  %192 = load i32, ptr %191, align 4
  %193 = call i32 @emu_MULDIV(ptr %memory, i32 %192, i32 245, i32 1000)
  %194 = getelementptr i32, ptr %registers, i32 8
  store i32 %193, ptr %194, align 4
  br label %pc52

pc52:
  %195 = getelementptr i32, ptr %registers, i32 8
  %196 = load i32, ptr %195, align 4
  %197 = call i32 @emu_ADD(ptr %memory, i32 %196, i32 10, i32 0)
  %198 = getelementptr i32, ptr %registers, i32 8
  store i32 %197, ptr %198, align 4
  br label %pc53

pc53:
  %199 = getelementptr i32, ptr %registers, i32 7
  %200 = load i32, ptr %199, align 4
  %201 = call i32 @emu_MULDIV(ptr %memory, i32 %200, i32 235, i32 1000)
  %202 = getelementptr i32, ptr %registers, i32 9
  store i32 %201, ptr %202, align 4
  br label %pc54

pc54:
  %203 = getelementptr i32, ptr %registers, i32 9
  %204 = load i32, ptr %203, align 4
  %205 = call i32 @emu_ADD(ptr %memory, i32 %204, i32 20, i32 0)
  %206 = getelementptr i32, ptr %registers, i32 9
  store i32 %205, ptr %206, align 4
  br label %pc55

pc55:
  %207 = getelementptr i32, ptr %registers, i32 7
  %208 = load i32, ptr %207, align 4
  %209 = call i32 @emu_MULDIV(ptr %memory, i32 %208, i32 215, i32 1000)
  %210 = getelementptr i32, ptr %registers, i32 10
  store i32 %209, ptr %210, align 4
  br label %pc56

pc56:
  %211 = getelementptr i32, ptr %registers, i32 10
  %212 = load i32, ptr %211, align 4
  %213 = call i32 @emu_ADD(ptr %memory, i32 %212, i32 40, i32 0)
  %214 = getelementptr i32, ptr %registers, i32 10
  store i32 %213, ptr %214, align 4
  br label %pc57

pc57:
  br label %pc64

pc58:
  %215 = getelementptr i32, ptr %registers, i32 7
  %216 = load i32, ptr %215, align 4
  %217 = call i32 @emu_SUB(ptr %memory, i32 0, i32 %216, i32 0)
  %218 = getelementptr i32, ptr %registers, i32 7
  store i32 %217, ptr %218, align 4
  br label %pc59

pc59:
  %219 = call i32 @emu_MOV(ptr %memory, i32 5, i32 0, i32 0)
  %220 = getelementptr i32, ptr %registers, i32 8
  store i32 %219, ptr %220, align 4
  br label %pc60

pc60:
  %221 = getelementptr i32, ptr %registers, i32 7
  %222 = load i32, ptr %221, align 4
  %223 = call i32 @emu_MULDIV(ptr %memory, i32 %222, i32 30, i32 1000)
  %224 = getelementptr i32, ptr %registers, i32 9
  store i32 %223, ptr %224, align 4
  br label %pc61

pc61:
  %225 = getelementptr i32, ptr %registers, i32 9
  %226 = load i32, ptr %225, align 4
  %227 = call i32 @emu_ADD(ptr %memory, i32 %226, i32 10, i32 0)
  %228 = getelementptr i32, ptr %registers, i32 9
  store i32 %227, ptr %228, align 4
  br label %pc62

pc62:
  %229 = getelementptr i32, ptr %registers, i32 7
  %230 = load i32, ptr %229, align 4
  %231 = call i32 @emu_MULDIV(ptr %memory, i32 %230, i32 100, i32 1000)
  %232 = getelementptr i32, ptr %registers, i32 10
  store i32 %231, ptr %232, align 4
  br label %pc63

pc63:
  %233 = getelementptr i32, ptr %registers, i32 10
  %234 = load i32, ptr %233, align 4
  %235 = call i32 @emu_ADD(ptr %memory, i32 %234, i32 25, i32 0)
  %236 = getelementptr i32, ptr %registers, i32 10
  store i32 %235, ptr %236, align 4
  br label %pc64

pc64:
  %237 = getelementptr i32, ptr %registers, i32 8
  %238 = load i32, ptr %237, align 4
  %239 = getelementptr i32, ptr %registers, i32 9
  %240 = load i32, ptr %239, align 4
  %241 = getelementptr i32, ptr %registers, i32 10
  %242 = load i32, ptr %241, align 4
  %243 = call i32 @emu_PACK(ptr %memory, i32 %238, i32 %240, i32 %242)
  %244 = getelementptr i32, ptr %registers, i32 11
  store i32 %243, ptr %244, align 4
  br label %pc65

pc65:
  %245 = getelementptr i32, ptr %registers, i32 5
  %246 = load i32, ptr %245, align 4
  %247 = getelementptr i32, ptr %registers, i32 4
  %248 = load i32, ptr %247, align 4
  %249 = getelementptr i32, ptr %registers, i32 11
  %250 = load i32, ptr %249, align 4
  %251 = call i32 @emu_CELL(ptr %memory, i32 %246, i32 %248, i32 %250)
  br label %pc66

pc66:
  %252 = getelementptr i32, ptr %registers, i32 6
  %253 = load i32, ptr %252, align 4
  %254 = call i32 @emu_ADD(ptr %memory, i32 %253, i32 1, i32 0)
  %255 = getelementptr i32, ptr %registers, i32 6
  store i32 %254, ptr %255, align 4
  br label %pc67

pc67:
  %256 = getelementptr i32, ptr %registers, i32 5
  %257 = load i32, ptr %256, align 4
  %258 = call i32 @emu_ADD(ptr %memory, i32 %257, i32 1, i32 0)
  %259 = getelementptr i32, ptr %registers, i32 5
  store i32 %258, ptr %259, align 4
  br label %pc68

pc68:
  %260 = getelementptr i32, ptr %registers, i32 5
  %261 = load i32, ptr %260, align 4
  %262 = icmp slt i32 %261, 384
  br i1 %262, label %pc45, label %pc69

pc69:
  %263 = getelementptr i32, ptr %registers, i32 4
  %264 = load i32, ptr %263, align 4
  %265 = call i32 @emu_ADD(ptr %memory, i32 %264, i32 1, i32 0)
  %266 = getelementptr i32, ptr %registers, i32 4
  store i32 %265, ptr %266, align 4
  br label %pc70

pc70:
  %267 = getelementptr i32, ptr %registers, i32 4
  %268 = load i32, ptr %267, align 4
  %269 = icmp slt i32 %268, 192
  br i1 %269, label %pc44, label %pc71

pc71:
  %270 = call i32 @emu_FLUSH(ptr %memory, i32 0, i32 0, i32 0)
  %271 = getelementptr i32, ptr %registers, i32 30
  store i32 %270, ptr %271, align 4
  br label %pc72

pc72:
  %272 = getelementptr i32, ptr %registers, i32 30
  %273 = load i32, ptr %272, align 4
  %274 = icmp eq i32 %273, 0
  br i1 %274, label %pc116, label %pc73

pc73:
  %275 = call i32 @emu_MOV(ptr %memory, i32 0, i32 0, i32 0)
  %276 = getelementptr i32, ptr %registers, i32 4
  store i32 %275, ptr %276, align 4
  br label %pc74

pc74:
  %277 = getelementptr i32, ptr %registers, i32 2
  %278 = load i32, ptr %277, align 4
  %279 = getelementptr i32, ptr %registers, i32 4
  %280 = load i32, ptr %279, align 4
  %281 = call i32 @emu_ST(ptr %memory, i32 %278, i32 %280, i32 0)
  br label %pc75

pc75:
  %282 = getelementptr i32, ptr %registers, i32 4
  %283 = load i32, ptr %282, align 4
  %284 = call i32 @emu_ADD(ptr %memory, i32 %283, i32 73344, i32 0)
  %285 = getelementptr i32, ptr %registers, i32 9
  store i32 %284, ptr %285, align 4
  br label %pc76

pc76:
  %286 = getelementptr i32, ptr %registers, i32 2
  %287 = load i32, ptr %286, align 4
  %288 = getelementptr i32, ptr %registers, i32 9
  %289 = load i32, ptr %288, align 4
  %290 = call i32 @emu_ST(ptr %memory, i32 %287, i32 %289, i32 0)
  br label %pc77

pc77:
  %291 = getelementptr i32, ptr %registers, i32 4
  %292 = load i32, ptr %291, align 4
  %293 = call i32 @emu_ADD(ptr %memory, i32 %292, i32 1, i32 0)
  %294 = getelementptr i32, ptr %registers, i32 4
  store i32 %293, ptr %294, align 4
  br label %pc78

pc78:
  %295 = getelementptr i32, ptr %registers, i32 4
  %296 = load i32, ptr %295, align 4
  %297 = icmp slt i32 %296, 384
  br i1 %297, label %pc74, label %pc79

pc79:
  %298 = call i32 @emu_MOV(ptr %memory, i32 0, i32 0, i32 0)
  %299 = getelementptr i32, ptr %registers, i32 5
  store i32 %298, ptr %299, align 4
  br label %pc80

pc80:
  %300 = getelementptr i32, ptr %registers, i32 5
  %301 = load i32, ptr %300, align 4
  %302 = call i32 @emu_MUL(ptr %memory, i32 %301, i32 384, i32 0)
  %303 = getelementptr i32, ptr %registers, i32 9
  store i32 %302, ptr %303, align 4
  br label %pc81

pc81:
  %304 = getelementptr i32, ptr %registers, i32 2
  %305 = load i32, ptr %304, align 4
  %306 = getelementptr i32, ptr %registers, i32 9
  %307 = load i32, ptr %306, align 4
  %308 = call i32 @emu_ST(ptr %memory, i32 %305, i32 %307, i32 0)
  br label %pc82

pc82:
  %309 = getelementptr i32, ptr %registers, i32 9
  %310 = load i32, ptr %309, align 4
  %311 = call i32 @emu_ADD(ptr %memory, i32 %310, i32 383, i32 0)
  %312 = getelementptr i32, ptr %registers, i32 9
  store i32 %311, ptr %312, align 4
  br label %pc83

pc83:
  %313 = getelementptr i32, ptr %registers, i32 2
  %314 = load i32, ptr %313, align 4
  %315 = getelementptr i32, ptr %registers, i32 9
  %316 = load i32, ptr %315, align 4
  %317 = call i32 @emu_ST(ptr %memory, i32 %314, i32 %316, i32 0)
  br label %pc84

pc84:
  %318 = getelementptr i32, ptr %registers, i32 5
  %319 = load i32, ptr %318, align 4
  %320 = call i32 @emu_ADD(ptr %memory, i32 %319, i32 1, i32 0)
  %321 = getelementptr i32, ptr %registers, i32 5
  store i32 %320, ptr %321, align 4
  br label %pc85

pc85:
  %322 = getelementptr i32, ptr %registers, i32 5
  %323 = load i32, ptr %322, align 4
  %324 = icmp slt i32 %323, 192
  br i1 %324, label %pc80, label %pc86

pc86:
  %325 = call i32 @emu_MOV(ptr %memory, i32 1, i32 0, i32 0)
  %326 = getelementptr i32, ptr %registers, i32 5
  store i32 %325, ptr %326, align 4
  br label %pc87

pc87:
  %327 = call i32 @emu_MOV(ptr %memory, i32 1, i32 0, i32 0)
  %328 = getelementptr i32, ptr %registers, i32 4
  store i32 %327, ptr %328, align 4
  br label %pc88

pc88:
  %329 = getelementptr i32, ptr %registers, i32 5
  %330 = load i32, ptr %329, align 4
  %331 = call i32 @emu_MUL(ptr %memory, i32 %330, i32 384, i32 0)
  %332 = getelementptr i32, ptr %registers, i32 6
  store i32 %331, ptr %332, align 4
  br label %pc89

pc89:
  %333 = getelementptr i32, ptr %registers, i32 6
  %334 = load i32, ptr %333, align 4
  %335 = getelementptr i32, ptr %registers, i32 4
  %336 = load i32, ptr %335, align 4
  %337 = call i32 @emu_ADD(ptr %memory, i32 %334, i32 %336, i32 0)
  %338 = getelementptr i32, ptr %registers, i32 6
  store i32 %337, ptr %338, align 4
  br label %pc90

pc90:
  %339 = getelementptr i32, ptr %registers, i32 6
  %340 = load i32, ptr %339, align 4
  %341 = call i32 @emu_SUB(ptr %memory, i32 %340, i32 1, i32 0)
  %342 = getelementptr i32, ptr %registers, i32 9
  store i32 %341, ptr %342, align 4
  br label %pc91

pc91:
  %343 = getelementptr i32, ptr %registers, i32 1
  %344 = load i32, ptr %343, align 4
  %345 = getelementptr i32, ptr %registers, i32 9
  %346 = load i32, ptr %345, align 4
  %347 = call i32 @emu_LD(ptr %memory, i32 %344, i32 %346, i32 0)
  %348 = getelementptr i32, ptr %registers, i32 7
  store i32 %347, ptr %348, align 4
  br label %pc92

pc92:
  %349 = getelementptr i32, ptr %registers, i32 6
  %350 = load i32, ptr %349, align 4
  %351 = call i32 @emu_ADD(ptr %memory, i32 %350, i32 1, i32 0)
  %352 = getelementptr i32, ptr %registers, i32 9
  store i32 %351, ptr %352, align 4
  br label %pc93

pc93:
  %353 = getelementptr i32, ptr %registers, i32 1
  %354 = load i32, ptr %353, align 4
  %355 = getelementptr i32, ptr %registers, i32 9
  %356 = load i32, ptr %355, align 4
  %357 = call i32 @emu_LD(ptr %memory, i32 %354, i32 %356, i32 0)
  %358 = getelementptr i32, ptr %registers, i32 8
  store i32 %357, ptr %358, align 4
  br label %pc94

pc94:
  %359 = getelementptr i32, ptr %registers, i32 7
  %360 = load i32, ptr %359, align 4
  %361 = getelementptr i32, ptr %registers, i32 8
  %362 = load i32, ptr %361, align 4
  %363 = call i32 @emu_ADD(ptr %memory, i32 %360, i32 %362, i32 0)
  %364 = getelementptr i32, ptr %registers, i32 7
  store i32 %363, ptr %364, align 4
  br label %pc95

pc95:
  %365 = getelementptr i32, ptr %registers, i32 6
  %366 = load i32, ptr %365, align 4
  %367 = call i32 @emu_SUB(ptr %memory, i32 %366, i32 384, i32 0)
  %368 = getelementptr i32, ptr %registers, i32 9
  store i32 %367, ptr %368, align 4
  br label %pc96

pc96:
  %369 = getelementptr i32, ptr %registers, i32 1
  %370 = load i32, ptr %369, align 4
  %371 = getelementptr i32, ptr %registers, i32 9
  %372 = load i32, ptr %371, align 4
  %373 = call i32 @emu_LD(ptr %memory, i32 %370, i32 %372, i32 0)
  %374 = getelementptr i32, ptr %registers, i32 8
  store i32 %373, ptr %374, align 4
  br label %pc97

pc97:
  %375 = getelementptr i32, ptr %registers, i32 7
  %376 = load i32, ptr %375, align 4
  %377 = getelementptr i32, ptr %registers, i32 8
  %378 = load i32, ptr %377, align 4
  %379 = call i32 @emu_ADD(ptr %memory, i32 %376, i32 %378, i32 0)
  %380 = getelementptr i32, ptr %registers, i32 7
  store i32 %379, ptr %380, align 4
  br label %pc98

pc98:
  %381 = getelementptr i32, ptr %registers, i32 6
  %382 = load i32, ptr %381, align 4
  %383 = call i32 @emu_ADD(ptr %memory, i32 %382, i32 384, i32 0)
  %384 = getelementptr i32, ptr %registers, i32 9
  store i32 %383, ptr %384, align 4
  br label %pc99

pc99:
  %385 = getelementptr i32, ptr %registers, i32 1
  %386 = load i32, ptr %385, align 4
  %387 = getelementptr i32, ptr %registers, i32 9
  %388 = load i32, ptr %387, align 4
  %389 = call i32 @emu_LD(ptr %memory, i32 %386, i32 %388, i32 0)
  %390 = getelementptr i32, ptr %registers, i32 8
  store i32 %389, ptr %390, align 4
  br label %pc100

pc100:
  %391 = getelementptr i32, ptr %registers, i32 7
  %392 = load i32, ptr %391, align 4
  %393 = getelementptr i32, ptr %registers, i32 8
  %394 = load i32, ptr %393, align 4
  %395 = call i32 @emu_ADD(ptr %memory, i32 %392, i32 %394, i32 0)
  %396 = getelementptr i32, ptr %registers, i32 7
  store i32 %395, ptr %396, align 4
  br label %pc101

pc101:
  %397 = getelementptr i32, ptr %registers, i32 7
  %398 = load i32, ptr %397, align 4
  %399 = call i32 @emu_DIV(ptr %memory, i32 %398, i32 2, i32 0)
  %400 = getelementptr i32, ptr %registers, i32 7
  store i32 %399, ptr %400, align 4
  br label %pc102

pc102:
  %401 = getelementptr i32, ptr %registers, i32 0
  %402 = load i32, ptr %401, align 4
  %403 = getelementptr i32, ptr %registers, i32 6
  %404 = load i32, ptr %403, align 4
  %405 = call i32 @emu_LD(ptr %memory, i32 %402, i32 %404, i32 0)
  %406 = getelementptr i32, ptr %registers, i32 8
  store i32 %405, ptr %406, align 4
  br label %pc103

pc103:
  %407 = getelementptr i32, ptr %registers, i32 7
  %408 = load i32, ptr %407, align 4
  %409 = getelementptr i32, ptr %registers, i32 8
  %410 = load i32, ptr %409, align 4
  %411 = call i32 @emu_SUB(ptr %memory, i32 %408, i32 %410, i32 0)
  %412 = getelementptr i32, ptr %registers, i32 7
  store i32 %411, ptr %412, align 4
  br label %pc104

pc104:
  %413 = getelementptr i32, ptr %registers, i32 7
  %414 = load i32, ptr %413, align 4
  %415 = call i32 @emu_MULDIV(ptr %memory, i32 %414, i32 998, i32 1000)
  %416 = getelementptr i32, ptr %registers, i32 7
  store i32 %415, ptr %416, align 4
  br label %pc105

pc105:
  %417 = getelementptr i32, ptr %registers, i32 2
  %418 = load i32, ptr %417, align 4
  %419 = getelementptr i32, ptr %registers, i32 6
  %420 = load i32, ptr %419, align 4
  %421 = getelementptr i32, ptr %registers, i32 7
  %422 = load i32, ptr %421, align 4
  %423 = call i32 @emu_ST(ptr %memory, i32 %418, i32 %420, i32 %422)
  br label %pc106

pc106:
  %424 = getelementptr i32, ptr %registers, i32 4
  %425 = load i32, ptr %424, align 4
  %426 = call i32 @emu_ADD(ptr %memory, i32 %425, i32 1, i32 0)
  %427 = getelementptr i32, ptr %registers, i32 4
  store i32 %426, ptr %427, align 4
  br label %pc107

pc107:
  %428 = getelementptr i32, ptr %registers, i32 4
  %429 = load i32, ptr %428, align 4
  %430 = icmp slt i32 %429, 383
  br i1 %430, label %pc88, label %pc108

pc108:
  %431 = getelementptr i32, ptr %registers, i32 5
  %432 = load i32, ptr %431, align 4
  %433 = call i32 @emu_ADD(ptr %memory, i32 %432, i32 1, i32 0)
  %434 = getelementptr i32, ptr %registers, i32 5
  store i32 %433, ptr %434, align 4
  br label %pc109

pc109:
  %435 = getelementptr i32, ptr %registers, i32 5
  %436 = load i32, ptr %435, align 4
  %437 = icmp slt i32 %436, 191
  br i1 %437, label %pc87, label %pc110

pc110:
  %438 = getelementptr i32, ptr %registers, i32 0
  %439 = load i32, ptr %438, align 4
  %440 = call i32 @emu_MOV(ptr %memory, i32 %439, i32 0, i32 0)
  %441 = getelementptr i32, ptr %registers, i32 4
  store i32 %440, ptr %441, align 4
  br label %pc111

pc111:
  %442 = getelementptr i32, ptr %registers, i32 1
  %443 = load i32, ptr %442, align 4
  %444 = call i32 @emu_MOV(ptr %memory, i32 %443, i32 0, i32 0)
  %445 = getelementptr i32, ptr %registers, i32 0
  store i32 %444, ptr %445, align 4
  br label %pc112

pc112:
  %446 = getelementptr i32, ptr %registers, i32 2
  %447 = load i32, ptr %446, align 4
  %448 = call i32 @emu_MOV(ptr %memory, i32 %447, i32 0, i32 0)
  %449 = getelementptr i32, ptr %registers, i32 1
  store i32 %448, ptr %449, align 4
  br label %pc113

pc113:
  %450 = getelementptr i32, ptr %registers, i32 4
  %451 = load i32, ptr %450, align 4
  %452 = call i32 @emu_MOV(ptr %memory, i32 %451, i32 0, i32 0)
  %453 = getelementptr i32, ptr %registers, i32 2
  store i32 %452, ptr %453, align 4
  br label %pc114

pc114:
  %454 = getelementptr i32, ptr %registers, i32 3
  %455 = load i32, ptr %454, align 4
  %456 = call i32 @emu_ADD(ptr %memory, i32 %455, i32 1, i32 0)
  %457 = getelementptr i32, ptr %registers, i32 3
  store i32 %456, ptr %457, align 4
  br label %pc115

pc115:
  br label %pc8

pc116:
  ret void

pc117:
  ret void
}

declare i32 @waveRand()

declare i32 @waveFlush()

declare void @wavePixel(i32, i32, i32)

declare void @waveFault(i32) #0

declare i32 @emu_MOV(ptr, i32, i32, i32)

declare i32 @emu_ST(ptr, i32, i32, i32)

declare i32 @emu_ADD(ptr, i32, i32, i32)

declare i32 @emu_REM(ptr, i32, i32, i32)

declare i32 @emu_RAND(ptr, i32, i32, i32)

declare i32 @emu_MUL(ptr, i32, i32, i32)

declare i32 @emu_SUB(ptr, i32, i32, i32)

declare i32 @emu_MULDIV(ptr, i32, i32, i32)

declare i32 @emu_LD(ptr, i32, i32, i32)

declare i32 @emu_PACK(ptr, i32, i32, i32)

declare i32 @emu_CELL(ptr, i32, i32, i32)

declare i32 @emu_FLUSH(ptr, i32, i32, i32)

declare i32 @emu_DIV(ptr, i32, i32, i32)

attributes #0 = { noreturn }

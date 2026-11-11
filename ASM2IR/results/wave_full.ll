source_filename = "wave.full"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"

define void @wave_main(ptr %registers, ptr %memory) {
pc0:
  %0 = getelementptr i32, ptr %registers, i32 0
  store i32 0, ptr %0, align 4
  br label %pc1

pc1:
  %1 = getelementptr i32, ptr %registers, i32 1
  store i32 73728, ptr %1, align 4
  br label %pc2

pc2:
  %2 = getelementptr i32, ptr %registers, i32 2
  store i32 147456, ptr %2, align 4
  br label %pc3

pc3:
  %3 = getelementptr i32, ptr %registers, i32 3
  store i32 0, ptr %3, align 4
  br label %pc4

pc4:
  %4 = getelementptr i32, ptr %registers, i32 4
  store i32 0, ptr %4, align 4
  br label %pc5

pc5:
  %5 = getelementptr i32, ptr %registers, i32 4
  %6 = load i32, ptr %5, align 4
  %7 = add i32 0, %6
  %8 = icmp uge i32 %7, 221184
  br i1 %8, label %fault, label %checked

pc6:
  %9 = getelementptr i32, ptr %registers, i32 4
  %10 = load i32, ptr %9, align 4
  %11 = add i32 %10, 1
  %12 = getelementptr i32, ptr %registers, i32 4
  store i32 %11, ptr %12, align 4
  br label %pc7

pc7:
  %13 = getelementptr i32, ptr %registers, i32 4
  %14 = load i32, ptr %13, align 4
  %15 = icmp slt i32 %14, 221184
  br i1 %15, label %pc5, label %pc8

pc8:
  %16 = getelementptr i32, ptr %registers, i32 3
  %17 = load i32, ptr %16, align 4
  %18 = icmp eq i32 %17, -2147483648
  %19 = and i1 %18, false
  %20 = or i1 false, %19
  br i1 %20, label %fault1, label %checked2

pc9:
  %21 = getelementptr i32, ptr %registers, i32 4
  %22 = load i32, ptr %21, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %pc42, label %pc10

pc10:
  %24 = call i32 @waveRand()
  %25 = getelementptr i32, ptr %registers, i32 4
  store i32 %24, ptr %25, align 4
  br label %pc11

pc11:
  %26 = getelementptr i32, ptr %registers, i32 4
  %27 = load i32, ptr %26, align 4
  %28 = icmp eq i32 %27, -2147483648
  %29 = and i1 %28, false
  %30 = or i1 false, %29
  br i1 %30, label %fault3, label %checked4

pc12:
  %31 = getelementptr i32, ptr %registers, i32 4
  %32 = load i32, ptr %31, align 4
  %33 = add i32 %32, 8
  %34 = getelementptr i32, ptr %registers, i32 4
  store i32 %33, ptr %34, align 4
  br label %pc13

pc13:
  %35 = call i32 @waveRand()
  %36 = getelementptr i32, ptr %registers, i32 5
  store i32 %35, ptr %36, align 4
  br label %pc14

pc14:
  %37 = getelementptr i32, ptr %registers, i32 5
  %38 = load i32, ptr %37, align 4
  %39 = icmp eq i32 %38, -2147483648
  %40 = and i1 %39, false
  %41 = or i1 false, %40
  br i1 %41, label %fault5, label %checked6

pc15:
  %42 = getelementptr i32, ptr %registers, i32 5
  %43 = load i32, ptr %42, align 4
  %44 = add i32 %43, 8
  %45 = getelementptr i32, ptr %registers, i32 5
  store i32 %44, ptr %45, align 4
  br label %pc16

pc16:
  %46 = getelementptr i32, ptr %registers, i32 7
  store i32 -6, ptr %46, align 4
  br label %pc17

pc17:
  %47 = getelementptr i32, ptr %registers, i32 6
  store i32 -6, ptr %47, align 4
  br label %pc18

pc18:
  %48 = getelementptr i32, ptr %registers, i32 6
  %49 = load i32, ptr %48, align 4
  %50 = getelementptr i32, ptr %registers, i32 6
  %51 = load i32, ptr %50, align 4
  %52 = mul i32 %49, %51
  %53 = getelementptr i32, ptr %registers, i32 8
  store i32 %52, ptr %53, align 4
  br label %pc19

pc19:
  %54 = getelementptr i32, ptr %registers, i32 7
  %55 = load i32, ptr %54, align 4
  %56 = getelementptr i32, ptr %registers, i32 7
  %57 = load i32, ptr %56, align 4
  %58 = mul i32 %55, %57
  %59 = getelementptr i32, ptr %registers, i32 14
  store i32 %58, ptr %59, align 4
  br label %pc20

pc20:
  %60 = getelementptr i32, ptr %registers, i32 8
  %61 = load i32, ptr %60, align 4
  %62 = getelementptr i32, ptr %registers, i32 14
  %63 = load i32, ptr %62, align 4
  %64 = add i32 %61, %63
  %65 = getelementptr i32, ptr %registers, i32 8
  store i32 %64, ptr %65, align 4
  br label %pc21

pc21:
  %66 = getelementptr i32, ptr %registers, i32 8
  %67 = load i32, ptr %66, align 4
  %68 = icmp slt i32 36, %67
  br i1 %68, label %pc38, label %pc22

pc22:
  %69 = getelementptr i32, ptr %registers, i32 4
  %70 = load i32, ptr %69, align 4
  %71 = getelementptr i32, ptr %registers, i32 6
  %72 = load i32, ptr %71, align 4
  %73 = add i32 %70, %72
  %74 = getelementptr i32, ptr %registers, i32 9
  store i32 %73, ptr %74, align 4
  br label %pc23

pc23:
  %75 = getelementptr i32, ptr %registers, i32 5
  %76 = load i32, ptr %75, align 4
  %77 = getelementptr i32, ptr %registers, i32 7
  %78 = load i32, ptr %77, align 4
  %79 = add i32 %76, %78
  %80 = getelementptr i32, ptr %registers, i32 10
  store i32 %79, ptr %80, align 4
  br label %pc24

pc24:
  %81 = getelementptr i32, ptr %registers, i32 9
  %82 = load i32, ptr %81, align 4
  %83 = icmp sle i32 %82, 0
  br i1 %83, label %pc38, label %pc25

pc25:
  %84 = getelementptr i32, ptr %registers, i32 9
  %85 = load i32, ptr %84, align 4
  %86 = icmp sle i32 383, %85
  br i1 %86, label %pc38, label %pc26

pc26:
  %87 = getelementptr i32, ptr %registers, i32 10
  %88 = load i32, ptr %87, align 4
  %89 = icmp sle i32 %88, 0
  br i1 %89, label %pc38, label %pc27

pc27:
  %90 = getelementptr i32, ptr %registers, i32 10
  %91 = load i32, ptr %90, align 4
  %92 = icmp sle i32 191, %91
  br i1 %92, label %pc38, label %pc28

pc28:
  %93 = getelementptr i32, ptr %registers, i32 8
  %94 = load i32, ptr %93, align 4
  %95 = sub i32 36, %94
  %96 = getelementptr i32, ptr %registers, i32 11
  store i32 %95, ptr %96, align 4
  br label %pc29

pc29:
  %97 = getelementptr i32, ptr %registers, i32 11
  %98 = load i32, ptr %97, align 4
  %99 = mul i32 %98, 1800
  %100 = icmp eq i32 %99, -2147483648
  %101 = and i1 %100, false
  %102 = or i1 false, %101
  br i1 %102, label %fault7, label %checked8

pc30:
  %103 = getelementptr i32, ptr %registers, i32 10
  %104 = load i32, ptr %103, align 4
  %105 = mul i32 %104, 384
  %106 = getelementptr i32, ptr %registers, i32 12
  store i32 %105, ptr %106, align 4
  br label %pc31

pc31:
  %107 = getelementptr i32, ptr %registers, i32 12
  %108 = load i32, ptr %107, align 4
  %109 = getelementptr i32, ptr %registers, i32 9
  %110 = load i32, ptr %109, align 4
  %111 = add i32 %108, %110
  %112 = getelementptr i32, ptr %registers, i32 12
  store i32 %111, ptr %112, align 4
  br label %pc32

pc32:
  %113 = getelementptr i32, ptr %registers, i32 0
  %114 = load i32, ptr %113, align 4
  %115 = getelementptr i32, ptr %registers, i32 12
  %116 = load i32, ptr %115, align 4
  %117 = add i32 %114, %116
  %118 = icmp uge i32 %117, 221184
  br i1 %118, label %fault9, label %checked10

pc33:
  %119 = getelementptr i32, ptr %registers, i32 13
  %120 = load i32, ptr %119, align 4
  %121 = getelementptr i32, ptr %registers, i32 11
  %122 = load i32, ptr %121, align 4
  %123 = add i32 %120, %122
  %124 = getelementptr i32, ptr %registers, i32 13
  store i32 %123, ptr %124, align 4
  br label %pc34

pc34:
  %125 = getelementptr i32, ptr %registers, i32 0
  %126 = load i32, ptr %125, align 4
  %127 = getelementptr i32, ptr %registers, i32 12
  %128 = load i32, ptr %127, align 4
  %129 = getelementptr i32, ptr %registers, i32 13
  %130 = load i32, ptr %129, align 4
  %131 = add i32 %126, %128
  %132 = icmp uge i32 %131, 221184
  br i1 %132, label %fault11, label %checked12

pc35:
  %133 = getelementptr i32, ptr %registers, i32 1
  %134 = load i32, ptr %133, align 4
  %135 = getelementptr i32, ptr %registers, i32 12
  %136 = load i32, ptr %135, align 4
  %137 = add i32 %134, %136
  %138 = icmp uge i32 %137, 221184
  br i1 %138, label %fault13, label %checked14

pc36:
  %139 = getelementptr i32, ptr %registers, i32 13
  %140 = load i32, ptr %139, align 4
  %141 = getelementptr i32, ptr %registers, i32 11
  %142 = load i32, ptr %141, align 4
  %143 = add i32 %140, %142
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
  %151 = add i32 %146, %148
  %152 = icmp uge i32 %151, 221184
  br i1 %152, label %fault15, label %checked16

pc38:
  %153 = getelementptr i32, ptr %registers, i32 6
  %154 = load i32, ptr %153, align 4
  %155 = add i32 %154, 1
  %156 = getelementptr i32, ptr %registers, i32 6
  store i32 %155, ptr %156, align 4
  br label %pc39

pc39:
  %157 = getelementptr i32, ptr %registers, i32 6
  %158 = load i32, ptr %157, align 4
  %159 = icmp sle i32 %158, 6
  br i1 %159, label %pc18, label %pc40

pc40:
  %160 = getelementptr i32, ptr %registers, i32 7
  %161 = load i32, ptr %160, align 4
  %162 = add i32 %161, 1
  %163 = getelementptr i32, ptr %registers, i32 7
  store i32 %162, ptr %163, align 4
  br label %pc41

pc41:
  %164 = getelementptr i32, ptr %registers, i32 7
  %165 = load i32, ptr %164, align 4
  %166 = icmp sle i32 %165, 6
  br i1 %166, label %pc17, label %pc42

pc42:
  %167 = getelementptr i32, ptr %registers, i32 4
  store i32 0, ptr %167, align 4
  br label %pc43

pc43:
  %168 = getelementptr i32, ptr %registers, i32 6
  store i32 0, ptr %168, align 4
  br label %pc44

pc44:
  %169 = getelementptr i32, ptr %registers, i32 5
  store i32 0, ptr %169, align 4
  br label %pc45

pc45:
  %170 = getelementptr i32, ptr %registers, i32 1
  %171 = load i32, ptr %170, align 4
  %172 = getelementptr i32, ptr %registers, i32 6
  %173 = load i32, ptr %172, align 4
  %174 = add i32 %171, %173
  %175 = icmp uge i32 %174, 221184
  br i1 %175, label %fault17, label %checked18

pc46:
  %176 = getelementptr i32, ptr %registers, i32 7
  %177 = load i32, ptr %176, align 4
  %178 = icmp sle i32 %177, 1000
  br i1 %178, label %pc48, label %pc47

pc47:
  %179 = getelementptr i32, ptr %registers, i32 7
  store i32 1000, ptr %179, align 4
  br label %pc48

pc48:
  %180 = getelementptr i32, ptr %registers, i32 7
  %181 = load i32, ptr %180, align 4
  %182 = icmp sle i32 -1000, %181
  br i1 %182, label %pc50, label %pc49

pc49:
  %183 = getelementptr i32, ptr %registers, i32 7
  store i32 -1000, ptr %183, align 4
  br label %pc50

pc50:
  %184 = getelementptr i32, ptr %registers, i32 7
  %185 = load i32, ptr %184, align 4
  %186 = icmp slt i32 %185, 0
  br i1 %186, label %pc58, label %pc51

pc51:
  %187 = getelementptr i32, ptr %registers, i32 7
  %188 = load i32, ptr %187, align 4
  %189 = mul i32 %188, 245
  %190 = icmp eq i32 %189, -2147483648
  %191 = and i1 %190, false
  %192 = or i1 false, %191
  br i1 %192, label %fault19, label %checked20

pc52:
  %193 = getelementptr i32, ptr %registers, i32 8
  %194 = load i32, ptr %193, align 4
  %195 = add i32 %194, 10
  %196 = getelementptr i32, ptr %registers, i32 8
  store i32 %195, ptr %196, align 4
  br label %pc53

pc53:
  %197 = getelementptr i32, ptr %registers, i32 7
  %198 = load i32, ptr %197, align 4
  %199 = mul i32 %198, 235
  %200 = icmp eq i32 %199, -2147483648
  %201 = and i1 %200, false
  %202 = or i1 false, %201
  br i1 %202, label %fault21, label %checked22

pc54:
  %203 = getelementptr i32, ptr %registers, i32 9
  %204 = load i32, ptr %203, align 4
  %205 = add i32 %204, 20
  %206 = getelementptr i32, ptr %registers, i32 9
  store i32 %205, ptr %206, align 4
  br label %pc55

pc55:
  %207 = getelementptr i32, ptr %registers, i32 7
  %208 = load i32, ptr %207, align 4
  %209 = mul i32 %208, 215
  %210 = icmp eq i32 %209, -2147483648
  %211 = and i1 %210, false
  %212 = or i1 false, %211
  br i1 %212, label %fault23, label %checked24

pc56:
  %213 = getelementptr i32, ptr %registers, i32 10
  %214 = load i32, ptr %213, align 4
  %215 = add i32 %214, 40
  %216 = getelementptr i32, ptr %registers, i32 10
  store i32 %215, ptr %216, align 4
  br label %pc57

pc57:
  br label %pc64

pc58:
  %217 = getelementptr i32, ptr %registers, i32 7
  %218 = load i32, ptr %217, align 4
  %219 = sub i32 0, %218
  %220 = getelementptr i32, ptr %registers, i32 7
  store i32 %219, ptr %220, align 4
  br label %pc59

pc59:
  %221 = getelementptr i32, ptr %registers, i32 8
  store i32 5, ptr %221, align 4
  br label %pc60

pc60:
  %222 = getelementptr i32, ptr %registers, i32 7
  %223 = load i32, ptr %222, align 4
  %224 = mul i32 %223, 30
  %225 = icmp eq i32 %224, -2147483648
  %226 = and i1 %225, false
  %227 = or i1 false, %226
  br i1 %227, label %fault25, label %checked26

pc61:
  %228 = getelementptr i32, ptr %registers, i32 9
  %229 = load i32, ptr %228, align 4
  %230 = add i32 %229, 10
  %231 = getelementptr i32, ptr %registers, i32 9
  store i32 %230, ptr %231, align 4
  br label %pc62

pc62:
  %232 = getelementptr i32, ptr %registers, i32 7
  %233 = load i32, ptr %232, align 4
  %234 = mul i32 %233, 100
  %235 = icmp eq i32 %234, -2147483648
  %236 = and i1 %235, false
  %237 = or i1 false, %236
  br i1 %237, label %fault27, label %checked28

pc63:
  %238 = getelementptr i32, ptr %registers, i32 10
  %239 = load i32, ptr %238, align 4
  %240 = add i32 %239, 25
  %241 = getelementptr i32, ptr %registers, i32 10
  store i32 %240, ptr %241, align 4
  br label %pc64

pc64:
  %242 = getelementptr i32, ptr %registers, i32 8
  %243 = load i32, ptr %242, align 4
  %244 = getelementptr i32, ptr %registers, i32 9
  %245 = load i32, ptr %244, align 4
  %246 = getelementptr i32, ptr %registers, i32 10
  %247 = load i32, ptr %246, align 4
  %248 = and i32 %243, 255
  %249 = shl i32 %248, 16
  %250 = and i32 %245, 255
  %251 = shl i32 %250, 8
  %252 = and i32 %247, 255
  %253 = or i32 %251, %252
  %254 = or i32 %249, %253
  %255 = or i32 -16777216, %254
  %256 = getelementptr i32, ptr %registers, i32 11
  store i32 %255, ptr %256, align 4
  br label %pc65

pc65:
  %257 = getelementptr i32, ptr %registers, i32 5
  %258 = load i32, ptr %257, align 4
  %259 = getelementptr i32, ptr %registers, i32 4
  %260 = load i32, ptr %259, align 4
  %261 = getelementptr i32, ptr %registers, i32 11
  %262 = load i32, ptr %261, align 4
  %263 = mul i32 %258, 4
  %264 = add i32 %263, 1
  %265 = mul i32 %260, 4
  %266 = add i32 %265, 1
  %267 = add i32 %264, 1
  %268 = add i32 %266, 1
  call void @wavePixel(i32 %264, i32 %266, i32 %262)
  call void @wavePixel(i32 %267, i32 %266, i32 %262)
  call void @wavePixel(i32 %264, i32 %268, i32 %262)
  call void @wavePixel(i32 %267, i32 %268, i32 %262)
  br label %pc66

pc66:
  %269 = getelementptr i32, ptr %registers, i32 6
  %270 = load i32, ptr %269, align 4
  %271 = add i32 %270, 1
  %272 = getelementptr i32, ptr %registers, i32 6
  store i32 %271, ptr %272, align 4
  br label %pc67

pc67:
  %273 = getelementptr i32, ptr %registers, i32 5
  %274 = load i32, ptr %273, align 4
  %275 = add i32 %274, 1
  %276 = getelementptr i32, ptr %registers, i32 5
  store i32 %275, ptr %276, align 4
  br label %pc68

pc68:
  %277 = getelementptr i32, ptr %registers, i32 5
  %278 = load i32, ptr %277, align 4
  %279 = icmp slt i32 %278, 384
  br i1 %279, label %pc45, label %pc69

pc69:
  %280 = getelementptr i32, ptr %registers, i32 4
  %281 = load i32, ptr %280, align 4
  %282 = add i32 %281, 1
  %283 = getelementptr i32, ptr %registers, i32 4
  store i32 %282, ptr %283, align 4
  br label %pc70

pc70:
  %284 = getelementptr i32, ptr %registers, i32 4
  %285 = load i32, ptr %284, align 4
  %286 = icmp slt i32 %285, 192
  br i1 %286, label %pc44, label %pc71

pc71:
  %287 = call i32 @waveFlush()
  %288 = getelementptr i32, ptr %registers, i32 30
  store i32 %287, ptr %288, align 4
  br label %pc72

pc72:
  %289 = getelementptr i32, ptr %registers, i32 30
  %290 = load i32, ptr %289, align 4
  %291 = icmp eq i32 %290, 0
  br i1 %291, label %pc116, label %pc73

pc73:
  %292 = getelementptr i32, ptr %registers, i32 4
  store i32 0, ptr %292, align 4
  br label %pc74

pc74:
  %293 = getelementptr i32, ptr %registers, i32 2
  %294 = load i32, ptr %293, align 4
  %295 = getelementptr i32, ptr %registers, i32 4
  %296 = load i32, ptr %295, align 4
  %297 = add i32 %294, %296
  %298 = icmp uge i32 %297, 221184
  br i1 %298, label %fault29, label %checked30

pc75:
  %299 = getelementptr i32, ptr %registers, i32 4
  %300 = load i32, ptr %299, align 4
  %301 = add i32 %300, 73344
  %302 = getelementptr i32, ptr %registers, i32 9
  store i32 %301, ptr %302, align 4
  br label %pc76

pc76:
  %303 = getelementptr i32, ptr %registers, i32 2
  %304 = load i32, ptr %303, align 4
  %305 = getelementptr i32, ptr %registers, i32 9
  %306 = load i32, ptr %305, align 4
  %307 = add i32 %304, %306
  %308 = icmp uge i32 %307, 221184
  br i1 %308, label %fault31, label %checked32

pc77:
  %309 = getelementptr i32, ptr %registers, i32 4
  %310 = load i32, ptr %309, align 4
  %311 = add i32 %310, 1
  %312 = getelementptr i32, ptr %registers, i32 4
  store i32 %311, ptr %312, align 4
  br label %pc78

pc78:
  %313 = getelementptr i32, ptr %registers, i32 4
  %314 = load i32, ptr %313, align 4
  %315 = icmp slt i32 %314, 384
  br i1 %315, label %pc74, label %pc79

pc79:
  %316 = getelementptr i32, ptr %registers, i32 5
  store i32 0, ptr %316, align 4
  br label %pc80

pc80:
  %317 = getelementptr i32, ptr %registers, i32 5
  %318 = load i32, ptr %317, align 4
  %319 = mul i32 %318, 384
  %320 = getelementptr i32, ptr %registers, i32 9
  store i32 %319, ptr %320, align 4
  br label %pc81

pc81:
  %321 = getelementptr i32, ptr %registers, i32 2
  %322 = load i32, ptr %321, align 4
  %323 = getelementptr i32, ptr %registers, i32 9
  %324 = load i32, ptr %323, align 4
  %325 = add i32 %322, %324
  %326 = icmp uge i32 %325, 221184
  br i1 %326, label %fault33, label %checked34

pc82:
  %327 = getelementptr i32, ptr %registers, i32 9
  %328 = load i32, ptr %327, align 4
  %329 = add i32 %328, 383
  %330 = getelementptr i32, ptr %registers, i32 9
  store i32 %329, ptr %330, align 4
  br label %pc83

pc83:
  %331 = getelementptr i32, ptr %registers, i32 2
  %332 = load i32, ptr %331, align 4
  %333 = getelementptr i32, ptr %registers, i32 9
  %334 = load i32, ptr %333, align 4
  %335 = add i32 %332, %334
  %336 = icmp uge i32 %335, 221184
  br i1 %336, label %fault35, label %checked36

pc84:
  %337 = getelementptr i32, ptr %registers, i32 5
  %338 = load i32, ptr %337, align 4
  %339 = add i32 %338, 1
  %340 = getelementptr i32, ptr %registers, i32 5
  store i32 %339, ptr %340, align 4
  br label %pc85

pc85:
  %341 = getelementptr i32, ptr %registers, i32 5
  %342 = load i32, ptr %341, align 4
  %343 = icmp slt i32 %342, 192
  br i1 %343, label %pc80, label %pc86

pc86:
  %344 = getelementptr i32, ptr %registers, i32 5
  store i32 1, ptr %344, align 4
  br label %pc87

pc87:
  %345 = getelementptr i32, ptr %registers, i32 4
  store i32 1, ptr %345, align 4
  br label %pc88

pc88:
  %346 = getelementptr i32, ptr %registers, i32 5
  %347 = load i32, ptr %346, align 4
  %348 = mul i32 %347, 384
  %349 = getelementptr i32, ptr %registers, i32 6
  store i32 %348, ptr %349, align 4
  br label %pc89

pc89:
  %350 = getelementptr i32, ptr %registers, i32 6
  %351 = load i32, ptr %350, align 4
  %352 = getelementptr i32, ptr %registers, i32 4
  %353 = load i32, ptr %352, align 4
  %354 = add i32 %351, %353
  %355 = getelementptr i32, ptr %registers, i32 6
  store i32 %354, ptr %355, align 4
  br label %pc90

pc90:
  %356 = getelementptr i32, ptr %registers, i32 6
  %357 = load i32, ptr %356, align 4
  %358 = sub i32 %357, 1
  %359 = getelementptr i32, ptr %registers, i32 9
  store i32 %358, ptr %359, align 4
  br label %pc91

pc91:
  %360 = getelementptr i32, ptr %registers, i32 1
  %361 = load i32, ptr %360, align 4
  %362 = getelementptr i32, ptr %registers, i32 9
  %363 = load i32, ptr %362, align 4
  %364 = add i32 %361, %363
  %365 = icmp uge i32 %364, 221184
  br i1 %365, label %fault37, label %checked38

pc92:
  %366 = getelementptr i32, ptr %registers, i32 6
  %367 = load i32, ptr %366, align 4
  %368 = add i32 %367, 1
  %369 = getelementptr i32, ptr %registers, i32 9
  store i32 %368, ptr %369, align 4
  br label %pc93

pc93:
  %370 = getelementptr i32, ptr %registers, i32 1
  %371 = load i32, ptr %370, align 4
  %372 = getelementptr i32, ptr %registers, i32 9
  %373 = load i32, ptr %372, align 4
  %374 = add i32 %371, %373
  %375 = icmp uge i32 %374, 221184
  br i1 %375, label %fault39, label %checked40

pc94:
  %376 = getelementptr i32, ptr %registers, i32 7
  %377 = load i32, ptr %376, align 4
  %378 = getelementptr i32, ptr %registers, i32 8
  %379 = load i32, ptr %378, align 4
  %380 = add i32 %377, %379
  %381 = getelementptr i32, ptr %registers, i32 7
  store i32 %380, ptr %381, align 4
  br label %pc95

pc95:
  %382 = getelementptr i32, ptr %registers, i32 6
  %383 = load i32, ptr %382, align 4
  %384 = sub i32 %383, 384
  %385 = getelementptr i32, ptr %registers, i32 9
  store i32 %384, ptr %385, align 4
  br label %pc96

pc96:
  %386 = getelementptr i32, ptr %registers, i32 1
  %387 = load i32, ptr %386, align 4
  %388 = getelementptr i32, ptr %registers, i32 9
  %389 = load i32, ptr %388, align 4
  %390 = add i32 %387, %389
  %391 = icmp uge i32 %390, 221184
  br i1 %391, label %fault41, label %checked42

pc97:
  %392 = getelementptr i32, ptr %registers, i32 7
  %393 = load i32, ptr %392, align 4
  %394 = getelementptr i32, ptr %registers, i32 8
  %395 = load i32, ptr %394, align 4
  %396 = add i32 %393, %395
  %397 = getelementptr i32, ptr %registers, i32 7
  store i32 %396, ptr %397, align 4
  br label %pc98

pc98:
  %398 = getelementptr i32, ptr %registers, i32 6
  %399 = load i32, ptr %398, align 4
  %400 = add i32 %399, 384
  %401 = getelementptr i32, ptr %registers, i32 9
  store i32 %400, ptr %401, align 4
  br label %pc99

pc99:
  %402 = getelementptr i32, ptr %registers, i32 1
  %403 = load i32, ptr %402, align 4
  %404 = getelementptr i32, ptr %registers, i32 9
  %405 = load i32, ptr %404, align 4
  %406 = add i32 %403, %405
  %407 = icmp uge i32 %406, 221184
  br i1 %407, label %fault43, label %checked44

pc100:
  %408 = getelementptr i32, ptr %registers, i32 7
  %409 = load i32, ptr %408, align 4
  %410 = getelementptr i32, ptr %registers, i32 8
  %411 = load i32, ptr %410, align 4
  %412 = add i32 %409, %411
  %413 = getelementptr i32, ptr %registers, i32 7
  store i32 %412, ptr %413, align 4
  br label %pc101

pc101:
  %414 = getelementptr i32, ptr %registers, i32 7
  %415 = load i32, ptr %414, align 4
  %416 = icmp eq i32 %415, -2147483648
  %417 = and i1 %416, false
  %418 = or i1 false, %417
  br i1 %418, label %fault45, label %checked46

pc102:
  %419 = getelementptr i32, ptr %registers, i32 0
  %420 = load i32, ptr %419, align 4
  %421 = getelementptr i32, ptr %registers, i32 6
  %422 = load i32, ptr %421, align 4
  %423 = add i32 %420, %422
  %424 = icmp uge i32 %423, 221184
  br i1 %424, label %fault47, label %checked48

pc103:
  %425 = getelementptr i32, ptr %registers, i32 7
  %426 = load i32, ptr %425, align 4
  %427 = getelementptr i32, ptr %registers, i32 8
  %428 = load i32, ptr %427, align 4
  %429 = sub i32 %426, %428
  %430 = getelementptr i32, ptr %registers, i32 7
  store i32 %429, ptr %430, align 4
  br label %pc104

pc104:
  %431 = getelementptr i32, ptr %registers, i32 7
  %432 = load i32, ptr %431, align 4
  %433 = mul i32 %432, 998
  %434 = icmp eq i32 %433, -2147483648
  %435 = and i1 %434, false
  %436 = or i1 false, %435
  br i1 %436, label %fault49, label %checked50

pc105:
  %437 = getelementptr i32, ptr %registers, i32 2
  %438 = load i32, ptr %437, align 4
  %439 = getelementptr i32, ptr %registers, i32 6
  %440 = load i32, ptr %439, align 4
  %441 = getelementptr i32, ptr %registers, i32 7
  %442 = load i32, ptr %441, align 4
  %443 = add i32 %438, %440
  %444 = icmp uge i32 %443, 221184
  br i1 %444, label %fault51, label %checked52

pc106:
  %445 = getelementptr i32, ptr %registers, i32 4
  %446 = load i32, ptr %445, align 4
  %447 = add i32 %446, 1
  %448 = getelementptr i32, ptr %registers, i32 4
  store i32 %447, ptr %448, align 4
  br label %pc107

pc107:
  %449 = getelementptr i32, ptr %registers, i32 4
  %450 = load i32, ptr %449, align 4
  %451 = icmp slt i32 %450, 383
  br i1 %451, label %pc88, label %pc108

pc108:
  %452 = getelementptr i32, ptr %registers, i32 5
  %453 = load i32, ptr %452, align 4
  %454 = add i32 %453, 1
  %455 = getelementptr i32, ptr %registers, i32 5
  store i32 %454, ptr %455, align 4
  br label %pc109

pc109:
  %456 = getelementptr i32, ptr %registers, i32 5
  %457 = load i32, ptr %456, align 4
  %458 = icmp slt i32 %457, 191
  br i1 %458, label %pc87, label %pc110

pc110:
  %459 = getelementptr i32, ptr %registers, i32 0
  %460 = load i32, ptr %459, align 4
  %461 = getelementptr i32, ptr %registers, i32 4
  store i32 %460, ptr %461, align 4
  br label %pc111

pc111:
  %462 = getelementptr i32, ptr %registers, i32 1
  %463 = load i32, ptr %462, align 4
  %464 = getelementptr i32, ptr %registers, i32 0
  store i32 %463, ptr %464, align 4
  br label %pc112

pc112:
  %465 = getelementptr i32, ptr %registers, i32 2
  %466 = load i32, ptr %465, align 4
  %467 = getelementptr i32, ptr %registers, i32 1
  store i32 %466, ptr %467, align 4
  br label %pc113

pc113:
  %468 = getelementptr i32, ptr %registers, i32 4
  %469 = load i32, ptr %468, align 4
  %470 = getelementptr i32, ptr %registers, i32 2
  store i32 %469, ptr %470, align 4
  br label %pc114

pc114:
  %471 = getelementptr i32, ptr %registers, i32 3
  %472 = load i32, ptr %471, align 4
  %473 = add i32 %472, 1
  %474 = getelementptr i32, ptr %registers, i32 3
  store i32 %473, ptr %474, align 4
  br label %pc115

pc115:
  br label %pc8

pc116:
  ret void

pc117:
  ret void

fault:
  call void @waveFault(i32 1)
  unreachable

checked:
  %475 = getelementptr i32, ptr %memory, i32 %7
  store i32 0, ptr %475, align 4
  br label %pc6

fault1:
  call void @waveFault(i32 2)
  unreachable

checked2:
  %476 = srem i32 %17, 70
  %477 = getelementptr i32, ptr %registers, i32 4
  store i32 %476, ptr %477, align 4
  br label %pc9

fault3:
  call void @waveFault(i32 2)
  unreachable

checked4:
  %478 = srem i32 %27, 368
  %479 = getelementptr i32, ptr %registers, i32 4
  store i32 %478, ptr %479, align 4
  br label %pc12

fault5:
  call void @waveFault(i32 2)
  unreachable

checked6:
  %480 = srem i32 %38, 176
  %481 = getelementptr i32, ptr %registers, i32 5
  store i32 %480, ptr %481, align 4
  br label %pc15

fault7:
  call void @waveFault(i32 2)
  unreachable

checked8:
  %482 = sdiv i32 %99, 37
  %483 = getelementptr i32, ptr %registers, i32 11
  store i32 %482, ptr %483, align 4
  br label %pc30

fault9:
  call void @waveFault(i32 1)
  unreachable

checked10:
  %484 = getelementptr i32, ptr %memory, i32 %117
  %485 = load i32, ptr %484, align 4
  %486 = getelementptr i32, ptr %registers, i32 13
  store i32 %485, ptr %486, align 4
  br label %pc33

fault11:
  call void @waveFault(i32 1)
  unreachable

checked12:
  %487 = getelementptr i32, ptr %memory, i32 %131
  store i32 %130, ptr %487, align 4
  br label %pc35

fault13:
  call void @waveFault(i32 1)
  unreachable

checked14:
  %488 = getelementptr i32, ptr %memory, i32 %137
  %489 = load i32, ptr %488, align 4
  %490 = getelementptr i32, ptr %registers, i32 13
  store i32 %489, ptr %490, align 4
  br label %pc36

fault15:
  call void @waveFault(i32 1)
  unreachable

checked16:
  %491 = getelementptr i32, ptr %memory, i32 %151
  store i32 %150, ptr %491, align 4
  br label %pc38

fault17:
  call void @waveFault(i32 1)
  unreachable

checked18:
  %492 = getelementptr i32, ptr %memory, i32 %174
  %493 = load i32, ptr %492, align 4
  %494 = getelementptr i32, ptr %registers, i32 7
  store i32 %493, ptr %494, align 4
  br label %pc46

fault19:
  call void @waveFault(i32 2)
  unreachable

checked20:
  %495 = sdiv i32 %189, 1000
  %496 = getelementptr i32, ptr %registers, i32 8
  store i32 %495, ptr %496, align 4
  br label %pc52

fault21:
  call void @waveFault(i32 2)
  unreachable

checked22:
  %497 = sdiv i32 %199, 1000
  %498 = getelementptr i32, ptr %registers, i32 9
  store i32 %497, ptr %498, align 4
  br label %pc54

fault23:
  call void @waveFault(i32 2)
  unreachable

checked24:
  %499 = sdiv i32 %209, 1000
  %500 = getelementptr i32, ptr %registers, i32 10
  store i32 %499, ptr %500, align 4
  br label %pc56

fault25:
  call void @waveFault(i32 2)
  unreachable

checked26:
  %501 = sdiv i32 %224, 1000
  %502 = getelementptr i32, ptr %registers, i32 9
  store i32 %501, ptr %502, align 4
  br label %pc61

fault27:
  call void @waveFault(i32 2)
  unreachable

checked28:
  %503 = sdiv i32 %234, 1000
  %504 = getelementptr i32, ptr %registers, i32 10
  store i32 %503, ptr %504, align 4
  br label %pc63

fault29:
  call void @waveFault(i32 1)
  unreachable

checked30:
  %505 = getelementptr i32, ptr %memory, i32 %297
  store i32 0, ptr %505, align 4
  br label %pc75

fault31:
  call void @waveFault(i32 1)
  unreachable

checked32:
  %506 = getelementptr i32, ptr %memory, i32 %307
  store i32 0, ptr %506, align 4
  br label %pc77

fault33:
  call void @waveFault(i32 1)
  unreachable

checked34:
  %507 = getelementptr i32, ptr %memory, i32 %325
  store i32 0, ptr %507, align 4
  br label %pc82

fault35:
  call void @waveFault(i32 1)
  unreachable

checked36:
  %508 = getelementptr i32, ptr %memory, i32 %335
  store i32 0, ptr %508, align 4
  br label %pc84

fault37:
  call void @waveFault(i32 1)
  unreachable

checked38:
  %509 = getelementptr i32, ptr %memory, i32 %364
  %510 = load i32, ptr %509, align 4
  %511 = getelementptr i32, ptr %registers, i32 7
  store i32 %510, ptr %511, align 4
  br label %pc92

fault39:
  call void @waveFault(i32 1)
  unreachable

checked40:
  %512 = getelementptr i32, ptr %memory, i32 %374
  %513 = load i32, ptr %512, align 4
  %514 = getelementptr i32, ptr %registers, i32 8
  store i32 %513, ptr %514, align 4
  br label %pc94

fault41:
  call void @waveFault(i32 1)
  unreachable

checked42:
  %515 = getelementptr i32, ptr %memory, i32 %390
  %516 = load i32, ptr %515, align 4
  %517 = getelementptr i32, ptr %registers, i32 8
  store i32 %516, ptr %517, align 4
  br label %pc97

fault43:
  call void @waveFault(i32 1)
  unreachable

checked44:
  %518 = getelementptr i32, ptr %memory, i32 %406
  %519 = load i32, ptr %518, align 4
  %520 = getelementptr i32, ptr %registers, i32 8
  store i32 %519, ptr %520, align 4
  br label %pc100

fault45:
  call void @waveFault(i32 2)
  unreachable

checked46:
  %521 = sdiv i32 %415, 2
  %522 = getelementptr i32, ptr %registers, i32 7
  store i32 %521, ptr %522, align 4
  br label %pc102

fault47:
  call void @waveFault(i32 1)
  unreachable

checked48:
  %523 = getelementptr i32, ptr %memory, i32 %423
  %524 = load i32, ptr %523, align 4
  %525 = getelementptr i32, ptr %registers, i32 8
  store i32 %524, ptr %525, align 4
  br label %pc103

fault49:
  call void @waveFault(i32 2)
  unreachable

checked50:
  %526 = sdiv i32 %433, 1000
  %527 = getelementptr i32, ptr %registers, i32 7
  store i32 %526, ptr %527, align 4
  br label %pc105

fault51:
  call void @waveFault(i32 1)
  unreachable

checked52:
  %528 = getelementptr i32, ptr %memory, i32 %443
  store i32 %442, ptr %528, align 4
  br label %pc106
}

declare i32 @waveRand()

declare i32 @waveFlush()

declare void @wavePixel(i32, i32, i32)

declare void @waveFault(i32) #0

attributes #0 = { noreturn }

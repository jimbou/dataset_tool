; ModuleID = 'game_of_life_inst.bc'
source_filename = "game_of_life.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [69 x i8] c"/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"rapl_beg_end.txt\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"%llu\0A\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [35 x i8] c"Usage: ./exec ArraySize TimeSteps\0A\00", align 1
@.str.6 = private unnamed_addr constant [39 x i8] c"GameOfLife: Size %d Steps %d Time %lf\0A\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"out%d.pgm\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"P5\0A%d %d 1\0A\00", align 1
@.str.10 = private unnamed_addr constant [14 x i8] c"rapl_rest.txt\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rapl_D() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  store i8* null, i8** %1, align 8
  store i64 0, i64* %2, align 8
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #5
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #5
  unreachable

16:                                               ; preds = %12
  br label %17

17:                                               ; preds = %21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %19 = call i64 @getline(i8** %1, i64* %2, %struct._IO_FILE* %18)
  store i64 %19, i64* %3, align 8
  %20 = icmp ne i64 %19, -1
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  br label %17

22:                                               ; preds = %17
  %23 = load i8*, i8** %1, align 8
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #6
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #6
  br label %29

29:                                               ; preds = %27, %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %33 = load i64, i64* %4, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i64 %33)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %36 = call i32 @fclose(%struct._IO_FILE* %35)
  ret void
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

declare dso_local i64 @getline(i8**, i64*, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare dso_local i64 @strtoull(i8*, i8**, i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @do_nothing() #0 {
do_nothing:
  call void @rapl_A()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
main:
  call void @rapl_A()
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32**, align 8
  %8 = alloca i32**, align 8
  %9 = alloca i32**, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca double, align 8
  %15 = alloca %struct.timeval, align 8
  %16 = alloca %struct.timeval, align 8
  store i32 0, i32* %2, align 4
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  call void @rapl_B()
  call void @do_nothing()
  call void @rapl_C()
  %17 = load i32, i32* %3, align 4
  %18 = icmp ne i32 %17, 3
  br i1 %18, label %main1, label %main2

main1:                                            ; preds = %main
  call void @rapl_A()
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  call void @rapl_B()
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i64 0, i64 0))
  call void @rapl_C()
  call void @rapl_B()
  call void @exit(i32 -1) #5
  call void @rapl_C()
  unreachable

main2:                                            ; preds = %main
  call void @rapl_A()
  %21 = load i8**, i8*** %4, align 8
  %22 = getelementptr inbounds i8*, i8** %21, i64 1
  %23 = load i8*, i8** %22, align 8
  call void @rapl_B()
  %24 = call i32 @atoi(i8* %23) #7
  call void @rapl_C()
  store i32 %24, i32* %5, align 4
  %25 = load i8**, i8*** %4, align 8
  %26 = getelementptr inbounds i8*, i8** %25, i64 2
  %27 = load i8*, i8** %26, align 8
  call void @rapl_B()
  %28 = call i32 @atoi(i8* %27) #7
  call void @rapl_C()
  store i32 %28, i32* %6, align 4
  br label %main3

main3:                                            ; preds = %main2
  call void @rapl_A()
  %29 = load i32, i32* %5, align 4
  call void @rapl_B()
  %30 = call i32** @allocate_array(i32 %29)
  call void @rapl_C()
  store i32** %30, i32*** %7, align 8
  %31 = load i32, i32* %5, align 4
  call void @rapl_B()
  %32 = call i32** @allocate_array(i32 %31)
  call void @rapl_C()
  store i32** %32, i32*** %8, align 8
  %33 = load i32**, i32*** %8, align 8
  %34 = load i32**, i32*** %7, align 8
  %35 = load i32, i32* %5, align 4
  call void @rapl_B()
  call void @init_random(i32** %33, i32** %34, i32 %35)
  call void @rapl_C()
  call void @rapl_B()
  %36 = call i32 @gettimeofday(%struct.timeval* %15, i8* null) #6
  call void @rapl_C()
  store i32 0, i32* %10, align 4
  br label %main4

main4:                                            ; preds = %main18, %main3
  call void @rapl_A()
  %37 = load i32, i32* %10, align 4
  %38 = load i32, i32* %6, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %main5, label %main19

main5:                                            ; preds = %main4
  call void @rapl_A()
  store i32 1, i32* %11, align 4
  br label %main6

main6:                                            ; preds = %main16, %main5
  call void @rapl_A()
  %40 = load i32, i32* %11, align 4
  %41 = load i32, i32* %5, align 4
  %42 = sub nsw i32 %41, 1
  %43 = icmp slt i32 %40, %42
  br i1 %43, label %main7, label %main17

main7:                                            ; preds = %main6
  call void @rapl_A()
  store i32 1, i32* %12, align 4
  br label %main8

main8:                                            ; preds = %main14, %main7
  call void @rapl_A()
  %44 = load i32, i32* %12, align 4
  %45 = load i32, i32* %5, align 4
  %46 = sub nsw i32 %45, 1
  %47 = icmp slt i32 %44, %46
  br i1 %47, label %main9, label %main15

main9:                                            ; preds = %main8
  call void @rapl_A()
  %48 = load i32**, i32*** %8, align 8
  %49 = load i32, i32* %11, align 4
  %50 = add nsw i32 %49, 1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32*, i32** %48, i64 %51
  %53 = load i32*, i32** %52, align 8
  %54 = load i32, i32* %12, align 4
  %55 = add nsw i32 %54, 1
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32* %53, i64 %56
  %58 = load i32, i32* %57, align 4
  %59 = load i32**, i32*** %8, align 8
  %60 = load i32, i32* %11, align 4
  %61 = add nsw i32 %60, 1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32*, i32** %59, i64 %62
  %64 = load i32*, i32** %63, align 8
  %65 = load i32, i32* %12, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32* %64, i64 %66
  %68 = load i32, i32* %67, align 4
  %69 = add nsw i32 %58, %68
  %70 = load i32**, i32*** %8, align 8
  %71 = load i32, i32* %11, align 4
  %72 = add nsw i32 %71, 1
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32*, i32** %70, i64 %73
  %75 = load i32*, i32** %74, align 8
  %76 = load i32, i32* %12, align 4
  %77 = sub nsw i32 %76, 1
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i32, i32* %75, i64 %78
  %80 = load i32, i32* %79, align 4
  %81 = add nsw i32 %69, %80
  %82 = load i32**, i32*** %8, align 8
  %83 = load i32, i32* %11, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32*, i32** %82, i64 %84
  %86 = load i32*, i32** %85, align 8
  %87 = load i32, i32* %12, align 4
  %88 = sub nsw i32 %87, 1
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32* %86, i64 %89
  %91 = load i32, i32* %90, align 4
  %92 = add nsw i32 %81, %91
  %93 = load i32**, i32*** %8, align 8
  %94 = load i32, i32* %11, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32*, i32** %93, i64 %95
  %97 = load i32*, i32** %96, align 8
  %98 = load i32, i32* %12, align 4
  %99 = add nsw i32 %98, 1
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32* %97, i64 %100
  %102 = load i32, i32* %101, align 4
  %103 = add nsw i32 %92, %102
  %104 = load i32**, i32*** %8, align 8
  %105 = load i32, i32* %11, align 4
  %106 = sub nsw i32 %105, 1
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i32*, i32** %104, i64 %107
  %109 = load i32*, i32** %108, align 8
  %110 = load i32, i32* %12, align 4
  %111 = sub nsw i32 %110, 1
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, i32* %109, i64 %112
  %114 = load i32, i32* %113, align 4
  %115 = add nsw i32 %103, %114
  %116 = load i32**, i32*** %8, align 8
  %117 = load i32, i32* %11, align 4
  %118 = sub nsw i32 %117, 1
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i32*, i32** %116, i64 %119
  %121 = load i32*, i32** %120, align 8
  %122 = load i32, i32* %12, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, i32* %121, i64 %123
  %125 = load i32, i32* %124, align 4
  %126 = add nsw i32 %115, %125
  %127 = load i32**, i32*** %8, align 8
  %128 = load i32, i32* %11, align 4
  %129 = sub nsw i32 %128, 1
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32*, i32** %127, i64 %130
  %132 = load i32*, i32** %131, align 8
  %133 = load i32, i32* %12, align 4
  %134 = add nsw i32 %133, 1
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i32, i32* %132, i64 %135
  %137 = load i32, i32* %136, align 4
  %138 = add nsw i32 %126, %137
  store i32 %138, i32* %13, align 4
  %139 = load i32, i32* %13, align 4
  %140 = icmp eq i32 %139, 3
  br i1 %140, label %main11, label %main10

main10:                                           ; preds = %main9
  call void @rapl_A()
  %141 = load i32**, i32*** %8, align 8
  %142 = load i32, i32* %11, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i32*, i32** %141, i64 %143
  %145 = load i32*, i32** %144, align 8
  %146 = load i32, i32* %12, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i32, i32* %145, i64 %147
  %149 = load i32, i32* %148, align 4
  %150 = load i32, i32* %13, align 4
  %151 = add nsw i32 %149, %150
  %152 = icmp eq i32 %151, 3
  br i1 %152, label %main11, label %main12

main11:                                           ; preds = %main10, %main9
  call void @rapl_A()
  %153 = load i32**, i32*** %7, align 8
  %154 = load i32, i32* %11, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i32*, i32** %153, i64 %155
  %157 = load i32*, i32** %156, align 8
  %158 = load i32, i32* %12, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i32, i32* %157, i64 %159
  store i32 1, i32* %160, align 4
  br label %main13

main12:                                           ; preds = %main10
  call void @rapl_A()
  %161 = load i32**, i32*** %7, align 8
  %162 = load i32, i32* %11, align 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds i32*, i32** %161, i64 %163
  %165 = load i32*, i32** %164, align 8
  %166 = load i32, i32* %12, align 4
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds i32, i32* %165, i64 %167
  store i32 0, i32* %168, align 4
  br label %main13

main13:                                           ; preds = %main12, %main11
  call void @rapl_A()
  br label %main14

main14:                                           ; preds = %main13
  call void @rapl_A()
  %169 = load i32, i32* %12, align 4
  %170 = add nsw i32 %169, 1
  store i32 %170, i32* %12, align 4
  br label %main8

main15:                                           ; preds = %main8
  call void @rapl_A()
  br label %main16

main16:                                           ; preds = %main15
  call void @rapl_A()
  %171 = load i32, i32* %11, align 4
  %172 = add nsw i32 %171, 1
  store i32 %172, i32* %11, align 4
  br label %main6

main17:                                           ; preds = %main6
  call void @rapl_A()
  %173 = load i32**, i32*** %7, align 8
  store i32** %173, i32*** %9, align 8
  %174 = load i32**, i32*** %8, align 8
  store i32** %174, i32*** %7, align 8
  %175 = load i32**, i32*** %9, align 8
  store i32** %175, i32*** %8, align 8
  br label %main18

main18:                                           ; preds = %main17
  call void @rapl_A()
  %176 = load i32, i32* %10, align 4
  %177 = add nsw i32 %176, 1
  store i32 %177, i32* %10, align 4
  br label %main4

main19:                                           ; preds = %main4
  call void @rapl_A()
  call void @rapl_B()
  %178 = call i32 @gettimeofday(%struct.timeval* %16, i8* null) #6
  call void @rapl_C()
  %179 = getelementptr inbounds %struct.timeval, %struct.timeval* %16, i32 0, i32 0
  %180 = load i64, i64* %179, align 8
  %181 = getelementptr inbounds %struct.timeval, %struct.timeval* %15, i32 0, i32 0
  %182 = load i64, i64* %181, align 8
  %183 = sub nsw i64 %180, %182
  %184 = sitofp i64 %183 to double
  %185 = getelementptr inbounds %struct.timeval, %struct.timeval* %16, i32 0, i32 1
  %186 = load i64, i64* %185, align 8
  %187 = getelementptr inbounds %struct.timeval, %struct.timeval* %15, i32 0, i32 1
  %188 = load i64, i64* %187, align 8
  %189 = sub nsw i64 %186, %188
  %190 = sitofp i64 %189 to double
  %191 = fmul double %190, 0x3EB0C6F7A0B5ED8D
  %192 = fadd double %184, %191
  store double %192, double* %14, align 8
  %193 = load i32**, i32*** %7, align 8
  %194 = load i32, i32* %5, align 4
  call void @rapl_B()
  call void @free_array(i32** %193, i32 %194)
  call void @rapl_C()
  %195 = load i32**, i32*** %8, align 8
  %196 = load i32, i32* %5, align 4
  call void @rapl_B()
  call void @free_array(i32** %195, i32 %196)
  call void @rapl_C()
  %197 = load i32, i32* %5, align 4
  %198 = load i32, i32* %6, align 4
  %199 = load double, double* %14, align 8
  call void @rapl_B()
  %200 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.6, i64 0, i64 0), i32 %197, i32 %198, double %199)
  call void @rapl_C()
  call void @rapl_B()
  call void @do_nothing()
  call void @rapl_C()
  ret i32 0
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32** @allocate_array(i32 %0) #0 {
allocate_array:
  call void @rapl_A()
  %1 = alloca i32, align 4
  %2 = alloca i32**, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %1, align 4
  %5 = load i32, i32* %1, align 4
  %6 = sext i32 %5 to i64
  %7 = mul i64 %6, 8
  call void @rapl_B()
  %8 = call noalias i8* @malloc(i64 %7) #6
  call void @rapl_C()
  %9 = bitcast i8* %8 to i32**
  store i32** %9, i32*** %2, align 8
  store i32 0, i32* %3, align 4
  br label %allocate_array1

allocate_array1:                                  ; preds = %allocate_array3, %allocate_array
  call void @rapl_A()
  %10 = load i32, i32* %3, align 4
  %11 = load i32, i32* %1, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %allocate_array2, label %allocate_array4

allocate_array2:                                  ; preds = %allocate_array1
  call void @rapl_A()
  %13 = load i32, i32* %1, align 4
  %14 = sext i32 %13 to i64
  %15 = mul i64 %14, 4
  call void @rapl_B()
  %16 = call noalias i8* @malloc(i64 %15) #6
  call void @rapl_C()
  %17 = bitcast i8* %16 to i32*
  %18 = load i32**, i32*** %2, align 8
  %19 = load i32, i32* %3, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32*, i32** %18, i64 %20
  store i32* %17, i32** %21, align 8
  br label %allocate_array3

allocate_array3:                                  ; preds = %allocate_array2
  call void @rapl_A()
  %22 = load i32, i32* %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %3, align 4
  br label %allocate_array1

allocate_array4:                                  ; preds = %allocate_array1
  call void @rapl_A()
  store i32 0, i32* %3, align 4
  br label %allocate_array5

allocate_array5:                                  ; preds = %allocate_array11, %allocate_array4
  call void @rapl_A()
  %24 = load i32, i32* %3, align 4
  %25 = load i32, i32* %1, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %allocate_array6, label %allocate_array12

allocate_array6:                                  ; preds = %allocate_array5
  call void @rapl_A()
  store i32 0, i32* %4, align 4
  br label %allocate_array7

allocate_array7:                                  ; preds = %allocate_array9, %allocate_array6
  call void @rapl_A()
  %27 = load i32, i32* %4, align 4
  %28 = load i32, i32* %1, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %allocate_array8, label %allocate_array10

allocate_array8:                                  ; preds = %allocate_array7
  call void @rapl_A()
  %30 = load i32**, i32*** %2, align 8
  %31 = load i32, i32* %3, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32*, i32** %30, i64 %32
  %34 = load i32*, i32** %33, align 8
  %35 = load i32, i32* %4, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32* %34, i64 %36
  store i32 0, i32* %37, align 4
  br label %allocate_array9

allocate_array9:                                  ; preds = %allocate_array8
  call void @rapl_A()
  %38 = load i32, i32* %4, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %4, align 4
  br label %allocate_array7

allocate_array10:                                 ; preds = %allocate_array7
  call void @rapl_A()
  br label %allocate_array11

allocate_array11:                                 ; preds = %allocate_array10
  call void @rapl_A()
  %40 = load i32, i32* %3, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %3, align 4
  br label %allocate_array5

allocate_array12:                                 ; preds = %allocate_array5
  call void @rapl_A()
  %42 = load i32**, i32*** %2, align 8
  ret i32** %42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @init_random(i32** %0, i32** %1, i32 %2) #0 {
init_random:
  call void @rapl_A()
  %3 = alloca i32**, align 8
  %4 = alloca i32**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32** %0, i32*** %3, align 8
  store i32** %1, i32*** %4, align 8
  store i32 %2, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %init_random1

init_random1:                                     ; preds = %init_random3, %init_random
  call void @rapl_A()
  %10 = load i32, i32* %6, align 4
  %11 = load i32, i32* %5, align 4
  %12 = load i32, i32* %5, align 4
  %13 = mul nsw i32 %11, %12
  %14 = sdiv i32 %13, 10
  %15 = icmp slt i32 %10, %14
  br i1 %15, label %init_random2, label %init_random4

init_random2:                                     ; preds = %init_random1
  call void @rapl_A()
  call void @rapl_B()
  %16 = call i32 @rand() #6
  call void @rapl_C()
  %17 = load i32, i32* %5, align 4
  %18 = sub nsw i32 %17, 2
  %19 = load i32, i32* %5, align 4
  %20 = sub nsw i32 %19, 2
  %21 = mul nsw i32 %18, %20
  %22 = srem i32 %16, %21
  store i32 %22, i32* %7, align 4
  %23 = load i32**, i32*** %3, align 8
  %24 = load i32, i32* %7, align 4
  %25 = load i32, i32* %5, align 4
  %26 = sub nsw i32 %25, 2
  %27 = srem i32 %24, %26
  %28 = add nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32*, i32** %23, i64 %29
  %31 = load i32*, i32** %30, align 8
  %32 = load i32, i32* %7, align 4
  %33 = load i32, i32* %5, align 4
  %34 = sub nsw i32 %33, 2
  %35 = sdiv i32 %32, %34
  %36 = add nsw i32 %35, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32* %31, i64 %37
  store i32 1, i32* %38, align 4
  %39 = load i32**, i32*** %4, align 8
  %40 = load i32, i32* %7, align 4
  %41 = load i32, i32* %5, align 4
  %42 = sub nsw i32 %41, 2
  %43 = srem i32 %40, %42
  %44 = add nsw i32 %43, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32*, i32** %39, i64 %45
  %47 = load i32*, i32** %46, align 8
  %48 = load i32, i32* %7, align 4
  %49 = load i32, i32* %5, align 4
  %50 = sub nsw i32 %49, 2
  %51 = sdiv i32 %48, %50
  %52 = add nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32* %47, i64 %53
  store i32 1, i32* %54, align 4
  br label %init_random3

init_random3:                                     ; preds = %init_random2
  call void @rapl_A()
  %55 = load i32, i32* %6, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %6, align 4
  br label %init_random1

init_random4:                                     ; preds = %init_random1
  call void @rapl_A()
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval*, i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @free_array(i32** %0, i32 %1) #0 {
free_array:
  call void @rapl_A()
  %2 = alloca i32**, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32** %0, i32*** %2, align 8
  store i32 %1, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %free_array1

free_array1:                                      ; preds = %free_array3, %free_array
  call void @rapl_A()
  %5 = load i32, i32* %4, align 4
  %6 = load i32, i32* %3, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %free_array2, label %free_array4

free_array2:                                      ; preds = %free_array1
  call void @rapl_A()
  %8 = load i32**, i32*** %2, align 8
  %9 = load i32, i32* %4, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i32*, i32** %8, i64 %10
  %12 = load i32*, i32** %11, align 8
  %13 = bitcast i32* %12 to i8*
  call void @rapl_B()
  call void @free(i8* %13) #6
  call void @rapl_C()
  br label %free_array3

free_array3:                                      ; preds = %free_array2
  call void @rapl_A()
  %14 = load i32, i32* %4, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %4, align 4
  br label %free_array1

free_array4:                                      ; preds = %free_array1
  call void @rapl_A()
  %16 = load i32**, i32*** %2, align 8
  %17 = bitcast i32** %16 to i8*
  call void @rapl_B()
  call void @free(i8* %17) #6
  call void @rapl_C()
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @print_to_pgm(i32** %0, i32 %1, i32 %2) #0 {
print_to_pgm:
  call void @rapl_A()
  %3 = alloca i32**, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca %struct._IO_FILE*, align 8
  store i32** %0, i32*** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 %2, i32* %5, align 4
  call void @rapl_B()
  %10 = call noalias i8* @malloc(i64 30) #6
  call void @rapl_C()
  store i8* %10, i8** %8, align 8
  %11 = load i8*, i8** %8, align 8
  %12 = load i32, i32* %5, align 4
  call void @rapl_B()
  %13 = call i32 (i8*, i8*, ...) @sprintf(i8* %11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i64 0, i64 0), i32 %12) #6
  call void @rapl_C()
  %14 = load i8*, i8** %8, align 8
  call void @rapl_B()
  %15 = call %struct._IO_FILE* @fopen(i8* %14, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0))
  call void @rapl_C()
  store %struct._IO_FILE* %15, %struct._IO_FILE** %9, align 8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  %17 = load i32, i32* %4, align 4
  %18 = load i32, i32* %4, align 4
  call void @rapl_B()
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.9, i64 0, i64 0), i32 %17, i32 %18)
  call void @rapl_C()
  store i32 0, i32* %6, align 4
  br label %print_to_pgm1

print_to_pgm1:                                    ; preds = %print_to_pgm10, %print_to_pgm
  call void @rapl_A()
  %20 = load i32, i32* %6, align 4
  %21 = load i32, i32* %4, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %print_to_pgm2, label %print_to_pgm11

print_to_pgm2:                                    ; preds = %print_to_pgm1
  call void @rapl_A()
  store i32 0, i32* %7, align 4
  br label %print_to_pgm3

print_to_pgm3:                                    ; preds = %print_to_pgm8, %print_to_pgm2
  call void @rapl_A()
  %23 = load i32, i32* %7, align 4
  %24 = load i32, i32* %4, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %print_to_pgm4, label %print_to_pgm9

print_to_pgm4:                                    ; preds = %print_to_pgm3
  call void @rapl_A()
  %26 = load i32**, i32*** %3, align 8
  %27 = load i32, i32* %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32*, i32** %26, i64 %28
  %30 = load i32*, i32** %29, align 8
  %31 = load i32, i32* %7, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32* %30, i64 %32
  %34 = load i32, i32* %33, align 4
  %35 = icmp eq i32 %34, 1
  br i1 %35, label %print_to_pgm5, label %print_to_pgm6

print_to_pgm5:                                    ; preds = %print_to_pgm4
  call void @rapl_A()
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  call void @rapl_B()
  %37 = call i32 @fputc(i32 1, %struct._IO_FILE* %36)
  call void @rapl_C()
  br label %print_to_pgm7

print_to_pgm6:                                    ; preds = %print_to_pgm4
  call void @rapl_A()
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  call void @rapl_B()
  %39 = call i32 @fputc(i32 0, %struct._IO_FILE* %38)
  call void @rapl_C()
  br label %print_to_pgm7

print_to_pgm7:                                    ; preds = %print_to_pgm6, %print_to_pgm5
  call void @rapl_A()
  br label %print_to_pgm8

print_to_pgm8:                                    ; preds = %print_to_pgm7
  call void @rapl_A()
  %40 = load i32, i32* %7, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %7, align 4
  br label %print_to_pgm3

print_to_pgm9:                                    ; preds = %print_to_pgm3
  call void @rapl_A()
  br label %print_to_pgm10

print_to_pgm10:                                   ; preds = %print_to_pgm9
  call void @rapl_A()
  %42 = load i32, i32* %6, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %6, align 4
  br label %print_to_pgm1

print_to_pgm11:                                   ; preds = %print_to_pgm1
  call void @rapl_A()
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %9, align 8
  call void @rapl_B()
  %45 = call i32 @fclose(%struct._IO_FILE* %44)
  call void @rapl_C()
  %46 = load i8*, i8** %8, align 8
  call void @rapl_B()
  call void @free(i8* %46) #6
  call void @rapl_C()
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @sprintf(i8*, i8*, ...) #3

declare dso_local i32 @fputc(i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rapl_A() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  store i8* null, i8** %1, align 8
  store i64 0, i64* %2, align 8
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #5
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #5
  unreachable

16:                                               ; preds = %12
  br label %17

17:                                               ; preds = %21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %19 = call i64 @getline(i8** %1, i64* %2, %struct._IO_FILE* %18)
  store i64 %19, i64* %3, align 8
  %20 = icmp ne i64 %19, -1
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  br label %17

22:                                               ; preds = %17
  %23 = load i8*, i8** %1, align 8
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #6
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #6
  br label %29

29:                                               ; preds = %27, %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %33 = load i64, i64* %4, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i64 %33)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %36 = call i32 @fclose(%struct._IO_FILE* %35)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rapl_B() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  store i8* null, i8** %1, align 8
  store i64 0, i64* %2, align 8
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #5
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #5
  unreachable

16:                                               ; preds = %12
  br label %17

17:                                               ; preds = %21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %19 = call i64 @getline(i8** %1, i64* %2, %struct._IO_FILE* %18)
  store i64 %19, i64* %3, align 8
  %20 = icmp ne i64 %19, -1
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  br label %17

22:                                               ; preds = %17
  %23 = load i8*, i8** %1, align 8
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #6
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #6
  br label %29

29:                                               ; preds = %27, %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %33 = load i64, i64* %4, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i64 %33)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %36 = call i32 @fclose(%struct._IO_FILE* %35)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rapl_C() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  store i8* null, i8** %1, align 8
  store i64 0, i64* %2, align 8
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #5
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #5
  unreachable

16:                                               ; preds = %12
  br label %17

17:                                               ; preds = %21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %19 = call i64 @getline(i8** %1, i64* %2, %struct._IO_FILE* %18)
  store i64 %19, i64* %3, align 8
  %20 = icmp ne i64 %19, -1
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  br label %17

22:                                               ; preds = %17
  %23 = load i8*, i8** %1, align 8
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #6
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #6
  br label %29

29:                                               ; preds = %27, %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %33 = load i64, i64* %4, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i64 %33)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %36 = call i32 @fclose(%struct._IO_FILE* %35)
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 "}

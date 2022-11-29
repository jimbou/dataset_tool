; ModuleID = 'faa_inst.bc'
source_filename = "faa.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [13 x i8] c"hello world\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"hello world_2\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"path\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"rapl_rest.txt\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"%llu\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @hello() #0 {
hello:
  call void @rapl_A()
  call void @rapl_B()
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0))
  call void @rapl_C()
  ret void
}

declare dso_local i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
main:
  call void @rapl_A()
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 9, i32* %a, align 4
  %0 = load i32, i32* %a, align 4
  %cmp = icmp sgt i32 %0, 2
  br i1 %cmp, label %main1, label %main2

main1:                                            ; preds = %main
  call void @rapl_A()
  call void @rapl_B()
  call void @hello()
  call void @rapl_C()
  br label %main3

main2:                                            ; preds = %main
  call void @rapl_A()
  call void @rapl_B()
  call void @hello()
  call void @rapl_C()
  call void @rapl_B()
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0))
  call void @rapl_C()
  br label %main3

main3:                                            ; preds = %main2, %main1
  call void @rapl_A()
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rapl_A() #0 {
entry:
  %line = alloca i8*, align 8
  %len = alloca i64, align 8
  %read = alloca i64, align 8
  %data = alloca i64, align 8
  %fd = alloca %struct._IO_FILE*, align 8
  %fd1 = alloca %struct._IO_FILE*, align 8
  store i8* null, i8** %line, align 8
  store i64 0, i64* %len, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fd, align 8
  %call1 = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0))
  store %struct._IO_FILE* %call1, %struct._IO_FILE** %fd1, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %fd, align 8
  %cmp = icmp eq %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 1) #4
  unreachable

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fd1, align 8
  %cmp2 = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @exit(i32 noundef 1) #4
  unreachable

if.end4:                                          ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fd, align 8
  %call5 = call i64 @getline(i8** noundef %line, i64* noundef %len, %struct._IO_FILE* noundef %2)
  store i64 %call5, i64* %read, align 8
  %cmp6 = icmp ne i64 %call5, -1
  br i1 %cmp6, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond, !llvm.loop !4

while.end:                                        ; preds = %while.cond
  %3 = load i8*, i8** %line, align 8
  %call7 = call i64 @strtoull(i8* noundef %3, i8** noundef null, i32 noundef 10) #5
  store i64 %call7, i64* %data, align 8
  %4 = load i8*, i8** %line, align 8
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %if.then8, label %if.end9

if.then8:                                         ; preds = %while.end
  %5 = load i8*, i8** %line, align 8
  call void @free(i8* noundef %5) #5
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %while.end
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fd, align 8
  %call10 = call i32 @fclose(%struct._IO_FILE* noundef %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %fd1, align 8
  %8 = load i64, i64* %data, align 8
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %7, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 noundef %8)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %fd1, align 8
  %call12 = call i32 @fclose(%struct._IO_FILE* noundef %9)
  ret void
}

declare dso_local noalias %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) #2

declare dso_local i64 @getline(i8** noundef, i64* noundef, %struct._IO_FILE* noundef) #1

; Function Attrs: nounwind
declare dso_local i64 @strtoull(i8* noundef, i8** noundef, i32 noundef) #3

; Function Attrs: nounwind
declare dso_local void @free(i8* noundef) #3

declare dso_local i32 @fclose(%struct._IO_FILE* noundef) #1

declare dso_local i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rapl_B() #0 {
entry:
  %line = alloca i8*, align 8
  %len = alloca i64, align 8
  %read = alloca i64, align 8
  %data = alloca i64, align 8
  %fd = alloca %struct._IO_FILE*, align 8
  %fd1 = alloca %struct._IO_FILE*, align 8
  store i8* null, i8** %line, align 8
  store i64 0, i64* %len, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fd, align 8
  %call1 = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0))
  store %struct._IO_FILE* %call1, %struct._IO_FILE** %fd1, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %fd, align 8
  %cmp = icmp eq %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 1) #4
  unreachable

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fd1, align 8
  %cmp2 = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @exit(i32 noundef 1) #4
  unreachable

if.end4:                                          ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fd, align 8
  %call5 = call i64 @getline(i8** noundef %line, i64* noundef %len, %struct._IO_FILE* noundef %2)
  store i64 %call5, i64* %read, align 8
  %cmp6 = icmp ne i64 %call5, -1
  br i1 %cmp6, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %3 = load i8*, i8** %line, align 8
  %call7 = call i64 @strtoull(i8* noundef %3, i8** noundef null, i32 noundef 10) #5
  store i64 %call7, i64* %data, align 8
  %4 = load i8*, i8** %line, align 8
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %if.then8, label %if.end9

if.then8:                                         ; preds = %while.end
  %5 = load i8*, i8** %line, align 8
  call void @free(i8* noundef %5) #5
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %while.end
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fd, align 8
  %call10 = call i32 @fclose(%struct._IO_FILE* noundef %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %fd1, align 8
  %8 = load i64, i64* %data, align 8
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %7, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 noundef %8)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %fd1, align 8
  %call12 = call i32 @fclose(%struct._IO_FILE* noundef %9)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rapl_C() #0 {
entry:
  %line = alloca i8*, align 8
  %len = alloca i64, align 8
  %read = alloca i64, align 8
  %data = alloca i64, align 8
  %fd = alloca %struct._IO_FILE*, align 8
  %fd1 = alloca %struct._IO_FILE*, align 8
  store i8* null, i8** %line, align 8
  store i64 0, i64* %len, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fd, align 8
  %call1 = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i64 0, i64 0))
  store %struct._IO_FILE* %call1, %struct._IO_FILE** %fd1, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %fd, align 8
  %cmp = icmp eq %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 1) #4
  unreachable

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fd1, align 8
  %cmp2 = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @exit(i32 noundef 1) #4
  unreachable

if.end4:                                          ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %fd, align 8
  %call5 = call i64 @getline(i8** noundef %line, i64* noundef %len, %struct._IO_FILE* noundef %2)
  store i64 %call5, i64* %read, align 8
  %cmp6 = icmp ne i64 %call5, -1
  br i1 %cmp6, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond, !llvm.loop !7

while.end:                                        ; preds = %while.cond
  %3 = load i8*, i8** %line, align 8
  %call7 = call i64 @strtoull(i8* noundef %3, i8** noundef null, i32 noundef 10) #5
  store i64 %call7, i64* %data, align 8
  %4 = load i8*, i8** %line, align 8
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %if.then8, label %if.end9

if.then8:                                         ; preds = %while.end
  %5 = load i8*, i8** %line, align 8
  call void @free(i8* noundef %5) #5
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %while.end
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fd, align 8
  %call10 = call i32 @fclose(%struct._IO_FILE* noundef %6)
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %fd1, align 8
  %8 = load i64, i64* %data, align 8
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %7, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 noundef %8)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %fd1, align 8
  %call12 = call i32 @fclose(%struct._IO_FILE* noundef %9)
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 15.0.0 (https://github.com/llvm/llvm-project.git d9756fa723be7907afdceb933644a2dc00d6e5af)"}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.mustprogress"}
!6 = distinct !{!6, !5}
!7 = distinct !{!7, !5}

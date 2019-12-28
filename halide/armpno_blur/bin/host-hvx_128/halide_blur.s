	.text
	.file	"posix_allocator.cpp"
	.section	.text.halide_default_malloc,"ax",@progbits
	.weak	halide_default_malloc   # -- Begin function halide_default_malloc
	.p2align	4, 0x90
	.type	halide_default_malloc,@function
halide_default_malloc:                  # @halide_default_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	128(%rsi), %rdi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB0_1
# %bb.2:                                # %if.end
	movq	%rax, %rcx
	addq	$135, %rax
	andq	$-128, %rax
	movq	%rcx, -8(%rax)
	popq	%rbp
	retq
.LBB0_1:
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end0:
	.size	halide_default_malloc, .Lfunc_end0-halide_default_malloc
                                        # -- End function
	.section	.text.halide_default_free,"ax",@progbits
	.weak	halide_default_free     # -- Begin function halide_default_free
	.p2align	4, 0x90
	.type	halide_default_free,@function
halide_default_free:                    # @halide_default_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	-8(%rsi), %rdi
	popq	%rbp
	jmp	free@PLT                # TAILCALL
.Lfunc_end1:
	.size	halide_default_free, .Lfunc_end1-halide_default_free
                                        # -- End function
	.section	.text.halide_set_custom_malloc,"ax",@progbits
	.weak	halide_set_custom_malloc # -- Begin function halide_set_custom_malloc
	.p2align	4, 0x90
	.type	halide_set_custom_malloc,@function
halide_set_custom_malloc:               # @halide_set_custom_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal13custom_mallocE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end2:
	.size	halide_set_custom_malloc, .Lfunc_end2-halide_set_custom_malloc
                                        # -- End function
	.section	.text.halide_set_custom_free,"ax",@progbits
	.weak	halide_set_custom_free  # -- Begin function halide_set_custom_free
	.p2align	4, 0x90
	.type	halide_set_custom_free,@function
halide_set_custom_free:                 # @halide_set_custom_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal11custom_freeE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end3:
	.size	halide_set_custom_free, .Lfunc_end3-halide_set_custom_free
                                        # -- End function
	.section	.text.halide_malloc,"ax",@progbits
	.weak	halide_malloc           # -- Begin function halide_malloc
	.p2align	4, 0x90
	.type	halide_malloc,@function
halide_malloc:                          # @halide_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal13custom_mallocE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end4:
	.size	halide_malloc, .Lfunc_end4-halide_malloc
                                        # -- End function
	.section	.text.halide_free,"ax",@progbits
	.weak	halide_free             # -- Begin function halide_free
	.p2align	4, 0x90
	.type	halide_free,@function
halide_free:                            # @halide_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal11custom_freeE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end5:
	.size	halide_free, .Lfunc_end5-halide_free
                                        # -- End function
	.section	.text.halide_default_error,"ax",@progbits
	.weak	halide_default_error    # -- Begin function halide_default_error
	.p2align	4, 0x90
	.type	halide_default_error,@function
halide_default_error:                   # @halide_default_error
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$4104, %rsp             # imm = 0x1008
	movq	%rsi, %rbx
	movq	%rdi, %r15
	leaq	-26(%rbp), %rsi
	leaq	.L.str(%rip), %rdx
	leaq	-4120(%rbp), %r14
	movq	%r14, %rdi
	callq	halide_string_to_string@PLT
	leaq	4094(%rax), %rsi
	movq	%rax, %rdi
	movq	%rbx, %rdx
	callq	halide_string_to_string@PLT
	cmpb	$10, -1(%rax)
	je	.LBB6_2
# %bb.1:                                # %if.then
	movw	$10, (%rax)
	incq	%rax
.LBB6_2:                                # %if.end
	subq	%r14, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	addq	$4104, %rsp             # imm = 0x1008
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end6:
	.size	halide_default_error, .Lfunc_end6-halide_default_error
                                        # -- End function
	.section	.text.halide_error,"ax",@progbits
	.weak	halide_error            # -- Begin function halide_error
	.p2align	4, 0x90
	.type	halide_error,@function
halide_error:                           # @halide_error
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal13error_handlerE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end7:
	.size	halide_error, .Lfunc_end7-halide_error
                                        # -- End function
	.section	.text.halide_set_error_handler,"ax",@progbits
	.weak	halide_set_error_handler # -- Begin function halide_set_error_handler
	.p2align	4, 0x90
	.type	halide_set_error_handler,@function
halide_set_error_handler:               # @halide_set_error_handler
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal13error_handlerE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end8:
	.size	halide_set_error_handler, .Lfunc_end8-halide_set_error_handler
                                        # -- End function
	.section	.text.halide_print,"ax",@progbits
	.weak	halide_print            # -- Begin function halide_print
	.p2align	4, 0x90
	.type	halide_print,@function
halide_print:                           # @halide_print
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal12custom_printE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end9:
	.size	halide_print, .Lfunc_end9-halide_print
                                        # -- End function
	.section	.text.halide_set_custom_print,"ax",@progbits
	.weak	halide_set_custom_print # -- Begin function halide_set_custom_print
	.p2align	4, 0x90
	.type	halide_set_custom_print,@function
halide_set_custom_print:                # @halide_set_custom_print
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal12custom_printE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end10:
	.size	halide_set_custom_print, .Lfunc_end10-halide_set_custom_print
                                        # -- End function
	.section	.text.halide_start_clock,"ax",@progbits
	.weak	halide_start_clock      # -- Begin function halide_start_clock
	.p2align	4, 0x90
	.type	halide_start_clock,@function
halide_start_clock:                     # @halide_start_clock
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	halide_reference_clock_inited@GOTPCREL(%rip), %rbx
	cmpb	$0, (%rbx)
	jne	.LBB11_2
# %bb.1:                                # %if.then
	movq	halide_reference_clock@GOTPCREL(%rip), %rdx
	movl	$228, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	syscall@PLT
	movb	$1, (%rbx)
.LBB11_2:                               # %if.end
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end11:
	.size	halide_start_clock, .Lfunc_end11-halide_start_clock
                                        # -- End function
	.section	.text.halide_current_time_ns,"ax",@progbits
	.weak	halide_current_time_ns  # -- Begin function halide_current_time_ns
	.p2align	4, 0x90
	.type	halide_current_time_ns,@function
halide_current_time_ns:                 # @halide_current_time_ns
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	leaq	-16(%rbp), %rdx
	movl	$228, %edi
	xorl	%esi, %esi
	xorl	%eax, %eax
	callq	syscall@PLT
	vmovdqa	-16(%rbp), %xmm0
	movq	halide_reference_clock@GOTPCREL(%rip), %rax
	vpsubq	(%rax), %xmm0, %xmm0
	vmovq	%xmm0, %rax
	imulq	$1000000000, %rax, %rcx # imm = 0x3B9ACA00
	vpextrq	$1, %xmm0, %rax
	addq	%rcx, %rax
	addq	$16, %rsp
	popq	%rbp
	retq
.Lfunc_end12:
	.size	halide_current_time_ns, .Lfunc_end12-halide_current_time_ns
                                        # -- End function
	.section	.text.halide_sleep_ms,"ax",@progbits
	.weak	halide_sleep_ms         # -- Begin function halide_sleep_ms
	.p2align	4, 0x90
	.type	halide_sleep_ms,@function
halide_sleep_ms:                        # @halide_sleep_ms
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	imull	$1000, %esi, %edi       # imm = 0x3E8
	popq	%rbp
	jmp	usleep@PLT              # TAILCALL
.Lfunc_end13:
	.size	halide_sleep_ms, .Lfunc_end13-halide_sleep_ms
                                        # -- End function
	.section	.text.halide_default_print,"ax",@progbits
	.weak	halide_default_print    # -- Begin function halide_default_print
	.p2align	4, 0x90
	.type	halide_default_print,@function
halide_default_print:                   # @halide_default_print
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %rbx
	movq	%rsi, %rdi
	callq	strlen@PLT
	movl	$1, %edi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	write@PLT               # TAILCALL
.Lfunc_end14:
	.size	halide_default_print, .Lfunc_end14-halide_default_print
                                        # -- End function
	.section	.text.halide_host_cpu_count,"ax",@progbits
	.weak	halide_host_cpu_count   # -- Begin function halide_host_cpu_count
	.p2align	4, 0x90
	.type	halide_host_cpu_count,@function
halide_host_cpu_count:                  # @halide_host_cpu_count
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$84, %edi
	popq	%rbp
	jmp	sysconf@PLT             # TAILCALL
.Lfunc_end15:
	.size	halide_host_cpu_count, .Lfunc_end15-halide_host_cpu_count
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal19halide_thread_yieldEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv # -- Begin function _ZN6Halide7Runtime8Internal19halide_thread_yieldEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv,@function
_ZN6Halide7Runtime8Internal19halide_thread_yieldEv: # @_ZN6Halide7Runtime8Internal19halide_thread_yieldEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	sched_yield@PLT         # TAILCALL
.Lfunc_end16:
	.size	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv, .Lfunc_end16-_ZN6Halide7Runtime8Internal19halide_thread_yieldEv
                                        # -- End function
	.section	.text.halide_default_do_task,"ax",@progbits
	.weak	halide_default_do_task  # -- Begin function halide_default_do_task
	.p2align	4, 0x90
	.type	halide_default_do_task,@function
halide_default_do_task:                 # @halide_default_do_task
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rsi, %rax
	movl	%edx, %esi
	movq	%rcx, %rdx
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end17:
	.size	halide_default_do_task, .Lfunc_end17-halide_default_do_task
                                        # -- End function
	.section	.text.halide_default_do_loop_task,"ax",@progbits
	.weak	halide_default_do_loop_task # -- Begin function halide_default_do_loop_task
	.p2align	4, 0x90
	.type	halide_default_do_loop_task,@function
halide_default_do_loop_task:            # @halide_default_do_loop_task
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rsi, %rax
	movl	%edx, %esi
	movl	%ecx, %edx
	movq	%r8, %rcx
	movq	%r9, %r8
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end18:
	.size	halide_default_do_loop_task, .Lfunc_end18-halide_default_do_loop_task
                                        # -- End function
	.section	.text.halide_default_do_par_for,"ax",@progbits
	.weak	halide_default_do_par_for # -- Begin function halide_default_do_par_for
	.p2align	4, 0x90
	.type	halide_default_do_par_for,@function
halide_default_do_par_for:              # @halide_default_do_par_for
# %bb.0:                                # %entry
	testl	%ecx, %ecx
	jle	.LBB19_1
# %bb.2:                                # %if.end
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	subq	$128, %rsp
	movq	$0, -144(%rbp)
	movl	%edx, -108(%rbp)
	movl	%ecx, -104(%rbp)
	movb	$0, -96(%rbp)
	movl	$0, -112(%rbp)
	movq	%r8, -136(%rbp)
	movl	$0, -100(%rbp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, -128(%rbp)
	movq	%rsi, -88(%rbp)
	movq	%rdi, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -27(%rbp)
	leaq	-144(%rbp), %rbx
	movq	%rbx, -72(%rbp)
	movl	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r14
	movq	%r14, %rdi
	callq	halide_mutex_lock@PLT
	movl	$1, %edi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	callq	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_@PLT
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE@PLT
	movq	%r14, %rdi
	callq	halide_mutex_unlock@PLT
	movl	-28(%rbp), %eax
	addq	$128, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.LBB19_1:
	xorl	%eax, %eax
	retq
.Lfunc_end19:
	.size	halide_default_do_par_for, .Lfunc_end19-halide_default_do_par_for
                                        # -- End function
	.section	.text.halide_mutex_lock,"ax",@progbits
	.weak	halide_mutex_lock       # -- Begin function halide_mutex_lock
	.p2align	4, 0x90
	.type	halide_mutex_lock,@function
halide_mutex_lock:                      # @halide_mutex_lock
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movl	$1, %ecx
	xorl	%eax, %eax
	lock		cmpxchgq	%rcx, (%rdi)
	je	.LBB20_4
# %bb.1:                                # %if.then.i
	movq	%rdi, %rbx
	movq	(%rdi), %rax
	movl	$40, %r12d
	movq	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE@GOTPCREL(%rip), %r13
	movq	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib@GOTPCREL(%rip), %r15
	leaq	-80(%rbp), %r14
	.p2align	4, 0x90
.LBB20_2:                               # %while.cond.outer.i.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB20_5 Depth 2
	testb	$1, %al
	jne	.LBB20_5
.LBB20_3:                               # %if.then.i.i
                                        #   in Loop: Header=BB20_2 Depth=1
	movq	%rax, %rcx
	orq	$1, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB20_2
	jmp	.LBB20_4
.LBB20_5:                               # %if.end4.i.i
                                        #   Parent Loop BB20_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testb	$2, %al
	jne	.LBB20_10
# %bb.6:                                # %land.lhs.true.i.i
                                        #   in Loop: Header=BB20_5 Depth=2
	testl	%r12d, %r12d
	jg	.LBB20_7
# %bb.9:                                # %if.then12.i.i
                                        #   in Loop: Header=BB20_5 Depth=2
	movq	%rax, %rcx
	orq	$2, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB20_2
.LBB20_10:                              # %if.end21.i.i
                                        #   in Loop: Header=BB20_5 Depth=2
	movq	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv@GOTPCREL(%rip), %rax
	movq	%rax, -72(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb@GOTPCREL(%rip), %rax
	movq	%rax, -56(%rbp)
	movq	%rbx, -48(%rbp)
	movq	%r13, -80(%rbp)
	movq	%r15, -64(%rbp)
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE@PLT
	cmpq	%rbx, %rax
	je	.LBB20_4
# %bb.11:                               # %if.end26.i.i
                                        #   in Loop: Header=BB20_5 Depth=2
	movq	(%rbx), %rax
	movl	$40, %r12d
	testb	$1, %al
	je	.LBB20_3
	jmp	.LBB20_5
.LBB20_7:                               # %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i
                                        #   in Loop: Header=BB20_5 Depth=2
	decl	%r12d
	jle	.LBB20_8
# %bb.12:                               # %if.then7.i.i
                                        #   in Loop: Header=BB20_5 Depth=2
	callq	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv@PLT
	movq	(%rbx), %rax
	testb	$1, %al
	je	.LBB20_3
	jmp	.LBB20_5
.LBB20_8:                               #   in Loop: Header=BB20_5 Depth=2
	xorl	%r12d, %r12d
	movq	%rax, %rcx
	orq	$2, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB20_2
	jmp	.LBB20_10
.LBB20_4:                               # %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex4lockEv.exit
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end20:
	.size	halide_mutex_lock, .Lfunc_end20-halide_mutex_lock
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_ # -- Begin function _ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_,@function
_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_: # @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	%rsi, %r14
	movl	%edi, %ebx
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r11
	cmpb	$0, 2121(%r11)
	movq	%rdx, -56(%rbp)         # 8-byte Spill
	je	.LBB21_1
# %bb.9:                                # %if.end4
	testl	%ebx, %ebx
	movq	%r14, -64(%rbp)         # 8-byte Spill
	movl	%ebx, -48(%rbp)         # 4-byte Spill
	jle	.LBB21_10
.LBB21_11:                              # %for.body.preheader
	movl	%ebx, %r9d
	movl	%r9d, %r8d
	andl	$1, %r8d
	cmpl	$1, %ebx
	jne	.LBB21_26
# %bb.12:
	movl	$-1, %r15d
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	movl	$0, -44(%rbp)           # 4-byte Folded Spill
	xorl	%r12d, %r12d
	jmp	.LBB21_13
.LBB21_1:                               # %land.rhs.i.preheader
	leaq	12(%r11), %rax
	movl	$2128, %ecx             # imm = 0x850
	addq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rcx
	.p2align	4, 0x90
.LBB21_2:                               # %land.rhs.i
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$0, (%rax)
	jne	.LBB21_4
# %bb.3:                                # %while.body.i
                                        #   in Loop: Header=BB21_2 Depth=1
	incq	%rax
	cmpq	%rcx, %rax
	jb	.LBB21_2
.LBB21_4:                               # %while.end.i
	movl	$2128, %ecx             # imm = 0x850
	addq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rcx
	cmpq	%rcx, %rax
	je	.LBB21_6
# %bb.5:                                # %if.then.i
	leaq	.L.str.7(%rip), %rsi
	xorl	%edi, %edi
	callq	halide_print@PLT
	callq	abort@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r11
.LBB21_6:                               # %_ZNK6Halide7Runtime8Internal12work_queue_t13assert_zeroedEv.exit
	movl	8(%r11), %edi
	testl	%edi, %edi
	movq	%r11, %r15
	jne	.LBB21_8
# %bb.7:                                # %if.then2
	callq	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv@PLT
	movl	%eax, %edi
	movl	%eax, 8(%r15)
.LBB21_8:                               # %if.end
	callq	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi@PLT
	movl	%eax, 8(%r15)
	movb	$1, 2121(%r15)
	movq	-56(%rbp), %rdx         # 8-byte Reload
	movq	%r15, %r11
	testl	%ebx, %ebx
	movq	%r14, -64(%rbp)         # 8-byte Spill
	movl	%ebx, -48(%rbp)         # 4-byte Spill
	jg	.LBB21_11
.LBB21_10:
	xorl	%r12d, %r12d
	movl	$-1, %r15d
	movl	$0, -44(%rbp)           # 4-byte Folded Spill
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
	testq	%rdx, %rdx
	jne	.LBB21_32
.LBB21_19:                              # %if.then32
	movl	%r14d, %ebx
	orb	-44(%rbp), %bl          # 1-byte Folded Reload
	movl	24(%r11), %ecx
	cmpl	$255, %ecx
	jg	.LBB21_24
# %bb.20:                               # %land.rhs.preheader
	movl	%ebx, %eax
	andb	$1, %al
	movzbl	%al, %eax
	addl	%eax, %r13d
	movl	8(%r11), %eax
	decl	%eax
	cmpl	%eax, %ecx
	jge	.LBB21_22
	.p2align	4, 0x90
.LBB21_23:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	incl	28(%r11)
	movq	_ZN6Halide7Runtime8Internal13worker_threadEPv@GOTPCREL(%rip), %rdi
	xorl	%esi, %esi
	callq	halide_spawn_thread@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r11
	movslq	24(%r11), %rdx
	leal	1(%rdx), %ecx
	movl	%ecx, 24(%r11)
	movq	%rax, 72(%r11,%rdx,8)
	cmpl	$256, %ecx              # imm = 0x100
	jge	.LBB21_24
# %bb.21:                               # %land.rhs
                                        #   in Loop: Header=BB21_23 Depth=1
	movl	8(%r11), %eax
	decl	%eax
	cmpl	%eax, %ecx
	jl	.LBB21_23
.LBB21_22:                              # %lor.rhs
	subl	2124(%r11), %ecx
	incl	%ecx
	cmpl	%r13d, %ecx
	jl	.LBB21_23
.LBB21_24:                              # %while.end
	testb	$1, %bl
	movq	-64(%rbp), %rsi         # 8-byte Reload
	movl	-48(%rbp), %edi         # 4-byte Reload
	movl	-44(%rbp), %ebx         # 4-byte Reload
	je	.LBB21_36
# %bb.25:                               # %if.then51
	incl	2124(%r11)
	testl	%edi, %edi
	jg	.LBB21_37
	jmp	.LBB21_43
.LBB21_26:                              # %for.body.preheader.new
	leaq	176(%r14), %rsi
	subq	%r8, %r9
	movl	$-1, %r15d
	xorl	%eax, %eax
	movl	$1, %r10d
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	movl	$0, -44(%rbp)           # 4-byte Folded Spill
	xorl	%r12d, %r12d
	movl	-144(%rsi), %ecx
	movl	-132(%rsi), %edi
	cmpb	$0, -128(%rsi)
	jne	.LBB21_28
	jmp	.LBB21_29
	.p2align	4, 0x90
.LBB21_56:                              # %if.else24.1
	addl	-8(%rsi), %r15d
.LBB21_57:                              # %for.inc.1
	addl	%ebx, %r13d
	addq	$2, %rax
	addq	$256, %rsi              # imm = 0x100
	cmpq	%rax, %r9
	je	.LBB21_13
# %bb.27:                               # %for.body
	movl	-144(%rsi), %ecx
	movl	-132(%rsi), %edi
	cmpb	$0, -128(%rsi)
	je	.LBB21_29
.LBB21_28:                              # %if.then23
	incl	%r15d
	jmp	.LBB21_30
	.p2align	4, 0x90
.LBB21_29:                              # %if.else24
	addl	-136(%rsi), %r15d
.LBB21_30:                              # %for.inc
	addl	%edi, %r13d
	testl	%edi, %edi
	movzbl	%r12b, %r12d
	cmovel	%r10d, %r12d
	movl	-4(%rsi), %ebx
	testl	%ebx, %ebx
	cmovel	%r10d, %r12d
	orl	%ebx, %edi
	movzbl	%r14b, %r14d
	cmovnel	%r10d, %r14d
	orl	-16(%rsi), %ecx
	movl	-44(%rbp), %ecx         # 4-byte Reload
	movzbl	%cl, %ecx
	cmovnel	%r10d, %ecx
	movl	%ecx, -44(%rbp)         # 4-byte Spill
	cmpb	$0, (%rsi)
	je	.LBB21_56
# %bb.31:                               # %if.then23.1
	incl	%r15d
	jmp	.LBB21_57
.LBB21_13:                              # %for.cond.cleanup.loopexit.unr-lcssa
	testq	%r8, %r8
	je	.LBB21_17
# %bb.14:                               # %for.body.epil
	shlq	$7, %rax
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movl	44(%rdi,%rax), %ecx
	testl	%ecx, %ecx
	movzbl	%r12b, %r12d
	movl	$1, %esi
	cmovel	%esi, %r12d
	movzbl	%r14b, %r14d
	cmovnel	%esi, %r14d
	addl	%ecx, %r13d
	cmpl	$0, 32(%rdi,%rax)
	movl	-44(%rbp), %ecx         # 4-byte Reload
	movzbl	%cl, %ecx
	cmovnel	%esi, %ecx
	movl	%ecx, -44(%rbp)         # 4-byte Spill
	cmpb	$0, 48(%rdi,%rax)
	je	.LBB21_16
# %bb.15:                               # %if.then23.epil
	incl	%r15d
.LBB21_17:                              # %for.cond.cleanup.loopexit
	andb	$1, %r12b
	testq	%rdx, %rdx
	je	.LBB21_19
.LBB21_32:                              # %if.else54
	movl	112(%rdx), %eax
	imull	44(%rdx), %eax
	subl	96(%rdx), %eax
	cmpl	%eax, %r13d
	jle	.LBB21_34
# %bb.33:                               # %if.then59
	leaq	.L.str.3(%rip), %rsi
	xorl	%edi, %edi
	callq	halide_print@PLT
	callq	abort@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r11
	movq	-56(%rbp), %rdx         # 8-byte Reload
.LBB21_34:                              # %if.end60
	movl	%r14d, %eax
	movl	-44(%rbp), %ebx         # 4-byte Reload
	orb	%bl, %al
	testb	$1, %al
	movq	-64(%rbp), %rsi         # 8-byte Reload
	movl	-48(%rbp), %edi         # 4-byte Reload
	je	.LBB21_36
# %bb.35:                               # %if.then64
	incl	96(%rdx)
.LBB21_36:                              # %if.end68
	testl	%edi, %edi
	jle	.LBB21_43
.LBB21_37:                              # %for.body74.preheader
	movslq	%edi, %rax
	movq	16(%r11), %rcx
	testb	$1, %al
	je	.LBB21_39
# %bb.38:                               # %for.body74.prol
	decq	%rax
	movq	%rax, %rdx
	shlq	$7, %rdx
	movq	%rcx, 64(%rsi,%rdx)
	leaq	(%rsi,%rdx), %rcx
	movq	%rsi, 72(%rsi,%rdx)
	movl	%edi, 80(%rsi,%rdx)
	movl	$0, 96(%rsi,%rdx)
.LBB21_39:                              # %for.body74.prol.loopexit
	cmpl	$1, %edi
	je	.LBB21_42
# %bb.40:                               # %for.body74.preheader1
	movq	%rax, %rdx
	shlq	$7, %rdx
	addq	%rsi, %rdx
	addq	$-128, %rdx
	.p2align	4, 0x90
.LBB21_41:                              # %for.body74
                                        # =>This Inner Loop Header: Depth=1
	movq	%rcx, 64(%rdx)
	movq	%rsi, 72(%rdx)
	movl	%edi, 80(%rdx)
	movl	$0, 96(%rdx)
	movq	%rdx, -64(%rdx)
	movq	%rsi, -56(%rdx)
	movl	%edi, -48(%rdx)
	movl	$0, -32(%rdx)
	leaq	-128(%rdx), %rcx
	addq	$-256, %rdx
	addq	$-2, %rax
	jg	.LBB21_41
.LBB21_42:                              # %for.cond.cleanup73.loopexit
	movq	%rsi, 16(%r11)
.LBB21_43:                              # %for.cond.cleanup73
	cmpl	$0, 68(%r11)
	je	.LBB21_45
# %bb.44:                               # %for.cond.cleanup73.if.then94_crit_edge
	movl	24(%r11), %eax
.LBB21_47:                              # %if.then94
	movl	%eax, %r15d
.LBB21_48:                              # %if.end96
	movl	%r15d, 32(%r11)
	leaq	40(%r11), %rdi
	callq	halide_cond_broadcast@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rcx
	movl	32(%rcx), %eax
	cmpl	28(%rcx), %eax
	jle	.LBB21_51
# %bb.49:                               # %if.then98
	leaq	48(%rcx), %rdi
	callq	halide_cond_broadcast@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rcx
	testb	%r12b, %r12b
	je	.LBB21_51
# %bb.50:                               # %if.then100
	leaq	56(%rcx), %rdi
	callq	halide_cond_broadcast@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rcx
.LBB21_51:                              # %if.end102
	orb	%bl, %r14b
	testb	$1, %r14b
	je	.LBB21_55
# %bb.52:                               # %if.then106
	movq	-56(%rbp), %rax         # 8-byte Reload
	testq	%rax, %rax
	je	.LBB21_54
# %bb.53:                               # %if.then108
	decl	96(%rax)
	jmp	.LBB21_55
.LBB21_45:                              # %lor.rhs88
	movl	24(%r11), %eax
	movl	64(%r11), %ecx
	cmpl	%ecx, %r15d
	jg	.LBB21_47
# %bb.46:                               # %lor.rhs88
	cmpl	%eax, %ecx
	jge	.LBB21_48
	jmp	.LBB21_47
.LBB21_54:                              # %if.else111
	decl	2124(%rcx)
.LBB21_55:                              # %if.end114
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB21_16:                              # %if.else24.epil
	addl	40(%rdi,%rax), %r15d
	andb	$1, %r12b
	testq	%rdx, %rdx
	jne	.LBB21_32
	jmp	.LBB21_19
.Lfunc_end21:
	.size	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_, .Lfunc_end21-_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE # -- Begin function _ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE,@function
_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE: # @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	movq	%rdi, %r15
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r13
	leaq	56(%r13), %rax
	movq	%rax, -56(%rbp)         # 8-byte Spill
	leaq	16(%r13), %rax
	movq	%rax, -72(%rbp)         # 8-byte Spill
	leaq	48(%r13), %rax
	movq	%rax, -88(%rbp)         # 8-byte Spill
	leaq	40(%r13), %rax
	movq	%rax, -80(%rbp)         # 8-byte Spill
	movq	%rdi, -48(%rbp)         # 8-byte Spill
	testq	%r15, %r15
	jne	.LBB22_4
	jmp	.LBB22_14
.LBB22_1:                               # %if.then15
	movl	%eax, 116(%r15)
.LBB22_2:                               # %if.then257
	movq	-56(%rbp), %rdi         # 8-byte Reload
	callq	halide_cond_broadcast@PLT
.LBB22_3:                               # %while.cond
	testq	%r15, %r15
	je	.LBB22_14
.LBB22_4:                               # %cond.true
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB22_9 Depth 2
	cmpl	$0, 40(%r15)
	jne	.LBB22_6
# %bb.5:                                # %cond.end
                                        #   in Loop: Header=BB22_4 Depth=1
	cmpl	$0, 112(%r15)
	je	.LBB22_108
.LBB22_6:                               # %if.then
                                        #   in Loop: Header=BB22_4 Depth=1
	movq	16(%r13), %r12
	cmpl	$0, 116(%r15)
	je	.LBB22_10
# %bb.7:                                # %if.then3
                                        #   in Loop: Header=BB22_4 Depth=1
	cmpl	$0, 112(%r15)
	jne	.LBB22_16
# %bb.8:                                # %while.cond6.preheader
                                        #   in Loop: Header=BB22_4 Depth=1
	leaq	64(%r12), %rax
	cmpq	%r15, %r12
	je	.LBB22_12
	.p2align	4, 0x90
.LBB22_9:                               # %while.body8
                                        #   Parent Loop BB22_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, %rcx
	movq	(%rax), %rdx
	leaq	64(%rdx), %rax
	cmpq	%r15, %rdx
	jne	.LBB22_9
	jmp	.LBB22_13
	.p2align	4, 0x90
.LBB22_10:                              # %if.else
	movq	88(%r15), %rax
	testq	%rax, %rax
	je	.LBB22_16
# %bb.11:                               # %land.lhs.true
	movl	116(%rax), %eax
	testl	%eax, %eax
	jne	.LBB22_1
	jmp	.LBB22_16
.LBB22_12:                              #   in Loop: Header=BB22_4 Depth=1
	movq	-72(%rbp), %rcx         # 8-byte Reload
.LBB22_13:                              # %while.end
                                        #   in Loop: Header=BB22_4 Depth=1
	movq	(%rax), %rax
	movq	%rax, (%rcx)
	movl	$0, 40(%r15)
	testq	%r15, %r15
	jne	.LBB22_4
	.p2align	4, 0x90
.LBB22_14:                              # %cond.false
	cmpb	$0, 2120(%r13)
	jne	.LBB22_108
# %bb.15:                               # %while.body
	movq	16(%r13), %r12
.LBB22_16:                              # %if.end21
	testq	%r12, %r12
	je	.LBB22_60
# %bb.17:                               # %while.body24.lr.ph
	testq	%r15, %r15
	je	.LBB22_34
# %bb.18:                               # %while.body24.us.preheader
	movq	-72(%rbp), %r14         # 8-byte Reload
	movq	88(%r12), %rcx
	testq	%rcx, %rcx
	jne	.LBB22_21
	jmp	.LBB22_24
	.p2align	4, 0x90
.LBB22_19:                              # %cleanup.us
	movq	%r12, %r14
	movq	64(%r12), %rax
	addq	$64, %r14
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB22_60
# %bb.20:                               # %while.body24.us
	movq	88(%r12), %rcx
	testq	%rcx, %rcx
	je	.LBB22_24
.LBB22_21:                              # %if.else29.us
	movl	44(%rcx), %eax
	movl	112(%rcx), %edx
	testl	%edx, %edx
	je	.LBB22_23
# %bb.22:                               # %if.else35.us
	imull	%edx, %eax
.LBB22_23:                              # %if.then32.us
	subl	96(%rcx), %eax
	jmp	.LBB22_25
	.p2align	4, 0x90
.LBB22_24:                              # %if.then28.us
	movl	24(%r13), %eax
	subl	2124(%r13), %eax
	incl	%eax
.LBB22_25:                              # %if.end42.us
	movl	44(%r12), %edx
	movq	72(%r12), %rsi
	movq	72(%r15), %rdi
	cmpb	$0, 48(%r12)
	je	.LBB22_27
# %bb.26:                               # %lor.rhs61.us
	cmpl	$0, 112(%r12)
	sete	%r8b
	jmp	.LBB22_28
	.p2align	4, 0x90
.LBB22_27:
	movb	$1, %r8b
.LBB22_28:                              # %lor.end64.us
	testl	%edx, %edx
	setne	%bl
	cmpq	%rdi, %rsi
	setne	%cl
	cmpl	%edx, %eax
	jl	.LBB22_19
# %bb.29:                               # %lor.end64.us
	andb	%cl, %bl
	jne	.LBB22_19
# %bb.30:                               # %lor.end64.us
	testb	%r8b, %r8b
	je	.LBB22_19
# %bb.31:                               # %if.then74.us
	movl	120(%r12), %eax
	cmpl	32(%r12), %eax
	jge	.LBB22_47
	.p2align	4, 0x90
.LBB22_32:                              # %for.body.i.us
                                        # =>This Inner Loop Header: Depth=1
	movq	24(%r12), %rcx
	cltq
	shlq	$4, %rax
	movq	(%rcx,%rax), %rdi
	movl	8(%rcx,%rax), %esi
	callq	halide_default_semaphore_try_acquire@PLT
	testb	%al, %al
	je	.LBB22_19
# %bb.33:                               # %for.inc.i.us
                                        #   in Loop: Header=BB22_32 Depth=1
	movl	120(%r12), %eax
	incl	%eax
	movl	%eax, 120(%r12)
	cmpl	32(%r12), %eax
	jl	.LBB22_32
	jmp	.LBB22_47
.LBB22_34:                              # %while.body24.preheader
	leaq	16(%r13), %r14
	movq	88(%r12), %rcx
	testq	%rcx, %rcx
	jne	.LBB22_37
	jmp	.LBB22_45
	.p2align	4, 0x90
.LBB22_35:                              # %cleanup
	movq	%r12, %r14
	movq	64(%r12), %rax
	addq	$64, %r14
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB22_60
# %bb.36:                               # %while.body24
	movq	88(%r12), %rcx
	testq	%rcx, %rcx
	je	.LBB22_45
.LBB22_37:                              # %if.else29
	movl	44(%rcx), %eax
	movl	112(%rcx), %edx
	testl	%edx, %edx
	je	.LBB22_39
# %bb.38:                               # %if.else35
	imull	%edx, %eax
.LBB22_39:                              # %if.end42
	subl	96(%rcx), %eax
	movl	44(%r12), %ecx
	cmpb	$0, 48(%r12)
	je	.LBB22_46
.LBB22_40:                              # %lor.rhs61
	cmpl	$0, 112(%r12)
	sete	%dl
	cmpl	%ecx, %eax
	jl	.LBB22_35
.LBB22_41:                              # %lor.end64
	testb	%dl, %dl
	je	.LBB22_35
# %bb.42:                               # %if.then74
	movl	120(%r12), %eax
	cmpl	32(%r12), %eax
	jge	.LBB22_47
	.p2align	4, 0x90
.LBB22_43:                              # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	movq	24(%r12), %rcx
	cltq
	shlq	$4, %rax
	movq	(%rcx,%rax), %rdi
	movl	8(%rcx,%rax), %esi
	callq	halide_default_semaphore_try_acquire@PLT
	testb	%al, %al
	je	.LBB22_35
# %bb.44:                               # %for.inc.i
                                        #   in Loop: Header=BB22_43 Depth=1
	movl	120(%r12), %eax
	incl	%eax
	movl	%eax, 120(%r12)
	cmpl	32(%r12), %eax
	jl	.LBB22_43
	jmp	.LBB22_47
	.p2align	4, 0x90
.LBB22_45:                              # %if.then28
	movl	24(%r13), %eax
	subl	2124(%r13), %eax
	incl	%eax
	movl	44(%r12), %ecx
	cmpb	$0, 48(%r12)
	jne	.LBB22_40
.LBB22_46:
	movb	$1, %dl
	cmpl	%ecx, %eax
	jge	.LBB22_41
	jmp	.LBB22_35
	.p2align	4, 0x90
.LBB22_47:                              # %if.end102
	movl	$0, 120(%r12)
	incl	112(%r12)
	movq	88(%r12), %rax
	movl	44(%r12), %ecx
	testq	%rax, %rax
	je	.LBB22_66
# %bb.48:                               # %if.else111
	addl	%ecx, 96(%rax)
	cmpb	$0, 48(%r12)
	je	.LBB22_67
.LBB22_49:                              # %if.then121
	movq	64(%r12), %rax
	movq	%rax, (%r14)
	movq	%r13, %rdi
	callq	halide_mutex_unlock@PLT
	xorl	%ebx, %ebx
	movl	$1, %r15d
	.p2align	4, 0x90
.LBB22_50:                              # %while.cond126.preheader
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB22_54 Depth 2
                                        #     Child Loop BB22_52 Depth 2
	movl	40(%r12), %ecx
	movl	%ecx, %eax
	subl	%ebx, %eax
	cmpl	%r15d, %eax
	jle	.LBB22_57
# %bb.51:                               # %land.rhs.preheader
                                        #   in Loop: Header=BB22_50 Depth=1
	movl	32(%r12), %eax
	movl	120(%r12), %edx
	cmpl	%eax, %edx
	jl	.LBB22_54
	.p2align	4, 0x90
.LBB22_52:                              # %while.body132
                                        #   Parent Loop BB22_50 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	$0, 120(%r12)
	incl	%r15d
	movl	%ecx, %esi
	subl	%ebx, %esi
	xorl	%edx, %edx
	cmpl	%r15d, %esi
	jle	.LBB22_58
# %bb.53:                               # %land.rhs
                                        #   in Loop: Header=BB22_52 Depth=2
	cmpl	%eax, %edx
	jge	.LBB22_52
	.p2align	4, 0x90
.LBB22_54:                              # %for.body.i417
                                        #   Parent Loop BB22_50 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	24(%r12), %rax
	movslq	%edx, %rcx
	shlq	$4, %rcx
	movq	(%rax,%rcx), %rdi
	movl	8(%rax,%rcx), %esi
	callq	halide_default_semaphore_try_acquire@PLT
	testb	%al, %al
	je	.LBB22_57
# %bb.55:                               # %for.inc.i420
                                        #   in Loop: Header=BB22_54 Depth=2
	movl	32(%r12), %eax
	movl	120(%r12), %edx
	incl	%edx
	movl	%edx, 120(%r12)
	cmpl	%eax, %edx
	jl	.LBB22_54
# %bb.56:                               # %while.body132.loopexit
                                        #   in Loop: Header=BB22_50 Depth=1
	movl	40(%r12), %ecx
	jmp	.LBB22_52
	.p2align	4, 0x90
.LBB22_57:                              # %while.end134
                                        #   in Loop: Header=BB22_50 Depth=1
	testl	%r15d, %r15d
	je	.LBB22_62
.LBB22_58:                              # %if.end137
                                        #   in Loop: Header=BB22_50 Depth=1
	movq	104(%r12), %rdi
	movl	36(%r12), %edx
	addl	%ebx, %edx
	movq	(%r12), %rsi
	movq	8(%r12), %r8
	movl	%r15d, %ecx
	movq	%r12, %r9
	callq	halide_do_loop_task@PLT
	addl	%r15d, %ebx
	xorl	%r15d, %r15d
	testl	%eax, %eax
	je	.LBB22_50
# %bb.59:
	movl	%eax, %r13d
	jmp	.LBB22_63
	.p2align	4, 0x90
.LBB22_60:                              # %if.then88
	testq	%r15, %r15
	je	.LBB22_71
# %bb.61:                               # %if.then90
	incl	68(%r13)
	movb	$1, 124(%r15)
	movq	-56(%rbp), %rdi         # 8-byte Reload
	movq	%r13, %rsi
	callq	halide_cond_wait@PLT
	movb	$0, 124(%r15)
	decl	68(%r13)
	testq	%r15, %r15
	jne	.LBB22_4
	jmp	.LBB22_14
.LBB22_62:
	movb	$1, %r15b
	xorl	%r13d, %r13d
.LBB22_63:                              # %while.end144
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	addl	%ebx, 36(%r12)
	movl	40(%r12), %eax
	subl	%ebx, %eax
	movl	%eax, 40(%r12)
	testb	%r15b, %r15b
	je	.LBB22_70
# %bb.64:                               # %if.else155
	testl	%eax, %eax
	movq	-48(%rbp), %r15         # 8-byte Reload
	jle	.LBB22_79
# %bb.65:                               # %if.then159
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rax
	movq	%rax, %rcx
	movq	16(%rax), %rax
	movq	%rax, 64(%r12)
	movq	%r12, 16(%rcx)
	jmp	.LBB22_79
.LBB22_66:                              # %if.then107
	addl	%ecx, 2124(%r13)
	cmpb	$0, 48(%r12)
	jne	.LBB22_49
.LBB22_67:                              # %if.else163
	movq	(%r12), %rax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	movq	8(%r12), %rbx
	movl	36(%r12), %r13d
	movq	56(%r12), %r15
	movq	104(%r12), %rax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	leal	1(%r13), %eax
	movl	%eax, 36(%r12)
	decl	40(%r12)
	je	.LBB22_73
# %bb.68:                               # %if.end175
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	testq	%r15, %r15
	je	.LBB22_74
.LBB22_69:                              # %if.then177
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movq	%r15, %rsi
	movl	%r13d, %edx
	movq	%rbx, %rcx
	callq	halide_do_task@PLT
	jmp	.LBB22_75
.LBB22_70:                              # %if.end195.thread439
	movl	$0, 40(%r12)
	movq	-48(%rbp), %r15         # 8-byte Reload
	movl	%r13d, 116(%r12)
	movslq	80(%r12), %rdi
	testq	%rdi, %rdi
	jg	.LBB22_77
	jmp	.LBB22_79
.LBB22_71:                              # %if.else92
	incl	64(%r13)
	movl	28(%r13), %eax
	cmpl	32(%r13), %eax
	jle	.LBB22_95
# %bb.72:                               # %if.then95
	decl	%eax
	movl	%eax, 28(%r13)
	movq	-88(%rbp), %rdi         # 8-byte Reload
	movq	%r13, %rsi
	callq	halide_cond_wait@PLT
	incl	28(%r13)
	decl	64(%r13)
	testq	%r15, %r15
	jne	.LBB22_4
	jmp	.LBB22_14
.LBB22_73:                              # %if.then173
	movq	64(%r12), %rax
	movq	%rax, (%r14)
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	testq	%r15, %r15
	jne	.LBB22_69
.LBB22_74:                              # %if.else185
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movq	-96(%rbp), %rsi         # 8-byte Reload
	movl	%r13d, %edx
	movl	$1, %ecx
	movq	%rbx, %r8
	movq	%r12, %r9
	callq	halide_do_loop_task@PLT
.LBB22_75:                              # %if.end195
	movl	%eax, %r13d
	movq	-48(%rbp), %r15         # 8-byte Reload
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	testl	%r13d, %r13d
	je	.LBB22_79
# %bb.76:                               # %if.then200
	movl	%r13d, 116(%r12)
	movslq	80(%r12), %rdi
	testq	%rdi, %rdi
	jle	.LBB22_79
.LBB22_77:                              # %for.body.lr.ph
	movq	72(%r12), %r8
	movl	%edi, %esi
	andl	$1, %esi
	cmpl	$1, %edi
	jne	.LBB22_80
# %bb.78:
	xorl	%edx, %edx
	xorl	%eax, %eax
	jmp	.LBB22_91
	.p2align	4, 0x90
.LBB22_79:
	xorl	%eax, %eax
	movq	88(%r12), %rcx
	movl	44(%r12), %edx
	testq	%rcx, %rcx
	jne	.LBB22_94
.LBB22_97:                              # %if.then230
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r13
	subl	%edx, 2124(%r13)
	jmp	.LBB22_98
.LBB22_80:                              # %for.body.lr.ph.new
	leaq	116(%r8), %rbx
	subq	%rsi, %rdi
	xorl	%edx, %edx
	xorl	%eax, %eax
	cmpl	$0, (%rbx)
	jne	.LBB22_85
	jmp	.LBB22_88
.LBB22_81:                              # %land.rhs213.1
	movb	136(%rbx), %cl
.LBB22_82:                              # %land.end219.1
	andb	$1, %al
	orb	%cl, %al
.LBB22_83:                              # %for.inc.1
	addq	$2, %rdx
	addq	$256, %rbx              # imm = 0x100
	cmpq	%rdx, %rdi
	je	.LBB22_91
# %bb.84:                               # %for.body
	cmpl	$0, (%rbx)
	je	.LBB22_88
.LBB22_85:                              # %for.inc
	cmpl	$0, 128(%rbx)
	jne	.LBB22_83
.LBB22_86:                              # %if.then206.1
	movl	%r13d, 128(%rbx)
	cmpl	$0, 112(%r12)
	je	.LBB22_81
# %bb.87:
	xorl	%ecx, %ecx
	jmp	.LBB22_82
	.p2align	4, 0x90
.LBB22_88:                              # %if.then206
	movl	%r13d, (%rbx)
	cmpl	$0, 112(%r12)
	je	.LBB22_90
# %bb.89:
	xorl	%ecx, %ecx
	andb	$1, %al
	orb	%cl, %al
	cmpl	$0, 128(%rbx)
	jne	.LBB22_83
	jmp	.LBB22_86
.LBB22_90:                              # %land.rhs213
	movb	8(%rbx), %cl
	andb	$1, %al
	orb	%cl, %al
	cmpl	$0, 128(%rbx)
	jne	.LBB22_83
	jmp	.LBB22_86
.LBB22_91:                              # %if.end227.loopexit.unr-lcssa
	testq	%rsi, %rsi
	je	.LBB22_93
# %bb.92:                               # %for.body.epil
	shlq	$7, %rdx
	cmpl	$0, 116(%r8,%rdx)
	je	.LBB22_104
	.p2align	4, 0x90
.LBB22_93:                              # %if.end227
	movq	88(%r12), %rcx
	movl	44(%r12), %edx
	testq	%rcx, %rcx
	je	.LBB22_97
.LBB22_94:                              # %if.else234
	subl	%edx, 96(%rcx)
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r13
.LBB22_98:                              # %if.end240
	movl	112(%r12), %ecx
	decl	%ecx
	movl	%ecx, 112(%r12)
	testb	$1, %al
	jne	.LBB22_2
# %bb.99:                               # %lor.lhs.false244
	testl	%ecx, %ecx
	jne	.LBB22_3
# %bb.100:                              # %land.lhs.true247
	cmpl	$0, 40(%r12)
	je	.LBB22_102
# %bb.101:                              # %lor.lhs.false251
	cmpl	$0, 116(%r12)
	je	.LBB22_3
.LBB22_102:                             # %land.lhs.true254
	cmpb	$0, 124(%r12)
	je	.LBB22_3
	jmp	.LBB22_2
.LBB22_95:                              # %if.else98
	movq	-80(%rbp), %rdi         # 8-byte Reload
	movq	%r13, %rsi
	callq	halide_cond_wait@PLT
	decl	64(%r13)
	testq	%r15, %r15
	jne	.LBB22_4
	jmp	.LBB22_14
.LBB22_104:                             # %if.then206.epil
	leaq	(%r8,%rdx), %rcx
	addq	$116, %rcx
	movl	%r13d, (%rcx)
	cmpl	$0, 112(%r12)
	je	.LBB22_106
# %bb.105:
	xorl	%ecx, %ecx
	jmp	.LBB22_107
.LBB22_106:                             # %land.rhs213.epil
	movb	124(%r8,%rdx), %cl
.LBB22_107:                             # %land.end219.epil
	andb	$1, %al
	orb	%cl, %al
	movq	88(%r12), %rcx
	movl	44(%r12), %edx
	testq	%rcx, %rcx
	jne	.LBB22_94
	jmp	.LBB22_97
.LBB22_108:                             # %while.end263
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end22:
	.size	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE, .Lfunc_end22-_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
                                        # -- End function
	.section	.text.halide_mutex_unlock,"ax",@progbits
	.weak	halide_mutex_unlock     # -- Begin function halide_mutex_unlock
	.p2align	4, 0x90
	.type	halide_mutex_unlock,@function
halide_mutex_unlock:                    # @halide_mutex_unlock
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	xorl	%ecx, %ecx
	movl	$1, %eax
	lock		cmpxchgq	%rcx, (%rdi)
	je	.LBB23_3
# %bb.1:                                # %if.then.i
	xorl	%ecx, %ecx
	movl	$1, %eax
	lock		cmpxchgq	%rcx, (%rdi)
	je	.LBB23_3
# %bb.2:                                # %if.end.i.i
	movq	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv@GOTPCREL(%rip), %rax
	movq	%rax, -32(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb@GOTPCREL(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	%rdi, -8(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE@GOTPCREL(%rip), %rax
	movq	%rax, -40(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib@GOTPCREL(%rip), %rax
	movq	%rax, -24(%rbp)
	leaq	-40(%rbp), %rsi
	callq	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE@PLT
.LBB23_3:                               # %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end23:
	.size	halide_mutex_unlock, .Lfunc_end23-halide_mutex_unlock
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv,@function
_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv: # @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	retq
.Lfunc_end24:
	.size	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, .Lfunc_end24-_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,@function
_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb: # @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	retq
.Lfunc_end25:
	.size	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, .Lfunc_end25-_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE: # @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	32(%rdi), %rax
	movq	(%rax), %rax
	cmpq	$3, %rax
	sete	%al
	popq	%rbp
	retq
.Lfunc_end26:
	.size	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end26-_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib: # @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edx, %eax
	addq	%rax, %rax
	movq	32(%rdi), %rcx
	movq	%rax, (%rcx)
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end27:
	.size	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, .Lfunc_end27-_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE,@function
_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE: # @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %r15
	movq	%rdi, %r12
	callq	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy@PLT
	movq	%rax, %r14
	movq	8(%rax), %rax
	movq	%r14, %rdx
	addq	$8, %rdx
	xorl	%edi, %edi
	.p2align	4, 0x90
.LBB28_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	testq	%rax, %rax
	je	.LBB28_8
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB28_1 Depth=1
	movq	%rax, %r13
	movq	%rdi, %rcx
	movq	%rdx, %rsi
	movq	136(%rax), %rbx
	leaq	144(%rax), %rdx
	movq	144(%rax), %rax
	movq	%r13, %rdi
	cmpq	%r12, %rbx
	jne	.LBB28_1
# %bb.3:                                # %if.then
	movq	%rax, (%rsi)
	cmpq	%r13, 16(%r14)
	je	.LBB28_13
# %bb.4:                                # %while.cond6.preheader
	testq	%rax, %rax
	je	.LBB28_14
	.p2align	4, 0x90
.LBB28_5:                               # %while.body8
                                        # =>This Inner Loop Header: Depth=1
	movq	136(%rax), %rcx
	movq	144(%rax), %rax
	testq	%rax, %rax
	je	.LBB28_7
# %bb.6:                                # %while.body8
                                        #   in Loop: Header=BB28_5 Depth=1
	cmpq	%r12, %rcx
	jne	.LBB28_5
.LBB28_7:                               # %if.end.loopexit
	cmpq	%r12, %rcx
	sete	%al
	jmp	.LBB28_15
.LBB28_8:                               # %while.end21
	movq	%r15, %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	*16(%r15)
	movq	(%r14), %rax
	.p2align	4, 0x90
.LBB28_9:                               # %atomicrmw.start2
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%r14)
	jne	.LBB28_9
# %bb.10:                               # %atomicrmw.end1
	xorl	%r12d, %r12d
	cmpq	$4, %rax
	jb	.LBB28_21
# %bb.11:                               # %atomicrmw.end1
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB28_21
# %bb.12:                               # %if.then.i
	movq	%r14, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT
	xorl	%r12d, %r12d
	jmp	.LBB28_21
.LBB28_13:                              # %if.then4
	movq	%rcx, 16(%r14)
.LBB28_14:
	xorl	%eax, %eax
.LBB28_15:                              # %if.end
	movzbl	%al, %r12d
	movq	%r15, %rdi
	movl	$1, %esi
	movl	%r12d, %edx
	callq	*16(%r15)
	movq	%rax, 152(%r13)
	movq	%r13, %rdi
	callq	pthread_mutex_lock@PLT
	movq	(%r14), %rax
	.p2align	4, 0x90
.LBB28_16:                              # %atomicrmw.start
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%r14)
	jne	.LBB28_16
# %bb.17:                               # %atomicrmw.end
	cmpq	$4, %rax
	jb	.LBB28_20
# %bb.18:                               # %atomicrmw.end
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB28_20
# %bb.19:                               # %if.then.i66
	movq	%r14, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT
.LBB28_20:                              # %cleanup.thread
	movb	$0, 128(%r13)
	leaq	64(%r13), %rdi
	callq	pthread_cond_signal@PLT
	movq	%r13, %rdi
	callq	pthread_mutex_unlock@PLT
.LBB28_21:                              # %cleanup25
	movq	%r12, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end28:
	.size	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE, .Lfunc_end28-_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy,@function
_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy: # @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movabsq	$-7046029254386353131, %rax # imm = 0x9E3779B97F4A7C15
	imulq	%rdi, %rax
	shrq	$54, %rax
	leaq	(%rax,%rax,2), %rcx
	movq	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE@GOTPCREL(%rip), %rdx
	leaq	(%rdx,%rcx,8), %rbx
	movl	$1, %esi
	xorl	%eax, %eax
	lock		cmpxchgq	%rsi, (%rdx,%rcx,8)
	je	.LBB29_2
# %bb.1:                                # %if.then.i
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv@PLT
.LBB29_2:                               # %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end29:
	.size	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy, .Lfunc_end29-_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv,@function
_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv: # @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %r14
	movq	(%rdi), %rbx
	.p2align	4, 0x90
.LBB30_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$4, %rbx
	jb	.LBB30_18
# %bb.2:                                # %while.cond
                                        #   in Loop: Header=BB30_1 Depth=1
	movl	%ebx, %eax
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB30_18
# %bb.3:                                # %if.end
                                        #   in Loop: Header=BB30_1 Depth=1
	movq	%rbx, %rcx
	orq	$2, %rcx
	movq	%rbx, %rax
	lock		cmpxchgq	%rcx, (%r14)
	movq	%rax, %rbx
	jne	.LBB30_1
	jmp	.LBB30_4
	.p2align	4, 0x90
.LBB30_12:                              # %cleanup70
                                        #   in Loop: Header=BB30_4 Depth=1
	#MEMBARRIER
.LBB30_4:                               # %while.cond11
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB30_8 Depth 2
                                        #     Child Loop BB30_14 Depth 2
	movq	%rbx, %rax
	andq	$-4, %rax
	movq	%rax, -48(%rbp)         # 8-byte Spill
	movq	152(%rax), %r12
	testq	%r12, %r12
	jne	.LBB30_9
# %bb.5:                                # %while.body17.preheader
                                        #   in Loop: Header=BB30_4 Depth=1
	movq	-48(%rbp), %r15         # 8-byte Reload
	movq	136(%r15), %r13
	testq	%r13, %r13
	je	.LBB30_7
	.p2align	4, 0x90
.LBB30_8:                               # %if.end21
                                        #   Parent Loop BB30_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r15, 144(%r13)
	movq	152(%r13), %r12
	movq	%r13, %r15
	testq	%r12, %r12
	jne	.LBB30_9
# %bb.6:                                # %while.body17
                                        #   in Loop: Header=BB30_8 Depth=2
	movq	136(%r15), %r13
	testq	%r13, %r13
	jne	.LBB30_8
.LBB30_7:                               # %if.then20
                                        #   in Loop: Header=BB30_4 Depth=1
	xorl	%edi, %edi
	leaq	.L.str.5(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	jmp	.LBB30_8
	.p2align	4, 0x90
.LBB30_9:                               # %while.end23
                                        #   in Loop: Header=BB30_4 Depth=1
	movq	-48(%rbp), %rax         # 8-byte Reload
	movq	%r12, 152(%rax)
	testb	$1, %bl
	jne	.LBB30_10
# %bb.13:                               # %if.end35
                                        #   in Loop: Header=BB30_4 Depth=1
	movq	144(%r12), %rax
	testq	%rax, %rax
	jne	.LBB30_16
	.p2align	4, 0x90
.LBB30_14:                              # %while.body41
                                        #   Parent Loop BB30_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%ebx, %ecx
	andl	$1, %ecx
	movq	%rbx, %rax
	lock		cmpxchgq	%rcx, (%r14)
	je	.LBB30_17
# %bb.15:                               # %if.end47
                                        #   in Loop: Header=BB30_14 Depth=2
	movq	%rax, %rbx
	cmpq	$4, %rax
	jb	.LBB30_14
	jmp	.LBB30_12
	.p2align	4, 0x90
.LBB30_10:                              # %if.then27
                                        #   in Loop: Header=BB30_4 Depth=1
	movq	%rbx, %rcx
	andq	$-3, %rcx
	movq	%rbx, %rax
	lock		cmpxchgq	%rcx, (%r14)
	je	.LBB30_18
# %bb.11:                               # %if.end33
                                        #   in Loop: Header=BB30_4 Depth=1
	movq	%rax, %rbx
	jmp	.LBB30_12
.LBB30_18:                              # %cleanup76
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB30_16:                              # %if.else62
	movq	-48(%rbp), %rcx         # 8-byte Reload
	movq	%rax, 152(%rcx)
	lock		andq	$-3, (%r14)
.LBB30_17:                              # %if.end66
	movq	%r12, %rdi
	callq	pthread_mutex_lock@PLT
	movb	$0, 128(%r12)
	leaq	64(%r12), %rdi
	callq	pthread_cond_signal@PLT
	movq	%r12, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	pthread_mutex_unlock@PLT # TAILCALL
.Lfunc_end30:
	.size	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv, .Lfunc_end30-_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4               # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
.LCPI31_0:
	.zero	16
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv,@function
_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv: # @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$168, %rsp
	movq	%rdi, %r12
	movq	(%rdi), %rbx
	leaq	-136(%rbp), %r14
	movl	$40, %r13d
	leaq	-200(%rbp), %r15
	testb	$1, %bl
	je	.LBB31_2
	jmp	.LBB31_4
	.p2align	4, 0x90
.LBB31_16:                              # %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
                                        #   in Loop: Header=BB31_4 Depth=1
	movq	%r15, %rdi
	callq	pthread_mutex_unlock@PLT
	movq	(%r12), %rbx
	movl	$40, %r13d
.LBB31_17:                              # %if.end22
                                        #   in Loop: Header=BB31_4 Depth=1
	movq	%r14, %rdi
	callq	pthread_cond_destroy@PLT
	movq	%r15, %rdi
	callq	pthread_mutex_destroy@PLT
	testb	$1, %bl
	je	.LBB31_2
	.p2align	4, 0x90
.LBB31_4:                               # %if.end4
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB31_14 Depth 2
	testl	%r13d, %r13d
	jle	.LBB31_8
# %bb.5:                                # %if.end4
                                        #   in Loop: Header=BB31_4 Depth=1
	cmpq	$4, %rbx
	jb	.LBB31_8
# %bb.6:                                # %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit
                                        #   in Loop: Header=BB31_4 Depth=1
	decl	%r13d
	jle	.LBB31_7
# %bb.19:                               # %if.then7
                                        #   in Loop: Header=BB31_4 Depth=1
	callq	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv@PLT
	movq	(%r12), %rbx
	testb	$1, %bl
	je	.LBB31_2
	jmp	.LBB31_4
	.p2align	4, 0x90
.LBB31_7:                               #   in Loop: Header=BB31_4 Depth=1
	xorl	%r13d, %r13d
.LBB31_8:                               # %if.end9
                                        #   in Loop: Header=BB31_4 Depth=1
	movb	$0, -72(%rbp)
	movq	%r15, %rdi
	xorl	%esi, %esi
	callq	pthread_mutex_init@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
	callq	pthread_cond_init@PLT
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, 72(%r14)
	movq	$0, 88(%r14)
	movb	$1, -72(%rbp)
	movq	%rbx, %rax
	andq	$-4, %rax
	je	.LBB31_9
# %bb.10:                               # %if.else
                                        #   in Loop: Header=BB31_4 Depth=1
	movq	%rax, -64(%rbp)
	jmp	.LBB31_11
	.p2align	4, 0x90
.LBB31_9:                               # %if.then12
                                        #   in Loop: Header=BB31_4 Depth=1
	movq	%r15, -48(%rbp)
.LBB31_11:                              # %if.end13
                                        #   in Loop: Header=BB31_4 Depth=1
	movl	%ebx, %ecx
	andl	$3, %ecx
	orq	%r15, %rcx
	movq	%rbx, %rax
	lock		cmpxchgq	%rcx, (%r12)
	jne	.LBB31_12
# %bb.13:                               # %if.then19
                                        #   in Loop: Header=BB31_4 Depth=1
	movq	%r15, %rdi
	callq	pthread_mutex_lock@PLT
	cmpb	$0, -72(%rbp)
	je	.LBB31_16
	.p2align	4, 0x90
.LBB31_14:                              # %while.body.i
                                        #   Parent Loop BB31_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	pthread_cond_wait@PLT
	cmpb	$0, -72(%rbp)
	jne	.LBB31_14
	jmp	.LBB31_16
	.p2align	4, 0x90
.LBB31_12:                              # %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_release_relaxedEPyS4_S4_.exit
                                        #   in Loop: Header=BB31_4 Depth=1
	movq	%rax, %rbx
	jmp	.LBB31_17
	.p2align	4, 0x90
.LBB31_2:                               # %if.then
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rcx
	orq	$1, %rcx
	movq	%rbx, %rax
	lock		cmpxchgq	%rcx, (%r12)
	je	.LBB31_18
# %bb.3:                                # %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit
                                        #   in Loop: Header=BB31_2 Depth=1
	movq	%rax, %rbx
	testb	$1, %bl
	je	.LBB31_2
	jmp	.LBB31_4
.LBB31_18:                              # %cleanup23
	addq	$168, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end31:
	.size	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv, .Lfunc_end31-_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
                                        # -- End function
	.section	.text.halide_cond_broadcast,"ax",@progbits
	.weak	halide_cond_broadcast   # -- Begin function halide_cond_broadcast
	.p2align	4, 0x90
	.type	halide_cond_broadcast,@function
halide_cond_broadcast:                  # @halide_cond_broadcast
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	(%rdi), %rsi
	testq	%rsi, %rsi
	je	.LBB32_2
# %bb.1:                                # %if.end.i
	movq	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv@GOTPCREL(%rip), %rax
	movq	%rax, -40(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib@GOTPCREL(%rip), %rax
	movq	%rax, -32(%rbp)
	movq	%rdi, -16(%rbp)
	movq	%rsi, -8(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE@GOTPCREL(%rip), %rax
	movq	%rax, -48(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb@GOTPCREL(%rip), %rax
	movq	%rax, -24(%rbp)
	leaq	-48(%rbp), %rdx
	xorl	%ecx, %ecx
	callq	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy@PLT
.LBB32_2:                               # %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond9broadcastEv.exit
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end32:
	.size	halide_cond_broadcast, .Lfunc_end32-halide_cond_broadcast
                                        # -- End function
	.section	.text.halide_default_semaphore_try_acquire,"ax",@progbits
	.weak	halide_default_semaphore_try_acquire # -- Begin function halide_default_semaphore_try_acquire
	.p2align	4, 0x90
	.type	halide_default_semaphore_try_acquire,@function
halide_default_semaphore_try_acquire:   # @halide_default_semaphore_try_acquire
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movb	$1, %cl
	testl	%esi, %esi
	je	.LBB33_5
# %bb.1:                                # %if.end
	movl	(%rdi), %eax
	.p2align	4, 0x90
.LBB33_2:                               # %if.end
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, %edx
	subl	%esi, %edx
	js	.LBB33_4
# %bb.3:                                # %land.rhs
                                        #   in Loop: Header=BB33_2 Depth=1
	lock		cmpxchgl	%edx, (%rdi)
	jne	.LBB33_2
.LBB33_5:                               # %return
	movl	%ecx, %eax
	popq	%rbp
	retq
.LBB33_4:
	xorl	%ecx, %ecx
	movl	%ecx, %eax
	popq	%rbp
	retq
.Lfunc_end33:
	.size	halide_default_semaphore_try_acquire, .Lfunc_end33-halide_default_semaphore_try_acquire
                                        # -- End function
	.section	.text.halide_cond_wait,"ax",@progbits
	.weak	halide_cond_wait        # -- Begin function halide_cond_wait
	.p2align	4, 0x90
	.type	halide_cond_wait,@function
halide_cond_wait:                       # @halide_cond_wait
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	movq	%rsi, %rbx
	movq	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb@GOTPCREL(%rip), %r15
	movq	%r15, -104(%rbp)
	movq	%rdi, -96(%rbp)
	movq	%rsi, -88(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE@GOTPCREL(%rip), %rax
	movq	%rax, -128(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv@GOTPCREL(%rip), %rax
	movq	%rax, -120(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib@GOTPCREL(%rip), %rax
	movq	%rax, -112(%rbp)
	leaq	-128(%rbp), %rsi
	callq	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE@PLT
	cmpq	%rbx, %rax
	jne	.LBB34_1
# %bb.12:                               # %if.else.i
	movq	(%rbx), %rax
	testb	$1, %al
	jne	.LBB34_14
# %bb.13:                               # %if.then2.i
	leaq	.L.str.6(%rip), %rsi
	xorl	%edi, %edi
	callq	halide_print@PLT
	callq	abort@PLT
	jmp	.LBB34_14
.LBB34_1:                               # %if.then.i
	movl	$1, %ecx
	xorl	%eax, %eax
	lock		cmpxchgq	%rcx, (%rbx)
	je	.LBB34_14
# %bb.2:                                # %if.then.i.i
	movq	(%rbx), %rax
	movl	$40, %r13d
	movq	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib@GOTPCREL(%rip), %r12
	leaq	-80(%rbp), %r14
	.p2align	4, 0x90
.LBB34_3:                               # %while.cond.outer.i.i.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB34_5 Depth 2
	testb	$1, %al
	jne	.LBB34_5
.LBB34_4:                               # %if.then.i.i.i
                                        #   in Loop: Header=BB34_3 Depth=1
	movq	%rax, %rcx
	orq	$1, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB34_3
	jmp	.LBB34_14
.LBB34_5:                               # %if.end4.i.i.i
                                        #   Parent Loop BB34_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testb	$2, %al
	jne	.LBB34_10
# %bb.6:                                # %land.lhs.true.i.i.i
                                        #   in Loop: Header=BB34_5 Depth=2
	testl	%r13d, %r13d
	jg	.LBB34_7
# %bb.9:                                # %if.then12.i.i.i
                                        #   in Loop: Header=BB34_5 Depth=2
	movq	%rax, %rcx
	orq	$2, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB34_3
.LBB34_10:                              # %if.end21.i.i.i
                                        #   in Loop: Header=BB34_5 Depth=2
	movq	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv@GOTPCREL(%rip), %rax
	movq	%rax, -72(%rbp)
	movq	%r15, -56(%rbp)
	movq	%rbx, -48(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE@GOTPCREL(%rip), %rax
	movq	%rax, -80(%rbp)
	movq	%r12, -64(%rbp)
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE@PLT
	cmpq	%rbx, %rax
	je	.LBB34_14
# %bb.11:                               # %if.end26.i.i.i
                                        #   in Loop: Header=BB34_5 Depth=2
	movq	(%rbx), %rax
	movl	$40, %r13d
	testb	$1, %al
	je	.LBB34_4
	jmp	.LBB34_5
.LBB34_7:                               # %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i.i
                                        #   in Loop: Header=BB34_5 Depth=2
	decl	%r13d
	jle	.LBB34_8
# %bb.15:                               # %if.then7.i.i.i
                                        #   in Loop: Header=BB34_5 Depth=2
	callq	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv@PLT
	movq	(%rbx), %rax
	testb	$1, %al
	je	.LBB34_4
	jmp	.LBB34_5
.LBB34_8:                               #   in Loop: Header=BB34_5 Depth=2
	xorl	%r13d, %r13d
	movq	%rax, %rcx
	orq	$2, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB34_3
	jmp	.LBB34_10
.LBB34_14:                              # %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond4waitEPNS2_10fast_mutexE.exit
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end34:
	.size	halide_cond_wait, .Lfunc_end34-halide_cond_wait
                                        # -- End function
	.section	.text.halide_do_loop_task,"ax",@progbits
	.weak	halide_do_loop_task     # -- Begin function halide_do_loop_task
	.p2align	4, 0x90
	.type	halide_do_loop_task,@function
halide_do_loop_task:                    # @halide_do_loop_task
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end35:
	.size	halide_do_loop_task, .Lfunc_end35-halide_do_loop_task
                                        # -- End function
	.section	.text.halide_do_task,"ax",@progbits
	.weak	halide_do_task          # -- Begin function halide_do_task
	.p2align	4, 0x90
	.type	halide_do_task,@function
halide_do_task:                         # @halide_do_task
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal14custom_do_taskE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end36:
	.size	halide_do_task, .Lfunc_end36-halide_do_task
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE: # @_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	32(%rdi), %rax
	movq	(%rax), %rdx
	movq	40(%rdi), %rcx
	testq	%rdx, %rdx
	je	.LBB37_1
# %bb.2:                                # %if.else
	movb	$1, %al
	cmpq	%rcx, %rdx
	je	.LBB37_4
# %bb.3:                                # %if.then4
	movq	%rcx, 8(%rsi)
	xorl	%eax, %eax
.LBB37_4:                               # %cleanup
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	retq
.LBB37_1:                               # %if.then
	movq	%rcx, (%rax)
	movb	$1, %al
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	retq
.Lfunc_end37:
	.size	_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end37-_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv,@function
_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv: # @_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	40(%rdi), %rdi
	xorl	%ecx, %ecx
	movl	$1, %eax
	lock		cmpxchgq	%rcx, (%rdi)
	je	.LBB38_3
# %bb.1:                                # %if.then.i
	xorl	%ecx, %ecx
	movl	$1, %eax
	lock		cmpxchgq	%rcx, (%rdi)
	je	.LBB38_3
# %bb.2:                                # %if.end.i.i
	movq	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv@GOTPCREL(%rip), %rax
	movq	%rax, -32(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb@GOTPCREL(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	%rdi, -8(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE@GOTPCREL(%rip), %rax
	movq	%rax, -40(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib@GOTPCREL(%rip), %rax
	movq	%rax, -24(%rbp)
	leaq	-40(%rbp), %rsi
	callq	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE@PLT
.LBB38_3:                               # %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end38:
	.size	_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv, .Lfunc_end38-_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib: # @_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
# %bb.0:                                # %entry
	testl	%edx, %edx
	jne	.LBB39_2
# %bb.1:                                # %if.then
	pushq	%rbp
	movq	%rsp, %rbp
	movq	32(%rdi), %rax
	movq	$0, (%rax)
	popq	%rbp
.LBB39_2:                               # %if.end
	xorl	%eax, %eax
	retq
.Lfunc_end39:
	.size	_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib, .Lfunc_end39-_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE,@function
_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE: # @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$184, %rsp
	movq	%rsi, %r14
	movq	%rdi, %r13
	movb	$0, -88(%rbp)
	leaq	-216(%rbp), %r12
	movq	%r12, %rdi
	xorl	%esi, %esi
	callq	pthread_mutex_init@PLT
	leaq	-152(%rbp), %r15
	movq	%r15, %rdi
	xorl	%esi, %esi
	callq	pthread_cond_init@PLT
	movb	$0, -88(%rbp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, -80(%rbp)
	movq	$0, -64(%rbp)
	movq	%r13, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy@PLT
	movq	%rax, %rbx
	movb	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	leaq	-56(%rbp), %rsi
	movq	%r14, %rdi
	callq	*(%r14)
	testb	%al, %al
	je	.LBB40_1
# %bb.6:                                # %if.end
	movq	$0, -72(%rbp)
	movq	%r13, -80(%rbp)
	movb	$1, -88(%rbp)
	movq	%rbx, %rax
	addq	$8, %rax
	movl	$144, %ecx
	addq	16(%rbx), %rcx
	cmpq	$0, 8(%rbx)
	cmoveq	%rax, %rcx
	leaq	-64(%rbp), %r13
	movq	%r12, (%rcx)
	movq	%r12, 16(%rbx)
	movq	(%rbx), %rax
	.p2align	4, 0x90
.LBB40_7:                               # %atomicrmw.start2
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB40_7
# %bb.8:                                # %atomicrmw.end1
	cmpq	$4, %rax
	jb	.LBB40_11
# %bb.9:                                # %atomicrmw.end1
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB40_11
# %bb.10:                               # %if.then.i27
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT
.LBB40_11:                              # %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit28
	movq	%r14, %rdi
	callq	*8(%r14)
	leaq	-216(%rbp), %rdi
	callq	pthread_mutex_lock@PLT
	cmpb	$0, -88(%rbp)
	je	.LBB40_14
# %bb.12:                               # %while.body.i.preheader
	leaq	-216(%rbp), %rbx
	.p2align	4, 0x90
.LBB40_13:                              # %while.body.i
                                        # =>This Inner Loop Header: Depth=1
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	pthread_cond_wait@PLT
	cmpb	$0, -88(%rbp)
	jne	.LBB40_13
.LBB40_14:                              # %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
	leaq	-216(%rbp), %rdi
	callq	pthread_mutex_unlock@PLT
	jmp	.LBB40_15
.LBB40_1:                               # %if.then
	leaq	-48(%rbp), %r13
	movq	(%rbx), %rax
	.p2align	4, 0x90
.LBB40_2:                               # %atomicrmw.start
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rbx)
	jne	.LBB40_2
# %bb.3:                                # %atomicrmw.end
	cmpq	$4, %rax
	jb	.LBB40_15
# %bb.4:                                # %atomicrmw.end
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB40_15
# %bb.5:                                # %if.then.i
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT
.LBB40_15:                              # %cleanup
	movq	(%r13), %rbx
	movq	%r15, %rdi
	callq	pthread_cond_destroy@PLT
	leaq	-216(%rbp), %rdi
	callq	pthread_mutex_destroy@PLT
	movq	%rbx, %rax
	addq	$184, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end40:
	.size	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE, .Lfunc_end40-_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib: # @_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end41:
	.size	_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib, .Lfunc_end41-_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE: # @_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	32(%rdi), %rax
	movq	(%rax), %rcx
	cmpq	40(%rdi), %rcx
	jne	.LBB42_1
# %bb.2:                                # %if.end
	movq	$0, (%rax)
	movq	40(%rdi), %rdx
	movq	(%rdx), %rax
	movb	$1, %cl
	movb	$1, %dil
	testb	$1, %al
	je	.LBB42_7
	.p2align	4, 0x90
.LBB42_3:                               # %if.end.i
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rdi
	orq	$2, %rdi
	lock		cmpxchgq	%rdi, (%rdx)
	je	.LBB42_4
# %bb.5:                                # %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i
                                        #   in Loop: Header=BB42_3 Depth=1
	testb	$1, %al
	jne	.LBB42_3
# %bb.6:
	movb	$1, %dil
	movb	%dil, (%rsi)
	movl	%ecx, %eax
	popq	%rbp
	retq
.LBB42_1:
	xorl	%ecx, %ecx
	movl	%ecx, %eax
	popq	%rbp
	retq
.LBB42_4:
	xorl	%edi, %edi
.LBB42_7:                               # %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex21make_parked_if_lockedEv.exit
	movb	%dil, (%rsi)
	movl	%ecx, %eax
	popq	%rbp
	retq
.Lfunc_end42:
	.size	_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end42-_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,@function
_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb: # @_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	cmpb	$0, (%rsi)
	je	.LBB43_3
# %bb.1:                                # %entry
	testb	%cl, %cl
	je	.LBB43_3
# %bb.2:                                # %if.then
	movq	40(%rdi), %rax
	lock		orq	$2, (%rax)
.LBB43_3:                               # %if.end
	popq	%rbp
	retq
.Lfunc_end43:
	.size	_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, .Lfunc_end43-_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy,@function
_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy: # @_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %rbx
	leaq	-72(%rbp), %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy@PLT
	movb	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	leaq	-56(%rbp), %rsi
	movq	%r15, %rdi
	callq	*(%r15)
	testb	%al, %al
	je	.LBB44_1
# %bb.2:                                # %if.end
	movq	-72(%rbp), %r10
	movq	8(%r10), %rdx
	testq	%rdx, %rdx
	je	.LBB44_3
# %bb.4:                                # %while.body.lr.ph
	leaq	8(%r10), %r11
	cmpb	$0, -56(%rbp)
	je	.LBB44_16
# %bb.5:                                # %while.body.us.preheader
	xorl	%r13d, %r13d
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	xorl	%eax, %eax
	jmp	.LBB44_6
	.p2align	4, 0x90
.LBB44_7:                               #   in Loop: Header=BB44_6 Depth=1
	leaq	144(%rdi), %r11
	movq	%rdi, %rax
	testq	%rdx, %rdx
	je	.LBB44_25
.LBB44_6:                               # %while.body.us
                                        # =>This Inner Loop Header: Depth=1
	movq	%rdx, %rdi
	movq	136(%rdx), %rcx
	movq	144(%rdx), %rdx
	cmpq	%rbx, %rcx
	jne	.LBB44_7
# %bb.8:                                # %if.then3.us
                                        #   in Loop: Header=BB44_6 Depth=1
	movq	%rdx, (%r11)
	cmpq	%rdi, 16(%r10)
	je	.LBB44_9
# %bb.10:                               # %if.end9.us
                                        #   in Loop: Header=BB44_6 Depth=1
	testq	%r13, %r13
	je	.LBB44_11
.LBB44_12:                              # %if.else.us
                                        #   in Loop: Header=BB44_6 Depth=1
	movq	%rdi, %rcx
	testq	%rsi, %rsi
	je	.LBB44_14
# %bb.13:                               # %if.else14.us
                                        #   in Loop: Header=BB44_6 Depth=1
	movq	%rdi, 144(%r8)
	movq	%rsi, %rcx
.LBB44_14:                              # %if.end16.us
                                        #   in Loop: Header=BB44_6 Depth=1
	movq	%r12, 136(%rdi)
	movq	%rcx, %rsi
	movq	%rdi, %r8
	testq	%rdx, %rdx
	jne	.LBB44_6
	jmp	.LBB44_25
.LBB44_9:                               # %if.then6.us
                                        #   in Loop: Header=BB44_6 Depth=1
	movq	%rax, 16(%r10)
	testq	%r13, %r13
	jne	.LBB44_12
.LBB44_11:                              #   in Loop: Header=BB44_6 Depth=1
	movq	%rdi, %r13
	testq	%rdx, %rdx
	jne	.LBB44_6
	jmp	.LBB44_25
.LBB44_1:                               # %if.then
	leaq	-72(%rbp), %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE@PLT
	xorl	%eax, %eax
	jmp	.LBB44_35
.LBB44_3:
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	jmp	.LBB44_31
.LBB44_16:                              # %while.body.preheader
	xorl	%r13d, %r13d
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	movq	136(%rdx), %rcx
	movq	144(%rdx), %rax
	cmpq	%rbx, %rcx
	je	.LBB44_19
	.p2align	4, 0x90
.LBB44_18:
	leaq	144(%rdx), %r11
	movq	%rdx, %r9
	movq	%rax, %rdx
	testq	%rax, %rax
	je	.LBB44_25
.LBB44_17:                              # %while.body
	movq	136(%rdx), %rcx
	movq	144(%rdx), %rax
	cmpq	%rbx, %rcx
	jne	.LBB44_18
.LBB44_19:                              # %if.then3
	movq	%rax, (%r11)
	cmpq	%rdx, 16(%r10)
	je	.LBB44_20
# %bb.21:                               # %if.else
	movq	%rdx, %rcx
	testq	%rsi, %rsi
	je	.LBB44_23
.LBB44_22:                              # %if.else14
	movq	%rdx, 144(%r8)
	movq	%rsi, %rcx
.LBB44_23:                              # %if.end16
	movq	%r12, 136(%rdx)
	movq	%rcx, %rsi
	movq	%rdx, %r8
	movq	%rax, %rdx
	testq	%rax, %rax
	jne	.LBB44_17
	jmp	.LBB44_25
.LBB44_20:                              # %if.then6
	movq	%r9, 16(%r10)
	movq	%rdx, %rcx
	testq	%rsi, %rsi
	jne	.LBB44_22
	jmp	.LBB44_23
.LBB44_25:                              # %while.end
	testq	%rsi, %rsi
	je	.LBB44_26
# %bb.27:                               # %if.then23
	movq	$0, 144(%r8)
	movq	-64(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	.LBB44_28
# %bb.29:                               # %if.else30
	movl	$144, %ecx
	addq	16(%rax), %rcx
	jmp	.LBB44_30
.LBB44_26:
	xorl	%eax, %eax
	jmp	.LBB44_31
.LBB44_28:
	leaq	8(%rax), %rcx
.LBB44_30:                              # %if.end34
	movq	%rsi, (%rcx)
	movq	%r8, 16(%rax)
	movb	$1, %al
.LBB44_31:                              # %if.end37
	xorl	%edx, %edx
	testq	%r13, %r13
	setne	%dl
	movzbl	%al, %ecx
	leaq	-56(%rbp), %rsi
	movq	%r15, %rdi
	callq	*24(%r15)
	testq	%r13, %r13
	je	.LBB44_33
# %bb.32:                               # %if.then41
	movq	%r14, 152(%r13)
	movq	%r13, %rdi
	callq	pthread_mutex_lock@PLT
	leaq	-72(%rbp), %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE@PLT
	movb	$0, 128(%r13)
	leaq	64(%r13), %rdi
	callq	pthread_cond_signal@PLT
	movq	%r13, %rdi
	callq	pthread_mutex_unlock@PLT
	jmp	.LBB44_34
.LBB44_33:                              # %if.else45
	leaq	-72(%rbp), %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE@PLT
.LBB44_34:                              # %if.end46
	testq	%r13, %r13
	setne	%al
	andb	-56(%rbp), %al
	movzbl	%al, %eax
.LBB44_35:                              # %cleanup
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end44:
	.size	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy, .Lfunc_end44-_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy,@function
_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy: # @_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdi, %r14
	movabsq	$-7046029254386353131, %rax # imm = 0x9E3779B97F4A7C15
	imulq	%rax, %rsi
	shrq	$54, %rsi
	imulq	%rax, %rdx
	shrq	$54, %rdx
	cmpq	%rdx, %rsi
	jne	.LBB45_4
# %bb.1:                                # %if.then
	leaq	(%rsi,%rsi,2), %rcx
	movq	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE@GOTPCREL(%rip), %rdx
	leaq	(%rdx,%rcx,8), %rbx
	movl	$1, %esi
	xorl	%eax, %eax
	lock		cmpxchgq	%rsi, (%rdx,%rcx,8)
	jne	.LBB45_3
# %bb.2:
	movq	%rbx, %r15
	jmp	.LBB45_14
.LBB45_4:                               # %if.else
	jae	.LBB45_9
# %bb.5:                                # %if.then3
	leaq	(%rsi,%rsi,2), %rcx
	movq	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE@GOTPCREL(%rip), %rsi
	leaq	(%rsi,%rcx,8), %rbx
	leaq	(%rdx,%rdx,2), %rax
	leaq	(%rsi,%rax,8), %r15
	movl	$1, %r12d
	xorl	%eax, %eax
	lock		cmpxchgq	%r12, (%rsi,%rcx,8)
	je	.LBB45_7
# %bb.6:                                # %if.then.i50
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv@PLT
.LBB45_7:                               # %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit51
	xorl	%eax, %eax
	lock		cmpxchgq	%r12, (%r15)
	je	.LBB45_14
# %bb.8:                                # %if.then.i47
	movq	%r15, %rdi
	jmp	.LBB45_13
.LBB45_3:                               # %if.then.i53
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv@PLT
	movq	%rbx, %r15
	jmp	.LBB45_14
.LBB45_9:                               # %if.else9
	leaq	(%rdx,%rdx,2), %rcx
	movq	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE@GOTPCREL(%rip), %rdx
	leaq	(%rdx,%rcx,8), %r15
	leaq	(%rsi,%rsi,2), %rax
	leaq	(%rdx,%rax,8), %rbx
	movl	$1, %r12d
	xorl	%eax, %eax
	lock		cmpxchgq	%r12, (%rdx,%rcx,8)
	je	.LBB45_11
# %bb.10:                               # %if.then.i42
	movq	%r15, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv@PLT
.LBB45_11:                              # %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit43
	xorl	%eax, %eax
	lock		cmpxchgq	%r12, (%rbx)
	je	.LBB45_14
# %bb.12:                               # %if.then.i
	movq	%rbx, %rdi
.LBB45_13:                              # %cleanup
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv@PLT
.LBB45_14:                              # %cleanup
	movq	%rbx, (%r14)
	movq	%r15, 8(%r14)
	movq	%r14, %rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end45:
	.size	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy, .Lfunc_end45-_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE,@function
_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE: # @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	movq	8(%rbx), %rcx
	cmpq	%rcx, %rdi
	je	.LBB46_1
# %bb.6:                                # %if.else
	jbe	.LBB46_14
# %bb.7:                                # %if.then5
	movq	(%rdi), %rax
	.p2align	4, 0x90
.LBB46_8:                               # %atomicrmw.start2
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rdi)
	jne	.LBB46_8
# %bb.9:                                # %atomicrmw.end1
	cmpq	$4, %rax
	jb	.LBB46_12
# %bb.10:                               # %atomicrmw.end1
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB46_12
# %bb.11:                               # %if.then.i28
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT
.LBB46_12:                              # %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit29
	movq	8(%rbx), %rdi
	movq	(%rdi), %rax
	.p2align	4, 0x90
.LBB46_13:                              # %atomicrmw.start8
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rdi)
	jne	.LBB46_13
	jmp	.LBB46_3
.LBB46_1:                               # %if.then
	movq	(%rdi), %rax
	.p2align	4, 0x90
.LBB46_2:                               # %atomicrmw.start
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rdi)
	jne	.LBB46_2
	jmp	.LBB46_3
.LBB46_14:                              # %if.else10
	movq	(%rcx), %rax
	.p2align	4, 0x90
.LBB46_15:                              # %atomicrmw.start14
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rdx
	andq	$-2, %rdx
	lock		cmpxchgq	%rdx, (%rcx)
	jne	.LBB46_15
# %bb.16:                               # %atomicrmw.end13
	cmpq	$4, %rax
	jb	.LBB46_19
# %bb.17:                               # %atomicrmw.end13
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB46_19
# %bb.18:                               # %if.then.i42
	movq	%rcx, %rdi
	callq	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT
.LBB46_19:                              # %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit43
	movq	(%rbx), %rdi
	movq	(%rdi), %rax
	.p2align	4, 0x90
.LBB46_20:                              # %atomicrmw.start20
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rcx
	andq	$-2, %rcx
	lock		cmpxchgq	%rcx, (%rdi)
	jne	.LBB46_20
.LBB46_3:                               # %atomicrmw.end
	cmpq	$4, %rax
	jb	.LBB46_21
# %bb.4:                                # %atomicrmw.end
	andl	$2, %eax
	testq	%rax, %rax
	jne	.LBB46_21
# %bb.5:                                # %if.then.i
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv@PLT # TAILCALL
.LBB46_21:                              # %if.end15
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end46:
	.size	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE, .Lfunc_end46-_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal27default_desired_num_threadsEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv # -- Begin function _ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv,@function
_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv: # @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.1(%rip), %rdi
	callq	getenv@PLT
	testq	%rax, %rax
	jne	.LBB47_2
# %bb.1:                                # %if.end
	leaq	.L.str.2(%rip), %rdi
	callq	getenv@PLT
	testq	%rax, %rax
	je	.LBB47_3
.LBB47_2:                               # %if.then3
	movq	%rax, %rdi
	popq	%rbp
	jmp	atoi@PLT                # TAILCALL
.LBB47_3:                               # %if.else
	popq	%rbp
	jmp	halide_host_cpu_count@PLT # TAILCALL
.Lfunc_end47:
	.size	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv, .Lfunc_end47-_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal17clamp_num_threadsEi,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi # -- Begin function _ZN6Halide7Runtime8Internal17clamp_num_threadsEi
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi,@function
_ZN6Halide7Runtime8Internal17clamp_num_threadsEi: # @_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	cmpl	$256, %edi              # imm = 0x100
	jle	.LBB48_1
# %bb.2:                                # %if.end3
	movl	$256, %eax              # imm = 0x100
	popq	%rbp
	retq
.LBB48_1:                               # %if.else
	testl	%edi, %edi
	movl	$1, %eax
	cmovgl	%edi, %eax
	popq	%rbp
	retq
.Lfunc_end48:
	.size	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi, .Lfunc_end48-_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal13worker_threadEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal13worker_threadEPv # -- Begin function _ZN6Halide7Runtime8Internal13worker_threadEPv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal13worker_threadEPv,@function
_ZN6Halide7Runtime8Internal13worker_threadEPv: # @_ZN6Halide7Runtime8Internal13worker_threadEPv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %rbx
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r14
	movq	%r14, %rdi
	callq	halide_mutex_lock@PLT
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE@PLT
	movq	%r14, %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_mutex_unlock@PLT # TAILCALL
.Lfunc_end49:
	.size	_ZN6Halide7Runtime8Internal13worker_threadEPv, .Lfunc_end49-_ZN6Halide7Runtime8Internal13worker_threadEPv
                                        # -- End function
	.section	.text.halide_spawn_thread,"ax",@progbits
	.weak	halide_spawn_thread     # -- Begin function halide_spawn_thread
	.p2align	4, 0x90
	.type	halide_spawn_thread,@function
halide_spawn_thread:                    # @halide_spawn_thread
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %r14
	movq	%rdi, %r15
	movl	$24, %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%r15, (%rax)
	movq	%r14, 8(%rax)
	leaq	16(%rax), %rdi
	movq	$0, 16(%rax)
	movq	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv@GOTPCREL(%rip), %rdx
	xorl	%esi, %esi
	movq	%rax, %rcx
	callq	pthread_create@PLT
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end50:
	.size	halide_spawn_thread, .Lfunc_end50-halide_spawn_thread
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal19spawn_thread_helperEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv # -- Begin function _ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv,@function
_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv: # @_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, %rax
	movq	8(%rdi), %rdi
	callq	*(%rax)
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end51:
	.size	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv, .Lfunc_end51-_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
                                        # -- End function
	.section	.text.halide_default_do_parallel_tasks,"ax",@progbits
	.weak	halide_default_do_parallel_tasks # -- Begin function halide_default_do_parallel_tasks
	.p2align	4, 0x90
	.type	halide_default_do_parallel_tasks,@function
halide_default_do_parallel_tasks:       # @halide_default_do_parallel_tasks
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rcx, %r15
	movl	%esi, %r14d
	movslq	%esi, %rax
	movq	%rsp, %r12
	movq	%rax, %rcx
	shlq	$7, %rcx
	subq	%rcx, %r12
	movq	%r12, %rsp
	testl	%eax, %eax
	jle	.LBB52_4
# %bb.1:                                # %for.body.preheader
	leaq	112(%r12), %rax
	xorl	%ecx, %ecx
	cmpl	$0, 40(%rdx)
	jle	.LBB52_3
	.p2align	4, 0x90
.LBB52_6:                               # %if.end
	vmovups	(%rdx), %ymm0
	vmovups	24(%rdx), %ymm1
	vmovups	%ymm1, -88(%rax)
	addq	$56, %rdx
	vmovups	%ymm0, -112(%rax)
	movq	$0, -56(%rax)
	movq	%rdi, -8(%rax)
	movq	$0, (%rax)
	movq	$0, 5(%rax)
	movq	%r15, -24(%rax)
.LBB52_7:                               # %for.inc
	incq	%rcx
	movslq	%r14d, %rsi
	subq	$-128, %rax
	cmpq	%rsi, %rcx
	jge	.LBB52_4
# %bb.2:                                # %for.body
	cmpl	$0, 40(%rdx)
	jg	.LBB52_6
.LBB52_3:                               # %if.then
	decl	%r14d
	jmp	.LBB52_7
.LBB52_4:                               # %for.cond.cleanup
	testl	%r14d, %r14d
	je	.LBB52_5
# %bb.8:                                # %if.end19
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rdi
	vzeroupper
	callq	halide_mutex_lock@PLT
	movl	%r14d, %edi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_@PLT
	testl	%r14d, %r14d
	jle	.LBB52_9
# %bb.12:                               # %for.body25.preheader
	movl	%r14d, %ebx
	xorl	%r14d, %r14d
	.p2align	4, 0x90
.LBB52_13:                              # %for.body25
                                        # =>This Inner Loop Header: Depth=1
	movq	%r12, %rdi
	callq	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE@PLT
	movl	116(%r12), %eax
	testl	%eax, %eax
	cmovnel	%eax, %r14d
	subq	$-128, %r12
	decq	%rbx
	jne	.LBB52_13
	jmp	.LBB52_10
.LBB52_5:
	xorl	%r14d, %r14d
	jmp	.LBB52_11
.LBB52_9:
	xorl	%r14d, %r14d
.LBB52_10:                              # %for.cond.cleanup24
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
.LBB52_11:                              # %cleanup
	movl	%r14d, %eax
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end52:
	.size	halide_default_do_parallel_tasks, .Lfunc_end52-halide_default_do_parallel_tasks
                                        # -- End function
	.section	.text.halide_default_semaphore_init,"ax",@progbits
	.weak	halide_default_semaphore_init # -- Begin function halide_default_semaphore_init
	.p2align	4, 0x90
	.type	halide_default_semaphore_init,@function
halide_default_semaphore_init:          # @halide_default_semaphore_init
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%esi, %eax
	movl	%esi, (%rdi)
	popq	%rbp
	retq
.Lfunc_end53:
	.size	halide_default_semaphore_init, .Lfunc_end53-halide_default_semaphore_init
                                        # -- End function
	.section	.text.halide_default_semaphore_release,"ax",@progbits
	.weak	halide_default_semaphore_release # -- Begin function halide_default_semaphore_release
	.p2align	4, 0x90
	.type	halide_default_semaphore_release,@function
halide_default_semaphore_release:       # @halide_default_semaphore_release
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movl	%esi, %r14d
	movl	%esi, %ebx
	lock		xaddl	%ebx, (%rdi)
	testl	%esi, %esi
	je	.LBB54_3
# %bb.1:                                # %entry
	testl	%ebx, %ebx
	jne	.LBB54_3
# %bb.2:                                # %if.then
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r15
	movq	%r15, %rdi
	callq	halide_mutex_lock@PLT
	leaq	40(%r15), %rdi
	callq	halide_cond_broadcast@PLT
	leaq	56(%r15), %rdi
	callq	halide_cond_broadcast@PLT
	movq	%r15, %rdi
	callq	halide_mutex_unlock@PLT
.LBB54_3:                               # %if.end
	addl	%r14d, %ebx
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end54:
	.size	halide_default_semaphore_release, .Lfunc_end54-halide_default_semaphore_release
                                        # -- End function
	.section	.text.halide_thread_pool_cleanup,"ax",@progbits
	.weak	halide_thread_pool_cleanup # -- Begin function halide_thread_pool_cleanup
	.p2align	4, 0x90
	.type	halide_thread_pool_cleanup,@function
halide_thread_pool_cleanup:             # @halide_thread_pool_cleanup
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	halide_shutdown_thread_pool@PLT # TAILCALL
.Lfunc_end55:
	.size	halide_thread_pool_cleanup, .Lfunc_end55-halide_thread_pool_cleanup
                                        # -- End function
	.section	.text.halide_shutdown_thread_pool,"ax",@progbits
	.weak	halide_shutdown_thread_pool # -- Begin function halide_shutdown_thread_pool
	.p2align	4, 0x90
	.type	halide_shutdown_thread_pool,@function
halide_shutdown_thread_pool:            # @halide_shutdown_thread_pool
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r14
	cmpb	$0, 2121(%r14)
	je	.LBB56_5
# %bb.1:                                # %if.then
	movq	%r14, %rdi
	callq	halide_mutex_lock@PLT
	movb	$1, 2120(%r14)
	leaq	56(%r14), %rdi
	callq	halide_cond_broadcast@PLT
	leaq	40(%r14), %rdi
	callq	halide_cond_broadcast@PLT
	leaq	48(%r14), %rdi
	callq	halide_cond_broadcast@PLT
	movq	%r14, %rdi
	callq	halide_mutex_unlock@PLT
	cmpl	$0, 24(%r14)
	jle	.LBB56_4
# %bb.2:                                # %for.body.preheader
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB56_3:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	72(%r14,%rbx,8), %rdi
	callq	halide_join_thread@PLT
	incq	%rbx
	movslq	24(%r14), %rax
	cmpq	%rax, %rbx
	jl	.LBB56_3
.LBB56_4:                               # %for.cond.cleanup
	addq	$12, %r14
	movl	$2116, %edx             # imm = 0x844
	movq	%r14, %rdi
	xorl	%esi, %esi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	memset@PLT              # TAILCALL
.LBB56_5:                               # %if.end
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end56:
	.size	halide_shutdown_thread_pool, .Lfunc_end56-halide_shutdown_thread_pool
                                        # -- End function
	.section	.text.halide_join_thread,"ax",@progbits
	.weak	halide_join_thread      # -- Begin function halide_join_thread
	.p2align	4, 0x90
	.type	halide_join_thread,@function
halide_join_thread:                     # @halide_join_thread
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %rbx
	movq	$0, -16(%rbp)
	movq	16(%rdi), %rdi
	leaq	-16(%rbp), %rsi
	callq	pthread_join@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end57:
	.size	halide_join_thread, .Lfunc_end57-halide_join_thread
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE: # @_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movb	$1, %al
	popq	%rbp
	retq
.Lfunc_end58:
	.size	_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end58-_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib # -- Begin function _ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib: # @_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
# %bb.0:                                # %entry
	testl	%edx, %edx
	jne	.LBB59_2
# %bb.1:                                # %if.then
	pushq	%rbp
	movq	%rsp, %rbp
	movq	32(%rdi), %rax
	movq	$0, (%rax)
	popq	%rbp
.LBB59_2:                               # %if.end
	xorl	%eax, %eax
	retq
.Lfunc_end59:
	.size	_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib, .Lfunc_end59-_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
                                        # -- End function
	.section	.text.halide_cond_signal,"ax",@progbits
	.weak	halide_cond_signal      # -- Begin function halide_cond_signal
	.p2align	4, 0x90
	.type	halide_cond_signal,@function
halide_cond_signal:                     # @halide_cond_signal
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	(%rdi), %rax
	testq	%rax, %rax
	je	.LBB60_2
# %bb.1:                                # %if.end.i
	movq	_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE@GOTPCREL(%rip), %rcx
	movq	%rcx, -48(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv@GOTPCREL(%rip), %rcx
	movq	%rcx, -40(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb@GOTPCREL(%rip), %rcx
	movq	%rcx, -24(%rbp)
	movq	%rdi, -16(%rbp)
	movq	%rax, -8(%rbp)
	movq	_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib@GOTPCREL(%rip), %rax
	movq	%rax, -32(%rbp)
	leaq	-48(%rbp), %rsi
	callq	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE@PLT
.LBB60_2:                               # %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond6signalEv.exit
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end60:
	.size	halide_cond_signal, .Lfunc_end60-halide_cond_signal
                                        # -- End function
	.section	.text.halide_set_num_threads,"ax",@progbits
	.weak	halide_set_num_threads  # -- Begin function halide_set_num_threads
	.p2align	4, 0x90
	.type	halide_set_num_threads,@function
halide_set_num_threads:                 # @halide_set_num_threads
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movl	%edi, %ebx
	testl	%edi, %edi
	js	.LBB61_1
# %bb.2:                                # %if.end
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	testl	%ebx, %ebx
	jne	.LBB61_4
# %bb.3:                                # %if.then2
	callq	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv@PLT
	movl	%eax, %ebx
	jmp	.LBB61_4
.LBB61_1:                               # %if.end.thread
	leaq	.L.str.4(%rip), %rsi
	xorl	%edi, %edi
	callq	halide_error@PLT
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
.LBB61_4:                               # %if.end3
	movq	_ZN6Halide7Runtime8Internal10work_queueE@GOTPCREL(%rip), %r14
	movl	8(%r14), %r15d
	movl	%ebx, %edi
	callq	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi@PLT
	movl	%eax, 8(%r14)
	movq	%r14, %rdi
	callq	halide_mutex_unlock@PLT
	movl	%r15d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end61:
	.size	halide_set_num_threads, .Lfunc_end61-halide_set_num_threads
                                        # -- End function
	.section	.text.halide_set_custom_do_task,"ax",@progbits
	.weak	halide_set_custom_do_task # -- Begin function halide_set_custom_do_task
	.p2align	4, 0x90
	.type	halide_set_custom_do_task,@function
halide_set_custom_do_task:              # @halide_set_custom_do_task
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal14custom_do_taskE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end62:
	.size	halide_set_custom_do_task, .Lfunc_end62-halide_set_custom_do_task
                                        # -- End function
	.section	.text.halide_set_custom_do_loop_task,"ax",@progbits
	.weak	halide_set_custom_do_loop_task # -- Begin function halide_set_custom_do_loop_task
	.p2align	4, 0x90
	.type	halide_set_custom_do_loop_task,@function
halide_set_custom_do_loop_task:         # @halide_set_custom_do_loop_task
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end63:
	.size	halide_set_custom_do_loop_task, .Lfunc_end63-halide_set_custom_do_loop_task
                                        # -- End function
	.section	.text.halide_set_custom_do_par_for,"ax",@progbits
	.weak	halide_set_custom_do_par_for # -- Begin function halide_set_custom_do_par_for
	.p2align	4, 0x90
	.type	halide_set_custom_do_par_for,@function
halide_set_custom_do_par_for:           # @halide_set_custom_do_par_for
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal17custom_do_par_forE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end64:
	.size	halide_set_custom_do_par_for, .Lfunc_end64-halide_set_custom_do_par_for
                                        # -- End function
	.section	.text.halide_set_custom_parallel_runtime,"ax",@progbits
	.weak	halide_set_custom_parallel_runtime # -- Begin function halide_set_custom_parallel_runtime
	.p2align	4, 0x90
	.type	halide_set_custom_parallel_runtime,@function
halide_set_custom_parallel_runtime:     # @halide_set_custom_parallel_runtime
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	16(%rbp), %r10
	movq	_ZN6Halide7Runtime8Internal17custom_do_par_forE@GOTPCREL(%rip), %rax
	movq	%rdi, (%rax)
	movq	_ZN6Halide7Runtime8Internal14custom_do_taskE@GOTPCREL(%rip), %rax
	movq	%rsi, (%rax)
	movq	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE@GOTPCREL(%rip), %rax
	movq	%rdx, (%rax)
	movq	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE@GOTPCREL(%rip), %rax
	movq	%rcx, (%rax)
	movq	_ZN6Halide7Runtime8Internal21custom_semaphore_initE@GOTPCREL(%rip), %rax
	movq	%r8, (%rax)
	movq	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE@GOTPCREL(%rip), %rax
	movq	%r9, (%rax)
	movq	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE@GOTPCREL(%rip), %rax
	movq	%r10, (%rax)
	popq	%rbp
	retq
.Lfunc_end65:
	.size	halide_set_custom_parallel_runtime, .Lfunc_end65-halide_set_custom_parallel_runtime
                                        # -- End function
	.section	.text.halide_do_par_for,"ax",@progbits
	.weak	halide_do_par_for       # -- Begin function halide_do_par_for
	.p2align	4, 0x90
	.type	halide_do_par_for,@function
halide_do_par_for:                      # @halide_do_par_for
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal17custom_do_par_forE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end66:
	.size	halide_do_par_for, .Lfunc_end66-halide_do_par_for
                                        # -- End function
	.section	.text.halide_do_parallel_tasks,"ax",@progbits
	.weak	halide_do_parallel_tasks # -- Begin function halide_do_parallel_tasks
	.p2align	4, 0x90
	.type	halide_do_parallel_tasks,@function
halide_do_parallel_tasks:               # @halide_do_parallel_tasks
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end67:
	.size	halide_do_parallel_tasks, .Lfunc_end67-halide_do_parallel_tasks
                                        # -- End function
	.section	.text.halide_semaphore_init,"ax",@progbits
	.weak	halide_semaphore_init   # -- Begin function halide_semaphore_init
	.p2align	4, 0x90
	.type	halide_semaphore_init,@function
halide_semaphore_init:                  # @halide_semaphore_init
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal21custom_semaphore_initE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end68:
	.size	halide_semaphore_init, .Lfunc_end68-halide_semaphore_init
                                        # -- End function
	.section	.text.halide_semaphore_release,"ax",@progbits
	.weak	halide_semaphore_release # -- Begin function halide_semaphore_release
	.p2align	4, 0x90
	.type	halide_semaphore_release,@function
halide_semaphore_release:               # @halide_semaphore_release
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end69:
	.size	halide_semaphore_release, .Lfunc_end69-halide_semaphore_release
                                        # -- End function
	.section	.text.halide_semaphore_try_acquire,"ax",@progbits
	.weak	halide_semaphore_try_acquire # -- Begin function halide_semaphore_try_acquire
	.p2align	4, 0x90
	.type	halide_semaphore_try_acquire,@function
halide_semaphore_try_acquire:           # @halide_semaphore_try_acquire
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end70:
	.size	halide_semaphore_try_acquire, .Lfunc_end70-halide_semaphore_try_acquire
                                        # -- End function
	.section	.text.halide_default_get_symbol,"ax",@progbits
	.weak	halide_default_get_symbol # -- Begin function halide_default_get_symbol
	.p2align	4, 0x90
	.type	halide_default_get_symbol,@function
halide_default_get_symbol:              # @halide_default_get_symbol
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, %rsi
	xorl	%edi, %edi
	popq	%rbp
	jmp	dlsym@PLT               # TAILCALL
.Lfunc_end71:
	.size	halide_default_get_symbol, .Lfunc_end71-halide_default_get_symbol
                                        # -- End function
	.section	.text.halide_default_load_library,"ax",@progbits
	.weak	halide_default_load_library # -- Begin function halide_default_load_library
	.p2align	4, 0x90
	.type	halide_default_load_library,@function
halide_default_load_library:            # @halide_default_load_library
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movl	$1, %esi
	callq	dlopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.LBB72_2
# %bb.1:                                # %if.then
	callq	dlerror@PLT
.LBB72_2:                               # %if.end
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end72:
	.size	halide_default_load_library, .Lfunc_end72-halide_default_load_library
                                        # -- End function
	.section	.text.halide_default_get_library_symbol,"ax",@progbits
	.weak	halide_default_get_library_symbol # -- Begin function halide_default_get_library_symbol
	.p2align	4, 0x90
	.type	halide_default_get_library_symbol,@function
halide_default_get_library_symbol:      # @halide_default_get_library_symbol
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	dlsym@PLT               # TAILCALL
.Lfunc_end73:
	.size	halide_default_get_library_symbol, .Lfunc_end73-halide_default_get_library_symbol
                                        # -- End function
	.section	.text.halide_set_custom_get_symbol,"ax",@progbits
	.weak	halide_set_custom_get_symbol # -- Begin function halide_set_custom_get_symbol
	.p2align	4, 0x90
	.type	halide_set_custom_get_symbol,@function
halide_set_custom_get_symbol:           # @halide_set_custom_get_symbol
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal17custom_get_symbolE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end74:
	.size	halide_set_custom_get_symbol, .Lfunc_end74-halide_set_custom_get_symbol
                                        # -- End function
	.section	.text.halide_set_custom_load_library,"ax",@progbits
	.weak	halide_set_custom_load_library # -- Begin function halide_set_custom_load_library
	.p2align	4, 0x90
	.type	halide_set_custom_load_library,@function
halide_set_custom_load_library:         # @halide_set_custom_load_library
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal19custom_load_libraryE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end75:
	.size	halide_set_custom_load_library, .Lfunc_end75-halide_set_custom_load_library
                                        # -- End function
	.section	.text.halide_set_custom_get_library_symbol,"ax",@progbits
	.weak	halide_set_custom_get_library_symbol # -- Begin function halide_set_custom_get_library_symbol
	.p2align	4, 0x90
	.type	halide_set_custom_get_library_symbol,@function
halide_set_custom_get_library_symbol:   # @halide_set_custom_get_library_symbol
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end76:
	.size	halide_set_custom_get_library_symbol, .Lfunc_end76-halide_set_custom_get_library_symbol
                                        # -- End function
	.section	.text.halide_get_symbol,"ax",@progbits
	.weak	halide_get_symbol       # -- Begin function halide_get_symbol
	.p2align	4, 0x90
	.type	halide_get_symbol,@function
halide_get_symbol:                      # @halide_get_symbol
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal17custom_get_symbolE@GOTPCREL(%rip), %rax
	popq	%rbp
	jmpq	*(%rax)                 # TAILCALL
.Lfunc_end77:
	.size	halide_get_symbol, .Lfunc_end77-halide_get_symbol
                                        # -- End function
	.section	.text.halide_load_library,"ax",@progbits
	.weak	halide_load_library     # -- Begin function halide_load_library
	.p2align	4, 0x90
	.type	halide_load_library,@function
halide_load_library:                    # @halide_load_library
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal19custom_load_libraryE@GOTPCREL(%rip), %rax
	popq	%rbp
	jmpq	*(%rax)                 # TAILCALL
.Lfunc_end78:
	.size	halide_load_library, .Lfunc_end78-halide_load_library
                                        # -- End function
	.section	.text.halide_get_library_symbol,"ax",@progbits
	.weak	halide_get_library_symbol # -- Begin function halide_get_library_symbol
	.p2align	4, 0x90
	.type	halide_get_library_symbol,@function
halide_get_library_symbol:              # @halide_get_library_symbol
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end79:
	.size	halide_get_library_symbol, .Lfunc_end79-halide_get_library_symbol
                                        # -- End function
	.section	.text.halide_set_gpu_device,"ax",@progbits
	.weak	halide_set_gpu_device   # -- Begin function halide_set_gpu_device
	.p2align	4, 0x90
	.type	halide_set_gpu_device,@function
halide_set_gpu_device:                  # @halide_set_gpu_device
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE@GOTPCREL(%rip), %rax
	movl	%edi, (%rax)
	movq	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE@GOTPCREL(%rip), %rax
	movb	$1, (%rax)
	popq	%rbp
	retq
.Lfunc_end80:
	.size	halide_set_gpu_device, .Lfunc_end80-halide_set_gpu_device
                                        # -- End function
	.section	.text.halide_get_gpu_device,"ax",@progbits
	.weak	halide_get_gpu_device   # -- Begin function halide_get_gpu_device
	.p2align	4, 0x90
	.type	halide_get_gpu_device,@function
halide_get_gpu_device:                  # @halide_get_gpu_device
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE@GOTPCREL(%rip), %rbx
	.p2align	4, 0x90
.LBB81_1:                               # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, %eax
	xchgl	%eax, (%rbx)
	testl	%eax, %eax
	jne	.LBB81_1
# %bb.2:                                # %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit
	movq	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE@GOTPCREL(%rip), %r14
	cmpb	$0, (%r14)
	je	.LBB81_4
# %bb.3:                                # %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit.if.end4_crit_edge
	movq	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	jmp	.LBB81_8
.LBB81_4:                               # %if.then
	leaq	.L.str.8(%rip), %rdi
	callq	getenv@PLT
	testq	%rax, %rax
	je	.LBB81_5
# %bb.6:                                # %if.then2
	movq	%rax, %rdi
	callq	atoi@PLT
	jmp	.LBB81_7
.LBB81_5:
	movl	$-1, %eax
.LBB81_7:                               # %if.end
	movq	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE@GOTPCREL(%rip), %rcx
	movl	%eax, (%rcx)
	movb	$1, (%r14)
.LBB81_8:                               # %if.end4
	movl	$0, (%rbx)
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end81:
	.size	halide_get_gpu_device, .Lfunc_end81-halide_get_gpu_device
                                        # -- End function
	.section	.text.halide_default_trace,"ax",@progbits
	.weak	halide_default_trace    # -- Begin function halide_default_trace
	.p2align	4, 0x90
	.type	halide_default_trace,@function
halide_default_trace:                   # @halide_default_trace
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$4168, %rsp             # imm = 0x1048
	movq	%rsi, %r15
	movl	$1, %r14d
	movl	$1, %r13d
	lock		xaddl	%r13d, _ZZ20halide_default_traceE3ids(%rip)
	movq	%rdi, -48(%rbp)         # 8-byte Spill
	callq	halide_get_trace_file@PLT
	movl	%eax, -56(%rbp)         # 4-byte Spill
	testl	%eax, %eax
	movq	%r15, -72(%rbp)         # 8-byte Spill
	movl	%r13d, -60(%rbp)        # 4-byte Spill
	jle	.LBB82_40
# %bb.1:                                # %if.then
	movzwl	34(%r15), %eax
	movzbl	33(%r15), %ebx
	addq	$7, %rbx
	shrq	$3, %rbx
	imulq	%rax, %rbx
	movl	48(%r15), %eax
	shll	$2, %eax
	movq	%rax, -80(%rbp)         # 8-byte Spill
	movq	(%r15), %rdi
	callq	strlen@PLT
	movq	%rax, %r12
	incl	%r12d
	movq	24(%r15), %rdi
	testq	%rdi, %rdi
	je	.LBB82_3
# %bb.2:                                # %cond.true
	callq	strlen@PLT
	movq	%rax, %r14
	incl	%r14d
.LBB82_3:                               # %cond.end
	movq	%rbx, -96(%rbp)         # 8-byte Spill
	movq	-80(%rbp), %rax         # 8-byte Reload
	addl	%ebx, %eax
	movq	%r12, -104(%rbp)        # 8-byte Spill
	addl	%r12d, %eax
	leal	(%r14,%rax), %r12d
	addl	$31, %r12d
	andl	$-4, %r12d
	movq	_ZN6Halide7Runtime8Internal19halide_trace_bufferE@GOTPCREL(%rip), %rax
	movq	(%rax), %r15
	leaq	12(%r15), %rax
	movq	%rax, -88(%rbp)         # 8-byte Spill
	cmpl	$1048577, %r12d         # imm = 0x100001
	movq	%r14, -112(%rbp)        # 8-byte Spill
	jae	.LBB82_4
# %bb.12:                               # %while.body.i.i.us.i.preheader
	movl	$1073741823, %r14d      # imm = 0x3FFFFFFF
	movl	$-2147483648, %r13d     # imm = 0x80000000
	jmp	.LBB82_13
.LBB82_20:                              # %if.end11.critedge.i.us.i
                                        #   in Loop: Header=BB82_13 Depth=1
	lock		andl	$2147483647, (%r15) # imm = 0x7FFFFFFF
	.p2align	4, 0x90
.LBB82_13:                              # %while.body.i.i.us.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB82_16 Depth 2
	movl	(%r15), %eax
	andl	%r14d, %eax
	leal	1(%rax), %ecx
                                        # kill: def $eax killed $eax killed $rax
	lock		cmpxchgl	%ecx, (%r15)
	jne	.LBB82_13
# %bb.14:                               # %if.end.i.us.i
                                        #   in Loop: Header=BB82_13 Depth=1
	movl	%r12d, %eax
	lock		xaddl	%eax, 4(%r15)
	leal	(%rax,%r12), %ecx
	cmpl	$1048577, %ecx          # imm = 0x100001
	jb	.LBB82_22
# %bb.15:                               # %while.body.us.i
                                        #   in Loop: Header=BB82_13 Depth=1
	lock		addl	%r12d, 8(%r15)
	lock		decl	(%r15)
	.p2align	4, 0x90
.LBB82_16:                              # %while.body.i.i5.us.i
                                        #   Parent Loop BB82_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lock		orl	$1073741824, (%r15) # imm = 0x40000000
	movl	$1073741824, %eax       # imm = 0x40000000
	lock		cmpxchgl	%r13d, (%r15)
	jne	.LBB82_16
# %bb.17:                               # %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.us.i
                                        #   in Loop: Header=BB82_13 Depth=1
	movl	4(%r15), %ebx
	testl	%ebx, %ebx
	je	.LBB82_20
# %bb.18:                               # %if.then.i9.us.i
                                        #   in Loop: Header=BB82_13 Depth=1
	subl	8(%r15), %ebx
	movl	%ebx, 4(%r15)
	movl	-56(%rbp), %edi         # 4-byte Reload
	movq	-88(%rbp), %rsi         # 8-byte Reload
	movq	%rbx, %rdx
	callq	write@PLT
	movq	$0, 4(%r15)
	lock		andl	$2147483647, (%r15) # imm = 0x7FFFFFFF
	cmpl	%eax, %ebx
	je	.LBB82_13
# %bb.19:                               # %if.then10.i.us.i
                                        #   in Loop: Header=BB82_13 Depth=1
	movq	-48(%rbp), %rdi         # 8-byte Reload
	leaq	.L.str.32(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	jmp	.LBB82_13
.LBB82_40:                              # %if.else
	leaq	-113(%rbp), %r12
	movb	$0, -113(%rbp)
	movzbl	33(%r15), %eax
	movl	$8, %ecx
	.p2align	4, 0x90
.LBB82_41:                              # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	%ecx, %r14d
	leal	(%r14,%r14), %ecx
	cmpl	%eax, %r14d
	jl	.LBB82_41
# %bb.42:                               # %while.end
	cmpl	$65, %r14d
	jl	.LBB82_44
# %bb.43:                               # %if.then63
	leaq	.L.str.2.11(%rip), %rsi
	movq	-48(%rbp), %rdi         # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
.LBB82_44:                              # %if.end64
	movl	36(%r15), %ecx
	leaq	.L__const.halide_default_trace.event_types(%rip), %rax
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	movq	(%rax,%rcx,8), %rdx
	leaq	-4208(%rbp), %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.20.189(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	(%r15), %rdx
	testq	%rdx, %rdx
	jne	.LBB82_46
# %bb.45:                               # %if.then.i462
	leaq	.L.str.112(%rip), %rdx
.LBB82_46:                              # %if.else.i464
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.30.144(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movslq	44(%r15), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.22.191(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	cmpw	$2, 34(%r15)
	jb	.LBB82_48
# %bb.47:                               # %if.then80
	leaq	.L.str.17(%rip), %rdx
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
.LBB82_48:                              # %if.end82
	cmpl	$0, 48(%r15)
	jle	.LBB82_56
# %bb.49:                               # %for.body.lr.ph
	xorl	%ebx, %ebx
	leaq	.L.str.55(%rip), %r13
	movq	-72(%rbp), %r15         # 8-byte Reload
	testq	%rbx, %rbx
	jne	.LBB82_51
	jmp	.LBB82_55
	.p2align	4, 0x90
.LBB82_53:                              # %if.else97.split
	movq	%r13, %rdx
.LBB82_54:                              # %if.end100.sink.split
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
.LBB82_55:                              # %if.end100
                                        # =>This Inner Loop Header: Depth=1
	movq	16(%r15), %rax
	movslq	(%rax,%rbx,4), %rdx
	movq	%r12, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	incq	%rbx
	movslq	48(%r15), %rax
	cmpq	%rax, %rbx
	jge	.LBB82_56
# %bb.50:                               # %for.body
                                        #   in Loop: Header=BB82_55 Depth=1
	testq	%rbx, %rbx
	je	.LBB82_55
.LBB82_51:                              # %if.then86
	movq	-72(%rbp), %rax         # 8-byte Reload
	movzwl	34(%rax), %ecx
	cmpl	$2, %ecx
	jb	.LBB82_53
# %bb.52:                               # %land.lhs.true
	movl	%ebx, %eax
	xorl	%edx, %edx
	divl	%ecx
	movl	%edx, %eax
	leaq	.L.str.18(%rip), %rdx
	testl	%eax, %eax
	jne	.LBB82_53
	jmp	.LBB82_54
.LBB82_56:                              # %for.cond.cleanup
	movq	-72(%rbp), %r15         # 8-byte Reload
	cmpw	$1, 34(%r15)
	leaq	.L.str.20(%rip), %rax
	leaq	.L.str.5.170(%rip), %rdx
	cmovaq	%rax, %rdx
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %r13
	cmpl	$2, -56(%rbp)           # 4-byte Folded Reload
	jge	.LBB82_69
# %bb.57:                               # %if.then115
	cmpw	$1, 34(%r15)
	leaq	.L.str.22(%rip), %rax
	leaq	.L.str.23(%rip), %rdx
	cmovaq	%rax, %rdx
	movq	%r13, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %r13
	cmpw	$0, 34(%r15)
	je	.LBB82_69
# %bb.58:                               # %for.body132.lr.ph
	xorl	%ebx, %ebx
	testq	%rbx, %rbx
	jne	.LBB82_60
	jmp	.LBB82_61
.LBB82_4:
	movl	$1073741823, %r13d      # imm = 0x3FFFFFFF
	movl	$-2147483648, %r14d     # imm = 0x80000000
	jmp	.LBB82_5
.LBB82_21:                              # %if.end11.critedge.i.i
                                        #   in Loop: Header=BB82_5 Depth=1
	lock		andl	$2147483647, (%r15) # imm = 0x7FFFFFFF
	.p2align	4, 0x90
.LBB82_5:                               # %while.body.i.i.i
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB82_8 Depth 2
	movl	(%r15), %eax
	andl	%r13d, %eax
	leal	1(%rax), %ecx
                                        # kill: def $eax killed $eax killed $rax
	lock		cmpxchgl	%ecx, (%r15)
	jne	.LBB82_5
# %bb.6:                                # %if.then.i.i
                                        #   in Loop: Header=BB82_5 Depth=1
	movq	-48(%rbp), %rdi         # 8-byte Reload
	leaq	.L.str.31(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	movl	%r12d, %eax
	lock		xaddl	%eax, 4(%r15)
	leal	(%rax,%r12), %ecx
	cmpl	$1048577, %ecx          # imm = 0x100001
	jb	.LBB82_22
# %bb.7:                                # %while.body.i
                                        #   in Loop: Header=BB82_5 Depth=1
	lock		addl	%r12d, 8(%r15)
	lock		decl	(%r15)
	.p2align	4, 0x90
.LBB82_8:                               # %while.body.i.i5.i
                                        #   Parent Loop BB82_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lock		orl	$1073741824, (%r15) # imm = 0x40000000
	movl	$1073741824, %eax       # imm = 0x40000000
	lock		cmpxchgl	%r14d, (%r15)
	jne	.LBB82_8
# %bb.9:                                # %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.i
                                        #   in Loop: Header=BB82_5 Depth=1
	movl	4(%r15), %ebx
	testl	%ebx, %ebx
	je	.LBB82_21
# %bb.10:                               # %if.then.i9.i
                                        #   in Loop: Header=BB82_5 Depth=1
	subl	8(%r15), %ebx
	movl	%ebx, 4(%r15)
	movl	-56(%rbp), %edi         # 4-byte Reload
	movq	-88(%rbp), %rsi         # 8-byte Reload
	movq	%rbx, %rdx
	callq	write@PLT
	movq	$0, 4(%r15)
	lock		andl	$2147483647, (%r15) # imm = 0x7FFFFFFF
	cmpl	%eax, %ebx
	je	.LBB82_5
# %bb.11:                               # %if.then10.i.i
                                        #   in Loop: Header=BB82_5 Depth=1
	movq	-48(%rbp), %rdi         # 8-byte Reload
	leaq	.L.str.32(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	jmp	.LBB82_5
.LBB82_22:                              # %_ZN6Halide7Runtime8Internal11TraceBuffer14acquire_packetEPvij.exit
	movl	%eax, %eax
	leaq	(%r15,%rax), %rbx
	addq	$12, %rbx
	cmpl	$4097, %r12d            # imm = 0x1001
	movl	-60(%rbp), %r13d        # 4-byte Reload
	jb	.LBB82_27
# %bb.23:                               # %if.then17
	movl	$1024, %esi             # imm = 0x400
	xorl	%edi, %edi
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB82_24
# %bb.25:                               # %if.else.i416
	movq	%rax, %r15
	leaq	1023(%rax), %r14
	movb	$0, 1023(%rax)
	movl	%r12d, %edx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	leaq	.L.str.3.215(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	subq	%r15, %rax
	leaq	1(%rax), %rdx
	xorl	%edi, %edi
	movq	%r15, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	xorl	%edi, %edi
	movq	%r15, %rsi
	callq	halide_print@PLT
	xorl	%edi, %edi
	movq	%r15, %rsi
	jmp	.LBB82_26
.LBB82_89:                              # %if.then186
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	8(%r15), %rax
	movzwl	(%rax,%rbx,2), %edx
	.p2align	4, 0x90
.LBB82_87:                              # %for.inc250
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	%r13, %rdi
	movq	%r12, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
.LBB82_103:                             # %for.inc250
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	%rax, %r13
.LBB82_104:                             # %for.inc250
                                        #   in Loop: Header=BB82_61 Depth=1
	incq	%rbx
	movzwl	34(%r15), %eax
	cmpq	%rax, %rbx
	jae	.LBB82_67
# %bb.59:                               # %for.body132
                                        #   in Loop: Header=BB82_61 Depth=1
	testq	%rbx, %rbx
	je	.LBB82_61
.LBB82_60:                              # %if.then134
	movq	%r13, %rdi
	movq	%r12, %rsi
	leaq	.L.str.55(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %r13
.LBB82_61:                              # %if.end136
                                        # =>This Inner Loop Header: Depth=1
	movzbl	32(%r15), %eax
	cmpb	$1, %al
	jg	.LBB82_78
# %bb.62:                               # %if.end136
                                        #   in Loop: Header=BB82_61 Depth=1
	testb	%al, %al
	je	.LBB82_81
# %bb.63:                               # %if.end136
                                        #   in Loop: Header=BB82_61 Depth=1
	cmpb	$1, %al
	jne	.LBB82_104
# %bb.64:                               # %if.then176
                                        #   in Loop: Header=BB82_61 Depth=1
	cmpl	$16, %r14d
	je	.LBB82_89
# %bb.65:                               # %if.then176
                                        #   in Loop: Header=BB82_61 Depth=1
	cmpl	$8, %r14d
	jne	.LBB82_90
# %bb.66:                               # %if.then178
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	8(%r15), %rax
	movzbl	(%rax,%rbx), %edx
	jmp	.LBB82_87
	.p2align	4, 0x90
.LBB82_78:                              # %if.end136
                                        #   in Loop: Header=BB82_61 Depth=1
	cmpb	$2, %al
	je	.LBB82_94
# %bb.79:                               # %if.end136
                                        #   in Loop: Header=BB82_61 Depth=1
	cmpb	$3, %al
	jne	.LBB82_104
# %bb.80:                               # %if.then241
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	8(%r15), %rax
	movq	(%rax,%rbx,8), %rdx
	movq	%r13, %rdi
	movq	%r12, %rsi
	callq	halide_pointer_to_string@PLT
	jmp	.LBB82_103
	.p2align	4, 0x90
.LBB82_81:                              # %if.then140
                                        #   in Loop: Header=BB82_61 Depth=1
	cmpl	$16, %r14d
	je	.LBB82_84
# %bb.82:                               # %if.then140
                                        #   in Loop: Header=BB82_61 Depth=1
	cmpl	$8, %r14d
	jne	.LBB82_85
# %bb.83:                               # %if.then142
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	8(%r15), %rax
	movsbq	(%rax,%rbx), %rdx
	jmp	.LBB82_87
	.p2align	4, 0x90
.LBB82_94:                              # %if.then212
                                        #   in Loop: Header=BB82_61 Depth=1
	cmpl	$15, %r14d
	jle	.LBB82_95
# %bb.97:                               # %if.end215
                                        #   in Loop: Header=BB82_61 Depth=1
	cmpl	$32, %r14d
	jne	.LBB82_99
# %bb.98:                               # %if.then217
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	8(%r15), %rax
	vmovss	(%rax,%rbx,4), %xmm0    # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	%r13, %rdi
	movq	%r12, %rsi
	xorl	%edx, %edx
	jmp	.LBB82_102
.LBB82_95:                              # %if.else222.thread
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	-48(%rbp), %rdi         # 8-byte Reload
	leaq	.L.str.24(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	movq	8(%r15), %rax
	jmp	.LBB82_96
.LBB82_90:                              # %if.else192
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	8(%r15), %rax
	cmpl	$32, %r14d
	jne	.LBB82_93
# %bb.91:                               # %if.then194
                                        #   in Loop: Header=BB82_61 Depth=1
	movl	(%rax,%rbx,4), %edx
	jmp	.LBB82_92
.LBB82_84:                              # %if.then150
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	8(%r15), %rax
	movswq	(%rax,%rbx,2), %rdx
	jmp	.LBB82_87
.LBB82_85:                              # %if.else156
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	8(%r15), %rax
	cmpl	$32, %r14d
	jne	.LBB82_88
# %bb.86:                               # %if.then158
                                        #   in Loop: Header=BB82_61 Depth=1
	movslq	(%rax,%rbx,4), %rdx
	jmp	.LBB82_87
.LBB82_99:                              # %if.else222
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	8(%r15), %rax
	cmpl	$16, %r14d
	jne	.LBB82_96
# %bb.100:                              # %if.then224
                                        #   in Loop: Header=BB82_61 Depth=1
	movzwl	(%rax,%rbx,2), %edi
	callq	halide_float16_bits_to_double@PLT
	jmp	.LBB82_101
.LBB82_96:                              # %if.else229
                                        #   in Loop: Header=BB82_61 Depth=1
	vmovsd	(%rax,%rbx,8), %xmm0    # xmm0 = mem[0],zero
.LBB82_101:                             # %for.inc250
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	%r13, %rdi
	movq	%r12, %rsi
	movl	$1, %edx
.LBB82_102:                             # %for.inc250
                                        #   in Loop: Header=BB82_61 Depth=1
	callq	halide_double_to_string@PLT
	jmp	.LBB82_103
.LBB82_93:                              # %if.else199
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	(%rax,%rbx,8), %rdx
.LBB82_92:                              # %for.inc250
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	%r13, %rdi
	movq	%r12, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	jmp	.LBB82_103
.LBB82_88:                              # %if.else163
                                        #   in Loop: Header=BB82_61 Depth=1
	movq	(%rax,%rbx,8), %rdx
	jmp	.LBB82_87
.LBB82_24:                              # %if.then.i410
	movl	%r12d, %edx
	xorl	%edi, %edi
	xorl	%esi, %esi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	leaq	.L.str.3.215(%rip), %rdx
	movq	%rax, %rdi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	xorl	%edi, %edi
	callq	halide_error@PLT
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB82_26:                              # %if.end
	callq	halide_free@PLT
.LBB82_27:                              # %if.end
	movl	%r12d, (%rbx)
	movl	%r13d, 4(%rbx)
	movq	-72(%rbp), %r14         # 8-byte Reload
	movl	32(%r14), %eax
	movl	%eax, 8(%rbx)
	vmovups	36(%r14), %xmm0
	vmovups	%xmm0, 12(%rbx)
	movq	16(%r14), %rsi
	testq	%rsi, %rsi
	je	.LBB82_29
# %bb.28:                               # %if.then28
	leaq	28(%rbx), %rdi
	movl	-80(%rbp), %edx         # 4-byte Reload
	callq	memcpy@PLT
.LBB82_29:                              # %if.end33
	movq	8(%r14), %rsi
	testq	%rsi, %rsi
	movq	-104(%rbp), %r15        # 8-byte Reload
	movq	-96(%rbp), %rdx         # 8-byte Reload
	je	.LBB82_31
# %bb.30:                               # %if.then35
	movslq	24(%rbx), %rax
	leaq	(%rbx,%rax,4), %rdi
	addq	$28, %rdi
	callq	memcpy@PLT
.LBB82_31:                              # %if.end40
	movslq	24(%rbx), %rax
	leaq	(%rbx,%rax,4), %rax
	addq	$28, %rax
	movzwl	10(%rbx), %ecx
	movzbl	9(%rbx), %edi
	addq	$7, %rdi
	shrq	$3, %rdi
	imulq	%rcx, %rdi
	addq	%rax, %rdi
	movq	(%r14), %rsi
	movl	%r15d, %edx
	callq	memcpy@PLT
	movslq	24(%rbx), %rax
	leaq	(%rbx,%rax,4), %rax
	addq	$28, %rax
	movzwl	10(%rbx), %ecx
	movzbl	9(%rbx), %edi
	addq	$7, %rdi
	shrq	$3, %rdi
	imulq	%rcx, %rdi
	addq	%rax, %rdi
	.p2align	4, 0x90
.LBB82_32:                              # %while.cond.i432
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$0, (%rdi)
	leaq	1(%rdi), %rdi
	jne	.LBB82_32
# %bb.33:                               # %_ZN21halide_trace_packet_t9trace_tagEv.exit
	movq	24(%r14), %rax
	testq	%rax, %rax
	leaq	.L.str.165(%rip), %rsi
	cmovneq	%rax, %rsi
	movl	-112(%rbp), %edx        # 4-byte Reload
	callq	memcpy@PLT
	movq	_ZN6Halide7Runtime8Internal19halide_trace_bufferE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	mfence
	lock		decl	(%rax)
	cmpl	$9, 36(%r14)
	jne	.LBB82_77
# %bb.34:                               # %if.then57
	movq	(%rcx), %rbx
	movl	$-2147483648, %ecx      # imm = 0x80000000
	.p2align	4, 0x90
.LBB82_35:                              # %while.body.i.i
                                        # =>This Inner Loop Header: Depth=1
	lock		orl	$1073741824, (%rbx) # imm = 0x40000000
	movl	$1073741824, %eax       # imm = 0x40000000
	lock		cmpxchgl	%ecx, (%rbx)
	jne	.LBB82_35
# %bb.36:                               # %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i
	movl	4(%rbx), %r14d
	testl	%r14d, %r14d
	je	.LBB82_39
# %bb.37:                               # %if.then.i437
	subl	8(%rbx), %r14d
	movl	%r14d, 4(%rbx)
	leaq	12(%rbx), %rsi
	movl	-56(%rbp), %edi         # 4-byte Reload
	movq	%r14, %rdx
	callq	write@PLT
	movq	$0, 4(%rbx)
	lock		andl	$2147483647, (%rbx) # imm = 0x7FFFFFFF
	cmpl	%eax, %r14d
	je	.LBB82_77
# %bb.38:                               # %if.then10.i
	leaq	.L.str.32(%rip), %rsi
	movq	-48(%rbp), %rdi         # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
	jmp	.LBB82_77
.LBB82_67:                              # %for.cond.cleanup131
	cmpw	$1, %ax
	jbe	.LBB82_69
# %bb.68:                               # %if.then257
	leaq	.L.str.25(%rip), %rdx
	movq	%r13, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %r13
.LBB82_69:                              # %if.end260
	movq	24(%r15), %rax
	testq	%rax, %rax
	je	.LBB82_74
# %bb.70:                               # %land.lhs.true263
	cmpb	$0, (%rax)
	je	.LBB82_74
# %bb.71:                               # %if.then266
	leaq	.L.str.26(%rip), %rdx
	movq	%r13, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	24(%r15), %rdx
	testq	%rdx, %rdx
	jne	.LBB82_73
# %bb.72:                               # %if.then.i595
	leaq	.L.str.112(%rip), %rdx
.LBB82_73:                              # %if.else.i597
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.27(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %r13
.LBB82_74:                              # %if.end271
	leaq	.L.str.3.215(%rip), %rdx
	movq	%r13, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %r15
	leaq	-4208(%rbp), %rsi
	subq	%rsi, %r15
	incq	%r15
	movq	-48(%rbp), %rdi         # 8-byte Reload
	movq	%r15, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE@GOTPCREL(%rip), %rbx
	.p2align	4, 0x90
.LBB82_75:                              # %while.cond.i619
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, %eax
	xchgl	%eax, (%rbx)
	testl	%eax, %eax
	jne	.LBB82_75
# %bb.76:                               # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy4096EED2Ev.exit
	leaq	-4208(%rbp), %r14
	movq	-48(%rbp), %r12         # 8-byte Reload
	movq	%r12, %rdi
	movq	%r14, %rsi
	callq	halide_print@PLT
	movl	$0, (%rbx)
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movl	-60(%rbp), %r13d        # 4-byte Reload
	jmp	.LBB82_77
.LBB82_39:                              # %if.end11.critedge.i
	lock		andl	$2147483647, (%rbx) # imm = 0x7FFFFFFF
.LBB82_77:                              # %if.end274
	movl	%r13d, %eax
	addq	$4168, %rsp             # imm = 0x1048
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end82:
	.size	halide_default_trace, .Lfunc_end82-halide_default_trace
                                        # -- End function
	.section	.text.halide_get_trace_file,"ax",@progbits
	.weak	halide_get_trace_file   # -- Begin function halide_get_trace_file
	.p2align	4, 0x90
	.type	halide_get_trace_file,@function
halide_get_trace_file:                  # @halide_get_trace_file
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdi, %r14
	movq	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE@GOTPCREL(%rip), %rbx
	.p2align	4, 0x90
.LBB83_1:                               # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, %eax
	xchgl	%eax, (%rbx)
	testl	%eax, %eax
	jne	.LBB83_1
# %bb.2:                                # %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit
	movq	_ZN6Halide7Runtime8Internal17halide_trace_fileE@GOTPCREL(%rip), %r12
	cmpl	$0, (%r12)
	js	.LBB83_3
.LBB83_9:                               # %if.end11
	movl	(%r12), %eax
	movl	$0, (%rbx)
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB83_3:                               # %if.then
	leaq	.L.str.28(%rip), %rdi
	callq	getenv@PLT
	testq	%rax, %rax
	je	.LBB83_8
# %bb.4:                                # %if.then1
	leaq	.L.str.29(%rip), %rsi
	movq	%rax, %rdi
	callq	fopen@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	jne	.LBB83_6
# %bb.5:                                # %if.then4
	leaq	.L.str.30(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB83_6:                               # %if.end
	movq	%r15, %rdi
	callq	fileno@PLT
	movl	%eax, %edi
	callq	halide_set_trace_file@PLT
	movq	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE@GOTPCREL(%rip), %rax
	movq	%r15, (%rax)
	movq	_ZN6Halide7Runtime8Internal19halide_trace_bufferE@GOTPCREL(%rip), %r14
	cmpq	$0, (%r14)
	jne	.LBB83_9
# %bb.7:                                # %if.then7
	movl	$1048588, %edi          # imm = 0x10000C
	callq	malloc@PLT
	movq	%rax, (%r14)
	movq	$0, 4(%rax)
	movl	$0, (%rax)
	jmp	.LBB83_9
.LBB83_8:                               # %if.else
	xorl	%edi, %edi
	callq	halide_set_trace_file@PLT
	jmp	.LBB83_9
.Lfunc_end83:
	.size	halide_get_trace_file, .Lfunc_end83-halide_get_trace_file
                                        # -- End function
	.section	.text.halide_set_trace_file,"ax",@progbits
	.weak	halide_set_trace_file   # -- Begin function halide_set_trace_file
	.p2align	4, 0x90
	.type	halide_set_trace_file,@function
halide_set_trace_file:                  # @halide_set_trace_file
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal17halide_trace_fileE@GOTPCREL(%rip), %rax
	movl	%edi, (%rax)
	popq	%rbp
	retq
.Lfunc_end84:
	.size	halide_set_trace_file, .Lfunc_end84-halide_set_trace_file
                                        # -- End function
	.section	.text.halide_trace_cleanup,"ax",@progbits
	.weak	halide_trace_cleanup    # -- Begin function halide_trace_cleanup
	.p2align	4, 0x90
	.type	halide_trace_cleanup,@function
halide_trace_cleanup:                   # @halide_trace_cleanup
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	halide_shutdown_trace@PLT # TAILCALL
.Lfunc_end85:
	.size	halide_trace_cleanup, .Lfunc_end85-halide_trace_cleanup
                                        # -- End function
	.section	.text.halide_shutdown_trace,"ax",@progbits
	.weak	halide_shutdown_trace   # -- Begin function halide_shutdown_trace
	.p2align	4, 0x90
	.type	halide_shutdown_trace,@function
halide_shutdown_trace:                  # @halide_shutdown_trace
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE@GOTPCREL(%rip), %r14
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	.LBB86_1
# %bb.2:                                # %if.then
	callq	fclose@PLT
	movl	%eax, %ebx
	movq	_ZN6Halide7Runtime8Internal17halide_trace_fileE@GOTPCREL(%rip), %rax
	movl	$0, (%rax)
	movq	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE@GOTPCREL(%rip), %rax
	movb	$0, (%rax)
	movq	$0, (%r14)
	movq	_ZN6Halide7Runtime8Internal19halide_trace_bufferE@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB86_4
# %bb.3:                                # %if.then2
	callq	free@PLT
	jmp	.LBB86_4
.LBB86_1:
	xorl	%ebx, %ebx
.LBB86_4:                               # %return
	movl	%ebx, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end86:
	.size	halide_shutdown_trace, .Lfunc_end86-halide_shutdown_trace
                                        # -- End function
	.section	.text.halide_set_custom_trace,"ax",@progbits
	.weak	halide_set_custom_trace # -- Begin function halide_set_custom_trace
	.p2align	4, 0x90
	.type	halide_set_custom_trace,@function
halide_set_custom_trace:                # @halide_set_custom_trace
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal19halide_custom_traceE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end87:
	.size	halide_set_custom_trace, .Lfunc_end87-halide_set_custom_trace
                                        # -- End function
	.section	.text.halide_trace,"ax",@progbits
	.weak	halide_trace            # -- Begin function halide_trace
	.p2align	4, 0x90
	.type	halide_trace,@function
halide_trace:                           # @halide_trace
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal19halide_custom_traceE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end88:
	.size	halide_trace, .Lfunc_end88-halide_trace
                                        # -- End function
	.section	.text.halide_trace_helper,"ax",@progbits
	.weak	halide_trace_helper     # -- Begin function halide_trace_helper
	.p2align	4, 0x90
	.type	halide_trace_helper,@function
halide_trace_helper:                    # @halide_trace_helper
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	movl	%r9d, %r13d
	movq	%rcx, %r14
	movq	%rdx, %r12
	movq	%rdi, %r15
	movslq	48(%rbp), %rbx
	movl	40(%rbp), %r9d
	movl	32(%rbp), %ecx
	movl	24(%rbp), %edx
	movl	16(%rbp), %eax
	movq	56(%rbp), %rdi
	movq	%rsi, -96(%rbp)
	movq	%r12, -88(%rbp)
	movq	%r14, -80(%rbp)
	movq	%rdi, -72(%rbp)
	movb	%r8b, -64(%rbp)
	movb	%r13b, -63(%rbp)
	movw	%ax, -62(%rbp)
	movl	%edx, -60(%rbp)
	movl	%ecx, -56(%rbp)
	movl	%r9d, -52(%rbp)
	movl	%ebx, -48(%rbp)
	leaq	-96(%rbp), %rsi
	movl	$56, %edx
	movq	%r15, %rdi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movl	%r13d, %eax
	addl	$7, %eax
	sarl	$31, %eax
	shrl	$29, %eax
	leal	(%rax,%r13), %eax
	addl	$7, %eax
	sarl	$3, %eax
	imull	16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	shlq	$2, %rbx
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	leaq	-96(%rbp), %rsi
	callq	halide_trace@PLT
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end89:
	.size	halide_trace_helper, .Lfunc_end89-halide_trace_helper
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal9ends_withEPKcS3_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_ # -- Begin function _ZN6Halide7Runtime8Internal9ends_withEPKcS3_
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_,@function
_ZN6Halide7Runtime8Internal9ends_withEPKcS3_: # @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$-2, %rcx
	.p2align	4, 0x90
.LBB90_1:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$0, 2(%rdi,%rcx)
	leaq	1(%rcx), %rcx
	jne	.LBB90_1
# %bb.2:                                # %while.cond1.preheader
	movq	$-2, %rdx
	.p2align	4, 0x90
.LBB90_3:                               # %while.cond1
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$0, 2(%rsi,%rdx)
	leaq	1(%rdx), %rdx
	jne	.LBB90_3
# %bb.4:                                # %while.cond6.preheader
	movb	$1, %al
	movb	$1, %r8b
	cmpq	$-1, %rcx
	je	.LBB90_8
# %bb.5:                                # %while.cond6.preheader
	cmpq	$-1, %rdx
	je	.LBB90_8
	.p2align	4, 0x90
.LBB90_6:                               # %if.end
                                        # =>This Inner Loop Header: Depth=1
	testq	%rdx, %rdx
	sete	%r11b
	testq	%rcx, %rcx
	sete	%r8b
	movzbl	(%rdi,%rcx), %r9d
	movzbl	(%rsi,%rdx), %r10d
	cmpb	%r10b, %r9b
	sete	%al
	orb	%r11b, %r8b
	jne	.LBB90_8
# %bb.7:                                # %if.end
                                        #   in Loop: Header=BB90_6 Depth=1
	decq	%rdx
	decq	%rcx
	cmpb	%r10b, %r9b
	je	.LBB90_6
.LBB90_8:                               # %cleanup
	andb	%r8b, %al
	popq	%rbp
	retq
.Lfunc_end90:
	.size	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_, .Lfunc_end90-_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
                                        # -- End function
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5               # -- Begin function halide_debug_to_file
.LCPI91_0:
	.long	327962                  # 0x5011a
	.long	1                       # 0x1
	.long	194                     # 0xc2
	.long	327963                  # 0x5011b
	.long	1                       # 0x1
	.long	202                     # 0xca
	.long	196892                  # 0x3011c
	.long	1                       # 0x1
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI91_1:
	.long	0                       # 0x0
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI91_2:
	.quad	17179869184             # 0x400000000
.LCPI91_3:
	.quad	25769803778             # 0x600000002
	.section	.text.halide_debug_to_file,"ax",@progbits
	.weak	halide_debug_to_file
	.p2align	4, 0x90
	.type	halide_debug_to_file,@function
halide_debug_to_file:                   # @halide_debug_to_file
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$4640, %rsp             # imm = 0x1220
	movl	%edx, %ebx
	movq	%rsi, %r13
	movq	%rdi, %r15
	cmpq	$0, 16(%rcx)
	jne	.LBB91_4
# %bb.1:                                # %_ZNK15halide_buffer_t15is_bounds_queryEv.exit
	cmpq	$0, (%rcx)
	je	.LBB91_2
.LBB91_4:                               # %if.end
	cmpl	$5, 36(%rcx)
	jl	.LBB91_6
# %bb.5:                                # %if.then1
	leaq	.L.str.1.36(%rip), %rsi
	jmp	.LBB91_3
.LBB91_6:                               # %if.end2
	movq	%r15, %rdi
	movq	%rcx, %rsi
	movq	%rcx, %r14
	callq	halide_copy_to_host@PLT
	leaq	.L.str.2.37(%rip), %rsi
	movq	%r13, %rdi
	callq	fopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB91_7
# %bb.8:                                # %if.end6
	movl	%ebx, 28(%rsp)          # 4-byte Spill
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqa	%ymm0, 96(%rsp)
	vmovdqa	%ymm0, 64(%rsp)
	movslq	36(%r14), %rax
	testq	%rax, %rax
	movq	%r14, %r8
	jle	.LBB91_9
# %bb.10:                               # %for.body.lr.ph
	movq	40(%r8), %rcx
	vmovdqu	(%rcx), %xmm0
	vmovdqa	%xmm0, 64(%rsp)
	movslq	68(%rsp), %r14
	cmpl	$1, %eax
	jle	.LBB91_11
# %bb.152:                              # %for.body.1
	vmovdqu	16(%rcx), %xmm0
	vmovdqa	%xmm0, 80(%rsp)
	movslq	84(%rsp), %rdx
	imulq	%rdx, %r14
	cmpl	$2, %eax
	je	.LBB91_11
# %bb.153:                              # %for.body.2
	vmovdqu	32(%rcx), %xmm0
	vmovdqa	%xmm0, 96(%rsp)
	movslq	100(%rsp), %rdx
	imulq	%rdx, %r14
	cmpl	$4, %eax
	jl	.LBB91_11
# %bb.154:                              # %for.body.3
	vmovdqu	48(%rcx), %xmm0
	vmovdqa	%xmm0, 112(%rsp)
	movslq	116(%rsp), %rcx
	imulq	%rcx, %r14
.LBB91_11:                              # %for.cond16.preheader
	cmpl	$3, %eax
	jle	.LBB91_12
	jmp	.LBB91_19
.LBB91_7:
	movl	$-2, %ebx
	jmp	.LBB91_150
.LBB91_2:                               # %if.then
	leaq	.L.str.35(%rip), %rsi
.LBB91_3:                               # %return
	movq	%r15, %rdi
	callq	halide_error@PLT
	movl	$-1, %ebx
	jmp	.LBB91_151
.LBB91_9:
	movl	$1, %r14d
.LBB91_12:                              # %for.body19.preheader
	movl	%eax, %esi
	negl	%esi
	movl	$3, %edx
	subq	%rax, %rdx
	movabsq	$4294967296, %rcx       # imm = 0x100000000
	andq	$3, %rsi
	je	.LBB91_16
# %bb.13:                               # %for.body19.prol.preheader
	movq	%rax, %rdi
	shlq	$4, %rdi
	addq	%rsp, %rdi
	addq	$72, %rdi
	negq	%rsi
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB91_14:                              # %for.body19.prol
                                        # =>This Inner Loop Header: Depth=1
	movq	%rcx, -8(%rdi)
	movl	$0, (%rdi)
	decq	%rbx
	addq	$16, %rdi
	cmpq	%rbx, %rsi
	jne	.LBB91_14
# %bb.15:                               # %for.body19.prol.loopexit.loopexit
	subq	%rbx, %rax
.LBB91_16:                              # %for.body19.prol.loopexit
	cmpq	$3, %rdx
	jb	.LBB91_19
# %bb.17:                               # %for.body19.preheader2
	leaq	-4(%rax), %rdx
	shlq	$4, %rax
	leaq	64(%rsp), %rsi
	addq	%rsi, %rax
	addq	$56, %rax
	.p2align	4, 0x90
.LBB91_18:                              # %for.body19
                                        # =>This Inner Loop Header: Depth=1
	movq	%rcx, -56(%rax)
	movl	$0, -48(%rax)
	movq	%rcx, -40(%rax)
	movl	$0, -32(%rax)
	movq	%rcx, -24(%rax)
	movl	$0, -16(%rax)
	movq	%rcx, -8(%rax)
	movl	$0, (%rax)
	addq	$64, %rax
	addq	$4, %rdx
	jne	.LBB91_18
.LBB91_19:                              # %for.cond.cleanup18
	movq	%r12, 40(%rsp)          # 8-byte Spill
	movq	%r8, 32(%rsp)           # 8-byte Spill
	movzbl	33(%r8), %r12d
	addq	$7, %r12
	movq	%r12, %rax
	shrq	$3, %rax
	movq	%rax, 128(%rsp)         # 8-byte Spill
	leaq	.L.str.3.38(%rip), %rsi
	movq	%r13, %rdi
	vzeroupper
	callq	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_@PLT
	testb	%al, %al
	movq	%r15, 152(%rsp)         # 8-byte Spill
	jne	.LBB91_21
# %bb.20:                               # %lor.lhs.false
	leaq	.L.str.4.39(%rip), %rsi
	movq	%r13, %rdi
	callq	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_@PLT
	testb	%al, %al
	je	.LBB91_33
.LBB91_21:                              # %if.then33
	movl	68(%rsp), %ecx
	movl	84(%rsp), %eax
	movl	116(%rsp), %r13d
	cmpl	$2, %r13d
	setb	%dl
	movl	100(%rsp), %esi
	cmpl	$5, %esi
	setl	%bl
	testb	%bl, %dl
	movq	128(%rsp), %rbx         # 8-byte Reload
	movl	$1, %r15d
	cmovel	%esi, %r15d
	cmovnel	%esi, %r13d
	movabsq	$34362509641, %rdx      # imm = 0x8002A4949
	movq	%rdx, 520(%rsp)
	movl	$16777231, 528(%rsp)    # imm = 0x100000F
	movw	$4, 532(%rsp)
	movl	$1, 534(%rsp)
	movl	%ecx, 538(%rsp)
	movabsq	$4295229697, %rcx       # imm = 0x100040101
	movq	%rcx, 542(%rsp)
	movl	%eax, 550(%rsp)
	andl	$-8, %r12d
	movabsq	$4295164162, %rcx       # imm = 0x100030102
	movq	%rcx, 554(%rsp)
	movw	%r12w, 562(%rsp)
	movabsq	$4295164163, %rcx       # imm = 0x100030103
	movq	%rcx, 566(%rsp)
	movw	$1, 574(%rsp)
	xorl	%ecx, %ecx
	cmpl	$2, %r13d
	setg	%cl
	incl	%ecx
	movabsq	$4295164166, %rdx       # imm = 0x100030106
	movq	%rdx, 578(%rsp)
	movw	%cx, 586(%rsp)
	movl	$262417, 590(%rsp)      # imm = 0x40111
	movl	%r13d, 594(%rsp)
	movabsq	$845614636073170, %rcx  # imm = 0x30115000000D2
	movq	%rcx, 598(%rsp)
	movl	$1, 606(%rsp)
	movw	%r13w, 610(%rsp)
	movabsq	$4295229718, %rcx       # imm = 0x100040116
	movq	%rcx, 614(%rsp)
	imull	%ebx, %r14d
	cmpl	$1, %r13d
	leal	210(,%r13,4), %ecx
	cmovel	%r14d, %ecx
	movl	%eax, 622(%rsp)
	movl	$262423, 626(%rsp)      # imm = 0x40117
	movl	%r13d, 630(%rsp)
	movl	%ecx, 634(%rsp)
	vmovaps	.LCPI91_0(%rip), %ymm0  # ymm0 = [327962,1,194,327963,1,202,196892,1]
	vmovups	%ymm0, 638(%rsp)
	movw	$2, 670(%rsp)
	movabsq	$4295164200, %rax       # imm = 0x100030128
	movq	%rax, 674(%rsp)
	movw	$1, 682(%rsp)
	movslq	28(%rsp), %rax          # 4-byte Folded Reload
	movq	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE@GOTPCREL(%rip), %rcx
	movzwl	(%rcx,%rax,2), %eax
	movabsq	$4295164243, %rcx       # imm = 0x100030153
	movq	%rcx, 686(%rsp)
	movw	%ax, 694(%rsp)
	movabsq	$4295262437, %rax       # imm = 0x1000480E5
	movq	%rax, 698(%rsp)
	movl	%r15d, 706(%rsp)
	vmovdqa	.LCPI91_1(%rip), %xmm0  # xmm0 = [0,1,1,1]
	vmovdqu	%xmm0, 710(%rsp)
	movl	$1, 726(%rsp)
	leaq	520(%rsp), %rdi
	movl	$210, %esi
	movl	$1, %edx
	movq	40(%rsp), %r12          # 8-byte Reload
	movq	%r12, %rcx
	vzeroupper
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB91_22
# %bb.23:                               # %if.end100
	cmpl	$2, %r13d
	jl	.LBB91_114
# %bb.24:                               # %for.body112.lr.ph
	leal	210(,%r13,8), %eax
	imull	%ebx, %r15d
	imull	68(%rsp), %r15d
	movl	%eax, 288(%rsp)
	imull	84(%rsp), %r15d
	leaq	288(%rsp), %r14
	movl	%r13d, %ebx
	.p2align	4, 0x90
.LBB91_25:                              # %for.body112
                                        # =>This Inner Loop Header: Depth=1
	movl	$4, %esi
	movl	$1, %edx
	movq	%r14, %rdi
	movq	%r12, %rcx
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB91_26
# %bb.27:                               # %if.end115
                                        #   in Loop: Header=BB91_25 Depth=1
	addl	%r15d, 288(%rsp)
	decl	%ebx
	jne	.LBB91_25
# %bb.28:                               # %for.end126
	movl	%r15d, 192(%rsp)
	testl	%r13d, %r13d
	jle	.LBB91_114
# %bb.29:
	leaq	192(%rsp), %r14
	.p2align	4, 0x90
.LBB91_31:                              # %for.body138
                                        # =>This Inner Loop Header: Depth=1
	movl	$4, %esi
	movl	$1, %edx
	movq	%r14, %rdi
	movq	%r12, %rcx
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB91_32
# %bb.30:                               # %for.cond135
                                        #   in Loop: Header=BB91_31 Depth=1
	decl	%r13d
	jne	.LBB91_31
.LBB91_114:                             # %cleanup151
	xorl	%r14d, %r14d
	movq	32(%rsp), %r11          # 8-byte Reload
.LBB91_115:                             # %if.end308
	movl	$4096, %eax             # imm = 0x1000
	xorl	%edx, %edx
	movq	128(%rsp), %rbx         # 8-byte Reload
	divl	%ebx
	xorl	%r15d, %r15d
	movl	116(%rsp), %r8d
	testl	%r8d, %r8d
	jle	.LBB91_144
# %bb.116:                              # %for.body319.lr.ph
	movl	112(%rsp), %r9d
	movl	%eax, %ecx
	imull	%ebx, %ecx
	movq	%rcx, 280(%rsp)         # 8-byte Spill
	movl	96(%rsp), %r10d
	movl	100(%rsp), %edx
	movl	80(%rsp), %r13d
	movl	84(%rsp), %esi
	movl	64(%rsp), %edi
	movl	68(%rsp), %ecx
	movq	%rdi, 264(%rsp)         # 8-byte Spill
	movq	%rcx, 272(%rsp)         # 8-byte Spill
	leal	(%rdi,%rcx), %ecx
	movl	%ecx, 148(%rsp)         # 4-byte Spill
	movl	116(%rsp), %ecx
	movl	%ecx, 140(%rsp)         # 4-byte Spill
	movq	%r13, 256(%rsp)         # 8-byte Spill
	leal	(%rsi,%r13), %ecx
	movl	%ecx, 144(%rsp)         # 4-byte Spill
	vpbroadcastq	.LCPI91_2(%rip), %ymm12 # ymm12 = [17179869184,17179869184,17179869184,17179869184]
	vpbroadcastq	.LCPI91_3(%rip), %ymm13 # ymm13 = [25769803778,25769803778,25769803778,25769803778]
	movq	%r9, %rcx
	movq	%r9, 224(%rsp)          # 8-byte Spill
	movl	%ecx, 28(%rsp)          # 4-byte Spill
	vmovdqa	%ymm12, 480(%rsp)       # 32-byte Spill
	vmovdqa	%ymm13, 448(%rsp)       # 32-byte Spill
	movl	%r14d, 52(%rsp)         # 4-byte Spill
	movl	%eax, 56(%rsp)          # 4-byte Spill
	movq	%r10, 248(%rsp)         # 8-byte Spill
	movq	%rdx, 240(%rsp)         # 8-byte Spill
	movq	%rsi, 232(%rsp)         # 8-byte Spill
.LBB91_117:                             # %for.body319
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB91_119 Depth 2
                                        #       Child Loop BB91_124 Depth 3
                                        #         Child Loop BB91_130 Depth 4
                                        #         Child Loop BB91_133 Depth 4
	testl	%edx, %edx
	jle	.LBB91_140
# %bb.118:                              # %for.body330.preheader
                                        #   in Loop: Header=BB91_117 Depth=1
	movl	%r10d, %r14d
.LBB91_119:                             # %for.body330
                                        #   Parent Loop BB91_117 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB91_124 Depth 3
                                        #         Child Loop BB91_130 Depth 4
                                        #         Child Loop BB91_133 Depth 4
	testl	%esi, %esi
	jle	.LBB91_138
# %bb.120:                              # %for.body341.preheader
                                        #   in Loop: Header=BB91_119 Depth=2
	movq	256(%rsp), %rax         # 8-byte Reload
	movl	%eax, %r13d
	movl	%r15d, %r9d
	cmpl	$0, 272(%rsp)           # 4-byte Folded Reload
	jg	.LBB91_123
.LBB91_122:                             #   in Loop: Header=BB91_119 Depth=2
	movl	%r9d, %r15d
.LBB91_137:                             # %for.inc386
                                        #   in Loop: Header=BB91_119 Depth=2
	incl	%r13d
	movl	%r15d, %r9d
	cmpl	144(%rsp), %r13d        # 4-byte Folded Reload
	jge	.LBB91_138
# %bb.121:                              # %for.body341
                                        #   in Loop: Header=BB91_119 Depth=2
	cmpl	$0, 272(%rsp)           # 4-byte Folded Reload
	jle	.LBB91_122
.LBB91_123:                             # %for.body352.preheader
                                        #   in Loop: Header=BB91_119 Depth=2
	movq	264(%rsp), %rax         # 8-byte Reload
	movl	%eax, %r12d
	jmp	.LBB91_124
	.p2align	4, 0x90
.LBB91_136:                             # %for.inc381
                                        #   in Loop: Header=BB91_124 Depth=3
	incl	%r12d
	movl	%r15d, %r9d
	cmpl	148(%rsp), %r12d        # 4-byte Folded Reload
	movq	32(%rsp), %r11          # 8-byte Reload
	vmovdqa	480(%rsp), %ymm12       # 32-byte Reload
	vmovdqa	448(%rsp), %ymm13       # 32-byte Reload
	jge	.LBB91_137
.LBB91_124:                             # %for.body352
                                        #   Parent Loop BB91_117 Depth=1
                                        #     Parent Loop BB91_119 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB91_130 Depth 4
                                        #         Child Loop BB91_133 Depth 4
	leal	1(%r9), %r15d
	movl	%r12d, 288(%rsp)
	movl	%r13d, 292(%rsp)
	movl	%r14d, 296(%rsp)
	movl	28(%rsp), %eax          # 4-byte Reload
	movl	%eax, 300(%rsp)
	movslq	36(%r11), %r10
	testq	%r10, %r10
	jle	.LBB91_125
# %bb.126:                              # %for.body.lr.ph.i
                                        #   in Loop: Header=BB91_124 Depth=3
	movq	40(%r11), %r8
	movslq	8(%r8), %rdx
	movslq	(%r8), %rsi
	movslq	%r12d, %rdi
	subq	%rsi, %rdi
	imulq	%rdx, %rdi
	cmpl	$1, %r10d
	je	.LBB91_134
# %bb.127:                              # %for.body.i.for.body.i_crit_edge.preheader
                                        #   in Loop: Header=BB91_124 Depth=3
	movslq	24(%r8), %rdx
	movslq	16(%r8), %rsi
	movslq	%r13d, %rbx
	subq	%rsi, %rbx
	imulq	%rdx, %rbx
	addq	%rbx, %rdi
	cmpl	$2, %r10d
	je	.LBB91_134
# %bb.128:                              # %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.lr.ph
                                        #   in Loop: Header=BB91_124 Depth=3
	leaq	-2(%r10), %rdx
	movl	$2, %esi
	cmpq	$9, %rdx
	jb	.LBB91_132
# %bb.129:                              # %vector.ph59
                                        #   in Loop: Header=BB91_124 Depth=3
	movl	%edx, %ebx
	andl	$7, %ebx
	testq	%rbx, %rbx
	movl	$8, %eax
	cmoveq	%rax, %rbx
	subq	%rbx, %rdx
	movq	%rdx, %rsi
	addq	$2, %rsi
	vmovq	%rdi, %xmm0
	vpxor	%xmm1, %xmm1, %xmm1
	movq	%r10, %rdi
	subq	%rbx, %rdi
	addq	$-2, %rdi
	leaq	96(%r8), %rbx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB91_130:                             # %vector.body55
                                        #   Parent Loop BB91_117 Depth=1
                                        #     Parent Loop BB91_119 Depth=2
                                        #       Parent Loop BB91_124 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	vmovdqu	296(%rsp,%rdx,4), %xmm2
	vmovdqu	312(%rsp,%rdx,4), %xmm8
	vmovdqu	-32(%rbx), %ymm4
	vpermd	%ymm4, %ymm12, %ymm5
	vmovdqu	-64(%rbx), %xmm6
	vmovdqu	-48(%rbx), %xmm7
	vpunpckldq	%xmm7, %xmm6, %xmm3 # xmm3 = xmm6[0],xmm7[0],xmm6[1],xmm7[1]
	vpblendd	$12, %xmm5, %xmm3, %xmm3 # xmm3 = xmm3[0,1],xmm5[2,3]
	vpsubd	%xmm3, %xmm2, %xmm9
	vmovdqu	16(%rbx), %xmm3
	vmovdqu	(%rbx), %xmm5
	vpunpckldq	%xmm3, %xmm5, %xmm2 # xmm2 = xmm5[0],xmm3[0],xmm5[1],xmm3[1]
	vmovdqu	32(%rbx), %ymm10
	vpermd	%ymm10, %ymm12, %ymm11
	vpblendd	$12, %xmm11, %xmm2, %xmm2 # xmm2 = xmm2[0,1],xmm11[2,3]
	vpsubd	%xmm2, %xmm8, %xmm2
	vpermd	%ymm4, %ymm13, %ymm4
	vpunpckhdq	%xmm7, %xmm6, %xmm6 # xmm6 = xmm6[2],xmm7[2],xmm6[3],xmm7[3]
	vpblendd	$12, %xmm4, %xmm6, %xmm4 # xmm4 = xmm6[0,1],xmm4[2,3]
	vpmulld	%xmm4, %xmm9, %xmm4
	vpunpckhdq	%xmm3, %xmm5, %xmm3 # xmm3 = xmm5[2],xmm3[2],xmm5[3],xmm3[3]
	vpermd	%ymm10, %ymm13, %ymm5
	vpblendd	$12, %xmm5, %xmm3, %xmm3 # xmm3 = xmm3[0,1],xmm5[2,3]
	vpmulld	%xmm3, %xmm2, %xmm2
	vpmovsxdq	%xmm4, %ymm3
	vpaddq	%ymm3, %ymm0, %ymm0
	vpmovsxdq	%xmm2, %ymm2
	vpaddq	%ymm2, %ymm1, %ymm1
	addq	$8, %rdx
	subq	$-128, %rbx
	cmpq	%rdx, %rdi
	jne	.LBB91_130
# %bb.131:                              # %middle.block56
                                        #   in Loop: Header=BB91_124 Depth=3
	vpaddq	%ymm0, %ymm1, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpshufd	$78, %xmm0, %xmm1       # xmm1 = xmm0[2,3,0,1]
	vpaddq	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, %rdi
.LBB91_132:                             # %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.preheader
                                        #   in Loop: Header=BB91_124 Depth=3
	movq	%rsi, %rdx
	shlq	$4, %rdx
	addq	%r8, %rdx
	addq	$8, %rdx
	.p2align	4, 0x90
.LBB91_133:                             # %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge
                                        #   Parent Loop BB91_117 Depth=1
                                        #     Parent Loop BB91_119 Depth=2
                                        #       Parent Loop BB91_124 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movslq	288(%rsp,%rsi,4), %rbx
	movslq	(%rdx), %rax
	movslq	-8(%rdx), %rcx
	subq	%rcx, %rbx
	imulq	%rax, %rbx
	addq	%rbx, %rdi
	incq	%rsi
	addq	$16, %rdx
	cmpq	%rsi, %r10
	jne	.LBB91_133
	jmp	.LBB91_134
	.p2align	4, 0x90
.LBB91_125:                             #   in Loop: Header=BB91_124 Depth=3
	xorl	%edi, %edi
.LBB91_134:                             # %_ZNK15halide_buffer_t10address_ofEPKi.exit
                                        #   in Loop: Header=BB91_124 Depth=3
	movzbl	33(%r11), %esi
	addq	$7, %rsi
	shrq	$3, %rsi
	imulq	%rdi, %rsi
	addq	16(%r11), %rsi
	movq	128(%rsp), %rbx         # 8-byte Reload
	imull	%ebx, %r9d
	movslq	%r9d, %rax
	leaq	(%rsp,%rax), %rdi
	addq	$520, %rdi              # imm = 0x208
	movq	%rbx, %rdx
	vzeroupper
	callq	memcpy@PLT
	cmpl	56(%rsp), %r15d         # 4-byte Folded Reload
	jne	.LBB91_136
# %bb.135:                              # %if.then368
                                        #   in Loop: Header=BB91_124 Depth=3
	movl	$1, %edx
	leaq	520(%rsp), %rdi
	movq	280(%rsp), %rsi         # 8-byte Reload
	movq	40(%rsp), %rcx          # 8-byte Reload
	callq	fwrite@PLT
	xorl	%r15d, %r15d
	testq	%rax, %rax
	jne	.LBB91_136
	jmp	.LBB91_155
.LBB91_138:                             # %for.inc391
                                        #   in Loop: Header=BB91_119 Depth=2
	incl	%r14d
	movq	248(%rsp), %r10         # 8-byte Reload
	movq	240(%rsp), %rdx         # 8-byte Reload
	leal	(%rdx,%r10), %eax
	cmpl	%eax, %r14d
	movq	40(%rsp), %r12          # 8-byte Reload
	movq	232(%rsp), %rsi         # 8-byte Reload
	jl	.LBB91_119
# %bb.139:                              #   in Loop: Header=BB91_117 Depth=1
	movl	140(%rsp), %ecx         # 4-byte Reload
	movl	%ecx, %r8d
	movl	52(%rsp), %r14d         # 4-byte Reload
.LBB91_140:                             # %for.inc396
                                        #   in Loop: Header=BB91_117 Depth=1
	movl	28(%rsp), %edi          # 4-byte Reload
	incl	%edi
	movq	224(%rsp), %rcx         # 8-byte Reload
	addl	%r8d, %ecx
	movl	%edi, 28(%rsp)          # 4-byte Spill
	cmpl	%ecx, %edi
	jl	.LBB91_117
# %bb.141:                              # %for.end400
	testl	%r15d, %r15d
	jle	.LBB91_144
# %bb.142:                              # %if.then402
	imull	%ebx, %r15d
	movslq	%r15d, %rsi
	leaq	520(%rsp), %rdi
	movl	$1, %edx
	movq	%r12, %rcx
	vzeroupper
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB91_143
.LBB91_144:                             # %if.end409
	movq	$0, 288(%rsp)
	testl	%r14d, %r14d
	je	.LBB91_149
# %bb.145:                              # %if.then411
	cmpl	$9, %r14d
	jb	.LBB91_147
# %bb.146:                              # %if.then414
	leaq	.L.str.7.42(%rip), %rsi
	movq	152(%rsp), %rdi         # 8-byte Reload
	vzeroupper
	callq	halide_error@PLT
	movl	$-15, %ebx
	jmp	.LBB91_150
.LBB91_22:
	movl	$-3, %ebx
	jmp	.LBB91_150
.LBB91_155:                             # %cleanup398
	movl	$-13, %ebx
	movq	40(%rsp), %r12          # 8-byte Reload
	jmp	.LBB91_150
.LBB91_33:                              # %if.else161
	leaq	.L.str.5.40(%rip), %rsi
	movq	%r13, %rdi
	callq	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_@PLT
	testb	%al, %al
	je	.LBB91_112
# %bb.34:                               # %for.cond164.preheader
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB91_35:                              # %for.cond164
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$0, (%r13,%rax)
	leaq	1(%rax), %rax
	jne	.LBB91_35
	.p2align	4, 0x90
.LBB91_36:                              # %for.inc173
                                        # =>This Inner Loop Header: Depth=1
	cmpb	$46, -2(%r13,%rax)
	leaq	-1(%rax), %rax
	jne	.LBB91_36
# %bb.37:                               # %for.cond176.preheader
	movl	$1, %edx
	subq	%rax, %rdx
	movl	$95, %edi
	xorl	%ebx, %ebx
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB91_38:                              # %for.cond176
                                        # =>This Inner Loop Header: Depth=1
	movq	%rcx, %r12
	movq	%rbx, %r15
	movq	%rdi, %r8
	testq	%rdx, %rdx
	je	.LBB91_40
# %bb.39:                               # %land.rhs178
                                        #   in Loop: Header=BB91_38 Depth=1
	leaq	(%r15,%r13), %rsi
	leaq	1(%r12), %rcx
	leaq	-1(%r15), %rbx
	incq	%rdx
	leaq	-1(%r8), %rdi
	cmpb	$47, -2(%rax,%rsi)
	jne	.LBB91_38
.LBB91_40:                              # %for.end186
	movq	%r15, %rcx
	negq	%rcx
	movq	%rcx, 56(%rsp)          # 8-byte Spill
	leaq	520(%rsp), %rdx
	movq	%r15, %r9
	movq	%rdx, %rdi
	subq	$1, %r9
	jb	.LBB91_48
# %bb.41:                               # %while.body.preheader
	cmpq	$-128, %r9
	jb	.LBB91_53
# %bb.42:
	leaq	520(%rsp), %rdi
	jmp	.LBB91_43
.LBB91_112:                             # %if.else285
	movl	68(%rsp), %eax
	movl	84(%rsp), %ecx
	movl	%eax, 520(%rsp)
	movl	%ecx, 524(%rsp)
	movl	100(%rsp), %eax
	movl	%eax, 528(%rsp)
	movl	116(%rsp), %eax
	movl	%eax, 532(%rsp)
	movl	28(%rsp), %eax          # 4-byte Reload
	movl	%eax, 536(%rsp)
	leaq	520(%rsp), %rdi
	movl	$20, %esi
	movl	$1, %edx
	movq	40(%rsp), %r12          # 8-byte Reload
	movq	%r12, %rcx
	callq	fwrite@PLT
	xorl	%r14d, %r14d
	testq	%rax, %rax
	movq	32(%rsp), %r11          # 8-byte Reload
	jne	.LBB91_115
# %bb.113:
	movl	$-12, %ebx
	jmp	.LBB91_150
.LBB91_26:
	movl	$-4, %ebx
	jmp	.LBB91_150
.LBB91_147:                             # %if.end415
	movl	%r14d, %esi
	leaq	288(%rsp), %rdi
	movl	$1, %edx
	movq	%r12, %rcx
	vzeroupper
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB91_148
.LBB91_149:                             # %if.end420
	xorl	%ebx, %ebx
	jmp	.LBB91_150
.LBB91_32:                              # %cleanup148
	movl	$-5, %ebx
	jmp	.LBB91_150
.LBB91_53:                              # %vector.memcheck
	leaq	(%rax,%r13), %r14
	leaq	520(%rsp), %rdi
	leaq	(%rax,%r13), %rcx
	addq	$-1, %rcx
	cmpq	%rcx, %rdi
	jae	.LBB91_55
# %bb.54:                               # %vector.memcheck
	movq	%rdi, %rcx
	subq	%r15, %rcx
	leaq	(%r15,%r14), %rsi
	addq	$-1, %rsi
	cmpq	%rcx, %rsi
	jb	.LBB91_43
.LBB91_55:                              # %vector.ph
	movabsq	$9223372036854775680, %rcx # imm = 0x7FFFFFFFFFFFFF80
	movq	56(%rsp), %r9           # 8-byte Reload
	andq	%rcx, %r9
	leaq	-128(%r9), %rsi
	movq	%rsi, %r11
	shrq	$7, %r11
	incq	%r11
	movl	%r11d, %r10d
	andl	$3, %r10d
	cmpq	$384, %rsi              # imm = 0x180
	jae	.LBB91_57
# %bb.56:
	xorl	%edi, %edi
	testq	%r10, %r10
	jne	.LBB91_60
	jmp	.LBB91_62
.LBB91_148:
	movl	$-16, %ebx
	jmp	.LBB91_150
.LBB91_57:                              # %vector.ph.new
	leaq	(%r15,%r14), %rbx
	addq	$479, %rbx              # imm = 0x1DF
	subq	%r10, %r11
	xorl	%edi, %edi
.LBB91_58:                              # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovups	-480(%rbx), %ymm0
	vmovups	-448(%rbx), %ymm1
	vmovups	-416(%rbx), %ymm2
	vmovups	-384(%rbx), %ymm3
	vmovups	%ymm0, 520(%rsp,%rdi)
	vmovups	%ymm1, 552(%rsp,%rdi)
	vmovups	%ymm2, 584(%rsp,%rdi)
	vmovups	%ymm3, 616(%rsp,%rdi)
	vmovups	-352(%rbx), %ymm0
	vmovups	-320(%rbx), %ymm1
	vmovups	-288(%rbx), %ymm2
	vmovups	-256(%rbx), %ymm3
	vmovups	%ymm0, 648(%rsp,%rdi)
	vmovups	%ymm1, 680(%rsp,%rdi)
	vmovups	%ymm2, 712(%rsp,%rdi)
	vmovups	%ymm3, 744(%rsp,%rdi)
	vmovups	-224(%rbx), %ymm0
	vmovups	-192(%rbx), %ymm1
	vmovups	-160(%rbx), %ymm2
	vmovups	-128(%rbx), %ymm3
	vmovups	%ymm0, 776(%rsp,%rdi)
	vmovups	%ymm1, 808(%rsp,%rdi)
	vmovups	%ymm2, 840(%rsp,%rdi)
	vmovups	%ymm3, 872(%rsp,%rdi)
	vmovdqu	-96(%rbx), %ymm0
	vmovdqu	-64(%rbx), %ymm1
	vmovdqu	-32(%rbx), %ymm2
	vmovdqu	(%rbx), %ymm3
	vmovdqu	%ymm0, 904(%rsp,%rdi)
	vmovdqu	%ymm1, 936(%rsp,%rdi)
	vmovdqu	%ymm2, 968(%rsp,%rdi)
	vmovdqu	%ymm3, 1000(%rsp,%rdi)
	addq	$512, %rdi              # imm = 0x200
	addq	$512, %rbx              # imm = 0x200
	addq	$-4, %r11
	jne	.LBB91_58
# %bb.59:                               # %middle.block.unr-lcssa
	testq	%r10, %r10
	je	.LBB91_62
.LBB91_60:                              # %vector.body.epil.preheader
	leaq	520(%rsp), %rsi
	leaq	(%rdi,%rsi), %r10
	addq	$96, %r10
	movq	56(%rsp), %rsi          # 8-byte Reload
                                        # kill: def $esi killed $esi killed $rsi
	andl	$384, %esi              # imm = 0x180
	addl	$-128, %esi
	shrl	$7, %esi
	incb	%sil
	movzbl	%sil, %ebx
	andl	$3, %ebx
	negq	%rbx
	addq	%rdi, %r8
	addq	%r13, %r8
	xorl	%edi, %edi
.LBB91_61:                              # %vector.body.epil
                                        # =>This Inner Loop Header: Depth=1
	leaq	(%r8,%rdi), %rsi
	vmovdqu	-96(%rax,%rsi), %ymm0
	vmovdqu	-64(%rax,%rsi), %ymm1
	vmovdqu	-32(%rax,%rsi), %ymm2
	vmovdqu	(%rax,%rsi), %ymm3
	vmovdqu	%ymm0, -96(%r10,%rdi)
	vmovdqu	%ymm1, -64(%r10,%rdi)
	vmovdqu	%ymm2, -32(%r10,%rdi)
	vmovdqu	%ymm3, (%r10,%rdi)
	subq	$-128, %rdi
	incq	%rbx
	jne	.LBB91_61
.LBB91_62:                              # %middle.block
	leaq	(%rsp,%r9), %rdi
	addq	$520, %rdi              # imm = 0x208
	cmpq	%r9, 56(%rsp)           # 8-byte Folded Reload
	je	.LBB91_47
# %bb.63:
	andq	%rcx, %r12
	leaq	(%r12,%r15), %r9
	addq	$-1, %r9
.LBB91_43:                              # %while.body.preheader82
	movq	$-2, %r8
	subq	%r9, %r8
	movl	%r9d, %esi
	andl	$7, %esi
	cmpq	$7, %rsi
	je	.LBB91_46
# %bb.44:                               # %while.body.prol.preheader
	xorq	$7, %rsi
	.p2align	4, 0x90
.LBB91_45:                              # %while.body.prol
                                        # =>This Inner Loop Header: Depth=1
	leaq	(%r9,%r13), %rcx
	incq	%r9
	movzbl	(%rax,%rcx), %ecx
	movb	%cl, (%rdi)
	incq	%rdi
	decq	%rsi
	jne	.LBB91_45
.LBB91_46:                              # %while.body.prol.loopexit
	cmpq	$7, %r8
	jb	.LBB91_47
	.p2align	4, 0x90
.LBB91_64:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	leaq	(%r9,%r13), %rcx
	movzbl	(%rax,%rcx), %ebx
	movb	%bl, (%rdi)
	movzbl	1(%rax,%rcx), %ebx
	movb	%bl, 1(%rdi)
	movzbl	2(%rax,%rcx), %ebx
	movb	%bl, 2(%rdi)
	movzbl	3(%rax,%rcx), %ebx
	movb	%bl, 3(%rdi)
	movzbl	4(%rax,%rcx), %ebx
	movb	%bl, 4(%rdi)
	movzbl	5(%rax,%rcx), %ebx
	movb	%bl, 5(%rdi)
	movzbl	6(%rax,%rcx), %ebx
	movb	%bl, 6(%rdi)
	addq	$8, %r9
	movzbl	7(%rax,%rcx), %ecx
	movb	%cl, 7(%rdi)
	addq	$8, %rdi
	cmpq	$-1, %r9
	jne	.LBB91_64
.LBB91_47:                              # %while.cond191.preheader
	leaq	776(%rsp), %rax
	cmpq	%rax, %rdi
	jae	.LBB91_49
.LBB91_48:                              # %while.body194.preheader
	subq	%rdi, %rdx
	addq	$256, %rdx              # imm = 0x100
	xorl	%esi, %esi
	vzeroupper
	callq	memset@PLT
.LBB91_49:                              # %while.end196
	vmovups	.L__const.halide_debug_to_file.header+96(%rip), %ymm0
	vmovaps	%ymm0, 384(%rsp)
	vmovups	.L__const.halide_debug_to_file.header+64(%rip), %ymm0
	vmovaps	%ymm0, 352(%rsp)
	vmovups	.L__const.halide_debug_to_file.header+32(%rip), %ymm0
	vmovaps	%ymm0, 320(%rsp)
	vmovdqu	.L__const.halide_debug_to_file.header(%rip), %ymm0
	vmovdqa	%ymm0, 288(%rsp)
	movb	$0, 416(%rsp)
	leaq	288(%rsp), %rdi
	movl	$1, %r12d
	movl	$128, %esi
	movl	$1, %edx
	movq	40(%rsp), %rcx          # 8-byte Reload
	vzeroupper
	callq	fwrite@PLT
	movq	32(%rsp), %rax          # 8-byte Reload
	movslq	36(%rax), %r10
	testq	%r10, %r10
	jle	.LBB91_50
# %bb.65:                               # %for.body.lr.ph.i.i
	movq	40(%rax), %r8
	leaq	-1(%r10), %r11
	movl	%r10d, %edx
	andl	$3, %edx
	cmpq	$3, %r11
	jae	.LBB91_80
# %bb.66:
	xorl	%edi, %edi
	xorl	%r12d, %r12d
	jmp	.LBB91_67
.LBB91_50:                              # %_ZNK15halide_buffer_t3endEv.exit.thread.i
	movb	33(%rax), %r9b
	xorl	%esi, %esi
	jmp	.LBB91_51
.LBB91_80:                              # %for.body.lr.ph.i.i.new
	leaq	56(%r8), %rcx
	movq	%r10, %r9
	subq	%rdx, %r9
	xorl	%edi, %edi
	xorl	%r12d, %r12d
	movslq	-48(%rcx), %rsi
	testq	%rsi, %rsi
	jg	.LBB91_82
	jmp	.LBB91_83
	.p2align	4, 0x90
.LBB91_89:                              # %for.inc.i.i.3
                                        #   in Loop: Header=BB91_83 Depth=1
	addq	$4, %rdi
	addq	$64, %rcx
	cmpq	%rdi, %r9
	je	.LBB91_67
# %bb.81:                               # %for.body.i.i
                                        #   in Loop: Header=BB91_83 Depth=1
	movslq	-48(%rcx), %rsi
	testq	%rsi, %rsi
	jle	.LBB91_83
.LBB91_82:                              # %if.then.i.i
	movslq	-52(%rcx), %rax
	decq	%rax
	imulq	%rsi, %rax
	addq	%rax, %r12
.LBB91_83:                              # %for.inc.i.i
                                        # =>This Inner Loop Header: Depth=1
	movslq	-32(%rcx), %rsi
	testq	%rsi, %rsi
	jle	.LBB91_85
# %bb.84:                               # %if.then.i.i.1
                                        #   in Loop: Header=BB91_83 Depth=1
	movslq	-36(%rcx), %rax
	decq	%rax
	imulq	%rsi, %rax
	addq	%rax, %r12
.LBB91_85:                              # %for.inc.i.i.1
                                        #   in Loop: Header=BB91_83 Depth=1
	movslq	-16(%rcx), %rsi
	testq	%rsi, %rsi
	jle	.LBB91_87
# %bb.86:                               # %if.then.i.i.2
                                        #   in Loop: Header=BB91_83 Depth=1
	movslq	-20(%rcx), %rax
	decq	%rax
	imulq	%rsi, %rax
	addq	%rax, %r12
.LBB91_87:                              # %for.inc.i.i.2
                                        #   in Loop: Header=BB91_83 Depth=1
	movslq	(%rcx), %rsi
	testq	%rsi, %rsi
	jle	.LBB91_89
# %bb.88:                               # %if.then.i.i.3
                                        #   in Loop: Header=BB91_83 Depth=1
	movslq	-4(%rcx), %rax
	decq	%rax
	imulq	%rsi, %rax
	addq	%rax, %r12
	jmp	.LBB91_89
.LBB91_67:                              # %for.body.lr.ph.i5.i.unr-lcssa
	testq	%rdx, %rdx
	je	.LBB91_72
# %bb.68:                               # %for.body.i.i.epil.preheader
	shlq	$4, %rdi
	leaq	(%r8,%rdi), %rax
	addq	$8, %rax
	movslq	(%rax), %rcx
	testq	%rcx, %rcx
	jg	.LBB91_70
	.p2align	4, 0x90
.LBB91_71:                              # %for.inc.i.i.epil
	addq	$16, %rax
	decq	%rdx
	je	.LBB91_72
.LBB91_69:                              # %for.body.i.i.epil
	movslq	(%rax), %rcx
	testq	%rcx, %rcx
	jle	.LBB91_71
.LBB91_70:                              # %if.then.i.i.epil
	movslq	-4(%rax), %rsi
	decq	%rsi
	imulq	%rcx, %rsi
	addq	%rsi, %r12
	addq	$16, %rax
	decq	%rdx
	jne	.LBB91_69
.LBB91_72:                              # %for.body.lr.ph.i5.i
	movq	32(%rsp), %rax          # 8-byte Reload
	movb	33(%rax), %r9b
	movl	%r10d, %edi
	andl	$3, %edi
	cmpq	$3, %r11
	jae	.LBB91_90
# %bb.73:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.LBB91_74
.LBB91_90:                              # %for.body.lr.ph.i5.i.new
	leaq	56(%r8), %rdx
	movq	%r10, %r11
	subq	%rdi, %r11
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movslq	-48(%rdx), %rax
	testq	%rax, %rax
	jns	.LBB91_93
	jmp	.LBB91_92
	.p2align	4, 0x90
.LBB91_99:                              # %for.inc.i26.i.3
	addq	$4, %rcx
	addq	$64, %rdx
	cmpq	%rcx, %r11
	je	.LBB91_74
# %bb.91:                               # %for.body.i16.i
	movslq	-48(%rdx), %rax
	testq	%rax, %rax
	js	.LBB91_92
.LBB91_93:                              # %for.inc.i26.i
	movslq	-32(%rdx), %rax
	testq	%rax, %rax
	js	.LBB91_94
.LBB91_95:                              # %for.inc.i26.i.1
	movslq	-16(%rdx), %rax
	testq	%rax, %rax
	js	.LBB91_96
.LBB91_97:                              # %for.inc.i26.i.2
	movslq	(%rdx), %rax
	testq	%rax, %rax
	jns	.LBB91_99
	jmp	.LBB91_98
.LBB91_92:                              # %if.then.i22.i
	movslq	-52(%rdx), %rbx
	decq	%rbx
	imulq	%rax, %rbx
	addq	%rbx, %rsi
	movslq	-32(%rdx), %rax
	testq	%rax, %rax
	jns	.LBB91_95
.LBB91_94:                              # %if.then.i22.i.1
	movslq	-36(%rdx), %rbx
	decq	%rbx
	imulq	%rax, %rbx
	addq	%rbx, %rsi
	movslq	-16(%rdx), %rax
	testq	%rax, %rax
	jns	.LBB91_97
.LBB91_96:                              # %if.then.i22.i.2
	movslq	-20(%rdx), %rbx
	decq	%rbx
	imulq	%rax, %rbx
	addq	%rbx, %rsi
	movslq	(%rdx), %rax
	testq	%rax, %rax
	jns	.LBB91_99
.LBB91_98:                              # %if.then.i22.i.3
	movslq	-4(%rdx), %rbx
	decq	%rbx
	imulq	%rax, %rbx
	addq	%rbx, %rsi
	jmp	.LBB91_99
.LBB91_74:                              # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa
	testq	%rdi, %rdi
	je	.LBB91_79
# %bb.75:                               # %for.body.i16.i.epil.preheader
	shlq	$4, %rcx
	leaq	(%r8,%rcx), %rax
	addq	$8, %rax
	movslq	(%rax), %rcx
	testq	%rcx, %rcx
	js	.LBB91_77
	.p2align	4, 0x90
.LBB91_78:                              # %for.inc.i26.i.epil
	addq	$16, %rax
	decq	%rdi
	je	.LBB91_79
.LBB91_76:                              # %for.body.i16.i.epil
	movslq	(%rax), %rcx
	testq	%rcx, %rcx
	jns	.LBB91_78
.LBB91_77:                              # %if.then.i22.i.epil
	movslq	-4(%rax), %rdx
	decq	%rdx
	imulq	%rcx, %rdx
	addq	%rdx, %rsi
	addq	$16, %rax
	decq	%rdi
	jne	.LBB91_76
.LBB91_79:                              # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	incq	%r12
.LBB91_51:                              # %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	subq	%rsi, %r12
	movzbl	%r9b, %r14d
	addq	$7, %r14
	shrq	$3, %r14
	imulq	%r12, %r14
	movq	%r14, %rax
	shrq	$32, %rax
	je	.LBB91_100
# %bb.52:                               # %cleanup275.thread
	leaq	.L.str.6.41(%rip), %rsi
	movq	152(%rsp), %rdi         # 8-byte Reload
	callq	halide_error@PLT
	movl	$-6, %ebx
	movq	40(%rsp), %r12          # 8-byte Reload
	jmp	.LBB91_150
.LBB91_100:                             # %if.end204
	movl	$7, %r13d
	subl	%r15d, %r13d
	andl	$-8, %r13d
	cmpl	$1, %r10d
	movl	$2, %eax
	cmovgl	%r10d, %eax
	movl	$14, 192(%rsp)
	leal	4(,%rax,4), %ebx
                                        # kill: def $eax killed $eax killed $rax
	shll	$2, %eax
	andl	$-8, %ebx
	leal	(%rbx,%r13), %ecx
	leal	(%r14,%rcx), %ecx
	addl	$40, %ecx
	movl	%ecx, 196(%rsp)
	movabsq	$34359738374, %rcx      # imm = 0x800000006
	movq	%rcx, 200(%rsp)
	movslq	28(%rsp), %r15          # 4-byte Folded Reload
	movq	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE@GOTPCREL(%rip), %rcx
	movzbl	(%rcx,%r15), %ecx
	movl	%ecx, 208(%rsp)
	movabsq	$21474836481, %rcx      # imm = 0x500000001
	movq	%rcx, 212(%rsp)
	movl	%eax, 220(%rsp)
	leaq	192(%rsp), %rdi
	movl	$32, %esi
	movl	$1, %edx
	movq	40(%rsp), %r12          # 8-byte Reload
	movq	%r12, %rcx
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB91_101
# %bb.103:                              # %if.end228
	movl	68(%rsp), %eax
	movl	84(%rsp), %ecx
	movl	%eax, 176(%rsp)
	movl	%ecx, 180(%rsp)
	movl	100(%rsp), %eax
	movl	%eax, 184(%rsp)
	movl	116(%rsp), %eax
	movl	%eax, 188(%rsp)
	movslq	%ebx, %rsi
	leaq	176(%rsp), %rdi
	movl	$1, %edx
	movq	%r12, %rcx
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB91_104
# %bb.105:                              # %if.end245
	movl	$1, 168(%rsp)
	movq	56(%rsp), %rax          # 8-byte Reload
	movl	%eax, 172(%rsp)
	leaq	168(%rsp), %rdi
	movl	$8, %esi
	movl	$1, %edx
	movq	%r12, %rcx
	callq	fwrite@PLT
	movq	%r12, %rbx
	movl	$1, %r12d
	movl	$0, 52(%rsp)            # 4-byte Folded Spill
	testq	%rax, %rax
	je	.LBB91_106
# %bb.107:                              # %if.end250
	movl	%r13d, %esi
	leaq	520(%rsp), %rdi
	movl	$1, %edx
	movq	%rbx, %rcx
	callq	fwrite@PLT
	testq	%rax, %rax
	je	.LBB91_108
# %bb.109:                              # %if.end255
	leal	-1(%r14), %eax
	notl	%eax
	andl	$7, %eax
	movl	%eax, 52(%rsp)          # 4-byte Spill
	movq	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE@GOTPCREL(%rip), %rax
	movzbl	(%rax,%r15), %eax
	movl	%eax, 160(%rsp)
	movl	%r14d, 164(%rsp)
	leaq	160(%rsp), %rdi
	movl	$8, %esi
	movl	$1, %edx
	movq	%rbx, %rcx
	callq	fwrite@PLT
	xorl	%r12d, %r12d
	testq	%rax, %rax
	sete	%r12b
	movl	$-11, %ebx
	jmp	.LBB91_110
.LBB91_101:
	movl	$-7, %ebx
	jmp	.LBB91_102
.LBB91_104:
	movl	$-8, %ebx
.LBB91_102:                             # %cleanup275
	movl	$1, %r12d
	xorl	%r14d, %r14d
	movq	32(%rsp), %r11          # 8-byte Reload
	testl	%r12d, %r12d
	movq	40(%rsp), %r12          # 8-byte Reload
	jne	.LBB91_150
	jmp	.LBB91_115
.LBB91_106:
	movl	$-9, %ebx
	jmp	.LBB91_110
.LBB91_108:
	movl	$-10, %ebx
.LBB91_110:                             # %cleanup270
	movq	32(%rsp), %r11          # 8-byte Reload
	movl	52(%rsp), %r14d         # 4-byte Reload
	testl	%r12d, %r12d
	movq	40(%rsp), %r12          # 8-byte Reload
	je	.LBB91_115
.LBB91_150:                             # %cleanup430
	movq	%r12, %rdi
	vzeroupper
	callq	fclose@PLT
.LBB91_151:                             # %return
	movl	%ebx, %eax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB91_143:
	movl	$-14, %ebx
	jmp	.LBB91_150
.Lfunc_end91:
	.size	halide_debug_to_file, .Lfunc_end91-halide_debug_to_file
                                        # -- End function
	.section	.text.halide_cache_cleanup,"ax",@progbits
	.weak	halide_cache_cleanup    # -- Begin function halide_cache_cleanup
	.p2align	4, 0x90
	.type	halide_cache_cleanup,@function
halide_cache_cleanup:                   # @halide_cache_cleanup
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	halide_memoization_cache_cleanup@PLT # TAILCALL
.Lfunc_end92:
	.size	halide_cache_cleanup, .Lfunc_end92-halide_cache_cleanup
                                        # -- End function
	.section	.text.halide_memoization_cache_cleanup,"ax",@progbits
	.weak	halide_memoization_cache_cleanup # -- Begin function halide_memoization_cache_cleanup
	.p2align	4, 0x90
	.type	halide_memoization_cache_cleanup,@function
halide_memoization_cache_cleanup:       # @halide_memoization_cache_cleanup
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	xorl	%r14d, %r14d
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %r15
	movq	(%r15,%r14,8), %rbx
	movq	$0, (%r15,%r14,8)
	testq	%rbx, %rbx
	jne	.LBB93_2
	.p2align	4, 0x90
.LBB93_3:                               # %while.end
                                        # =>This Inner Loop Header: Depth=1
	incq	%r14
	cmpq	$256, %r14              # imm = 0x100
	je	.LBB93_4
# %bb.1:                                # %for.body
                                        #   in Loop: Header=BB93_3 Depth=1
	movq	(%r15,%r14,8), %rbx
	movq	$0, (%r15,%r14,8)
	testq	%rbx, %rbx
	je	.LBB93_3
	.p2align	4, 0x90
.LBB93_2:                               # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %r12
	movq	%rbx, %rdi
	callq	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv@PLT
	xorl	%edi, %edi
	movq	%rbx, %rsi
	callq	halide_free@PLT
	movq	%r12, %rbx
	testq	%r12, %r12
	jne	.LBB93_2
	jmp	.LBB93_3
.LBB93_4:                               # %for.cond.cleanup
	movq	_ZN6Halide7Runtime8Internal18current_cache_sizeE@GOTPCREL(%rip), %rax
	movq	$0, (%rax)
	movq	_ZN6Halide7Runtime8Internal18most_recently_usedE@GOTPCREL(%rip), %rax
	movq	$0, (%rax)
	movq	_ZN6Halide7Runtime8Internal19least_recently_usedE@GOTPCREL(%rip), %rax
	movq	$0, (%rax)
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end93:
	.size	halide_memoization_cache_cleanup, .Lfunc_end93-halide_memoization_cache_cleanup
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal10CacheEntry7destroyEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv # -- Begin function _ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv,@function
_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv: # @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %r14
	cmpl	$0, 56(%rdi)
	je	.LBB94_3
# %bb.1:                                # %for.body.lr.ph
	xorl	%ebx, %ebx
	xorl	%r15d, %r15d
	.p2align	4, 0x90
.LBB94_2:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	72(%r14), %rsi
	addq	%rbx, %rsi
	xorl	%edi, %edi
	callq	halide_device_free@PLT
	movq	72(%r14), %rax
	movq	16(%rax,%rbx), %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	xorl	%edi, %edi
	movq	%rax, %rsi
	callq	halide_free@PLT
	incq	%r15
	movl	56(%r14), %eax
	addq	$56, %rbx
	cmpq	%rax, %r15
	jb	.LBB94_2
.LBB94_3:                               # %for.cond.cleanup
	movq	24(%r14), %rsi
	xorl	%edi, %edi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_free@PLT         # TAILCALL
.Lfunc_end94:
	.size	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv, .Lfunc_end94-_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh # -- Begin function _ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh,@function
_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh: # @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	-128(%rdi), %rax
	popq	%rbp
	retq
.Lfunc_end95:
	.size	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh, .Lfunc_end95-_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx # -- Begin function _ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx,@function
_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx: # @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r14
	movl	%esi, %ebx
	movq	%rdi, %r12
	testl	%esi, %esi
	js	.LBB96_5
# %bb.1:                                # %land.rhs.preheader
	movslq	%ebx, %rbx
	.p2align	4, 0x90
.LBB96_2:                               # %land.rhs
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$1, 24(%r12,%rbx,8)
	jne	.LBB96_5
# %bb.3:                                # %while.body
                                        #   in Loop: Header=BB96_2 Depth=1
	leaq	-1(%rbx), %rax
	testq	%rbx, %rbx
	movq	%rax, %rbx
	jg	.LBB96_2
# %bb.4:                                # %while.end.loopexit
	movl	%eax, %ebx
.LBB96_5:                               # %while.end
	cmpl	$-1, %ebx
	je	.LBB96_10
# %bb.6:                                # %for.cond.preheader
	movslq	%ebx, %r15
	cmpq	$0, 24(%r12,%r15,8)
	je	.LBB96_9
# %bb.7:                                # %for.body.lr.ph
	decl	%ebx
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB96_8:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	%r12, %rdi
	movl	%ebx, %esi
	movq	%r14, %rdx
	callq	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx@PLT
	movq	-48(%rbp), %rcx         # 8-byte Reload
	addq	152(%r12,%r15,8), %r14
	addq	280(%r12,%r15,8), %rcx
	incq	%r13
	cmpq	24(%r12,%r15,8), %r13
	jb	.LBB96_8
.LBB96_9:                               # %if.end
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB96_10:                              # %if.then
	addq	(%r12), %r14
	addq	8(%r12), %rcx
	movq	408(%r12), %rdx
	movq	%rcx, %rdi
	movq	%r14, %rsi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	memcpy@PLT              # TAILCALL
.Lfunc_end96:
	.size	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx, .Lfunc_end96-_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv # -- Begin function _ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv,@function
_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv: # @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	(%rdi), %rax
	cmpq	8(%rdi), %rax
	jne	.LBB97_2
# %bb.1:                                # %if.end
	popq	%rbp
	retq
.LBB97_2:                               # %if.then
	movq	16(%rdi), %rdx
	movl	$15, %esi
	xorl	%ecx, %ecx
	popq	%rbp
	jmp	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx@PLT # TAILCALL
.Lfunc_end97:
	.size	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv, .Lfunc_end97-_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function _ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
.LCPI98_0:
	.quad	1                       # 0x1
.LCPI98_1:
	.quad	25769803778             # 0x600000002
.LCPI98_2:
	.quad	17179869184             # 0x400000000
	.section	.text._ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b,@function
_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b: # @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$512, %rsp              # imm = 0x200
	movl	%edx, %eax
	shlq	$4, %rax
	movq	(%rsi,%rax), %rax
	movq	%rax, 16(%rsp)
	movl	%r8d, %eax
	shlq	$4, %rax
	movq	(%rcx,%rax), %rax
	movq	%rax, 24(%rsp)
	movzbl	33(%rsi), %r10d
	addq	$7, %r10
	shrq	$3, %r10
	movq	%r10, 424(%rsp)
	vpbroadcastq	.LCPI98_0(%rip), %ymm0 # ymm0 = [1,1,1,1]
	vmovdqu	%ymm0, 40(%rsp)
	vpxor	%xmm1, %xmm1, %xmm1
	vmovdqu	%ymm1, 168(%rsp)
	vmovdqu	%ymm1, 296(%rsp)
	movq	$1, 72(%rsp)
	vmovdqu	%ymm1, 200(%rsp)
	vmovdqu	%ymm1, 328(%rsp)
	vmovdqu	%ymm0, 80(%rsp)
	vpxor	%xmm2, %xmm2, %xmm2
	vmovdqu	%xmm2, 232(%rsp)
	movq	$0, 360(%rsp)
	movq	$1, 112(%rsp)
	vmovdqu	%ymm1, 368(%rsp)
	vmovdqu	%ymm0, 120(%rsp)
	vmovdqu	%ymm1, 248(%rsp)
	movq	%rdi, %r14
	vmovdqu	%xmm2, 400(%rsp)
	movq	$1, 152(%rsp)
	vmovdqu	%xmm2, 280(%rsp)
	movq	$1, 160(%rsp)
	movq	$0, 416(%rsp)
	movq	$0, 32(%rsp)
	movslq	36(%rsi), %r9
	movl	%r9d, %r8d
	testq	%r9, %r9
	jle	.LBB98_1
# %bb.2:                                # %for.body19.lr.ph
	movq	40(%rsi), %r13
	movq	40(%rcx), %r15
	cmpl	$16, %r9d
	ja	.LBB98_11
# %bb.3:
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	jmp	.LBB98_4
.LBB98_1:
	xorl	%ebx, %ebx
	jmp	.LBB98_7
.LBB98_11:                              # %vector.ph
	movl	%r9d, %edx
	andl	$15, %edx
	testq	%rdx, %rdx
	movl	$16, %edi
	cmovneq	%rdx, %rdi
	movq	%r9, %r12
	subq	%rdi, %r12
	vpxor	%xmm0, %xmm0, %xmm0
	movl	$192, %ebx
	vpbroadcastq	.LCPI98_1(%rip), %ymm1 # ymm1 = [25769803778,25769803778,25769803778,25769803778]
	vmovdqa	%ymm1, 448(%rsp)        # 32-byte Spill
	vpbroadcastq	.LCPI98_2(%rip), %ymm11 # ymm11 = [17179869184,17179869184,17179869184,17179869184]
	movq	%r12, %r11
	vpxor	%xmm3, %xmm3, %xmm3
	vpxor	%xmm4, %xmm4, %xmm4
	vpxor	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
.LBB98_12:                              # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu	-192(%r13,%rbx), %xmm6
	vpunpckhdq	-176(%r13,%rbx), %xmm6, %xmm6 # xmm6 = xmm6[2],mem[2],xmm6[3],mem[3]
	vmovdqu	-160(%r13,%rbx), %ymm13
	vmovdqa	448(%rsp), %ymm2        # 32-byte Reload
	vpermd	%ymm13, %ymm2, %ymm7
	vpblendd	$12, %xmm7, %xmm6, %xmm7 # xmm7 = xmm6[0,1],xmm7[2,3]
	vmovdqu	-128(%r13,%rbx), %xmm6
	vpunpckhdq	-112(%r13,%rbx), %xmm6, %xmm6 # xmm6 = xmm6[2],mem[2],xmm6[3],mem[3]
	vmovdqu	-96(%r13,%rbx), %ymm12
	vpermd	%ymm12, %ymm2, %ymm8
	vmovdqu	-64(%r13,%rbx), %xmm1
	vpunpckhdq	-48(%r13,%rbx), %xmm1, %xmm1 # xmm1 = xmm1[2],mem[2],xmm1[3],mem[3]
	vpblendd	$12, %xmm8, %xmm6, %xmm14 # xmm14 = xmm6[0,1],xmm8[2,3]
	vmovdqu	-32(%r13,%rbx), %ymm9
	vpermd	%ymm9, %ymm2, %ymm8
	vpblendd	$12, %xmm8, %xmm1, %xmm1 # xmm1 = xmm1[0,1],xmm8[2,3]
	vmovdqa	%xmm1, 432(%rsp)        # 16-byte Spill
	vmovdqu	(%r13,%rbx), %xmm1
	vpunpckhdq	16(%r13,%rbx), %xmm1, %xmm1 # xmm1 = xmm1[2],mem[2],xmm1[3],mem[3]
	vmovdqu	32(%r13,%rbx), %ymm8
	vpermd	%ymm8, %ymm2, %ymm10
	vpblendd	$12, %xmm10, %xmm1, %xmm10 # xmm10 = xmm1[0,1],xmm10[2,3]
	vmovdqu	-192(%r15,%rbx), %ymm1
	vmovdqu	-160(%r15,%rbx), %ymm15
	vpsubd	%ymm13, %ymm15, %ymm13
	vpsubd	-192(%r13,%rbx), %ymm1, %ymm1
	vextracti128	$1, %ymm1, %xmm2
	vpunpckldq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	vpermd	%ymm13, %ymm11, %ymm2
	vpblendd	$12, %xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0,1],xmm2[2,3]
	vmovdqu	-128(%r15,%rbx), %ymm2
	vpmulld	%xmm7, %xmm1, %xmm13
	vmovdqu	-96(%r15,%rbx), %ymm7
	vpsubd	%ymm12, %ymm7, %ymm7
	vpsubd	-128(%r13,%rbx), %ymm2, %ymm2
	vextracti128	$1, %ymm2, %xmm6
	vpunpckldq	%xmm6, %xmm2, %xmm2 # xmm2 = xmm2[0],xmm6[0],xmm2[1],xmm6[1]
	vpermd	%ymm7, %ymm11, %ymm6
	vpblendd	$12, %xmm6, %xmm2, %xmm2 # xmm2 = xmm2[0,1],xmm6[2,3]
	vpmulld	%xmm14, %xmm2, %xmm12
	vmovdqu	-64(%r15,%rbx), %ymm6
	vmovdqu	-32(%r15,%rbx), %ymm7
	vpsubd	-64(%r13,%rbx), %ymm6, %ymm6
	vpsubd	%ymm9, %ymm7, %ymm7
	vextracti128	$1, %ymm6, %xmm1
	vpunpckldq	%xmm1, %xmm6, %xmm1 # xmm1 = xmm6[0],xmm1[0],xmm6[1],xmm1[1]
	vpermd	%ymm7, %ymm11, %ymm6
	vpblendd	$12, %xmm6, %xmm1, %xmm1 # xmm1 = xmm1[0,1],xmm6[2,3]
	vmovdqu	(%r15,%rbx), %ymm6
	vpmulld	432(%rsp), %xmm1, %xmm1 # 16-byte Folded Reload
	vmovdqu	32(%r15,%rbx), %ymm7
	vpsubd	%ymm8, %ymm7, %ymm7
	vpsubd	(%r13,%rbx), %ymm6, %ymm6
	vextracti128	$1, %ymm6, %xmm2
	vpunpckldq	%xmm2, %xmm6, %xmm2 # xmm2 = xmm6[0],xmm2[0],xmm6[1],xmm2[1]
	vpermd	%ymm7, %ymm11, %ymm6
	vpblendd	$12, %xmm6, %xmm2, %xmm2 # xmm2 = xmm2[0,1],xmm6[2,3]
	vpmulld	%xmm10, %xmm2, %xmm2
	vpmovsxdq	%xmm13, %ymm6
	vpaddq	%ymm6, %ymm0, %ymm0
	vpmovsxdq	%xmm12, %ymm6
	vpaddq	%ymm6, %ymm3, %ymm3
	vpmovsxdq	%xmm1, %ymm1
	vpaddq	%ymm1, %ymm4, %ymm4
	vpmovsxdq	%xmm2, %ymm1
	vpaddq	%ymm1, %ymm5, %ymm5
	addq	$256, %rbx              # imm = 0x100
	addq	$-16, %r11
	jne	.LBB98_12
# %bb.13:                               # %middle.block
	vpaddq	%ymm0, %ymm3, %ymm0
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	%ymm0, %ymm5, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpshufd	$78, %xmm0, %xmm1       # xmm1 = xmm0[2,3,0,1]
	vpaddq	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, %rbx
.LBB98_4:                               # %for.body19.preheader
	movq	%r9, %rdi
	subq	%r12, %rdi
	shlq	$4, %r12
	.p2align	4, 0x90
.LBB98_5:                               # %for.body19
                                        # =>This Inner Loop Header: Depth=1
	movslq	8(%r13,%r12), %r11
	movslq	(%r15,%r12), %rax
	movslq	(%r13,%r12), %rdx
	subq	%rdx, %rax
	imulq	%r11, %rax
	addq	%rax, %rbx
	addq	$16, %r12
	decq	%rdi
	jne	.LBB98_5
# %bb.6:                                # %for.cond16.for.cond.cleanup18_crit_edge
	movq	%rbx, 32(%rsp)
.LBB98_7:                               # %for.cond.cleanup18
	movq	424(%rsp), %rax
	imulq	%rax, %rbx
	movq	%rbx, 32(%rsp)
	cmpl	36(%rcx), %r8d
	jne	.LBB98_10
# %bb.8:                                # %lor.lhs.false
	cmpl	$16, %r8d
	jg	.LBB98_10
# %bb.9:                                # %lor.lhs.false
	movzbl	33(%rcx), %edx
	addl	$7, %edx
	shrl	$3, %edx
	cmpl	%edx, %r10d
	jne	.LBB98_10
# %bb.14:                               # %if.end
	testq	%rax, %rax
	je	.LBB98_10
# %bb.15:                               # %for.cond53.preheader
	testl	%r9d, %r9d
	jle	.LBB98_26
# %bb.16:                               # %for.body57.lr.ph
	movq	40(%rcx), %r11
	movq	40(%rsi), %r9
	xorl	%eax, %eax
	movl	%r10d, %r10d
	jmp	.LBB98_17
	.p2align	4, 0x90
.LBB98_32:                              # %for.cond.cleanup91
                                        #   in Loop: Header=BB98_17 Depth=1
	movslq	4(%r11,%r12), %rcx
	movq	%rcx, 40(%rsp,%r13,8)
	movq	%rdi, 296(%rsp,%r13,8)
	movq	%r15, 168(%rsp,%r13,8)
	incq	%rax
	cmpq	%r8, %rax
	je	.LBB98_22
.LBB98_17:                              # %for.body57
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB98_20 Depth 2
                                        #     Child Loop BB98_31 Depth 2
	movq	%rax, %r12
	shlq	$4, %r12
	movslq	8(%r11,%r12), %rdi
	imulq	%r10, %rdi
	movslq	8(%r9,%r12), %r15
	movl	$0, %edx
	testq	%rax, %rax
	je	.LBB98_29
# %bb.18:                               # %for.body78.lr.ph
                                        #   in Loop: Header=BB98_17 Depth=1
	testl	%edi, %edi
	je	.LBB98_28
# %bb.19:                               # %for.body78.us.preheader
                                        #   in Loop: Header=BB98_17 Depth=1
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB98_20:                              # %for.body78.us
                                        #   Parent Loop BB98_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	%rdi, 296(%rsp,%rdx,8)
	ja	.LBB98_29
# %bb.21:                               # %for.inc86.us
                                        #   in Loop: Header=BB98_20 Depth=2
	incq	%rdx
	cmpq	%rdx, %rax
	jne	.LBB98_20
	.p2align	4, 0x90
.LBB98_29:                              # %for.end88
                                        #   in Loop: Header=BB98_17 Depth=1
	imulq	%r10, %r15
	movl	%edx, %r13d
	cmpq	%r13, %rax
	jbe	.LBB98_32
.LBB98_30:                              # %for.body92.preheader
                                        #   in Loop: Header=BB98_17 Depth=1
	movslq	%r13d, %rsi
	movq	%rax, %rbx
	.p2align	4, 0x90
.LBB98_31:                              # %for.body92
                                        #   Parent Loop BB98_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	32(%rsp,%rbx,8), %rcx
	movq	160(%rsp,%rbx,8), %rdx
	movq	%rcx, 40(%rsp,%rbx,8)
	movq	288(%rsp,%rbx,8), %rcx
	movq	%rcx, 296(%rsp,%rbx,8)
	movq	%rdx, 168(%rsp,%rbx,8)
	decq	%rbx
	cmpq	%rsi, %rbx
	jg	.LBB98_31
	jmp	.LBB98_32
	.p2align	4, 0x90
.LBB98_28:                              # %for.body78.preheader
                                        #   in Loop: Header=BB98_17 Depth=1
	movl	%eax, %edx
	imulq	%r10, %r15
	movl	%edx, %r13d
	cmpq	%r13, %rax
	jbe	.LBB98_32
	jmp	.LBB98_30
.LBB98_10:                              # %if.then
	vpxor	%xmm0, %xmm0, %xmm0
	vmovdqu	%ymm0, 384(%r14)
	vmovdqu	%ymm0, 352(%r14)
	vmovdqu	%ymm0, 320(%r14)
	vmovdqu	%ymm0, 288(%r14)
	vmovdqu	%ymm0, 256(%r14)
	vmovdqu	%ymm0, 224(%r14)
	vmovdqu	%ymm0, 192(%r14)
	vmovdqu	%ymm0, 160(%r14)
	vmovdqu	%ymm0, 128(%r14)
	vmovdqu	%ymm0, 96(%r14)
	vmovdqu	%ymm0, 64(%r14)
	vmovdqu	%ymm0, 32(%r14)
	vmovdqu	%ymm0, (%r14)
.LBB98_27:                              # %cleanup
	movq	%r14, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.LBB98_22:                              # %while.cond.preheader
	movq	424(%rsp), %rax
	cmpq	168(%rsp), %rax
	jne	.LBB98_26
# %bb.23:                               # %land.rhs.lr.ph
	movq	296(%rsp), %rcx
	.p2align	4, 0x90
.LBB98_24:                              # %land.rhs
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rcx, %rax
	jne	.LBB98_26
# %bb.25:                               # %while.body
                                        #   in Loop: Header=BB98_24 Depth=1
	movq	%rcx, %rax
	imulq	40(%rsp), %rax
	movq	%rax, 424(%rsp)
	vmovups	48(%rsp), %ymm0
	vmovups	%ymm0, 40(%rsp)
	cmpq	176(%rsp), %rax
	vmovups	176(%rsp), %ymm0
	vmovups	%ymm0, 168(%rsp)
	vmovups	304(%rsp), %ymm0
	movq	304(%rsp), %rcx
	vmovups	%ymm0, 296(%rsp)
	movq	80(%rsp), %rdx
	movq	%rdx, 72(%rsp)
	movq	208(%rsp), %rdx
	movq	%rdx, 200(%rsp)
	movq	336(%rsp), %rdx
	movq	%rdx, 328(%rsp)
	vmovups	88(%rsp), %ymm0
	vmovups	%ymm0, 80(%rsp)
	vmovups	216(%rsp), %ymm0
	vmovups	%ymm0, 208(%rsp)
	vmovups	344(%rsp), %ymm0
	vmovups	%ymm0, 336(%rsp)
	movq	120(%rsp), %rdx
	movq	%rdx, 112(%rsp)
	movq	248(%rsp), %rdx
	movq	%rdx, 240(%rsp)
	movq	376(%rsp), %rdx
	movq	%rdx, 368(%rsp)
	movq	128(%rsp), %rdx
	movq	%rdx, 120(%rsp)
	vmovups	256(%rsp), %ymm0
	vmovups	%ymm0, 248(%rsp)
	vmovups	384(%rsp), %ymm0
	vmovups	%ymm0, 376(%rsp)
	vmovdqu	136(%rsp), %ymm0
	vmovdqu	%ymm0, 128(%rsp)
	movq	288(%rsp), %rdx
	movq	%rdx, 280(%rsp)
	movq	416(%rsp), %rdx
	movq	%rdx, 408(%rsp)
	movq	$1, 160(%rsp)
	movq	$0, 288(%rsp)
	movq	$0, 416(%rsp)
	je	.LBB98_24
.LBB98_26:                              # %while.end
	leaq	16(%rsp), %rsi
	movl	$416, %edx              # imm = 0x1A0
	movq	%r14, %rdi
	vzeroupper
	callq	memcpy@PLT
	jmp	.LBB98_27
.Lfunc_end98:
	.size	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b, .Lfunc_end98-_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t # -- Begin function _ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t,@function
_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t: # @_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %rbx
	movl	$1, %edx
	movq	%rsi, %rcx
	xorl	%r8d, %r8d
	callq	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b@PLT
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end99:
	.size	_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t, .Lfunc_end99-_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t # -- Begin function _ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t,@function
_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t: # @_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %rbx
	xorl	%edx, %edx
	movq	%rsi, %rcx
	movl	$1, %r8d
	callq	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b@PLT
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end100:
	.size	_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t, .Lfunc_end100-_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m # -- Begin function _ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m,@function
_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m: # @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	callq	memcmp@PLT
	testl	%eax, %eax
	sete	%al
	popq	%rbp
	retq
.Lfunc_end101:
	.size	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m, .Lfunc_end101-_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t # -- Begin function _ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t,@function
_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t: # @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movslq	36(%rdi), %rcx
	movb	$1, %al
	testq	%rcx, %rcx
	jle	.LBB102_8
# %bb.1:                                # %for.body.lr.ph
	movq	40(%rdi), %r8
	movl	$12, %edi
	.p2align	4, 0x90
.LBB102_3:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-12(%r8,%rdi), %edx
	cmpl	-12(%rsi,%rdi), %edx
	jne	.LBB102_7
# %bb.4:                                # %land.lhs.true.i.i
                                        #   in Loop: Header=BB102_3 Depth=1
	movl	-8(%r8,%rdi), %edx
	cmpl	-8(%rsi,%rdi), %edx
	jne	.LBB102_7
# %bb.5:                                # %land.lhs.true5.i.i
                                        #   in Loop: Header=BB102_3 Depth=1
	movl	-4(%r8,%rdi), %edx
	cmpl	-4(%rsi,%rdi), %edx
	jne	.LBB102_7
# %bb.6:                                # %_ZNK18halide_dimension_tneERKS_.exit
                                        #   in Loop: Header=BB102_3 Depth=1
	movl	(%r8,%rdi), %edx
	cmpl	(%rsi,%rdi), %edx
	jne	.LBB102_7
# %bb.2:                                # %for.cond
                                        #   in Loop: Header=BB102_3 Depth=1
	addq	$16, %rdi
	decq	%rcx
	jne	.LBB102_3
.LBB102_8:                              # %cleanup
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	retq
.LBB102_7:
	xorl	%eax, %eax
                                        # kill: def $al killed $al killed $eax
	popq	%rbp
	retq
.Lfunc_end102:
	.size	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t, .Lfunc_end102-_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_ # -- Begin function _ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_,@function
_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_: # @_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%r9d, %r13d
	movq	%r8, %r14
	movq	%rsi, %r12
	movq	%rdi, %r15
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, (%rdi)
	movq	$0, 16(%rdi)
	movq	%rdx, 32(%rdi)
	movl	%ecx, 48(%rdi)
	movl	$0, 52(%rdi)
	movl	%r9d, 56(%rdi)
	movslq	36(%r8), %rax
	movl	%eax, 60(%rdi)
	movl	%r9d, %ecx
	imulq	$56, %rcx, %rbx
	incl	%r13d
	imulq	%rax, %r13
	shlq	$4, %r13
	addq	%rbx, %r13
	leaq	(%rdx,%r13), %rsi
	xorl	%edi, %edi
	callq	halide_malloc@PLT
	movq	%rax, 24(%r15)
	testq	%rax, %rax
	je	.LBB103_1
# %bb.3:                                # %if.end
	movq	%rax, 72(%r15)
	addq	%rax, %rbx
	movq	%rbx, 64(%r15)
	addq	%rax, %r13
	movq	%r13, 40(%r15)
	cmpq	$0, 32(%r15)
	je	.LBB103_7
# %bb.4:                                # %for.body.preheader
	movb	(%r12), %al
	movb	%al, (%r13)
	cmpq	$2, 32(%r15)
	jb	.LBB103_7
# %bb.5:                                # %for.body.for.body_crit_edge.preheader
	movl	$1, %eax
	.p2align	4, 0x90
.LBB103_6:                              # %for.body.for.body_crit_edge
                                        # =>This Inner Loop Header: Depth=1
	movq	40(%r15), %rcx
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rcx,%rax)
	incq	%rax
	cmpq	32(%r15), %rax
	jb	.LBB103_6
.LBB103_7:                              # %for.cond23.preheader
	cmpl	$0, 60(%r15)
	jle	.LBB103_10
# %bb.8:                                # %for.body27.lr.ph
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB103_9:                              # %for.body27
                                        # =>This Inner Loop Header: Depth=1
	movq	40(%r14), %rdx
	movq	64(%r15), %rsi
	vmovups	(%rdx,%rax), %xmm0
	vmovups	%xmm0, (%rsi,%rax)
	incq	%rcx
	movslq	60(%r15), %rdx
	addq	$16, %rax
	cmpq	%rdx, %rcx
	jl	.LBB103_9
.LBB103_10:                             # %for.cond36.preheader
	movb	$1, %al
	cmpl	$0, 56(%r15)
	je	.LBB103_2
# %bb.11:                               # %for.body40.preheader
	movq	16(%rbp), %r9
	xorl	%r8d, %r8d
	jmp	.LBB103_13
	.p2align	4, 0x90
.LBB103_12:                             # %for.cond36.loopexit
                                        #   in Loop: Header=BB103_13 Depth=1
	movl	56(%r15), %ecx
	cmpq	%rcx, %r8
	jae	.LBB103_2
.LBB103_13:                             # %for.body40
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB103_16 Depth 2
	movq	%r8, %rdx
	movq	(%r9,%r8,8), %rcx
	movq	72(%r15), %rdi
	imulq	$56, %r8, %r10
	vmovups	(%rcx), %ymm0
	vmovups	24(%rcx), %ymm1
	vmovups	%ymm1, 24(%rdi,%r10)
	vmovups	%ymm0, (%rdi,%r10)
	incq	%r8
	movl	60(%r15), %edi
	movl	%r8d, %ecx
	imull	%edi, %ecx
	shlq	$4, %rcx
	addq	64(%r15), %rcx
	movq	72(%r15), %rbx
	movq	%rcx, 40(%rbx,%r10)
	testl	%edi, %edi
	jle	.LBB103_12
# %bb.14:                               # %for.body59.preheader
                                        #   in Loop: Header=BB103_13 Depth=1
	movq	(%r9,%rdx,8), %rdi
	movq	40(%rdi), %rdi
	vmovups	(%rdi), %xmm0
	vmovups	%xmm0, (%rcx)
	cmpl	$2, 60(%r15)
	jl	.LBB103_12
# %bb.15:                               # %for.body59.for.body59_crit_edge.preheader
                                        #   in Loop: Header=BB103_13 Depth=1
	movl	$1, %edi
	movl	$16, %ecx
	.p2align	4, 0x90
.LBB103_16:                             # %for.body59.for.body59_crit_edge
                                        #   Parent Loop BB103_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	72(%r15), %rbx
	movq	40(%rbx,%r10), %rsi
	movq	(%r9,%rdx,8), %rbx
	movq	40(%rbx), %rbx
	vmovups	(%rbx,%rcx), %xmm0
	vmovups	%xmm0, (%rsi,%rcx)
	incq	%rdi
	movslq	60(%r15), %rsi
	addq	$16, %rcx
	cmpq	%rsi, %rdi
	jl	.LBB103_16
	jmp	.LBB103_12
.LBB103_1:
	xorl	%eax, %eax
.LBB103_2:                              # %cleanup
                                        # kill: def $al killed $al killed $rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end103:
	.size	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_, .Lfunc_end103-_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal8djb_hashEPKhm,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal8djb_hashEPKhm # -- Begin function _ZN6Halide7Runtime8Internal8djb_hashEPKhm
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal8djb_hashEPKhm,@function
_ZN6Halide7Runtime8Internal8djb_hashEPKhm: # @_ZN6Halide7Runtime8Internal8djb_hashEPKhm
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	testq	%rsi, %rsi
	je	.LBB104_1
# %bb.2:                                # %for.body.preheader
	leaq	-1(%rsi), %rax
	movl	%esi, %r8d
	andl	$7, %r8d
	cmpq	$7, %rax
	jae	.LBB104_8
# %bb.3:
	movl	$5381, %eax             # imm = 0x1505
	xorl	%edx, %edx
	testq	%r8, %r8
	jne	.LBB104_5
	jmp	.LBB104_7
.LBB104_1:
	movl	$5381, %eax             # imm = 0x1505
	popq	%rbp
	retq
.LBB104_8:                              # %for.body.preheader.new
	subq	%r8, %rsi
	movl	$5381, %eax             # imm = 0x1505
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB104_9:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, %ecx
	shll	$5, %ecx
	addl	%eax, %ecx
	movzbl	(%rdi,%rdx), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	shll	$5, %ecx
	addl	%eax, %ecx
	movzbl	1(%rdi,%rdx), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	shll	$5, %ecx
	addl	%eax, %ecx
	movzbl	2(%rdi,%rdx), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	shll	$5, %ecx
	addl	%eax, %ecx
	movzbl	3(%rdi,%rdx), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	shll	$5, %ecx
	addl	%eax, %ecx
	movzbl	4(%rdi,%rdx), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	shll	$5, %ecx
	addl	%eax, %ecx
	movzbl	5(%rdi,%rdx), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	shll	$5, %ecx
	addl	%eax, %ecx
	movzbl	6(%rdi,%rdx), %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	shll	$5, %ecx
	addl	%eax, %ecx
	movzbl	7(%rdi,%rdx), %eax
	addl	%ecx, %eax
	addq	$8, %rdx
	cmpq	%rdx, %rsi
	jne	.LBB104_9
# %bb.4:                                # %for.cond.cleanup.loopexit.unr-lcssa
	testq	%r8, %r8
	je	.LBB104_7
.LBB104_5:                              # %for.body.epil.preheader
	addq	%rdx, %rdi
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB104_6:                              # %for.body.epil
                                        # =>This Inner Loop Header: Depth=1
	movl	%eax, %esi
	shll	$5, %esi
	addl	%eax, %esi
	movzbl	(%rdi,%rdx), %eax
	addl	%esi, %eax
	incq	%rdx
	cmpq	%rdx, %r8
	jne	.LBB104_6
.LBB104_7:                              # %for.cond.cleanup
	popq	%rbp
	retq
.Lfunc_end104:
	.size	_ZN6Halide7Runtime8Internal8djb_hashEPKhm, .Lfunc_end104-_ZN6Halide7Runtime8Internal8djb_hashEPKhm
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal11prune_cacheEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal11prune_cacheEv # -- Begin function _ZN6Halide7Runtime8Internal11prune_cacheEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal11prune_cacheEv,@function
_ZN6Halide7Runtime8Internal11prune_cacheEv: # @_ZN6Halide7Runtime8Internal11prune_cacheEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	_ZN6Halide7Runtime8Internal19least_recently_usedE@GOTPCREL(%rip), %r12
	movq	(%r12), %rdx
	testq	%rdx, %rdx
	je	.LBB105_28
# %bb.1:                                # %entry
	movq	_ZN6Halide7Runtime8Internal18current_cache_sizeE@GOTPCREL(%rip), %r15
	movq	(%r15), %rax
	movq	_ZN6Halide7Runtime8Internal14max_cache_sizeE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	%rcx, %rax
	jle	.LBB105_28
# %bb.2:                                # %while.body.preheader
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %r13
	.p2align	4, 0x90
.LBB105_3:                              # %while.body
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB105_6 Depth 2
                                        #     Child Loop BB105_47 Depth 2
	movq	8(%rdx), %r14
	cmpl	$0, 52(%rdx)
	jne	.LBB105_26
# %bb.4:                                # %if.then
                                        #   in Loop: Header=BB105_3 Depth=1
	movzbl	48(%rdx), %ecx
	movq	(%r13,%rcx,8), %rax
	cmpq	%rdx, %rax
	je	.LBB105_5
	.p2align	4, 0x90
.LBB105_6:                              # %while.cond9
                                        #   Parent Loop BB105_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB105_8
# %bb.7:                                # %land.rhs11
                                        #   in Loop: Header=BB105_6 Depth=2
	movq	(%rbx), %rax
	cmpq	%rdx, %rax
	jne	.LBB105_6
	jmp	.LBB105_9
.LBB105_5:                              # %if.then6
                                        #   in Loop: Header=BB105_3 Depth=1
	movq	(%rdx), %rax
	movq	%rax, (%r13,%rcx,8)
	movq	_ZN6Halide7Runtime8Internal18most_recently_usedE@GOTPCREL(%rip), %rcx
	cmpq	%rdx, (%r12)
	jne	.LBB105_12
	jmp	.LBB105_11
.LBB105_8:                              # %if.then18
                                        #   in Loop: Header=BB105_3 Depth=1
	xorl	%edi, %edi
	leaq	.L.str.4.44(%rip), %rsi
	movq	%r12, %r13
	movq	%r14, %r12
	movq	%rdx, %r14
	callq	halide_print@PLT
	callq	abort@PLT
	movq	%r14, %rdx
	movq	%r12, %r14
	movq	%r13, %r12
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %r13
.LBB105_9:                              # %if.end
                                        #   in Loop: Header=BB105_3 Depth=1
	movq	(%rdx), %rax
	movq	%rax, (%rbx)
	movq	_ZN6Halide7Runtime8Internal18most_recently_usedE@GOTPCREL(%rip), %rcx
	cmpq	%rdx, (%r12)
	jne	.LBB105_12
.LBB105_11:                             # %if.then23
                                        #   in Loop: Header=BB105_3 Depth=1
	movq	%r14, (%r12)
.LBB105_12:                             # %if.end24
                                        #   in Loop: Header=BB105_3 Depth=1
	testq	%r14, %r14
	je	.LBB105_14
# %bb.13:                               # %if.then26
                                        #   in Loop: Header=BB105_3 Depth=1
	movq	16(%rdx), %rax
	movq	%rax, 16(%r14)
.LBB105_14:                             # %if.end28
                                        #   in Loop: Header=BB105_3 Depth=1
	cmpq	%rdx, (%rcx)
	je	.LBB105_16
# %bb.15:                               # %if.end28.if.end32_crit_edge
                                        #   in Loop: Header=BB105_3 Depth=1
	movq	16(%rdx), %rax
	testq	%rax, %rax
	je	.LBB105_19
.LBB105_18:                             # %if.then35
                                        #   in Loop: Header=BB105_3 Depth=1
	movq	%r14, 16(%rdx)
.LBB105_19:                             # %if.end37
                                        #   in Loop: Header=BB105_3 Depth=1
	movl	56(%rdx), %eax
	movq	%rax, -64(%rbp)         # 8-byte Spill
	testq	%rax, %rax
	je	.LBB105_25
# %bb.20:                               # %for.body.lr.ph
                                        #   in Loop: Header=BB105_3 Depth=1
	movq	%r14, -48(%rbp)         # 8-byte Spill
	movq	%rdx, -56(%rbp)         # 8-byte Spill
	movq	72(%rdx), %r10
	movq	(%r15), %r13
	xorl	%r8d, %r8d
	imulq	$56, %r8, %r15
	movslq	36(%r10,%r15), %r14
	testq	%r14, %r14
	jg	.LBB105_29
	jmp	.LBB105_22
	.p2align	4, 0x90
.LBB105_43:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
                                        #   in Loop: Header=BB105_3 Depth=1
	incq	%rdi
.LBB105_23:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit
                                        #   in Loop: Header=BB105_3 Depth=1
	subq	%rdx, %rdi
	movzbl	%r15b, %eax
	addq	$7, %rax
	shrq	$3, %rax
	imulq	%rdi, %rax
	subq	%rax, %r13
	incq	%r8
	cmpq	-64(%rbp), %r8          # 8-byte Folded Reload
	je	.LBB105_24
# %bb.21:                               # %for.body
                                        #   in Loop: Header=BB105_3 Depth=1
	imulq	$56, %r8, %r15
	movslq	36(%r10,%r15), %r14
	testq	%r14, %r14
	jle	.LBB105_22
.LBB105_29:                             # %for.body.lr.ph.i.i
                                        #   in Loop: Header=BB105_3 Depth=1
	movq	40(%r10,%r15), %r9
	leaq	-1(%r14), %r11
	movl	%r14d, %r12d
	andl	$3, %r12d
	cmpq	$3, %r11
	jae	.LBB105_44
# %bb.30:                               #   in Loop: Header=BB105_3 Depth=1
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	jmp	.LBB105_31
	.p2align	4, 0x90
.LBB105_22:                             # %_ZNK15halide_buffer_t3endEv.exit.thread.i
                                        #   in Loop: Header=BB105_3 Depth=1
	movb	33(%r10,%r15), %r15b
	movl	$1, %edi
	xorl	%edx, %edx
	jmp	.LBB105_23
	.p2align	4, 0x90
.LBB105_44:                             # %for.body.lr.ph.i.i.new
                                        #   in Loop: Header=BB105_3 Depth=1
	leaq	56(%r9), %rcx
	movq	%r14, %rdx
	subq	%r12, %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	movslq	-48(%rcx), %rsi
	testq	%rsi, %rsi
	jg	.LBB105_46
	jmp	.LBB105_47
	.p2align	4, 0x90
.LBB105_53:                             # %for.inc.i.i.3
                                        #   in Loop: Header=BB105_47 Depth=2
	addq	$4, %rbx
	addq	$64, %rcx
	cmpq	%rbx, %rdx
	je	.LBB105_31
# %bb.45:                               # %for.body.i.i
                                        #   in Loop: Header=BB105_47 Depth=2
	movslq	-48(%rcx), %rsi
	testq	%rsi, %rsi
	jle	.LBB105_47
.LBB105_46:                             # %if.then.i.i
                                        #   in Loop: Header=BB105_3 Depth=1
	movslq	-52(%rcx), %rax
	decq	%rax
	imulq	%rsi, %rax
	addq	%rax, %rdi
.LBB105_47:                             # %for.inc.i.i
                                        #   Parent Loop BB105_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	-32(%rcx), %rsi
	testq	%rsi, %rsi
	jle	.LBB105_49
# %bb.48:                               # %if.then.i.i.1
                                        #   in Loop: Header=BB105_47 Depth=2
	movslq	-36(%rcx), %rax
	decq	%rax
	imulq	%rsi, %rax
	addq	%rax, %rdi
.LBB105_49:                             # %for.inc.i.i.1
                                        #   in Loop: Header=BB105_47 Depth=2
	movslq	-16(%rcx), %rax
	testq	%rax, %rax
	jle	.LBB105_51
# %bb.50:                               # %if.then.i.i.2
                                        #   in Loop: Header=BB105_47 Depth=2
	movslq	-20(%rcx), %rsi
	decq	%rsi
	imulq	%rax, %rsi
	addq	%rsi, %rdi
.LBB105_51:                             # %for.inc.i.i.2
                                        #   in Loop: Header=BB105_47 Depth=2
	movslq	(%rcx), %rax
	testq	%rax, %rax
	jle	.LBB105_53
# %bb.52:                               # %if.then.i.i.3
                                        #   in Loop: Header=BB105_47 Depth=2
	movslq	-4(%rcx), %rsi
	decq	%rsi
	imulq	%rax, %rsi
	addq	%rsi, %rdi
	jmp	.LBB105_53
	.p2align	4, 0x90
.LBB105_31:                             # %for.body.lr.ph.i5.i.unr-lcssa
                                        #   in Loop: Header=BB105_3 Depth=1
	testq	%r12, %r12
	je	.LBB105_36
# %bb.32:                               # %for.body.i.i.epil.preheader
                                        #   in Loop: Header=BB105_3 Depth=1
	shlq	$4, %rbx
	leaq	(%r9,%rbx), %rcx
	addq	$8, %rcx
	movq	%r12, %rdx
	shlq	$4, %rdx
	xorl	%esi, %esi
	movslq	(%rcx,%rsi), %rbx
	testq	%rbx, %rbx
	jg	.LBB105_34
	.p2align	4, 0x90
.LBB105_35:                             # %for.inc.i.i.epil
                                        #   in Loop: Header=BB105_3 Depth=1
	addq	$16, %rsi
	cmpq	%rsi, %rdx
	je	.LBB105_36
.LBB105_33:                             # %for.body.i.i.epil
                                        #   in Loop: Header=BB105_3 Depth=1
	movslq	(%rcx,%rsi), %rbx
	testq	%rbx, %rbx
	jle	.LBB105_35
.LBB105_34:                             # %if.then.i.i.epil
                                        #   in Loop: Header=BB105_3 Depth=1
	movslq	-4(%rcx,%rsi), %rax
	decq	%rax
	imulq	%rbx, %rax
	addq	%rax, %rdi
	addq	$16, %rsi
	cmpq	%rsi, %rdx
	jne	.LBB105_33
.LBB105_36:                             # %for.body.lr.ph.i5.i
                                        #   in Loop: Header=BB105_3 Depth=1
	movb	33(%r10,%r15), %r15b
	cmpq	$3, %r11
	jae	.LBB105_54
# %bb.37:                               #   in Loop: Header=BB105_3 Depth=1
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	jmp	.LBB105_38
	.p2align	4, 0x90
.LBB105_54:                             # %for.body.lr.ph.i5.i.new
                                        #   in Loop: Header=BB105_3 Depth=1
	leaq	56(%r9), %rcx
	movq	%r14, %r11
	subq	%r12, %r11
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	movslq	-48(%rcx), %rax
	testq	%rax, %rax
	jns	.LBB105_57
	jmp	.LBB105_56
	.p2align	4, 0x90
.LBB105_63:                             # %for.inc.i26.i.3
                                        #   in Loop: Header=BB105_3 Depth=1
	addq	$4, %rbx
	addq	$64, %rcx
	cmpq	%rbx, %r11
	je	.LBB105_38
# %bb.55:                               # %for.body.i16.i
                                        #   in Loop: Header=BB105_3 Depth=1
	movslq	-48(%rcx), %rax
	testq	%rax, %rax
	js	.LBB105_56
.LBB105_57:                             # %for.inc.i26.i
                                        #   in Loop: Header=BB105_3 Depth=1
	movslq	-32(%rcx), %rax
	testq	%rax, %rax
	js	.LBB105_58
.LBB105_59:                             # %for.inc.i26.i.1
                                        #   in Loop: Header=BB105_3 Depth=1
	movslq	-16(%rcx), %rax
	testq	%rax, %rax
	js	.LBB105_60
.LBB105_61:                             # %for.inc.i26.i.2
                                        #   in Loop: Header=BB105_3 Depth=1
	movslq	(%rcx), %rax
	testq	%rax, %rax
	jns	.LBB105_63
	jmp	.LBB105_62
	.p2align	4, 0x90
.LBB105_56:                             # %if.then.i22.i
                                        #   in Loop: Header=BB105_3 Depth=1
	movslq	-52(%rcx), %rsi
	decq	%rsi
	imulq	%rax, %rsi
	addq	%rsi, %rdx
	movslq	-32(%rcx), %rax
	testq	%rax, %rax
	jns	.LBB105_59
.LBB105_58:                             # %if.then.i22.i.1
                                        #   in Loop: Header=BB105_3 Depth=1
	movslq	-36(%rcx), %rsi
	decq	%rsi
	imulq	%rax, %rsi
	addq	%rsi, %rdx
	movslq	-16(%rcx), %rax
	testq	%rax, %rax
	jns	.LBB105_61
.LBB105_60:                             # %if.then.i22.i.2
                                        #   in Loop: Header=BB105_3 Depth=1
	movslq	-20(%rcx), %rsi
	decq	%rsi
	imulq	%rax, %rsi
	addq	%rsi, %rdx
	movslq	(%rcx), %rax
	testq	%rax, %rax
	jns	.LBB105_63
.LBB105_62:                             # %if.then.i22.i.3
                                        #   in Loop: Header=BB105_3 Depth=1
	movslq	-4(%rcx), %rsi
	decq	%rsi
	imulq	%rax, %rsi
	addq	%rsi, %rdx
	jmp	.LBB105_63
	.p2align	4, 0x90
.LBB105_38:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa
                                        #   in Loop: Header=BB105_3 Depth=1
	testb	$3, %r14b
	je	.LBB105_43
# %bb.39:                               # %for.body.i16.i.epil.preheader
                                        #   in Loop: Header=BB105_3 Depth=1
	shlq	$4, %rbx
	leaq	(%r9,%rbx), %rcx
	addq	$8, %rcx
	shlq	$4, %r12
	xorl	%esi, %esi
	movslq	(%rcx,%rsi), %rax
	testq	%rax, %rax
	js	.LBB105_41
	.p2align	4, 0x90
.LBB105_42:                             # %for.inc.i26.i.epil
                                        #   in Loop: Header=BB105_3 Depth=1
	addq	$16, %rsi
	cmpq	%rsi, %r12
	je	.LBB105_43
.LBB105_40:                             # %for.body.i16.i.epil
                                        #   in Loop: Header=BB105_3 Depth=1
	movslq	(%rcx,%rsi), %rax
	testq	%rax, %rax
	jns	.LBB105_42
.LBB105_41:                             # %if.then.i22.i.epil
                                        #   in Loop: Header=BB105_3 Depth=1
	movslq	-4(%rcx,%rsi), %rbx
	decq	%rbx
	imulq	%rax, %rbx
	addq	%rbx, %rdx
	addq	$16, %rsi
	cmpq	%rsi, %r12
	jne	.LBB105_40
	jmp	.LBB105_43
	.p2align	4, 0x90
.LBB105_24:                             # %for.cond.for.cond.cleanup_crit_edge
                                        #   in Loop: Header=BB105_3 Depth=1
	movq	_ZN6Halide7Runtime8Internal18current_cache_sizeE@GOTPCREL(%rip), %r15
	movq	%r13, (%r15)
	movq	_ZN6Halide7Runtime8Internal19least_recently_usedE@GOTPCREL(%rip), %r14
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %r12
	movq	%r12, %rax
	movq	%r14, %r12
	movq	%rax, %r13
	movq	-56(%rbp), %rdx         # 8-byte Reload
	movq	-48(%rbp), %r14         # 8-byte Reload
.LBB105_25:                             # %for.cond.cleanup
                                        #   in Loop: Header=BB105_3 Depth=1
	movq	%rdx, %rdi
	movq	%rdx, %rbx
	callq	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv@PLT
	xorl	%edi, %edi
	movq	%rbx, %rsi
	callq	halide_free@PLT
	movq	(%r15), %rax
	movq	_ZN6Halide7Runtime8Internal14max_cache_sizeE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
.LBB105_26:                             # %if.end41
                                        #   in Loop: Header=BB105_3 Depth=1
	testq	%r14, %r14
	je	.LBB105_28
# %bb.27:                               # %if.end41
                                        #   in Loop: Header=BB105_3 Depth=1
	movq	%r14, %rdx
	cmpq	%rcx, %rax
	jg	.LBB105_3
	jmp	.LBB105_28
.LBB105_16:                             # %if.then30
                                        #   in Loop: Header=BB105_3 Depth=1
	movq	16(%rdx), %rax
	movq	%rax, (%rcx)
	testq	%rax, %rax
	jne	.LBB105_18
	jmp	.LBB105_19
.LBB105_28:                             # %while.end42
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end105:
	.size	_ZN6Halide7Runtime8Internal11prune_cacheEv, .Lfunc_end105-_ZN6Halide7Runtime8Internal11prune_cacheEv
                                        # -- End function
	.section	.text.halide_memoization_cache_set_size,"ax",@progbits
	.weak	halide_memoization_cache_set_size # -- Begin function halide_memoization_cache_set_size
	.p2align	4, 0x90
	.type	halide_memoization_cache_set_size,@function
halide_memoization_cache_set_size:      # @halide_memoization_cache_set_size
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	testq	%rdi, %rdi
	movl	$1048576, %ebx          # imm = 0x100000
	cmovneq	%rdi, %rbx
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %r14
	movq	%r14, %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal14max_cache_sizeE@GOTPCREL(%rip), %rax
	movq	%rbx, (%rax)
	callq	_ZN6Halide7Runtime8Internal11prune_cacheEv@PLT
	movq	%r14, %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_mutex_unlock@PLT # TAILCALL
.Lfunc_end106:
	.size	halide_memoization_cache_set_size, .Lfunc_end106-halide_memoization_cache_set_size
                                        # -- End function
	.section	.text.halide_memoization_cache_lookup,"ax",@progbits
	.weak	halide_memoization_cache_lookup # -- Begin function halide_memoization_cache_lookup
	.p2align	4, 0x90
	.type	halide_memoization_cache_lookup,@function
halide_memoization_cache_lookup:        # @halide_memoization_cache_lookup
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	movq	%r9, %r15
	movl	%r8d, -44(%rbp)         # 4-byte Spill
	movq	%rcx, -80(%rbp)         # 8-byte Spill
	movq	%rsi, %rax
	movq	%rdi, %r14
	movslq	%edx, %rsi
	movq	%rax, -88(%rbp)         # 8-byte Spill
	movq	%rax, %rdi
	movq	%rsi, -56(%rbp)         # 8-byte Spill
	callq	_ZN6Halide7Runtime8Internal8djb_hashEPKhm@PLT
	movl	%eax, %r12d
	movzbl	%r12b, %ebx
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %rax
	movq	(%rax,%rbx,8), %rbx
	testq	%rbx, %rbx
	movl	%r12d, -68(%rbp)        # 4-byte Spill
	movq	%r14, -64(%rbp)         # 8-byte Spill
	je	.LBB107_9
# %bb.1:                                # %while.body.lr.ph
	movl	-44(%rbp), %eax         # 4-byte Reload
	testl	%eax, %eax
	jle	.LBB107_22
# %bb.2:                                # %while.body.us.preheader
	movslq	%eax, %r13
	cmpl	%r12d, 48(%rbx)
	jne	.LBB107_8
	jmp	.LBB107_4
	.p2align	4, 0x90
.LBB107_21:                             # %if.end67
                                        #   in Loop: Header=BB107_22 Depth=1
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.LBB107_9
.LBB107_22:                             # %while.body
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%r12d, 48(%rbx)
	jne	.LBB107_21
# %bb.23:                               # %land.lhs.true
                                        #   in Loop: Header=BB107_22 Depth=1
	movq	-56(%rbp), %rax         # 8-byte Reload
	cmpq	%rax, 32(%rbx)
	jne	.LBB107_21
# %bb.24:                               # %land.lhs.true7
                                        #   in Loop: Header=BB107_22 Depth=1
	movq	40(%rbx), %rdi
	movq	-88(%rbp), %rsi         # 8-byte Reload
	movq	-56(%rbp), %rdx         # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m@PLT
	testb	%al, %al
	je	.LBB107_21
# %bb.25:                               # %land.lhs.true10
                                        #   in Loop: Header=BB107_22 Depth=1
	movq	64(%rbx), %rsi
	movq	-80(%rbp), %rdi         # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t@PLT
	testb	%al, %al
	je	.LBB107_21
# %bb.26:                               # %land.lhs.true13
                                        #   in Loop: Header=BB107_22 Depth=1
	movl	-44(%rbp), %eax         # 4-byte Reload
	cmpl	%eax, 56(%rbx)
	jne	.LBB107_21
	jmp	.LBB107_27
.LBB107_20:                             # %for.cond.for.cond.cleanup_crit_edge.us
	testb	%al, %al
	movq	%r12, %r15
	movq	-64(%rbp), %r14         # 8-byte Reload
	movl	-68(%rbp), %r12d        # 4-byte Reload
	jne	.LBB107_27
	.p2align	4, 0x90
.LBB107_8:                              # %if.end67.us
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.LBB107_9
# %bb.3:                                # %while.body.us
                                        #   in Loop: Header=BB107_8 Depth=1
	cmpl	%r12d, 48(%rbx)
	jne	.LBB107_8
.LBB107_4:                              # %land.lhs.true.us
	movq	-56(%rbp), %rax         # 8-byte Reload
	cmpq	%rax, 32(%rbx)
	jne	.LBB107_8
# %bb.5:                                # %land.lhs.true7.us
	movq	40(%rbx), %rdi
	movq	-88(%rbp), %rsi         # 8-byte Reload
	movq	-56(%rbp), %rdx         # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m@PLT
	testb	%al, %al
	je	.LBB107_8
# %bb.6:                                # %land.lhs.true10.us
	movq	64(%rbx), %rsi
	movq	-80(%rbp), %rdi         # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t@PLT
	testb	%al, %al
	je	.LBB107_8
# %bb.7:                                # %land.lhs.true13.us
	movl	-44(%rbp), %eax         # 4-byte Reload
	cmpl	%eax, 56(%rbx)
	jne	.LBB107_8
# %bb.17:                               # %for.body.lr.ph.us
	movq	%r15, %r12
	movl	$1, %r15d
	movl	$5, %r14d
	.p2align	4, 0x90
.LBB107_18:                             # %for.body.us
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%r12,%r15,8), %rdi
	movq	72(%rbx), %rax
	movq	(%rax,%r14,8), %rsi
	callq	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t@PLT
	cmpq	%r13, %r15
	jge	.LBB107_20
# %bb.19:                               # %for.body.us
                                        #   in Loop: Header=BB107_18 Depth=1
	incq	%r15
	addq	$7, %r14
	testb	%al, %al
	jne	.LBB107_18
	jmp	.LBB107_20
.LBB107_9:                              # %for.cond69.preheader
	movl	$1, %r12d
	movl	-44(%rbp), %eax         # 4-byte Reload
	testl	%eax, %eax
	jle	.LBB107_86
# %bb.10:                               # %for.body72.preheader
	movl	%eax, %eax
	movq	%rax, -56(%rbp)         # 8-byte Spill
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB107_11:                             # %for.body72
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB107_67 Depth 2
	movq	(%r15,%r13,8), %r12
	movslq	36(%r12), %r11
	testq	%r11, %r11
	jle	.LBB107_12
# %bb.49:                               # %for.body.lr.ph.i.i
                                        #   in Loop: Header=BB107_11 Depth=1
	movq	40(%r12), %r8
	leaq	-1(%r11), %r10
	movl	%r11d, %r14d
	andl	$3, %r14d
	cmpq	$3, %r10
	jae	.LBB107_64
# %bb.50:                               #   in Loop: Header=BB107_11 Depth=1
	xorl	%edx, %edx
	xorl	%eax, %eax
	jmp	.LBB107_51
	.p2align	4, 0x90
.LBB107_12:                             # %_ZNK15halide_buffer_t3endEv.exit.thread.i
                                        #   in Loop: Header=BB107_11 Depth=1
	movb	33(%r12), %r9b
	movl	$1, %eax
	xorl	%edi, %edi
	jmp	.LBB107_13
	.p2align	4, 0x90
.LBB107_64:                             # %for.body.lr.ph.i.i.new
                                        #   in Loop: Header=BB107_11 Depth=1
	leaq	56(%r8), %rdi
	movq	%r11, %rsi
	subq	%r14, %rsi
	xorl	%edx, %edx
	xorl	%eax, %eax
	movslq	-48(%rdi), %rbx
	testq	%rbx, %rbx
	jg	.LBB107_66
	jmp	.LBB107_67
	.p2align	4, 0x90
.LBB107_73:                             # %for.inc.i.i.3
                                        #   in Loop: Header=BB107_67 Depth=2
	addq	$4, %rdx
	addq	$64, %rdi
	cmpq	%rdx, %rsi
	je	.LBB107_51
# %bb.65:                               # %for.body.i.i
                                        #   in Loop: Header=BB107_67 Depth=2
	movslq	-48(%rdi), %rbx
	testq	%rbx, %rbx
	jle	.LBB107_67
.LBB107_66:                             # %if.then.i.i
                                        #   in Loop: Header=BB107_11 Depth=1
	movslq	-52(%rdi), %rcx
	decq	%rcx
	imulq	%rbx, %rcx
	addq	%rcx, %rax
.LBB107_67:                             # %for.inc.i.i
                                        #   Parent Loop BB107_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	-32(%rdi), %rbx
	testq	%rbx, %rbx
	jle	.LBB107_69
# %bb.68:                               # %if.then.i.i.1
                                        #   in Loop: Header=BB107_67 Depth=2
	movslq	-36(%rdi), %rcx
	decq	%rcx
	imulq	%rbx, %rcx
	addq	%rcx, %rax
.LBB107_69:                             # %for.inc.i.i.1
                                        #   in Loop: Header=BB107_67 Depth=2
	movslq	-16(%rdi), %rcx
	testq	%rcx, %rcx
	jle	.LBB107_71
# %bb.70:                               # %if.then.i.i.2
                                        #   in Loop: Header=BB107_67 Depth=2
	movslq	-20(%rdi), %rbx
	decq	%rbx
	imulq	%rcx, %rbx
	addq	%rbx, %rax
.LBB107_71:                             # %for.inc.i.i.2
                                        #   in Loop: Header=BB107_67 Depth=2
	movslq	(%rdi), %rcx
	testq	%rcx, %rcx
	jle	.LBB107_73
# %bb.72:                               # %if.then.i.i.3
                                        #   in Loop: Header=BB107_67 Depth=2
	movslq	-4(%rdi), %rbx
	decq	%rbx
	imulq	%rcx, %rbx
	addq	%rbx, %rax
	jmp	.LBB107_73
	.p2align	4, 0x90
.LBB107_51:                             # %for.body.lr.ph.i5.i.unr-lcssa
                                        #   in Loop: Header=BB107_11 Depth=1
	testq	%r14, %r14
	je	.LBB107_56
# %bb.52:                               # %for.body.i.i.epil.preheader
                                        #   in Loop: Header=BB107_11 Depth=1
	shlq	$4, %rdx
	addq	%r8, %rdx
	addq	$8, %rdx
	movq	%r14, %rsi
	shlq	$4, %rsi
	xorl	%edi, %edi
	movslq	(%rdx,%rdi), %rbx
	testq	%rbx, %rbx
	jg	.LBB107_54
	.p2align	4, 0x90
.LBB107_55:                             # %for.inc.i.i.epil
                                        #   in Loop: Header=BB107_11 Depth=1
	addq	$16, %rdi
	cmpq	%rdi, %rsi
	je	.LBB107_56
.LBB107_53:                             # %for.body.i.i.epil
                                        #   in Loop: Header=BB107_11 Depth=1
	movslq	(%rdx,%rdi), %rbx
	testq	%rbx, %rbx
	jle	.LBB107_55
.LBB107_54:                             # %if.then.i.i.epil
                                        #   in Loop: Header=BB107_11 Depth=1
	movslq	-4(%rdx,%rdi), %rcx
	decq	%rcx
	imulq	%rbx, %rcx
	addq	%rcx, %rax
	addq	$16, %rdi
	cmpq	%rdi, %rsi
	jne	.LBB107_53
.LBB107_56:                             # %for.body.lr.ph.i5.i
                                        #   in Loop: Header=BB107_11 Depth=1
	movb	33(%r12), %r9b
	cmpq	$3, %r10
	jae	.LBB107_74
# %bb.57:                               #   in Loop: Header=BB107_11 Depth=1
	xorl	%edx, %edx
	xorl	%edi, %edi
	jmp	.LBB107_58
	.p2align	4, 0x90
.LBB107_74:                             # %for.body.lr.ph.i5.i.new
                                        #   in Loop: Header=BB107_11 Depth=1
	leaq	56(%r8), %rsi
	movq	%r11, %r10
	subq	%r14, %r10
	xorl	%edx, %edx
	xorl	%edi, %edi
	movslq	-48(%rsi), %rcx
	testq	%rcx, %rcx
	jns	.LBB107_77
	jmp	.LBB107_76
	.p2align	4, 0x90
.LBB107_83:                             # %for.inc.i26.i.3
                                        #   in Loop: Header=BB107_11 Depth=1
	addq	$4, %rdx
	addq	$64, %rsi
	cmpq	%rdx, %r10
	je	.LBB107_58
# %bb.75:                               # %for.body.i16.i
                                        #   in Loop: Header=BB107_11 Depth=1
	movslq	-48(%rsi), %rcx
	testq	%rcx, %rcx
	js	.LBB107_76
.LBB107_77:                             # %for.inc.i26.i
                                        #   in Loop: Header=BB107_11 Depth=1
	movslq	-32(%rsi), %rcx
	testq	%rcx, %rcx
	js	.LBB107_78
.LBB107_79:                             # %for.inc.i26.i.1
                                        #   in Loop: Header=BB107_11 Depth=1
	movslq	-16(%rsi), %rcx
	testq	%rcx, %rcx
	js	.LBB107_80
.LBB107_81:                             # %for.inc.i26.i.2
                                        #   in Loop: Header=BB107_11 Depth=1
	movslq	(%rsi), %rcx
	testq	%rcx, %rcx
	jns	.LBB107_83
	jmp	.LBB107_82
	.p2align	4, 0x90
.LBB107_76:                             # %if.then.i22.i
                                        #   in Loop: Header=BB107_11 Depth=1
	movslq	-52(%rsi), %rbx
	decq	%rbx
	imulq	%rcx, %rbx
	addq	%rbx, %rdi
	movslq	-32(%rsi), %rcx
	testq	%rcx, %rcx
	jns	.LBB107_79
.LBB107_78:                             # %if.then.i22.i.1
                                        #   in Loop: Header=BB107_11 Depth=1
	movslq	-36(%rsi), %rbx
	decq	%rbx
	imulq	%rcx, %rbx
	addq	%rbx, %rdi
	movslq	-16(%rsi), %rcx
	testq	%rcx, %rcx
	jns	.LBB107_81
.LBB107_80:                             # %if.then.i22.i.2
                                        #   in Loop: Header=BB107_11 Depth=1
	movslq	-20(%rsi), %rbx
	decq	%rbx
	imulq	%rcx, %rbx
	addq	%rbx, %rdi
	movslq	(%rsi), %rcx
	testq	%rcx, %rcx
	jns	.LBB107_83
.LBB107_82:                             # %if.then.i22.i.3
                                        #   in Loop: Header=BB107_11 Depth=1
	movslq	-4(%rsi), %rbx
	decq	%rbx
	imulq	%rcx, %rbx
	addq	%rbx, %rdi
	jmp	.LBB107_83
	.p2align	4, 0x90
.LBB107_58:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa
                                        #   in Loop: Header=BB107_11 Depth=1
	testb	$3, %r11b
	je	.LBB107_63
# %bb.59:                               # %for.body.i16.i.epil.preheader
                                        #   in Loop: Header=BB107_11 Depth=1
	shlq	$4, %rdx
	addq	%r8, %rdx
	addq	$8, %rdx
	shlq	$4, %r14
	xorl	%esi, %esi
	movslq	(%rdx,%rsi), %rcx
	testq	%rcx, %rcx
	js	.LBB107_61
	.p2align	4, 0x90
.LBB107_62:                             # %for.inc.i26.i.epil
                                        #   in Loop: Header=BB107_11 Depth=1
	addq	$16, %rsi
	cmpq	%rsi, %r14
	je	.LBB107_63
.LBB107_60:                             # %for.body.i16.i.epil
                                        #   in Loop: Header=BB107_11 Depth=1
	movslq	(%rdx,%rsi), %rcx
	testq	%rcx, %rcx
	jns	.LBB107_62
.LBB107_61:                             # %if.then.i22.i.epil
                                        #   in Loop: Header=BB107_11 Depth=1
	movslq	-4(%rdx,%rsi), %rbx
	decq	%rbx
	imulq	%rcx, %rbx
	addq	%rbx, %rdi
	addq	$16, %rsi
	cmpq	%rsi, %r14
	jne	.LBB107_60
.LBB107_63:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
                                        #   in Loop: Header=BB107_11 Depth=1
	incq	%rax
	movq	-64(%rbp), %r14         # 8-byte Reload
.LBB107_13:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit
                                        #   in Loop: Header=BB107_11 Depth=1
	subq	%rdi, %rax
	movzbl	%r9b, %esi
	addq	$7, %rsi
	shrq	$3, %rsi
	imulq	%rax, %rsi
	subq	$-128, %rsi
	movq	%r14, %rdi
	callq	halide_malloc@PLT
	movq	%rax, 16(%r12)
	testq	%rax, %rax
	je	.LBB107_14
# %bb.84:                               # %for.inc108
                                        #   in Loop: Header=BB107_11 Depth=1
	subq	$-128, %rax
	movq	%rax, 16(%r12)
	movq	%rax, %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movl	-68(%rbp), %ecx         # 4-byte Reload
	movl	%ecx, 8(%rax)
	movq	$0, (%rax)
	incq	%r13
	cmpq	-56(%rbp), %r13         # 8-byte Folded Reload
	jne	.LBB107_11
# %bb.85:
	movl	$1, %r12d
	jmp	.LBB107_86
.LBB107_14:                             # %for.cond83.preheader
	movl	$-1, %r12d
	testl	%r13d, %r13d
	je	.LBB107_86
# %bb.15:                               # %for.body86.preheader
	movl	%r13d, %ebx
	.p2align	4, 0x90
.LBB107_16:                             # %for.body86
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%r15,%rbx,8), %rax
	movq	16(%rax), %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movq	%r14, %rdi
	movq	%rax, %rsi
	callq	halide_free@PLT
	movq	-8(%r15,%rbx,8), %rax
	movq	$0, 16(%rax)
	decq	%rbx
	jg	.LBB107_16
.LBB107_86:                             # %cleanup113
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	vzeroupper
	callq	halide_mutex_unlock@PLT
	movl	%r12d, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB107_27:                             # %if.then23
	movq	_ZN6Halide7Runtime8Internal18most_recently_usedE@GOTPCREL(%rip), %r14
	cmpq	(%r14), %rbx
	movl	-44(%rbp), %r13d        # 4-byte Reload
	je	.LBB107_40
# %bb.28:                               # %if.then25
	cmpq	$0, 8(%rbx)
	jne	.LBB107_30
# %bb.29:                               # %if.then27
	leaq	.L.str.5.45(%rip), %rsi
	movq	-64(%rbp), %rdi         # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
.LBB107_30:                             # %if.end
	movq	16(%rbx), %rax
	testq	%rax, %rax
	je	.LBB107_32
# %bb.31:                               # %if.then29
	movq	8(%rbx), %rcx
	movq	%rcx, 8(%rax)
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.LBB107_37
	jmp	.LBB107_36
.LBB107_32:                             # %if.else
	movq	%r15, %r12
	movq	_ZN6Halide7Runtime8Internal19least_recently_usedE@GOTPCREL(%rip), %r15
	cmpq	%rbx, (%r15)
	je	.LBB107_34
# %bb.33:                               # %if.then34
	leaq	.L.str.6.46(%rip), %rsi
	movq	-64(%rbp), %rdi         # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
.LBB107_34:                             # %if.end35
	movq	8(%rbx), %rax
	movq	%rax, (%r15)
	movq	%r12, %r15
	testq	%rax, %rax
	jne	.LBB107_37
.LBB107_36:                             # %if.then40
	leaq	.L.str.7.47(%rip), %rsi
	movq	-64(%rbp), %rdi         # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
	movq	8(%rbx), %rax
.LBB107_37:                             # %if.end41
	movq	16(%rbx), %rcx
	movq	%rcx, 16(%rax)
	movq	$0, 8(%rbx)
	movq	(%r14), %rax
	movq	%rax, 16(%rbx)
	testq	%rax, %rax
	je	.LBB107_39
# %bb.38:                               # %if.then48
	movq	%rbx, 8(%rax)
.LBB107_39:                             # %if.end50
	movq	%rbx, (%r14)
.LBB107_40:                             # %if.end51
	testl	%r13d, %r13d
	jle	.LBB107_46
# %bb.41:                               # %for.body56.lr.ph
	movl	%r13d, %ecx
	leaq	-1(%rcx), %rdx
	movl	%ecx, %r8d
	andl	$3, %r8d
	cmpq	$3, %rdx
	jae	.LBB107_47
# %bb.42:
	xorl	%edx, %edx
	testq	%r8, %r8
	jne	.LBB107_44
	jmp	.LBB107_46
.LBB107_47:                             # %for.body56.lr.ph.new
	subq	%r8, %rcx
	xorl	%esi, %esi
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB107_48:                             # %for.body56
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r15,%rdx,8), %rax
	movq	72(%rbx), %rdi
	vmovups	(%rdi,%rsi), %ymm0
	vmovups	24(%rdi,%rsi), %ymm1
	vmovups	%ymm1, 24(%rax)
	vmovups	%ymm0, (%rax)
	movq	8(%r15,%rdx,8), %rax
	movq	72(%rbx), %rdi
	vmovups	56(%rdi,%rsi), %ymm0
	vmovups	80(%rdi,%rsi), %ymm1
	vmovups	%ymm1, 24(%rax)
	vmovups	%ymm0, (%rax)
	movq	16(%r15,%rdx,8), %rax
	movq	72(%rbx), %rdi
	vmovups	112(%rdi,%rsi), %ymm0
	vmovups	136(%rdi,%rsi), %ymm1
	vmovups	%ymm1, 24(%rax)
	vmovups	%ymm0, (%rax)
	movq	24(%r15,%rdx,8), %rax
	movq	72(%rbx), %rdi
	vmovups	168(%rdi,%rsi), %ymm0
	vmovups	192(%rdi,%rsi), %ymm1
	vmovups	%ymm1, 24(%rax)
	vmovups	%ymm0, (%rax)
	addq	$4, %rdx
	addq	$224, %rsi
	cmpq	%rdx, %rcx
	jne	.LBB107_48
# %bb.43:                               # %for.cond.cleanup55.loopexit.unr-lcssa
	testq	%r8, %r8
	je	.LBB107_46
.LBB107_44:                             # %for.body56.epil.preheader
	imulq	$56, %rdx, %rcx
	leaq	(%r15,%rdx,8), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB107_45:                             # %for.body56.epil
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rdx,%rsi,8), %rdi
	movq	72(%rbx), %rax
	vmovups	(%rax,%rcx), %ymm0
	vmovups	24(%rax,%rcx), %ymm1
	vmovups	%ymm1, 24(%rdi)
	vmovups	%ymm0, (%rdi)
	addq	$56, %rcx
	incq	%rsi
	cmpq	%rsi, %r8
	jne	.LBB107_45
.LBB107_46:                             # %for.cond.cleanup55
	addl	%r13d, 52(%rbx)
	xorl	%r12d, %r12d
	jmp	.LBB107_86
.Lfunc_end107:
	.size	halide_memoization_cache_lookup, .Lfunc_end107-halide_memoization_cache_lookup
                                        # -- End function
	.section	.text.halide_memoization_cache_store,"ax",@progbits
	.weak	halide_memoization_cache_store # -- Begin function halide_memoization_cache_store
	.p2align	4, 0x90
	.type	halide_memoization_cache_store,@function
halide_memoization_cache_store:         # @halide_memoization_cache_store
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	movl	%r8d, %r14d
	movq	%rcx, %r13
	movl	%edx, %r12d
	movq	%rsi, -72(%rbp)         # 8-byte Spill
	movq	%rdi, -80(%rbp)         # 8-byte Spill
	movq	%r9, -64(%rbp)          # 8-byte Spill
	movq	(%r9), %rax
	movq	16(%rax), %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movl	8(%rax), %r15d
	movzbl	%r15b, %ebx
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %rax
	movq	%rbx, -104(%rbp)        # 8-byte Spill
	movq	(%rax,%rbx,8), %rbx
	movslq	%r12d, %rax
	movq	%rax, -56(%rbp)         # 8-byte Spill
	testq	%rbx, %rbx
	movl	%r14d, -44(%rbp)        # 4-byte Spill
	movq	%r13, -96(%rbp)         # 8-byte Spill
	movq	%r15, -88(%rbp)         # 8-byte Spill
	je	.LBB108_9
# %bb.1:                                # %while.body.lr.ph
	movq	%r15, %r12
	testl	%r14d, %r14d
	jle	.LBB108_27
# %bb.2:                                # %while.body.us.preheader
	movslq	%r14d, %rax
	movq	%rax, -112(%rbp)        # 8-byte Spill
	cmpl	%r12d, 48(%rbx)
	jne	.LBB108_8
	jmp	.LBB108_4
	.p2align	4, 0x90
.LBB108_26:                             # %if.end53
                                        #   in Loop: Header=BB108_27 Depth=1
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.LBB108_9
.LBB108_27:                             # %while.body
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%r12d, 48(%rbx)
	jne	.LBB108_26
# %bb.28:                               # %land.lhs.true
                                        #   in Loop: Header=BB108_27 Depth=1
	movq	-56(%rbp), %rax         # 8-byte Reload
	cmpq	%rax, 32(%rbx)
	jne	.LBB108_26
# %bb.29:                               # %land.lhs.true8
                                        #   in Loop: Header=BB108_27 Depth=1
	movq	40(%rbx), %rdi
	movq	-72(%rbp), %rsi         # 8-byte Reload
	movq	-56(%rbp), %rdx         # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m@PLT
	testb	%al, %al
	je	.LBB108_26
# %bb.30:                               # %land.lhs.true11
                                        #   in Loop: Header=BB108_27 Depth=1
	movq	64(%rbx), %rsi
	movq	%r13, %rdi
	callq	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t@PLT
	testb	%al, %al
	je	.LBB108_26
# %bb.31:                               # %land.lhs.true14
                                        #   in Loop: Header=BB108_27 Depth=1
	cmpl	%r14d, 56(%rbx)
	jne	.LBB108_26
	jmp	.LBB108_32
.LBB108_23:                             # %for.cond.for.cond.cleanup_crit_edge.us
	testb	%al, %al
	movl	-44(%rbp), %r14d        # 4-byte Reload
	movq	-96(%rbp), %r13         # 8-byte Reload
	movq	-88(%rbp), %r12         # 8-byte Reload
	jne	.LBB108_24
	.p2align	4, 0x90
.LBB108_8:                              # %if.end53.us
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rbx
	testq	%rbx, %rbx
	je	.LBB108_9
# %bb.3:                                # %while.body.us
                                        #   in Loop: Header=BB108_8 Depth=1
	cmpl	%r12d, 48(%rbx)
	jne	.LBB108_8
.LBB108_4:                              # %land.lhs.true.us
	movq	-56(%rbp), %rax         # 8-byte Reload
	cmpq	%rax, 32(%rbx)
	jne	.LBB108_8
# %bb.5:                                # %land.lhs.true8.us
	movq	40(%rbx), %rdi
	movq	-72(%rbp), %rsi         # 8-byte Reload
	movq	-56(%rbp), %rdx         # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m@PLT
	testb	%al, %al
	je	.LBB108_8
# %bb.6:                                # %land.lhs.true11.us
	movq	64(%rbx), %rsi
	movq	%r13, %rdi
	callq	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t@PLT
	testb	%al, %al
	je	.LBB108_8
# %bb.7:                                # %land.lhs.true14.us
	cmpl	%r14d, 56(%rbx)
	jne	.LBB108_8
# %bb.18:                               # %for.body.lr.ph.us
	movq	72(%rbx), %rcx
	movb	$1, %r15b
	movl	$1, %r14d
	xorl	%r12d, %r12d
	.p2align	4, 0x90
.LBB108_19:                             # %for.body.us
                                        # =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	-8(%rax,%r14,8), %r13
	movq	40(%rcx,%r12), %rsi
	movq	%r13, %rdi
	callq	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t@PLT
	movq	72(%rbx), %rcx
	movq	16(%rcx,%r12), %rsi
	xorl	%edx, %edx
	cmpq	16(%r13), %rsi
	je	.LBB108_21
# %bb.20:                               # %for.body.us
                                        #   in Loop: Header=BB108_19 Depth=1
	movzbl	%r15b, %edx
.LBB108_21:                             # %for.body.us
                                        #   in Loop: Header=BB108_19 Depth=1
	movl	%edx, %r15d
	cmpq	-112(%rbp), %r14        # 8-byte Folded Reload
	jge	.LBB108_23
# %bb.22:                               # %for.body.us
                                        #   in Loop: Header=BB108_19 Depth=1
	incq	%r14
	addq	$56, %r12
	testb	%al, %al
	jne	.LBB108_19
	jmp	.LBB108_23
.LBB108_9:                              # %for.cond55.preheader
	testl	%r14d, %r14d
	jle	.LBB108_10
# %bb.35:                               # %for.body58.preheader
	movl	%r14d, %r8d
	xorl	%r15d, %r15d
	xorl	%r12d, %r12d
	jmp	.LBB108_36
	.p2align	4, 0x90
.LBB108_53:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
                                        #   in Loop: Header=BB108_36 Depth=1
	incq	%rdx
.LBB108_38:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit
                                        #   in Loop: Header=BB108_36 Depth=1
	subq	%rdi, %rdx
	movzbl	%r9b, %eax
	addq	$7, %rax
	shrq	$3, %rax
	imulq	%rdx, %rax
	addq	%rax, %r12
	incq	%r15
	cmpq	%r8, %r15
	je	.LBB108_11
.LBB108_36:                             # %for.body58
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB108_57 Depth 2
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	(%rax,%r15,8), %r9
	movslq	36(%r9), %r13
	testq	%r13, %r13
	jle	.LBB108_37
# %bb.39:                               # %for.body.lr.ph.i.i
                                        #   in Loop: Header=BB108_36 Depth=1
	movq	40(%r9), %r10
	leaq	-1(%r13), %r11
	movl	%r13d, %r14d
	andl	$3, %r14d
	cmpq	$3, %r11
	jae	.LBB108_54
# %bb.40:                               #   in Loop: Header=BB108_36 Depth=1
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	jmp	.LBB108_41
	.p2align	4, 0x90
.LBB108_37:                             # %_ZNK15halide_buffer_t3endEv.exit.thread.i
                                        #   in Loop: Header=BB108_36 Depth=1
	movb	33(%r9), %r9b
	movl	$1, %edx
	xorl	%edi, %edi
	jmp	.LBB108_38
	.p2align	4, 0x90
.LBB108_54:                             # %for.body.lr.ph.i.i.new
                                        #   in Loop: Header=BB108_36 Depth=1
	leaq	56(%r10), %rax
	movq	%r13, %rdi
	subq	%r14, %rdi
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	movslq	-48(%rax), %rcx
	testq	%rcx, %rcx
	jg	.LBB108_56
	jmp	.LBB108_57
	.p2align	4, 0x90
.LBB108_63:                             # %for.inc.i.i.3
                                        #   in Loop: Header=BB108_57 Depth=2
	addq	$4, %rbx
	addq	$64, %rax
	cmpq	%rbx, %rdi
	je	.LBB108_41
# %bb.55:                               # %for.body.i.i
                                        #   in Loop: Header=BB108_57 Depth=2
	movslq	-48(%rax), %rcx
	testq	%rcx, %rcx
	jle	.LBB108_57
.LBB108_56:                             # %if.then.i.i
                                        #   in Loop: Header=BB108_36 Depth=1
	movslq	-52(%rax), %rsi
	decq	%rsi
	imulq	%rcx, %rsi
	addq	%rsi, %rdx
.LBB108_57:                             # %for.inc.i.i
                                        #   Parent Loop BB108_36 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movslq	-32(%rax), %rcx
	testq	%rcx, %rcx
	jle	.LBB108_59
# %bb.58:                               # %if.then.i.i.1
                                        #   in Loop: Header=BB108_57 Depth=2
	movslq	-36(%rax), %rsi
	decq	%rsi
	imulq	%rcx, %rsi
	addq	%rsi, %rdx
.LBB108_59:                             # %for.inc.i.i.1
                                        #   in Loop: Header=BB108_57 Depth=2
	movslq	-16(%rax), %rcx
	testq	%rcx, %rcx
	jle	.LBB108_61
# %bb.60:                               # %if.then.i.i.2
                                        #   in Loop: Header=BB108_57 Depth=2
	movslq	-20(%rax), %rsi
	decq	%rsi
	imulq	%rcx, %rsi
	addq	%rsi, %rdx
.LBB108_61:                             # %for.inc.i.i.2
                                        #   in Loop: Header=BB108_57 Depth=2
	movslq	(%rax), %rcx
	testq	%rcx, %rcx
	jle	.LBB108_63
# %bb.62:                               # %if.then.i.i.3
                                        #   in Loop: Header=BB108_57 Depth=2
	movslq	-4(%rax), %rsi
	decq	%rsi
	imulq	%rcx, %rsi
	addq	%rsi, %rdx
	jmp	.LBB108_63
	.p2align	4, 0x90
.LBB108_41:                             # %for.body.lr.ph.i5.i.unr-lcssa
                                        #   in Loop: Header=BB108_36 Depth=1
	testq	%r14, %r14
	je	.LBB108_46
# %bb.42:                               # %for.body.i.i.epil.preheader
                                        #   in Loop: Header=BB108_36 Depth=1
	shlq	$4, %rbx
	leaq	(%r10,%rbx), %rax
	addq	$8, %rax
	movq	%r14, %rcx
	shlq	$4, %rcx
	xorl	%edi, %edi
	movslq	(%rax,%rdi), %rbx
	testq	%rbx, %rbx
	jg	.LBB108_44
	.p2align	4, 0x90
.LBB108_45:                             # %for.inc.i.i.epil
                                        #   in Loop: Header=BB108_36 Depth=1
	addq	$16, %rdi
	cmpq	%rdi, %rcx
	je	.LBB108_46
.LBB108_43:                             # %for.body.i.i.epil
                                        #   in Loop: Header=BB108_36 Depth=1
	movslq	(%rax,%rdi), %rbx
	testq	%rbx, %rbx
	jle	.LBB108_45
.LBB108_44:                             # %if.then.i.i.epil
                                        #   in Loop: Header=BB108_36 Depth=1
	movslq	-4(%rax,%rdi), %rsi
	decq	%rsi
	imulq	%rbx, %rsi
	addq	%rsi, %rdx
	addq	$16, %rdi
	cmpq	%rdi, %rcx
	jne	.LBB108_43
.LBB108_46:                             # %for.body.lr.ph.i5.i
                                        #   in Loop: Header=BB108_36 Depth=1
	movb	33(%r9), %r9b
	cmpq	$3, %r11
	jae	.LBB108_64
# %bb.47:                               #   in Loop: Header=BB108_36 Depth=1
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	jmp	.LBB108_48
	.p2align	4, 0x90
.LBB108_64:                             # %for.body.lr.ph.i5.i.new
                                        #   in Loop: Header=BB108_36 Depth=1
	leaq	56(%r10), %rax
	movq	%r13, %r11
	subq	%r14, %r11
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	movslq	-48(%rax), %rsi
	testq	%rsi, %rsi
	jns	.LBB108_67
	jmp	.LBB108_66
	.p2align	4, 0x90
.LBB108_73:                             # %for.inc.i26.i.3
                                        #   in Loop: Header=BB108_36 Depth=1
	addq	$4, %rbx
	addq	$64, %rax
	cmpq	%rbx, %r11
	je	.LBB108_48
# %bb.65:                               # %for.body.i16.i
                                        #   in Loop: Header=BB108_36 Depth=1
	movslq	-48(%rax), %rsi
	testq	%rsi, %rsi
	js	.LBB108_66
.LBB108_67:                             # %for.inc.i26.i
                                        #   in Loop: Header=BB108_36 Depth=1
	movslq	-32(%rax), %rsi
	testq	%rsi, %rsi
	js	.LBB108_68
.LBB108_69:                             # %for.inc.i26.i.1
                                        #   in Loop: Header=BB108_36 Depth=1
	movslq	-16(%rax), %rsi
	testq	%rsi, %rsi
	js	.LBB108_70
.LBB108_71:                             # %for.inc.i26.i.2
                                        #   in Loop: Header=BB108_36 Depth=1
	movslq	(%rax), %rsi
	testq	%rsi, %rsi
	jns	.LBB108_73
	jmp	.LBB108_72
	.p2align	4, 0x90
.LBB108_66:                             # %if.then.i22.i
                                        #   in Loop: Header=BB108_36 Depth=1
	movslq	-52(%rax), %rcx
	decq	%rcx
	imulq	%rsi, %rcx
	addq	%rcx, %rdi
	movslq	-32(%rax), %rsi
	testq	%rsi, %rsi
	jns	.LBB108_69
.LBB108_68:                             # %if.then.i22.i.1
                                        #   in Loop: Header=BB108_36 Depth=1
	movslq	-36(%rax), %rcx
	decq	%rcx
	imulq	%rsi, %rcx
	addq	%rcx, %rdi
	movslq	-16(%rax), %rsi
	testq	%rsi, %rsi
	jns	.LBB108_71
.LBB108_70:                             # %if.then.i22.i.2
                                        #   in Loop: Header=BB108_36 Depth=1
	movslq	-20(%rax), %rcx
	decq	%rcx
	imulq	%rsi, %rcx
	addq	%rcx, %rdi
	movslq	(%rax), %rsi
	testq	%rsi, %rsi
	jns	.LBB108_73
.LBB108_72:                             # %if.then.i22.i.3
                                        #   in Loop: Header=BB108_36 Depth=1
	movslq	-4(%rax), %rcx
	decq	%rcx
	imulq	%rsi, %rcx
	addq	%rcx, %rdi
	jmp	.LBB108_73
	.p2align	4, 0x90
.LBB108_48:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa
                                        #   in Loop: Header=BB108_36 Depth=1
	testb	$3, %r13b
	je	.LBB108_53
# %bb.49:                               # %for.body.i16.i.epil.preheader
                                        #   in Loop: Header=BB108_36 Depth=1
	shlq	$4, %rbx
	leaq	(%r10,%rbx), %rax
	addq	$8, %rax
	shlq	$4, %r14
	xorl	%ecx, %ecx
	movslq	(%rax,%rcx), %rsi
	testq	%rsi, %rsi
	js	.LBB108_51
	.p2align	4, 0x90
.LBB108_52:                             # %for.inc.i26.i.epil
                                        #   in Loop: Header=BB108_36 Depth=1
	addq	$16, %rcx
	cmpq	%rcx, %r14
	je	.LBB108_53
.LBB108_50:                             # %for.body.i16.i.epil
                                        #   in Loop: Header=BB108_36 Depth=1
	movslq	(%rax,%rcx), %rsi
	testq	%rsi, %rsi
	jns	.LBB108_52
.LBB108_51:                             # %if.then.i22.i.epil
                                        #   in Loop: Header=BB108_36 Depth=1
	movslq	-4(%rax,%rcx), %rbx
	decq	%rbx
	imulq	%rsi, %rbx
	addq	%rbx, %rdi
	addq	$16, %rcx
	cmpq	%rcx, %r14
	jne	.LBB108_50
	jmp	.LBB108_53
.LBB108_10:
	xorl	%r12d, %r12d
.LBB108_11:                             # %for.cond.cleanup57
	movq	_ZN6Halide7Runtime8Internal18current_cache_sizeE@GOTPCREL(%rip), %rbx
	addq	%r12, (%rbx)
	callq	_ZN6Halide7Runtime8Internal11prune_cacheEv@PLT
	movl	$80, %esi
	xorl	%edi, %edi
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	movq	-64(%rbp), %r15         # 8-byte Reload
	je	.LBB108_13
# %bb.12:                               # %if.then70
	movq	%r15, (%rsp)
	movq	%r13, %rdi
	movq	-72(%rbp), %rsi         # 8-byte Reload
	movq	-56(%rbp), %rdx         # 8-byte Reload
	movq	-88(%rbp), %rcx         # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx
	movq	-96(%rbp), %r8          # 8-byte Reload
	movl	-44(%rbp), %r9d         # 4-byte Reload
	callq	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_@PLT
	testb	%al, %al
	je	.LBB108_13
# %bb.74:                               # %if.end94
	movq	-104(%rbp), %rdx        # 8-byte Reload
	movq	_ZN6Halide7Runtime8Internal13cache_entriesE@GOTPCREL(%rip), %rsi
	movq	(%rsi,%rdx,8), %rax
	movq	%rax, (%r13)
	movq	_ZN6Halide7Runtime8Internal18most_recently_usedE@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movq	%rcx, 16(%r13)
	testq	%rcx, %rcx
	je	.LBB108_76
# %bb.75:                               # %if.then99
	movq	%r13, 8(%rcx)
.LBB108_76:                             # %if.end100
	movq	%r13, (%rax)
	movq	_ZN6Halide7Runtime8Internal19least_recently_usedE@GOTPCREL(%rip), %rax
	cmpq	$0, (%rax)
	jne	.LBB108_78
# %bb.77:                               # %if.then102
	movq	%r13, (%rax)
.LBB108_78:                             # %if.end103
	movq	%r13, (%rsi,%rdx,8)
	movl	-44(%rbp), %eax         # 4-byte Reload
	movl	%eax, 52(%r13)
	testl	%eax, %eax
	jle	.LBB108_81
# %bb.79:                               # %for.body110.preheader
	movl	%eax, %r14d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB108_80:                             # %for.body110
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r15,%rbx,8), %rax
	movq	16(%rax), %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movq	%r13, (%rax)
	incq	%rbx
	cmpq	%rbx, %r14
	jne	.LBB108_80
	jmp	.LBB108_81
.LBB108_13:                             # %if.then76
	subq	%r12, (%rbx)
	movl	-44(%rbp), %eax         # 4-byte Reload
	testl	%eax, %eax
	jle	.LBB108_16
# %bb.14:                               # %for.body81.preheader
	movl	%eax, %r14d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB108_15:                             # %for.body81
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r15,%rbx,8), %rax
	movq	16(%rax), %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movq	$0, (%rax)
	incq	%rbx
	cmpq	%rbx, %r14
	jne	.LBB108_15
.LBB108_16:                             # %for.cond.cleanup80
	testq	%r13, %r13
	je	.LBB108_81
# %bb.17:                               # %if.then92
	movq	-80(%rbp), %rdi         # 8-byte Reload
	movq	%r13, %rsi
	callq	halide_free@PLT
.LBB108_81:                             # %cleanup125
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	xorl	%eax, %eax
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB108_24:                             # %if.then34
	testb	$1, %r15b
	jne	.LBB108_32
# %bb.25:                               # %if.then36
	leaq	.L.str.9.48(%rip), %rsi
	movq	-80(%rbp), %rdi         # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
.LBB108_32:                             # %if.end37
	testl	%r14d, %r14d
	movq	-64(%rbp), %r15         # 8-byte Reload
	jle	.LBB108_81
# %bb.33:                               # %for.body42.preheader
	movl	%r14d, %r14d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB108_34:                             # %for.body42
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r15,%rbx,8), %rax
	movq	16(%rax), %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movq	$0, (%rax)
	incq	%rbx
	cmpq	%rbx, %r14
	jne	.LBB108_34
	jmp	.LBB108_81
.Lfunc_end108:
	.size	halide_memoization_cache_store, .Lfunc_end108-halide_memoization_cache_store
                                        # -- End function
	.section	.text.halide_memoization_cache_release,"ax",@progbits
	.weak	halide_memoization_cache_release # -- Begin function halide_memoization_cache_release
	.p2align	4, 0x90
	.type	halide_memoization_cache_release,@function
halide_memoization_cache_release:       # @halide_memoization_cache_release
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	movq	%rsi, %rdi
	callq	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh@PLT
	movq	(%rax), %rbx
	testq	%rbx, %rbx
	je	.LBB109_4
# %bb.1:                                # %if.else
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	movl	52(%rbx), %eax
	testl	%eax, %eax
	jne	.LBB109_3
# %bb.2:                                # %if.then4
	leaq	.L.str.12.49(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	movl	52(%rbx), %eax
.LBB109_3:                              # %if.end
	decl	%eax
	movl	%eax, 52(%rbx)
	movq	_ZN6Halide7Runtime8Internal16memoization_lockE@GOTPCREL(%rip), %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_mutex_unlock@PLT # TAILCALL
.LBB109_4:                              # %if.then
	movq	%r14, %rdi
	movq	%rax, %rsi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_free@PLT         # TAILCALL
.Lfunc_end109:
	.size	halide_memoization_cache_release, .Lfunc_end109-halide_memoization_cache_release
                                        # -- End function
	.section	.text.halide_string_to_string,"ax",@progbits
	.weak	halide_string_to_string # -- Begin function halide_string_to_string
	.p2align	4, 0x90
	.type	halide_string_to_string,@function
halide_string_to_string:                # @halide_string_to_string
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	cmpq	%rsi, %rdi
	jae	.LBB110_6
# %bb.1:
	movq	%rsi, %rax
	.p2align	4, 0x90
.LBB110_2:                              # %if.end3
                                        # =>This Inner Loop Header: Depth=1
	movzbl	(%rdx), %ecx
	movb	%cl, (%rdi)
	testb	%cl, %cl
	je	.LBB110_6
# %bb.3:                                # %if.end6
                                        #   in Loop: Header=BB110_2 Depth=1
	incq	%rdi
	incq	%rdx
	cmpq	%rdi, %rax
	jne	.LBB110_2
# %bb.4:                                # %if.then2
	movb	$0, -1(%rdi)
	popq	%rbp
	retq
.LBB110_6:
	movq	%rdi, %rax
	popq	%rbp
	retq
.Lfunc_end110:
	.size	halide_string_to_string, .Lfunc_end110-halide_string_to_string
                                        # -- End function
	.section	.text.halide_uint64_to_string,"ax",@progbits
	.weak	halide_uint64_to_string # -- Begin function halide_uint64_to_string
	.p2align	4, 0x90
	.type	halide_uint64_to_string,@function
halide_uint64_to_string:                # @halide_uint64_to_string
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$40, %rsp
	movb	$0, -9(%rbp)
	leaq	-10(%rbp), %r8
	testq	%rdx, %rdx
	jne	.LBB111_2
# %bb.1:                                # %entry
	testl	%ecx, %ecx
	jle	.LBB111_5
.LBB111_2:                              # %for.body.preheader
	movl	$1, %eax
	movabsq	$-3689348814741910323, %r10 # imm = 0xCCCCCCCCCCCCCCCD
	.p2align	4, 0x90
.LBB111_3:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rdx, %r9
	movl	%eax, %r11d
	movq	%rdx, %rax
	mulq	%r10
	shrq	$3, %rdx
	leal	(%rdx,%rdx), %eax
	leal	(%rax,%rax,4), %eax
	movl	%r9d, %ebx
	subl	%eax, %ebx
	addb	$48, %bl
	movb	%bl, (%r8)
	decq	%r8
	leal	1(%r11), %eax
	cmpq	$9, %r9
	ja	.LBB111_3
# %bb.4:                                # %for.body
                                        #   in Loop: Header=BB111_3 Depth=1
	cmpl	%ecx, %r11d
	jl	.LBB111_3
.LBB111_5:                              # %for.cond.cleanup
	incq	%r8
	movq	%r8, %rdx
	callq	halide_string_to_string@PLT
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end111:
	.size	halide_uint64_to_string, .Lfunc_end111-halide_uint64_to_string
                                        # -- End function
	.section	.text.halide_int64_to_string,"ax",@progbits
	.weak	halide_int64_to_string  # -- Begin function halide_int64_to_string
	.p2align	4, 0x90
	.type	halide_int64_to_string,@function
halide_int64_to_string:                 # @halide_int64_to_string
# %bb.0:                                # %entry
	cmpq	%rsi, %rdi
	jae	.LBB112_3
# %bb.1:                                # %entry
	testq	%rdx, %rdx
	jns	.LBB112_3
# %bb.2:                                # %if.then
	pushq	%rbp
	movq	%rsp, %rbp
	movb	$45, (%rdi)
	incq	%rdi
	negq	%rdx
	popq	%rbp
.LBB112_3:                              # %if.end
	jmp	halide_uint64_to_string@PLT # TAILCALL
.Lfunc_end112:
	.size	halide_int64_to_string, .Lfunc_end112-halide_int64_to_string
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4               # -- Begin function halide_double_to_string
.LCPI113_0:
	.quad	-9223372036854775808    # double -0
	.quad	-9223372036854775808    # double -0
.LCPI113_6:
	.long	1127219200              # 0x43300000
	.long	1160773632              # 0x45300000
	.long	0                       # 0x0
	.long	0                       # 0x0
.LCPI113_7:
	.quad	4841369599423283200     # double 4503599627370496
	.quad	4985484787499139072     # double 1.9342813113834067E+25
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI113_1:
	.quad	4607182418800017408     # double 1
.LCPI113_2:
	.quad	4621819117588971520     # double 10
.LCPI113_3:
	.quad	4696837146684686336     # double 1.0E+6
.LCPI113_4:
	.quad	4602678819172646912     # double 0.5
.LCPI113_5:
	.quad	4890909195324358656     # double 9.2233720368547758E+18
	.section	.text.halide_double_to_string,"ax",@progbits
	.weak	halide_double_to_string
	.p2align	4, 0x90
	.type	halide_double_to_string,@function
halide_double_to_string:                # @halide_double_to_string
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$552, %rsp              # imm = 0x228
	movl	%edx, %ebx
	movq	%rsi, %r12
	movq	%rdi, %r15
	vmovapd	%xmm0, -64(%rbp)        # 16-byte Spill
	vmovsd	%xmm0, -48(%rbp)
	movq	$0, -72(%rbp)
	leaq	-72(%rbp), %rdi
	leaq	-48(%rbp), %rsi
	movl	$8, %edx
	callq	memcpy@PLT
	movq	-72(%rbp), %rax
	movb	$52, %cl
	bzhiq	%rcx, %rax, %r13
	movq	%rax, %r14
	shrq	$52, %r14
	andl	$2047, %r14d            # imm = 0x7FF
	shrq	$63, %rax
	cmpl	$2047, %r14d            # imm = 0x7FF
	jne	.LBB113_9
# %bb.1:                                # %if.then
	testq	%r13, %r13
	je	.LBB113_6
# %bb.2:                                # %if.then4
	testl	%eax, %eax
	je	.LBB113_5
# %bb.3:                                # %if.then6
	leaq	.L.str.58(%rip), %rdx
	jmp	.LBB113_4
.LBB113_9:                              # %if.else15
	testq	%r13, %r13
	jne	.LBB113_18
# %bb.10:                               # %if.else15
	testl	%r14d, %r14d
	jne	.LBB113_18
# %bb.11:                               # %if.then18
	testl	%ebx, %ebx
	je	.LBB113_15
# %bb.12:                               # %if.then20
	testl	%eax, %eax
	je	.LBB113_14
# %bb.13:                               # %if.then22
	leaq	.L.str.4.62(%rip), %rdx
	jmp	.LBB113_4
.LBB113_18:                             # %if.end32
	testl	%eax, %eax
	je	.LBB113_19
# %bb.20:                               # %if.then34
	leaq	.L.str.8.66(%rip), %rdx
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %r15
	vmovapd	-64(%rbp), %xmm2        # 16-byte Reload
	vxorpd	.LCPI113_0(%rip), %xmm2, %xmm2
	vmovlpd	%xmm2, -48(%rbp)
	testl	%ebx, %ebx
	je	.LBB113_37
.LBB113_22:                             # %while.condthread-pre-split
	xorl	%ebx, %ebx
	vmovsd	.LCPI113_1(%rip), %xmm0 # xmm0 = mem[0],zero
	vucomisd	%xmm2, %xmm0
	jbe	.LBB113_26
# %bb.23:                               # %while.body.preheader
	xorl	%ebx, %ebx
	vmovsd	.LCPI113_2(%rip), %xmm1 # xmm1 = mem[0],zero
	.p2align	4, 0x90
.LBB113_24:                             # %while.body
                                        # =>This Inner Loop Header: Depth=1
	vmulsd	%xmm1, %xmm2, %xmm2
	decl	%ebx
	vucomisd	%xmm2, %xmm0
	ja	.LBB113_24
# %bb.25:                               # %while.cond.while.cond41thread-pre-split_crit_edge
	vmovsd	%xmm2, -48(%rbp)
.LBB113_26:                             # %while.cond41thread-pre-split
	vucomisd	.LCPI113_2(%rip), %xmm2
	jae	.LBB113_28
# %bb.27:
	movq	%r15, %rdi
	jmp	.LBB113_31
.LBB113_6:                              # %if.else9
	testl	%eax, %eax
	je	.LBB113_8
# %bb.7:                                # %if.then11
	leaq	.L.str.2.60(%rip), %rdx
	jmp	.LBB113_4
.LBB113_5:                              # %if.else
	leaq	.L.str.1.59(%rip), %rdx
	jmp	.LBB113_4
.LBB113_15:                             # %if.else26
	testl	%eax, %eax
	je	.LBB113_17
# %bb.16:                               # %if.then28
	leaq	.L.str.6.64(%rip), %rdx
	jmp	.LBB113_4
.LBB113_19:
	vmovapd	-64(%rbp), %xmm2        # 16-byte Reload
	testl	%ebx, %ebx
	jne	.LBB113_22
.LBB113_37:                             # %if.else62
	testl	%r14d, %r14d
	je	.LBB113_38
# %bb.39:                               # %if.end66
	movq	%r15, -64(%rbp)         # 8-byte Spill
	movabsq	$4503599627370495, %rax # imm = 0xFFFFFFFFFFFFF
	incq	%rax
	orq	%rax, %r13
	movl	%r14d, %ecx
	addl	$-1075, %ecx            # imm = 0xFBCD
	js	.LBB113_41
# %bb.40:
	xorl	%r14d, %r14d
	movl	%ecx, %r15d
	jmp	.LBB113_45
.LBB113_28:                             # %while.body43.preheader
	vmovsd	.LCPI113_2(%rip), %xmm0 # xmm0 = mem[0],zero
	.p2align	4, 0x90
.LBB113_29:                             # %while.body43
                                        # =>This Inner Loop Header: Depth=1
	vdivsd	%xmm0, %xmm2, %xmm2
	incl	%ebx
	vucomisd	%xmm0, %xmm2
	jae	.LBB113_29
# %bb.30:                               # %while.cond41.while.end44_crit_edge
	movq	%r15, %rdi
	vmovsd	%xmm2, -48(%rbp)
.LBB113_31:                             # %while.end44
	vmovsd	.LCPI113_3(%rip), %xmm0 # xmm0 = mem[0],zero
	vfmadd213sd	.LCPI113_4(%rip), %xmm2, %xmm0 # xmm0 = (xmm2 * xmm0) + mem
	vmovsd	.LCPI113_5(%rip), %xmm1 # xmm1 = mem[0],zero
	vsubsd	%xmm1, %xmm0, %xmm2
	vcvttsd2si	%xmm2, %rax
	movabsq	$-9223372036854775808, %rdx # imm = 0x8000000000000000
	vcvttsd2si	%xmm0, %rcx
	xorq	%rax, %rdx
	vucomisd	%xmm1, %xmm0
	cmovaeq	%rdx, %rcx
	movabsq	$4835703278458516699, %rdx # imm = 0x431BDE82D7B634DB
	movq	%rcx, %rax
	mulq	%rdx
	shrq	$18, %rdx
	imulq	$-1000000, %rdx, %r15   # imm = 0xFFF0BDC0
	addq	%rcx, %r15
	movq	%r12, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.30.144(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	movl	$6, %ecx
	callq	halide_int64_to_string@PLT
	testl	%ebx, %ebx
	js	.LBB113_33
# %bb.32:                               # %if.then54
	leaq	.L.str.10.68(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	jmp	.LBB113_34
.LBB113_8:                              # %if.else13
	leaq	.L.str.3.61(%rip), %rdx
	jmp	.LBB113_4
.LBB113_14:                             # %if.else24
	leaq	.L.str.5.63(%rip), %rdx
	jmp	.LBB113_4
.LBB113_33:                             # %if.else56
	leaq	.L.str.11.69(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	negl	%ebx
.LBB113_34:                             # %if.end59
	movslq	%ebx, %rdx
	movq	%r12, %rsi
	movl	$2, %ecx
	jmp	.LBB113_35
.LBB113_17:                             # %if.else30
	leaq	.L.str.7.65(%rip), %rdx
.LBB113_4:                              # %cleanup148
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	jmp	.LBB113_36
.LBB113_38:                             # %if.then64
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	%r15, %rdi
	movq	%r12, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	jmp	.LBB113_36
.LBB113_41:                             # %if.then72
	xorl	%r15d, %r15d
	cmpl	$-52, %ecx
	jge	.LBB113_43
# %bb.42:
	xorl	%eax, %eax
	jmp	.LBB113_44
.LBB113_43:                             # %if.else76
	movb	$51, %dl
	subb	%r14b, %dl
	shrxq	%rdx, %r13, %rax
	shlxq	%rdx, %rax, %rdx
	subq	%rdx, %r13
.LBB113_44:                             # %if.end84
	vmovq	%r13, %xmm0
	vmovdqa	.LCPI113_6(%rip), %xmm1 # xmm1 = [1127219200,1160773632,0,0]
	vpunpckldq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	vmovapd	.LCPI113_7(%rip), %xmm2 # xmm2 = [4.503599627370496E+15,1.9342813113834067E+25]
	vsubpd	%xmm2, %xmm0, %xmm0
	vhaddpd	%xmm0, %xmm0, %xmm0
	shlq	$52, %rcx
	movabsq	$4696837146684686336, %rdx # imm = 0x412E848000000000
	addq	%rcx, %rdx
	vmovq	%rdx, %xmm3
	vfmadd213sd	.LCPI113_4(%rip), %xmm0, %xmm3 # xmm3 = (xmm0 * xmm3) + mem
	vmovsd	.LCPI113_5(%rip), %xmm0 # xmm0 = mem[0],zero
	vsubsd	%xmm0, %xmm3, %xmm4
	vcvttsd2si	%xmm4, %rcx
	movabsq	$-9223372036854775808, %rdx # imm = 0x8000000000000000
	xorq	%rcx, %rdx
	vcvttsd2si	%xmm3, %rcx
	vucomisd	%xmm0, %xmm3
	cmovaeq	%rdx, %rcx
	vmovq	%rcx, %xmm0
	vpunpckldq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	vsubpd	%xmm2, %xmm0, %xmm0
	vhaddpd	%xmm0, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm3
	setnp	%dl
	sete	%bl
	andb	%dl, %bl
	andb	%cl, %bl
	movzbl	%bl, %edx
	subq	%rdx, %rcx
	xorl	%r13d, %r13d
	cmpq	$1000000, %rcx          # imm = 0xF4240
	sete	%r13b
	movl	$0, %r14d
	cmovneq	%rcx, %r14
	addq	%rax, %r13
.LBB113_45:                             # %if.end105
	leaq	-72(%rbp), %rsi
	leaq	-104(%rbp), %rbx
	movq	%rbx, %rdi
	movq	%r13, %rdx
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testl	%r15d, %r15d
	jle	.LBB113_46
# %bb.47:                               # %for.cond112.preheader.preheader
	movl	%r15d, %r8d
	andl	$1, %r8d
	cmpl	$1, %r15d
	je	.LBB113_62
# %bb.48:                               # %for.cond112.preheader.preheader.new
	subl	%r8d, %r15d
	movq	%rax, %rdx
	cmpq	%rbx, %rax
	jne	.LBB113_50
	jmp	.LBB113_55
	.p2align	4, 0x90
.LBB113_60:                             # %if.end138.1
                                        #   in Loop: Header=BB113_55 Depth=1
	movq	%rdx, %rbx
.LBB113_61:                             # %if.end138.1
                                        #   in Loop: Header=BB113_55 Depth=1
	addl	$-2, %r15d
	je	.LBB113_62
# %bb.49:                               # %for.cond112.preheader
                                        #   in Loop: Header=BB113_55 Depth=1
	movq	%rax, %rdx
	cmpq	%rbx, %rax
	je	.LBB113_55
.LBB113_50:                             # %for.body116.preheader
	xorl	%esi, %esi
	movq	%rax, %rdx
	.p2align	4, 0x90
.LBB113_51:                             # %for.body116
                                        # =>This Inner Loop Header: Depth=1
	movzbl	-1(%rdx), %ecx
	addb	$-48, %cl
	movzbl	%cl, %edi
	addl	%edi, %edi
	orl	%esi, %edi
	leal	-10(%rdi), %ecx
	xorl	%esi, %esi
	cmpb	$9, %dil
	setg	%sil
	movzbl	%cl, %ecx
	cmovlel	%edi, %ecx
	addb	$48, %cl
	movb	%cl, -1(%rdx)
	decq	%rdx
	cmpq	%rdx, %rbx
	jne	.LBB113_51
# %bb.52:                               # %for.cond.cleanup115
	cmpb	$9, %dil
	jle	.LBB113_54
# %bb.53:                               # %if.then136
	movb	$49, -1(%rbx)
	decq	%rbx
.LBB113_54:                             # %if.end138
	movq	%rbx, %rdx
.LBB113_55:                             # %if.end138
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB113_57 Depth 2
	movq	%rax, %rbx
	cmpq	%rdx, %rax
	je	.LBB113_61
# %bb.56:                               # %for.body116.1.preheader
                                        #   in Loop: Header=BB113_55 Depth=1
	xorl	%edi, %edi
	movq	%rax, %rsi
	.p2align	4, 0x90
.LBB113_57:                             # %for.body116.1
                                        #   Parent Loop BB113_55 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzbl	-1(%rsi), %ecx
	addb	$-48, %cl
	movzbl	%cl, %ebx
	addl	%ebx, %ebx
	orl	%edi, %ebx
	leal	-10(%rbx), %ecx
	xorl	%edi, %edi
	cmpb	$9, %bl
	setg	%dil
	movzbl	%cl, %ecx
	cmovlel	%ebx, %ecx
	addb	$48, %cl
	movb	%cl, -1(%rsi)
	decq	%rsi
	cmpq	%rsi, %rdx
	jne	.LBB113_57
# %bb.58:                               # %for.cond.cleanup115.1
                                        #   in Loop: Header=BB113_55 Depth=1
	cmpb	$10, %bl
	jl	.LBB113_60
# %bb.59:                               # %if.then136.1
                                        #   in Loop: Header=BB113_55 Depth=1
	movb	$49, -1(%rdx)
	decq	%rdx
	jmp	.LBB113_60
.LBB113_62:                             # %for.cond.cleanup.loopexit.unr-lcssa
	testl	%r8d, %r8d
	movq	-64(%rbp), %rdi         # 8-byte Reload
	je	.LBB113_69
# %bb.63:                               # %for.cond112.preheader.epil
	cmpq	%rbx, %rax
	je	.LBB113_64
# %bb.65:                               # %for.body116.epil.preheader
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB113_66:                             # %for.body116.epil
                                        # =>This Inner Loop Header: Depth=1
	movzbl	-1(%rax), %edx
	addb	$-48, %dl
	movzbl	%dl, %edx
	addl	%edx, %edx
	orl	%ecx, %edx
	leal	-10(%rdx), %esi
	xorl	%ecx, %ecx
	cmpb	$9, %dl
	setg	%cl
	movzbl	%sil, %esi
	cmovlel	%edx, %esi
	addb	$48, %sil
	movb	%sil, -1(%rax)
	decq	%rax
	cmpq	%rax, %rbx
	jne	.LBB113_66
# %bb.67:                               # %for.cond.cleanup115.epil
	cmpb	$10, %dl
	jl	.LBB113_69
# %bb.68:                               # %if.then136.epil
	movb	$49, -1(%rbx)
	decq	%rbx
	jmp	.LBB113_69
.LBB113_46:
	movq	-64(%rbp), %rdi         # 8-byte Reload
	jmp	.LBB113_69
.LBB113_64:
	movq	%rax, %rbx
.LBB113_69:                             # %for.cond.cleanup
	movq	%r12, %rsi
	movq	%rbx, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.30.144(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r14, %rdx
	movl	$6, %ecx
.LBB113_35:                             # %cleanup148
	callq	halide_int64_to_string@PLT
.LBB113_36:                             # %cleanup148
	addq	$552, %rsp              # imm = 0x228
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end113:
	.size	halide_double_to_string, .Lfunc_end113-halide_double_to_string
                                        # -- End function
	.section	.text.halide_pointer_to_string,"ax",@progbits
	.weak	halide_pointer_to_string # -- Begin function halide_pointer_to_string
	.p2align	4, 0x90
	.type	halide_pointer_to_string,@function
halide_pointer_to_string:               # @halide_pointer_to_string
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm0, -32(%rbp)
	movl	$0, -16(%rbp)
	leaq	-15(%rbp), %r9
	movl	$1, %ecx
	leaq	.L.str.12.72(%rip), %r8
	.p2align	4, 0x90
.LBB114_1:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%edx, %eax
	andl	$15, %eax
	movzbl	(%rax,%r8), %eax
	movb	%al, 1(%r9)
	decq	%r9
	cmpl	$15, %ecx
	ja	.LBB114_3
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB114_1 Depth=1
	shrq	$4, %rdx
	incl	%ecx
	testq	%rdx, %rdx
	jne	.LBB114_1
.LBB114_3:                              # %cleanup
	movw	$30768, (%r9)           # imm = 0x7830
	movq	%r9, %rdx
	callq	halide_string_to_string@PLT
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end114:
	.size	halide_pointer_to_string, .Lfunc_end114-halide_pointer_to_string
                                        # -- End function
	.section	.text.halide_type_to_string,"ax",@progbits
	.weak	halide_type_to_string   # -- Begin function halide_type_to_string
	.p2align	4, 0x90
	.type	halide_type_to_string,@function
halide_type_to_string:                  # @halide_type_to_string
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movsbq	(%rdx), %rax
	cmpq	$3, %rax
	ja	.LBB115_1
# %bb.2:                                # %switch.lookup
	leaq	.Lswitch.table.halide_type_to_string(%rip), %rcx
	movq	(%rcx,%rax,8), %rdx
	jmp	.LBB115_3
.LBB115_1:
	leaq	.L.str.17.73(%rip), %rdx
.LBB115_3:                              # %sw.epilog
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movzbl	1(%rbx), %edx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	cmpw	$1, 2(%rbx)
	jne	.LBB115_5
# %bb.4:                                # %if.end
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.LBB115_5:                              # %if.then
	leaq	.L.str.18.78(%rip), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movzwl	2(%rbx), %edx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_uint64_to_string@PLT # TAILCALL
.Lfunc_end115:
	.size	halide_type_to_string, .Lfunc_end115-halide_type_to_string
                                        # -- End function
	.section	.text.halide_buffer_to_string,"ax",@progbits
	.weak	halide_buffer_to_string # -- Begin function halide_buffer_to_string
	.p2align	4, 0x90
	.type	halide_buffer_to_string,@function
halide_buffer_to_string:                # @halide_buffer_to_string
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %rbx
	testq	%rdx, %rdx
	je	.LBB116_1
# %bb.3:                                # %if.end
	movq	%rdx, %r14
	leaq	.L.str.20.80(%rip), %rdx
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	(%r14), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	leaq	.L.str.55(%rip), %r15
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	movq	8(%r14), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_pointer_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	movq	16(%r14), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_pointer_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	movq	24(%r14), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	leaq	32(%r14), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_type_to_string@PLT
	cmpl	$0, 36(%r14)
	jle	.LBB116_6
# %bb.4:                                # %for.body.lr.ph
	xorl	%r15d, %r15d
	leaq	.L.str.55(%rip), %r12
	xorl	%r13d, %r13d
	.p2align	4, 0x90
.LBB116_5:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, %rdi
	movq	%rbx, %rsi
	leaq	.L.str.22.83(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	40(%r14), %rcx
	movslq	(%rcx,%r15), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movq	40(%r14), %rcx
	movslq	4(%rcx,%r15), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movq	40(%r14), %rcx
	movslq	8(%rcx,%r15), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	leaq	.L.str.23.84(%rip), %rdx
	callq	halide_string_to_string@PLT
	incq	%r13
	movslq	36(%r14), %rcx
	addq	$16, %r15
	cmpq	%rcx, %r13
	jl	.LBB116_5
.LBB116_6:                              # %for.cond.cleanup
	leaq	.L.str.5.170(%rip), %rdx
	movq	%rax, %rdi
	jmp	.LBB116_2
.LBB116_1:                              # %if.then
	leaq	.L.str.19.79(%rip), %rdx
.LBB116_2:                              # %if.then
	movq	%rbx, %rsi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_string_to_string@PLT # TAILCALL
.Lfunc_end116:
	.size	halide_buffer_to_string, .Lfunc_end116-halide_buffer_to_string
                                        # -- End function
	.section	.text.halide_reuse_device_allocations,"ax",@progbits
	.weak	halide_reuse_device_allocations # -- Begin function halide_reuse_device_allocations
	.p2align	4, 0x90
	.type	halide_reuse_device_allocations,@function
halide_reuse_device_allocations:        # @halide_reuse_device_allocations
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE@GOTPCREL(%rip), %rax
	movb	%sil, (%rax)
	xorl	%r15d, %r15d
	testl	%esi, %esi
	jne	.LBB117_4
# %bb.1:                                # %if.then
	movq	%rdi, %r14
	movq	_ZN6Halide7Runtime8Internal21allocation_pools_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal23device_allocation_poolsE@GOTPCREL(%rip), %rax
	movq	(%rax), %rbx
	xorl	%r15d, %r15d
	testq	%rbx, %rbx
	je	.LBB117_3
	.p2align	4, 0x90
.LBB117_5:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	callq	*(%rbx)
	testl	%eax, %eax
	cmovnel	%eax, %r15d
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.LBB117_5
.LBB117_3:                              # %for.cond.cleanup
	movq	_ZN6Halide7Runtime8Internal21allocation_pools_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
.LBB117_4:                              # %if.end5
	movl	%r15d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end117:
	.size	halide_reuse_device_allocations, .Lfunc_end117-halide_reuse_device_allocations
                                        # -- End function
	.section	.text.halide_can_reuse_device_allocations,"ax",@progbits
	.weak	halide_can_reuse_device_allocations # -- Begin function halide_can_reuse_device_allocations
	.p2align	4, 0x90
	.type	halide_can_reuse_device_allocations,@function
halide_can_reuse_device_allocations:    # @halide_can_reuse_device_allocations
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE@GOTPCREL(%rip), %rax
	movb	(%rax), %al
	popq	%rbp
	retq
.Lfunc_end118:
	.size	halide_can_reuse_device_allocations, .Lfunc_end118-halide_can_reuse_device_allocations
                                        # -- End function
	.section	.text.halide_register_device_allocation_pool,"ax",@progbits
	.weak	halide_register_device_allocation_pool # -- Begin function halide_register_device_allocation_pool
	.p2align	4, 0x90
	.type	halide_register_device_allocation_pool,@function
halide_register_device_allocation_pool: # @halide_register_device_allocation_pool
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %rbx
	movq	_ZN6Halide7Runtime8Internal21allocation_pools_lockE@GOTPCREL(%rip), %r14
	movq	%r14, %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal23device_allocation_poolsE@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rbx, (%rax)
	movq	%r14, %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_mutex_unlock@PLT # TAILCALL
.Lfunc_end119:
	.size	halide_register_device_allocation_pool, .Lfunc_end119-halide_register_device_allocation_pool
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t # -- Begin function _ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t,@function
_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t: # @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	24(%rsi), %rax
	xorl	%ebx, %ebx
	testb	$2, %al
	je	.LBB120_6
# %bb.1:                                # %if.end
	movl	$-14, %ebx
	testb	$1, %al
	jne	.LBB120_6
# %bb.2:                                # %if.end9
	movq	%rsi, %r14
	movq	8(%rsi), %rax
	testq	%rax, %rax
	je	.LBB120_3
# %bb.4:                                # %if.end15
	movq	%rdi, %r15
	movq	120(%rax), %rax
	movq	%r14, %rsi
	callq	*48(%rax)
	testl	%eax, %eax
	jne	.LBB120_6
# %bb.5:                                # %if.end23
	andb	$-3, 24(%r14)
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_msan_annotate_buffer_is_initialized@PLT
	xorl	%ebx, %ebx
	jmp	.LBB120_6
.LBB120_3:
	movl	$-19, %ebx
.LBB120_6:                              # %return
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end120:
	.size	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t, .Lfunc_end120-_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
                                        # -- End function
	.section	.text.halide_device_release,"ax",@progbits
	.weak	halide_device_release   # -- Begin function halide_device_release
	.p2align	4, 0x90
	.type	halide_device_release,@function
halide_device_release:                  # @halide_device_release
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	120(%rsi), %rax
	popq	%rbp
	jmpq	*40(%rax)               # TAILCALL
.Lfunc_end121:
	.size	halide_device_release, .Lfunc_end121-halide_device_release
                                        # -- End function
	.section	.text.halide_copy_to_host,"ax",@progbits
	.weak	halide_copy_to_host     # -- Begin function halide_copy_to_host
	.p2align	4, 0x90
	.type	halide_copy_to_host,@function
halide_copy_to_host:                    # @halide_copy_to_host
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %r15
	movq	%rdi, %r14
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	testq	%r15, %r15
	je	.LBB122_1
# %bb.2:                                # %if.end.i
	movq	(%r15), %rcx
	movq	8(%r15), %rax
	testq	%rax, %rax
	jne	.LBB122_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	je	.LBB122_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB122_12
	jmp	.LBB122_11
.LBB122_1:                              # %if.then.i
	leaq	.L.str.9.89(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB122_12
	jmp	.LBB122_11
.LBB122_5:                              # %if.end10.i
	testq	%rcx, %rcx
	jne	.LBB122_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	je	.LBB122_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB122_12
	jmp	.LBB122_11
.LBB122_8:                              # %if.end16.i
	movq	24(%r15), %rax
	andl	$3, %eax
	cmpq	$3, %rax
	jne	.LBB122_11
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB122_12
.LBB122_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t@PLT
	movl	%eax, %ebx
.LBB122_12:                             # %cleanup
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end122:
	.size	halide_copy_to_host, .Lfunc_end122-halide_copy_to_host
                                        # -- End function
	.section	.text.copy_to_device_already_locked,"ax",@progbits
	.weak	copy_to_device_already_locked # -- Begin function copy_to_device_already_locked
	.p2align	4, 0x90
	.type	copy_to_device_already_locked,@function
copy_to_device_already_locked:          # @copy_to_device_already_locked
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB123_1
# %bb.2:                                # %if.end.i
	movq	(%r12), %rcx
	movq	8(%r12), %rax
	testq	%rax, %rax
	jne	.LBB123_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	je	.LBB123_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB123_21
	jmp	.LBB123_11
.LBB123_1:                              # %if.then.i
	leaq	.L.str.10.90(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB123_21
	jmp	.LBB123_11
.LBB123_5:                              # %if.end10.i
	testq	%rcx, %rcx
	jne	.LBB123_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	je	.LBB123_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB123_21
	jmp	.LBB123_11
.LBB123_8:                              # %if.end16.i
	movq	24(%r12), %rax
	andl	$3, %eax
	cmpq	$3, %rax
	jne	.LBB123_11
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB123_21
.LBB123_11:                             # %if.end
	testq	%r15, %r15
	jne	.LBB123_13
# %bb.12:                               # %if.then2
	movq	8(%r12), %r15
	testq	%r15, %r15
	je	.LBB123_22
.LBB123_13:                             # %if.end11
	cmpq	$0, (%r12)
	je	.LBB123_16
# %bb.14:                               # %land.lhs.true
	cmpq	%r15, 8(%r12)
	je	.LBB123_17
# %bb.15:                               # %if.then14
	leaq	.L.str.12.91(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movl	$-42, %ebx
	jmp	.LBB123_21
.LBB123_16:                             # %if.then18
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	halide_device_malloc@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB123_21
.LBB123_17:                             # %if.end27
	movq	24(%r12), %rax
	xorl	%ebx, %ebx
	testb	$1, %al
	je	.LBB123_21
# %bb.18:                               # %if.then29
	movl	$-15, %ebx
	testb	$2, %al
	jne	.LBB123_21
# %bb.19:                               # %if.else
	movq	120(%r15), %rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	*56(%rax)
	testl	%eax, %eax
	jne	.LBB123_21
# %bb.20:                               # %if.then42
	andb	$-2, 24(%r12)
	xorl	%ebx, %ebx
.LBB123_21:                             # %cleanup
	movl	%ebx, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB123_22:                             # %if.then7
	movq	%r14, %rdi
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_no_device_interface@PLT # TAILCALL
.Lfunc_end123:
	.size	copy_to_device_already_locked, .Lfunc_end123-copy_to_device_already_locked
                                        # -- End function
	.section	.text.halide_device_malloc,"ax",@progbits
	.weak	halide_device_malloc    # -- Begin function halide_device_malloc
	.p2align	4, 0x90
	.type	halide_device_malloc,@function
halide_device_malloc:                   # @halide_device_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r14
	movq	%rsi, %rbx
	movq	%rdi, %r15
	testq	%rsi, %rsi
	je	.LBB124_1
# %bb.2:                                # %if.end.i
	movq	(%rbx), %rcx
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.LBB124_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	je	.LBB124_5
# %bb.4:                                # %if.then8.i
	movq	%r15, %rdi
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	jne	.LBB124_16
	jmp	.LBB124_11
.LBB124_1:                              # %if.then.i
	leaq	.L.str.18.92(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB124_16
	jmp	.LBB124_11
.LBB124_5:                              # %if.end10.i
	testq	%rcx, %rcx
	jne	.LBB124_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	je	.LBB124_8
# %bb.7:                                # %if.then14.i
	movq	%r15, %rdi
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	jne	.LBB124_16
	jmp	.LBB124_11
.LBB124_8:                              # %if.end16.i
	movq	24(%rbx), %rcx
	andl	$3, %ecx
	cmpq	$3, %rcx
	jne	.LBB124_12
# %bb.9:                                # %if.then24.i
	movq	%r15, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB124_16
.LBB124_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%rbx), %rax
.LBB124_12:                             # %if.end
	testq	%rax, %rax
	je	.LBB124_15
# %bb.13:                               # %if.end
	cmpq	%r14, %rax
	je	.LBB124_15
# %bb.14:                               # %if.then6
	leaq	.L.str.20.93(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movl	$-42, %eax
	jmp	.LBB124_16
.LBB124_15:                             # %if.end7
	movq	120(%r14), %rax
	callq	*(%rax)
	movq	120(%r14), %rax
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	*16(%rax)
	movl	%eax, %ebx
	movq	120(%r14), %rax
	callq	*8(%rax)
	xorl	%eax, %eax
	testl	%ebx, %ebx
	sete	%al
	shll	$4, %eax
	addl	$-16, %eax
.LBB124_16:                             # %cleanup12
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end124:
	.size	halide_device_malloc, .Lfunc_end124-halide_device_malloc
                                        # -- End function
	.section	.text.halide_copy_to_device,"ax",@progbits
	.weak	halide_copy_to_device   # -- Begin function halide_copy_to_device
	.p2align	4, 0x90
	.type	halide_copy_to_device,@function
halide_copy_to_device:                  # @halide_copy_to_device
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %r12
	movq	%r12, %rdi
	callq	halide_mutex_lock@PLT
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%r14, %rdx
	callq	copy_to_device_already_locked@PLT
	movl	%eax, %ebx
	movq	%r12, %rdi
	callq	halide_mutex_unlock@PLT
	movl	%ebx, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end125:
	.size	halide_copy_to_device, .Lfunc_end125-halide_copy_to_device
                                        # -- End function
	.section	.text.halide_device_sync,"ax",@progbits
	.weak	halide_device_sync      # -- Begin function halide_device_sync
	.p2align	4, 0x90
	.type	halide_device_sync,@function
halide_device_sync:                     # @halide_device_sync
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rsi, %rbx
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB126_1
# %bb.2:                                # %if.end.i
	movq	(%rbx), %rcx
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.LBB126_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	je	.LBB126_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	je	.LBB126_11
.LBB126_14:                             # %cleanup8
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.LBB126_1:                              # %if.then.i
	leaq	.L.str.17.94(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB126_14
	jmp	.LBB126_11
.LBB126_5:                              # %if.end10.i
	testq	%rcx, %rcx
	jne	.LBB126_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	je	.LBB126_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	jne	.LBB126_14
	jmp	.LBB126_11
.LBB126_8:                              # %if.end16.i
	movq	24(%rbx), %rcx
	andl	$3, %ecx
	cmpq	$3, %rcx
	jne	.LBB126_12
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB126_14
.LBB126_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%rbx), %rax
.LBB126_12:                             # %if.end
	testq	%rax, %rax
	je	.LBB126_15
# %bb.13:                               # %if.end5
	movq	120(%rax), %rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	*32(%rax)
	movl	%eax, %ecx
	testl	%eax, %eax
	movl	$-17, %eax
	cmovel	%ecx, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.LBB126_15:                             # %if.then3
	movq	%r14, %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_error_no_device_interface@PLT # TAILCALL
.Lfunc_end126:
	.size	halide_device_sync, .Lfunc_end126-halide_device_sync
                                        # -- End function
	.section	.text.halide_device_free,"ax",@progbits
	.weak	halide_device_free      # -- Begin function halide_device_free
	.p2align	4, 0x90
	.type	halide_device_free,@function
halide_device_free:                     # @halide_device_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r12
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB127_1
# %bb.2:                                # %if.end.i
	movq	(%r12), %rax
	movq	8(%r12), %rbx
	testq	%rbx, %rbx
	jne	.LBB127_5
# %bb.3:                                # %if.end.i
	testq	%rax, %rax
	je	.LBB127_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	jne	.LBB127_17
	jmp	.LBB127_11
.LBB127_1:                              # %if.then.i
	leaq	.L.str.21.97(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB127_17
	jmp	.LBB127_11
.LBB127_5:                              # %if.end10.i
	testq	%rax, %rax
	jne	.LBB127_8
# %bb.6:                                # %if.end10.i
	testq	%rbx, %rbx
	je	.LBB127_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	jne	.LBB127_17
	jmp	.LBB127_11
.LBB127_8:                              # %if.end16.i
	movq	24(%r12), %rax
	andl	$3, %eax
	cmpq	$3, %rax
	jne	.LBB127_12
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB127_17
.LBB127_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%r12), %rbx
.LBB127_12:                             # %if.end
	testq	%rbx, %rbx
	je	.LBB127_16
# %bb.13:                               # %if.then3
	movq	120(%rbx), %rax
	callq	*(%rax)
	movq	120(%rbx), %rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	*24(%rax)
	movl	%eax, %r15d
	movq	120(%rbx), %rax
	callq	*8(%rax)
	cmpq	$0, (%r12)
	je	.LBB127_15
# %bb.14:                               # %if.then8
	leaq	.L.str.22.98(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB127_15:                             # %if.end9
	testl	%r15d, %r15d
	movl	$-18, %eax
	cmovel	%r15d, %eax
	jmp	.LBB127_17
.LBB127_16:                             # %if.end11
	andb	$-3, 24(%r12)
	xorl	%eax, %eax
.LBB127_17:                             # %cleanup12
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end127:
	.size	halide_device_free, .Lfunc_end127-halide_device_free
                                        # -- End function
	.section	.text.halide_device_free_as_destructor,"ax",@progbits
	.weak	halide_device_free_as_destructor # -- Begin function halide_device_free_as_destructor
	.p2align	4, 0x90
	.type	halide_device_free_as_destructor,@function
halide_device_free_as_destructor:       # @halide_device_free_as_destructor
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	halide_device_free@PLT  # TAILCALL
.Lfunc_end128:
	.size	halide_device_free_as_destructor, .Lfunc_end128-halide_device_free_as_destructor
                                        # -- End function
	.section	.text.halide_device_and_host_malloc,"ax",@progbits
	.weak	halide_device_and_host_malloc # -- Begin function halide_device_and_host_malloc
	.p2align	4, 0x90
	.type	halide_device_and_host_malloc,@function
halide_device_and_host_malloc:          # @halide_device_and_host_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r14
	movq	%rsi, %rbx
	movq	%rdi, %r15
	testq	%rsi, %rsi
	je	.LBB129_1
# %bb.2:                                # %if.end.i
	movq	(%rbx), %rcx
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.LBB129_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	je	.LBB129_5
# %bb.4:                                # %if.then8.i
	movq	%r15, %rdi
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	jne	.LBB129_18
	jmp	.LBB129_11
.LBB129_1:                              # %if.then.i
	leaq	.L.str.23.99(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB129_18
	jmp	.LBB129_11
.LBB129_5:                              # %if.end10.i
	testq	%rcx, %rcx
	jne	.LBB129_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	je	.LBB129_8
# %bb.7:                                # %if.then14.i
	movq	%r15, %rdi
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	jne	.LBB129_18
	jmp	.LBB129_11
.LBB129_8:                              # %if.end16.i
	movq	24(%rbx), %rcx
	andl	$3, %ecx
	cmpq	$3, %rcx
	jne	.LBB129_12
# %bb.9:                                # %if.then24.i
	movq	%r15, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB129_18
.LBB129_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%rbx), %rax
.LBB129_12:                             # %if.end
	testq	%rax, %rax
	je	.LBB129_15
# %bb.13:                               # %if.end
	cmpq	%r14, %rax
	je	.LBB129_15
# %bb.14:                               # %if.then6
	leaq	.L.str.25.100(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movl	$-42, %eax
	jmp	.LBB129_18
.LBB129_15:                             # %if.end7
	movq	120(%r14), %rax
	callq	*(%rax)
	movq	120(%r14), %rax
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	*64(%rax)
	movl	%eax, %ebx
	movq	120(%r14), %rax
	callq	*8(%rax)
	testl	%ebx, %ebx
	je	.LBB129_16
# %bb.17:                               # %if.then12
	leaq	.L.str.26.101(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movl	$-16, %eax
	jmp	.LBB129_18
.LBB129_16:
	xorl	%eax, %eax
.LBB129_18:                             # %cleanup14
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end129:
	.size	halide_device_and_host_malloc, .Lfunc_end129-halide_device_and_host_malloc
                                        # -- End function
	.section	.text.halide_device_and_host_free,"ax",@progbits
	.weak	halide_device_and_host_free # -- Begin function halide_device_and_host_free
	.p2align	4, 0x90
	.type	halide_device_and_host_free,@function
halide_device_and_host_free:            # @halide_device_and_host_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r12
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB130_1
# %bb.2:                                # %if.end.i
	movq	(%r12), %rax
	movq	8(%r12), %rbx
	testq	%rbx, %rbx
	jne	.LBB130_5
# %bb.3:                                # %if.end.i
	testq	%rax, %rax
	je	.LBB130_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	jne	.LBB130_19
	jmp	.LBB130_11
.LBB130_1:                              # %if.then.i
	leaq	.L.str.27.102(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB130_19
	jmp	.LBB130_11
.LBB130_5:                              # %if.end10.i
	testq	%rax, %rax
	jne	.LBB130_8
# %bb.6:                                # %if.end10.i
	testq	%rbx, %rbx
	je	.LBB130_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	jne	.LBB130_19
	jmp	.LBB130_11
.LBB130_8:                              # %if.end16.i
	movq	24(%r12), %rax
	andl	$3, %eax
	cmpq	$3, %rax
	jne	.LBB130_12
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB130_19
.LBB130_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%r12), %rbx
.LBB130_12:                             # %if.end
	testq	%rbx, %rbx
	je	.LBB130_16
# %bb.13:                               # %if.then3
	movq	120(%rbx), %rax
	callq	*(%rax)
	movq	120(%rbx), %rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	*72(%rax)
	movl	%eax, %r15d
	movq	120(%rbx), %rax
	callq	*8(%rax)
	cmpq	$0, (%r12)
	je	.LBB130_15
# %bb.14:                               # %if.then8
	leaq	.L.str.28.103(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB130_15:                             # %if.end9
	testl	%r15d, %r15d
	movl	$-18, %eax
	cmovel	%r15d, %eax
	jmp	.LBB130_19
.LBB130_16:                             # %if.else11
	movq	16(%r12), %rsi
	testq	%rsi, %rsi
	je	.LBB130_18
# %bb.17:                               # %if.then13
	movq	%r14, %rdi
	callq	halide_free@PLT
	movq	$0, 16(%r12)
.LBB130_18:                             # %if.end17
	andb	$-3, 24(%r12)
	xorl	%eax, %eax
.LBB130_19:                             # %cleanup18
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end130:
	.size	halide_device_and_host_free, .Lfunc_end130-halide_device_and_host_free
                                        # -- End function
	.section	.text.halide_default_device_and_host_malloc,"ax",@progbits
	.weak	halide_default_device_and_host_malloc # -- Begin function halide_default_device_and_host_malloc
	.p2align	4, 0x90
	.type	halide_default_device_and_host_malloc,@function
halide_default_device_and_host_malloc:  # @halide_default_device_and_host_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB131_1
# %bb.2:                                # %if.end.i
	movq	(%r12), %rcx
	movq	8(%r12), %rax
	testq	%rax, %rax
	jne	.LBB131_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	je	.LBB131_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB131_53
	jmp	.LBB131_11
.LBB131_1:                              # %if.then.i
	leaq	.L.str.29.104(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB131_53
	jmp	.LBB131_11
.LBB131_5:                              # %if.end10.i
	testq	%rcx, %rcx
	jne	.LBB131_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	je	.LBB131_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB131_53
	jmp	.LBB131_11
.LBB131_8:                              # %if.end16.i
	movq	24(%r12), %rax
	andl	$3, %eax
	cmpq	$3, %rax
	jne	.LBB131_11
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB131_53
.LBB131_11:                             # %if.end
	movslq	36(%r12), %r10
	testq	%r10, %r10
	jle	.LBB131_12
# %bb.15:                               # %for.body.lr.ph.i.i
	movq	40(%r12), %r8
	leaq	-1(%r10), %r11
	movl	%r10d, %edi
	andl	$3, %edi
	cmpq	$3, %r11
	jae	.LBB131_30
# %bb.16:
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
	jmp	.LBB131_17
.LBB131_12:                             # %_ZNK15halide_buffer_t3endEv.exit.thread.i
	movb	33(%r12), %r9b
	movl	$1, %r13d
	xorl	%esi, %esi
	jmp	.LBB131_13
.LBB131_30:                             # %for.body.lr.ph.i.i.new
	leaq	56(%r8), %rcx
	movq	%r10, %r9
	subq	%rdi, %r9
	xorl	%ebx, %ebx
	xorl	%r13d, %r13d
	movslq	-48(%rcx), %rsi
	testq	%rsi, %rsi
	jg	.LBB131_32
	jmp	.LBB131_33
	.p2align	4, 0x90
.LBB131_39:                             # %for.inc.i.i.3
                                        #   in Loop: Header=BB131_33 Depth=1
	addq	$4, %rbx
	addq	$64, %rcx
	cmpq	%rbx, %r9
	je	.LBB131_17
# %bb.31:                               # %for.body.i.i
                                        #   in Loop: Header=BB131_33 Depth=1
	movslq	-48(%rcx), %rsi
	testq	%rsi, %rsi
	jle	.LBB131_33
.LBB131_32:                             # %if.then.i.i
	movslq	-52(%rcx), %rdx
	decq	%rdx
	imulq	%rsi, %rdx
	addq	%rdx, %r13
.LBB131_33:                             # %for.inc.i.i
                                        # =>This Inner Loop Header: Depth=1
	movslq	-32(%rcx), %rsi
	testq	%rsi, %rsi
	jle	.LBB131_35
# %bb.34:                               # %if.then.i.i.1
                                        #   in Loop: Header=BB131_33 Depth=1
	movslq	-36(%rcx), %rax
	decq	%rax
	imulq	%rsi, %rax
	addq	%rax, %r13
.LBB131_35:                             # %for.inc.i.i.1
                                        #   in Loop: Header=BB131_33 Depth=1
	movslq	-16(%rcx), %rsi
	testq	%rsi, %rsi
	jle	.LBB131_37
# %bb.36:                               # %if.then.i.i.2
                                        #   in Loop: Header=BB131_33 Depth=1
	movslq	-20(%rcx), %rax
	decq	%rax
	imulq	%rsi, %rax
	addq	%rax, %r13
.LBB131_37:                             # %for.inc.i.i.2
                                        #   in Loop: Header=BB131_33 Depth=1
	movslq	(%rcx), %rsi
	testq	%rsi, %rsi
	jle	.LBB131_39
# %bb.38:                               # %if.then.i.i.3
                                        #   in Loop: Header=BB131_33 Depth=1
	movslq	-4(%rcx), %rax
	decq	%rax
	imulq	%rsi, %rax
	addq	%rax, %r13
	jmp	.LBB131_39
.LBB131_17:                             # %for.body.lr.ph.i5.i.unr-lcssa
	testq	%rdi, %rdi
	je	.LBB131_22
# %bb.18:                               # %for.body.i.i.epil.preheader
	shlq	$4, %rbx
	leaq	(%r8,%rbx), %rcx
	addq	$8, %rcx
	movslq	(%rcx), %rdx
	testq	%rdx, %rdx
	jg	.LBB131_20
	.p2align	4, 0x90
.LBB131_21:                             # %for.inc.i.i.epil
	addq	$16, %rcx
	decq	%rdi
	je	.LBB131_22
.LBB131_19:                             # %for.body.i.i.epil
	movslq	(%rcx), %rdx
	testq	%rdx, %rdx
	jle	.LBB131_21
.LBB131_20:                             # %if.then.i.i.epil
	movslq	-4(%rcx), %rsi
	decq	%rsi
	imulq	%rdx, %rsi
	addq	%rsi, %r13
	addq	$16, %rcx
	decq	%rdi
	jne	.LBB131_19
.LBB131_22:                             # %for.body.lr.ph.i5.i
	movb	33(%r12), %r9b
	movl	%r10d, %edi
	andl	$3, %edi
	cmpq	$3, %r11
	jae	.LBB131_40
# %bb.23:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.LBB131_24
.LBB131_40:                             # %for.body.lr.ph.i5.i.new
	leaq	56(%r8), %rbx
	subq	%rdi, %r10
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	movslq	-48(%rbx), %rdx
	testq	%rdx, %rdx
	jns	.LBB131_43
	jmp	.LBB131_42
	.p2align	4, 0x90
.LBB131_49:                             # %for.inc.i26.i.3
	addq	$4, %rcx
	addq	$64, %rbx
	cmpq	%rcx, %r10
	je	.LBB131_24
# %bb.41:                               # %for.body.i16.i
	movslq	-48(%rbx), %rdx
	testq	%rdx, %rdx
	js	.LBB131_42
.LBB131_43:                             # %for.inc.i26.i
	movslq	-32(%rbx), %rdx
	testq	%rdx, %rdx
	js	.LBB131_44
.LBB131_45:                             # %for.inc.i26.i.1
	movslq	-16(%rbx), %rdx
	testq	%rdx, %rdx
	js	.LBB131_46
.LBB131_47:                             # %for.inc.i26.i.2
	movslq	(%rbx), %rdx
	testq	%rdx, %rdx
	jns	.LBB131_49
	jmp	.LBB131_48
	.p2align	4, 0x90
.LBB131_42:                             # %if.then.i22.i
	movslq	-52(%rbx), %rax
	decq	%rax
	imulq	%rdx, %rax
	addq	%rax, %rsi
	movslq	-32(%rbx), %rdx
	testq	%rdx, %rdx
	jns	.LBB131_45
.LBB131_44:                             # %if.then.i22.i.1
	movslq	-36(%rbx), %rax
	decq	%rax
	imulq	%rdx, %rax
	addq	%rax, %rsi
	movslq	-16(%rbx), %rdx
	testq	%rdx, %rdx
	jns	.LBB131_47
.LBB131_46:                             # %if.then.i22.i.2
	movslq	-20(%rbx), %rax
	decq	%rax
	imulq	%rdx, %rax
	addq	%rax, %rsi
	movslq	(%rbx), %rdx
	testq	%rdx, %rdx
	jns	.LBB131_49
.LBB131_48:                             # %if.then.i22.i.3
	movslq	-4(%rbx), %rax
	decq	%rax
	imulq	%rdx, %rax
	addq	%rax, %rsi
	jmp	.LBB131_49
.LBB131_24:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa
	testq	%rdi, %rdi
	je	.LBB131_29
# %bb.25:                               # %for.body.i16.i.epil.preheader
	shlq	$4, %rcx
	addq	%r8, %rcx
	addq	$8, %rcx
	movslq	(%rcx), %rdx
	testq	%rdx, %rdx
	js	.LBB131_27
	.p2align	4, 0x90
.LBB131_28:                             # %for.inc.i26.i.epil
	addq	$16, %rcx
	decq	%rdi
	je	.LBB131_29
.LBB131_26:                             # %for.body.i16.i.epil
	movslq	(%rcx), %rdx
	testq	%rdx, %rdx
	jns	.LBB131_28
.LBB131_27:                             # %if.then.i22.i.epil
	movslq	-4(%rcx), %rax
	decq	%rax
	imulq	%rdx, %rax
	addq	%rax, %rsi
	addq	$16, %rcx
	decq	%rdi
	jne	.LBB131_26
.LBB131_29:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	incq	%r13
.LBB131_13:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	subq	%rsi, %r13
	movzbl	%r9b, %esi
	addq	$7, %rsi
	shrq	$3, %rsi
	imulq	%r13, %rsi
	movq	%r14, %rdi
	callq	halide_malloc@PLT
	movq	%rax, 16(%r12)
	testq	%rax, %rax
	je	.LBB131_14
# %bb.50:                               # %if.end6
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	halide_device_malloc@PLT
	testl	%eax, %eax
	je	.LBB131_51
# %bb.52:                               # %if.then9
	movl	%eax, %ebx
	movq	16(%r12), %rsi
	movq	%r14, %rdi
	callq	halide_free@PLT
	movq	$0, 16(%r12)
	jmp	.LBB131_53
.LBB131_14:
	movl	$-1, %ebx
	jmp	.LBB131_53
.LBB131_51:
	xorl	%ebx, %ebx
.LBB131_53:                             # %cleanup13
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end131:
	.size	halide_default_device_and_host_malloc, .Lfunc_end131-halide_default_device_and_host_malloc
                                        # -- End function
	.section	.text.halide_default_device_and_host_free,"ax",@progbits
	.weak	halide_default_device_and_host_free # -- Begin function halide_default_device_and_host_free
	.p2align	4, 0x90
	.type	halide_default_device_and_host_free,@function
halide_default_device_and_host_free:    # @halide_default_device_and_host_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %r15
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB132_1
# %bb.2:                                # %if.end.i
	movq	(%r15), %rcx
	movq	8(%r15), %rax
	testq	%rax, %rax
	jne	.LBB132_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	je	.LBB132_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB132_14
	jmp	.LBB132_11
.LBB132_1:                              # %if.then.i
	leaq	.L.str.30.105(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB132_14
	jmp	.LBB132_11
.LBB132_5:                              # %if.end10.i
	testq	%rcx, %rcx
	jne	.LBB132_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	je	.LBB132_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB132_14
	jmp	.LBB132_11
.LBB132_8:                              # %if.end16.i
	movq	24(%r15), %rax
	andl	$3, %eax
	cmpq	$3, %rax
	jne	.LBB132_11
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB132_14
.LBB132_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	halide_device_free@PLT
	movl	%eax, %ebx
	movq	16(%r15), %rsi
	testq	%rsi, %rsi
	je	.LBB132_13
# %bb.12:                               # %if.then2
	movq	%r14, %rdi
	callq	halide_free@PLT
	movq	$0, 16(%r15)
.LBB132_13:                             # %if.end5
	andb	$-4, 24(%r15)
.LBB132_14:                             # %cleanup
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end132:
	.size	halide_default_device_and_host_free, .Lfunc_end132-halide_default_device_and_host_free
                                        # -- End function
	.section	.text.halide_device_wrap_native,"ax",@progbits
	.weak	halide_device_wrap_native # -- Begin function halide_device_wrap_native
	.p2align	4, 0x90
	.type	halide_device_wrap_native,@function
halide_device_wrap_native:              # @halide_device_wrap_native
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rcx, %r15
	movq	%rdx, %r14
	movq	%rsi, %rbx
	movq	%rdi, %r12
	testq	%rsi, %rsi
	je	.LBB133_1
# %bb.2:                                # %if.end.i
	movq	(%rbx), %rcx
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.LBB133_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	je	.LBB133_5
# %bb.4:                                # %if.then8.i
	movq	%r12, %rdi
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	jne	.LBB133_16
	jmp	.LBB133_11
.LBB133_1:                              # %if.then.i
	leaq	.L.str.31.106(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB133_16
	jmp	.LBB133_11
.LBB133_5:                              # %if.end10.i
	testq	%rcx, %rcx
	jne	.LBB133_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	je	.LBB133_8
# %bb.7:                                # %if.then14.i
	movq	%r12, %rdi
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	jne	.LBB133_16
	jmp	.LBB133_11
.LBB133_8:                              # %if.end16.i
	movq	24(%rbx), %rcx
	andl	$3, %ecx
	cmpq	$3, %rcx
	jne	.LBB133_12
# %bb.9:                                # %if.then24.i
	movq	%r12, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB133_16
.LBB133_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%rbx), %rax
.LBB133_12:                             # %if.end
	testq	%rax, %rax
	je	.LBB133_15
# %bb.13:                               # %if.end
	cmpq	%r15, %rax
	je	.LBB133_15
# %bb.14:                               # %if.then4
	leaq	.L.str.32.107(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_error@PLT
	movl	$-42, %eax
	jmp	.LBB133_16
.LBB133_15:                             # %if.end5
	movq	120(%r15), %rax
	callq	*(%rax)
	movq	%r15, 8(%rbx)
	movq	120(%r15), %rax
	movq	%r12, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	*112(%rax)
	movl	%eax, %ebx
	movq	120(%r15), %rax
	callq	*8(%rax)
	xorl	%eax, %eax
	testl	%ebx, %ebx
	sete	%al
	shll	$4, %eax
	addl	$-16, %eax
.LBB133_16:                             # %cleanup12
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end133:
	.size	halide_device_wrap_native, .Lfunc_end133-halide_device_wrap_native
                                        # -- End function
	.section	.text.halide_device_detach_native,"ax",@progbits
	.weak	halide_device_detach_native # -- Begin function halide_device_detach_native
	.p2align	4, 0x90
	.type	halide_device_detach_native,@function
halide_device_detach_native:            # @halide_device_detach_native
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r12
	movq	%rdi, %r14
	testq	%rsi, %rsi
	je	.LBB134_1
# %bb.2:                                # %if.end.i
	movq	(%r12), %rax
	movq	8(%r12), %rbx
	testq	%rbx, %rbx
	jne	.LBB134_5
# %bb.3:                                # %if.end.i
	testq	%rax, %rax
	je	.LBB134_5
# %bb.4:                                # %if.then8.i
	movq	%r14, %rdi
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	jne	.LBB134_17
	jmp	.LBB134_11
.LBB134_1:                              # %if.then.i
	leaq	.L.str.33.108(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB134_17
	jmp	.LBB134_11
.LBB134_5:                              # %if.end10.i
	testq	%rax, %rax
	jne	.LBB134_8
# %bb.6:                                # %if.end10.i
	testq	%rbx, %rbx
	je	.LBB134_8
# %bb.7:                                # %if.then14.i
	movq	%r14, %rdi
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	jne	.LBB134_17
	jmp	.LBB134_11
.LBB134_8:                              # %if.end16.i
	movq	24(%r12), %rax
	andl	$3, %eax
	cmpq	$3, %rax
	jne	.LBB134_12
# %bb.9:                                # %if.then24.i
	movq	%r14, %rdi
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB134_17
.LBB134_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%r12), %rbx
.LBB134_12:                             # %if.end
	testq	%rbx, %rbx
	je	.LBB134_13
# %bb.14:                               # %if.then3
	movq	120(%rbx), %rax
	callq	*(%rax)
	movq	120(%rbx), %rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	*120(%rax)
	movl	%eax, %r15d
	movq	120(%rbx), %rax
	callq	*8(%rax)
	cmpq	$0, (%r12)
	je	.LBB134_16
# %bb.15:                               # %if.then8
	leaq	.L.str.34.109(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB134_16:                             # %if.end9
	testl	%r15d, %r15d
	movl	$-33, %eax
	cmovel	%r15d, %eax
	jmp	.LBB134_17
.LBB134_13:
	xorl	%eax, %eax
.LBB134_17:                             # %cleanup
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end134:
	.size	halide_device_detach_native, .Lfunc_end134-halide_device_detach_native
                                        # -- End function
	.section	.text.halide_default_device_wrap_native,"ax",@progbits
	.weak	halide_default_device_wrap_native # -- Begin function halide_default_device_wrap_native
	.p2align	4, 0x90
	.type	halide_default_device_wrap_native,@function
halide_default_device_wrap_native:      # @halide_default_device_wrap_native
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdx, %r14
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	je	.LBB135_1
# %bb.2:                                # %if.end.i
	movq	(%rbx), %rcx
	movq	8(%rbx), %rax
	testq	%rax, %rax
	jne	.LBB135_5
# %bb.3:                                # %if.end.i
	testq	%rcx, %rcx
	je	.LBB135_5
# %bb.4:                                # %if.then8.i
	callq	halide_error_no_device_interface@PLT
	testl	%eax, %eax
	je	.LBB135_11
.LBB135_13:                             # %cleanup
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.LBB135_1:                              # %if.then.i
	leaq	.L.str.35.110(%rip), %rsi
	callq	halide_error_buffer_is_null@PLT
	testl	%eax, %eax
	jne	.LBB135_13
	jmp	.LBB135_11
.LBB135_5:                              # %if.end10.i
	testq	%rcx, %rcx
	jne	.LBB135_8
# %bb.6:                                # %if.end10.i
	testq	%rax, %rax
	je	.LBB135_8
# %bb.7:                                # %if.then14.i
	callq	halide_error_device_interface_no_device@PLT
	testl	%eax, %eax
	jne	.LBB135_13
	jmp	.LBB135_11
.LBB135_8:                              # %if.end16.i
	movq	24(%rbx), %rcx
	andl	$3, %ecx
	cmpq	$3, %rcx
	jne	.LBB135_12
# %bb.9:                                # %if.then24.i
	callq	halide_error_host_and_device_dirty@PLT
	testl	%eax, %eax
	jne	.LBB135_13
.LBB135_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	8(%rbx), %rax
.LBB135_12:                             # %if.end
	movq	120(%rax), %rax
	callq	*(%rax)
	movq	%r14, (%rbx)
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end135:
	.size	halide_default_device_wrap_native, .Lfunc_end135-halide_default_device_wrap_native
                                        # -- End function
	.section	.text.halide_default_device_detach_native,"ax",@progbits
	.weak	halide_default_device_detach_native # -- Begin function halide_default_device_detach_native
	.p2align	4, 0x90
	.type	halide_default_device_detach_native,@function
halide_default_device_detach_native:    # @halide_default_device_detach_native
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rsi, %r14
	testq	%rsi, %rsi
	je	.LBB136_1
# %bb.2:                                # %if.end.i
	movq	(%r14), %rax
	movq	8(%r14), %rcx
	testq	%rcx, %rcx
	jne	.LBB136_5
# %bb.3:                                # %if.end.i
	testq	%rax, %rax
	je	.LBB136_5
# %bb.4:                                # %if.then8.i
	callq	halide_error_no_device_interface@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB136_14
	jmp	.LBB136_11
.LBB136_1:                              # %if.then.i
	leaq	.L.str.36(%rip), %rsi
	callq	halide_error_buffer_is_null@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB136_14
	jmp	.LBB136_11
.LBB136_5:                              # %if.end10.i
	testq	%rax, %rax
	jne	.LBB136_8
# %bb.6:                                # %if.end10.i
	testq	%rcx, %rcx
	je	.LBB136_8
# %bb.7:                                # %if.then14.i
	callq	halide_error_device_interface_no_device@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB136_14
	jmp	.LBB136_11
.LBB136_8:                              # %if.end16.i
	movq	24(%r14), %rcx
	andl	$3, %ecx
	cmpq	$3, %rcx
	jne	.LBB136_12
# %bb.9:                                # %if.then24.i
	callq	halide_error_host_and_device_dirty@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB136_14
.LBB136_11:                             # %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	movq	(%r14), %rax
.LBB136_12:                             # %if.end
	xorl	%ebx, %ebx
	testq	%rax, %rax
	je	.LBB136_14
# %bb.13:                               # %if.end3
	movq	8(%r14), %rax
	movq	120(%rax), %rax
	callq	*8(%rax)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, (%r14)
.LBB136_14:                             # %cleanup
	movl	%ebx, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end136:
	.size	halide_default_device_detach_native, .Lfunc_end136-halide_default_device_detach_native
                                        # -- End function
	.section	.text.halide_device_and_host_free_as_destructor,"ax",@progbits
	.weak	halide_device_and_host_free_as_destructor # -- Begin function halide_device_and_host_free_as_destructor
	.p2align	4, 0x90
	.type	halide_device_and_host_free_as_destructor,@function
halide_device_and_host_free_as_destructor: # @halide_device_and_host_free_as_destructor
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	halide_device_and_host_free@PLT # TAILCALL
.Lfunc_end137:
	.size	halide_device_and_host_free_as_destructor, .Lfunc_end137-halide_device_and_host_free_as_destructor
                                        # -- End function
	.section	.text.halide_device_host_nop_free,"ax",@progbits
	.weak	halide_device_host_nop_free # -- Begin function halide_device_host_nop_free
	.p2align	4, 0x90
	.type	halide_device_host_nop_free,@function
halide_device_host_nop_free:            # @halide_device_host_nop_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	retq
.Lfunc_end138:
	.size	halide_device_host_nop_free, .Lfunc_end138-halide_device_host_nop_free
                                        # -- End function
	.section	.text.halide_default_buffer_copy,"ax",@progbits
	.weak	halide_default_buffer_copy # -- Begin function halide_default_buffer_copy
	.p2align	4, 0x90
	.type	halide_default_buffer_copy,@function
halide_default_buffer_copy:             # @halide_default_buffer_copy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$-39, %eax
	popq	%rbp
	retq
.Lfunc_end139:
	.size	halide_default_buffer_copy, .Lfunc_end139-halide_default_buffer_copy
                                        # -- End function
	.section	.text.halide_buffer_copy_already_locked,"ax",@progbits
	.weak	halide_buffer_copy_already_locked # -- Begin function halide_buffer_copy_already_locked
	.p2align	4, 0x90
	.type	halide_buffer_copy_already_locked,@function
halide_buffer_copy_already_locked:      # @halide_buffer_copy_already_locked
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$456, %rsp              # imm = 0x1C8
	movq	%rdx, %rbx
	movq	%rsi, -56(%rbp)         # 8-byte Spill
	testq	%rdx, %rdx
	je	.LBB140_6
# %bb.1:                                # %land.lhs.true
	movq	8(%rcx), %rax
	testq	%rax, %rax
	je	.LBB140_4
# %bb.2:                                # %land.lhs.true
	cmpq	%rbx, %rax
	je	.LBB140_4
# %bb.3:                                # %if.then
	leaq	.L.str.42(%rip), %rsi
	callq	halide_error@PLT
	movl	$-42, %eax
	jmp	.LBB140_39
.LBB140_4:                              # %land.lhs.true5
	cmpq	$0, (%rcx)
	je	.LBB140_5
.LBB140_6:                              # %if.end13
	movq	-56(%rbp), %rax         # 8-byte Reload
	cmpq	$0, (%rax)
	movq	16(%rax), %rax
	je	.LBB140_10
# %bb.7:                                # %land.rhs
	testq	%rax, %rax
	je	.LBB140_8
# %bb.9:                                # %land.end.thread
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	24(%rax), %rax
	movl	%eax, %r8d
	andb	$1, %r8b
	testq	%rbx, %rbx
	sete	%sil
	movb	$1, %r14b
	testb	$2, %al
	jne	.LBB140_15
.LBB140_14:
	xorl	%r9d, %r9d
	jmp	.LBB140_16
.LBB140_10:                             # %land.end
	testq	%rbx, %rbx
	sete	%sil
	testq	%rax, %rax
	je	.LBB140_11
# %bb.12:                               # %land.end.land.rhs26_crit_edge
	movq	-56(%rbp), %rax         # 8-byte Reload
	movq	24(%rax), %rax
	movb	$1, %r8b
	movb	$1, %r14b
	testb	$2, %al
	je	.LBB140_14
.LBB140_15:                             # %lor.rhs28
	movq	-56(%rbp), %rax         # 8-byte Reload
	cmpq	$0, 8(%rax)
	setne	%r9b
	jmp	.LBB140_16
.LBB140_8:                              # %land.end.thread259
	testq	%rbx, %rbx
	sete	%sil
	movb	$1, %r9b
	xorl	%r14d, %r14d
	xorl	%r8d, %r8d
	jmp	.LBB140_16
.LBB140_5:                              # %if.then7
	movq	%rdi, %r15
	movq	%rcx, %rsi
	movq	%rbx, %rdx
	movq	%rcx, %r14
	callq	halide_device_malloc@PLT
	movq	%r15, %rdi
	movq	%r14, %rcx
	testl	%eax, %eax
	jne	.LBB140_39
	jmp	.LBB140_6
.LBB140_11:
	movb	$1, %r8b
	xorl	%r14d, %r14d
	movb	$1, %r9b
.LBB140_16:                             # %land.end32
	movq	16(%rcx), %r13
	movl	%esi, %r15d
	xorb	$1, %r15b
	testq	%r13, %r13
	jne	.LBB140_18
# %bb.17:                               # %land.end32
	movl	$-34, %eax
	testb	%r15b, %r15b
	je	.LBB140_39
.LBB140_18:                             # %if.end41
	testq	%rbx, %rbx
	sete	%al
	orb	%r8b, %al
	jne	.LBB140_20
# %bb.19:                               # %if.end49
	movq	120(%rbx), %rax
	movq	%rdi, %r12
	movb	%sil, -41(%rbp)         # 1-byte Spill
	movq	-56(%rbp), %rsi         # 8-byte Reload
	movq	%rbx, %rdx
	movq	%rcx, -64(%rbp)         # 8-byte Spill
	movl	%r8d, -72(%rbp)         # 4-byte Spill
	movl	%r9d, -68(%rbp)         # 4-byte Spill
	callq	*80(%rax)
	movl	-68(%rbp), %r9d         # 4-byte Reload
	movl	-72(%rbp), %r8d         # 4-byte Reload
	movb	-41(%rbp), %sil         # 1-byte Reload
	movq	%r12, %rdi
	movq	-64(%rbp), %rcx         # 8-byte Reload
	cmpl	$-42, %eax
	jne	.LBB140_33
.LBB140_20:                             # %if.then51
	testq	%r13, %r13
	sete	%dl
	notb	%r14b
	movl	$-42, %eax
	testb	%dl, %r14b
	jne	.LBB140_39
# %bb.21:                               # %if.end58
	movq	%rdi, -64(%rbp)         # 8-byte Spill
	orb	%r15b, %r9b
	je	.LBB140_22
# %bb.23:                               # %if.else
	testb	%sil, %sil
	je	.LBB140_27
# %bb.24:                               # %if.then64
	movq	-56(%rbp), %rsi         # 8-byte Reload
	movq	8(%rsi), %rax
	movq	120(%rax), %rax
	movq	-64(%rbp), %rdi         # 8-byte Reload
	xorl	%edx, %edx
	movq	%rcx, %r14
	callq	*80(%rax)
	movq	%r14, %rcx
	cmpl	$-42, %eax
	jne	.LBB140_33
# %bb.25:                               # %if.then72
	movq	-64(%rbp), %rdi         # 8-byte Reload
	movq	-56(%rbp), %rsi         # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t@PLT
	movq	-64(%rbp), %rdi         # 8-byte Reload
	testl	%eax, %eax
	jne	.LBB140_39
# %bb.26:                               # %if.then75
	movq	%r14, %rcx
	movq	-56(%rbp), %rsi         # 8-byte Reload
	xorl	%edx, %edx
	callq	halide_buffer_copy_already_locked@PLT
	jmp	.LBB140_32
.LBB140_22:                             # %if.end109.thread249
	leaq	-488(%rbp), %r13
	movq	%r13, %rdi
	movq	-56(%rbp), %rsi         # 8-byte Reload
	movl	$1, %edx
	movq	%rcx, %r14
	movl	$1, %r8d
	callq	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b@PLT
	movq	%r13, %rdi
	movq	-64(%rbp), %rsi         # 8-byte Reload
	callq	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv@PLT
	movq	%r14, %rcx
	xorl	%eax, %eax
	cmpq	-56(%rbp), %rcx         # 8-byte Folded Reload
	jne	.LBB140_35
	jmp	.LBB140_39
.LBB140_27:                             # %if.else79
	testq	%r13, %r13
	sete	%al
	orb	%al, %r8b
	je	.LBB140_28
# %bb.30:                               # %if.else96
	movq	-64(%rbp), %r15         # 8-byte Reload
	movq	%r15, %rdi
	movq	-56(%rbp), %rsi         # 8-byte Reload
	movq	%rcx, %r14
	callq	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t@PLT
	testl	%eax, %eax
	jne	.LBB140_39
# %bb.31:                               # %if.then101
	movq	%r14, %rcx
	movq	120(%rbx), %rax
	movq	%r15, %rdi
	movq	-56(%rbp), %rsi         # 8-byte Reload
	movq	%rbx, %rdx
	callq	*80(%rax)
	jmp	.LBB140_32
.LBB140_28:                             # %if.then83
	movq	-56(%rbp), %rsi         # 8-byte Reload
	movq	8(%rsi), %rax
	movq	120(%rax), %rax
	movq	-64(%rbp), %r15         # 8-byte Reload
	movq	%r15, %rdi
	xorl	%edx, %edx
	movq	%rcx, %r14
	callq	*80(%rax)
	testl	%eax, %eax
	jne	.LBB140_39
# %bb.29:                               # %if.then93
	movq	%r14, %rsi
	orb	$1, 24(%r14)
	movq	%r15, %rdi
	movq	%rbx, %rdx
	callq	copy_to_device_already_locked@PLT
.LBB140_32:                             # %if.end109
	movq	%r14, %rcx
.LBB140_33:                             # %if.end109
	testl	%eax, %eax
	jne	.LBB140_39
# %bb.34:                               # %land.lhs.true118
	xorl	%eax, %eax
	cmpq	-56(%rbp), %rcx         # 8-byte Folded Reload
	je	.LBB140_39
.LBB140_35:                             # %if.then120
	movq	24(%rcx), %rdx
	andq	$-4, %rdx
	testq	%rbx, %rbx
	je	.LBB140_37
# %bb.36:                               # %if.then122
	orq	$2, %rdx
	jmp	.LBB140_38
.LBB140_37:                             # %if.else125
	orq	$1, %rdx
.LBB140_38:                             # %cleanup135
	movq	%rdx, 24(%rcx)
.LBB140_39:                             # %cleanup135
	addq	$456, %rsp              # imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end140:
	.size	halide_buffer_copy_already_locked, .Lfunc_end140-halide_buffer_copy_already_locked
                                        # -- End function
	.section	.text.halide_buffer_copy,"ax",@progbits
	.weak	halide_buffer_copy      # -- Begin function halide_buffer_copy
	.p2align	4, 0x90
	.type	halide_buffer_copy,@function
halide_buffer_copy:                     # @halide_buffer_copy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rcx, %r15
	movq	%rdx, %rbx
	movq	%rsi, %r14
	movq	%rdi, %r12
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	testq	%rbx, %rbx
	je	.LBB141_2
# %bb.1:                                # %if.then
	movq	120(%rbx), %rax
	callq	*(%rax)
.LBB141_2:                              # %if.end
	movq	8(%r14), %rax
	testq	%rax, %rax
	je	.LBB141_4
# %bb.3:                                # %if.then12
	movq	120(%rax), %rax
	callq	*(%rax)
.LBB141_4:                              # %if.end16
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	movq	%r15, %rcx
	callq	halide_buffer_copy_already_locked@PLT
	movl	%eax, %r15d
	testq	%rbx, %rbx
	je	.LBB141_6
# %bb.5:                                # %if.then18
	movq	120(%rbx), %rax
	callq	*8(%rax)
.LBB141_6:                              # %if.end20
	movq	8(%r14), %rax
	testq	%rax, %rax
	je	.LBB141_8
# %bb.7:                                # %if.then23
	movq	120(%rax), %rax
	callq	*8(%rax)
.LBB141_8:                              # %if.end27
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	movl	%r15d, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end141:
	.size	halide_buffer_copy, .Lfunc_end141-halide_buffer_copy
                                        # -- End function
	.section	.text.halide_default_device_crop,"ax",@progbits
	.weak	halide_default_device_crop # -- Begin function halide_default_device_crop
	.p2align	4, 0x90
	.type	halide_default_device_crop,@function
halide_default_device_crop:             # @halide_default_device_crop
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.58.111(%rip), %rsi
	callq	halide_error@PLT
	movl	$-40, %eax
	popq	%rbp
	retq
.Lfunc_end142:
	.size	halide_default_device_crop, .Lfunc_end142-halide_default_device_crop
                                        # -- End function
	.section	.text.halide_default_device_slice,"ax",@progbits
	.weak	halide_default_device_slice # -- Begin function halide_default_device_slice
	.p2align	4, 0x90
	.type	halide_default_device_slice,@function
halide_default_device_slice:            # @halide_default_device_slice
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.59(%rip), %rsi
	callq	halide_error@PLT
	movl	$-40, %eax
	popq	%rbp
	retq
.Lfunc_end143:
	.size	halide_default_device_slice, .Lfunc_end143-halide_default_device_slice
                                        # -- End function
	.section	.text.halide_device_crop,"ax",@progbits
	.weak	halide_device_crop      # -- Begin function halide_device_crop
	.p2align	4, 0x90
	.type	halide_device_crop,@function
halide_device_crop:                     # @halide_device_crop
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r15
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	cmpq	$0, (%rbx)
	je	.LBB144_1
# %bb.2:                                # %if.end
	cmpq	$0, (%r15)
	je	.LBB144_5
# %bb.3:                                # %if.then3
	leaq	.L.str.60(%rip), %rsi
	jmp	.LBB144_4
.LBB144_1:
	xorl	%ebx, %ebx
	jmp	.LBB144_8
.LBB144_5:                              # %if.end4
	movl	36(%rbx), %eax
	cmpl	36(%r15), %eax
	jne	.LBB144_6
# %bb.7:                                # %if.end7
	movq	8(%rbx), %rax
	movq	120(%rax), %rax
	callq	*(%rax)
	movq	8(%rbx), %rax
	movq	120(%rax), %rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	callq	*88(%rax)
	movl	%eax, %ebx
	jmp	.LBB144_8
.LBB144_6:                              # %if.then6
	leaq	.L.str.61(%rip), %rsi
.LBB144_4:                              # %cleanup
	movq	%r14, %rdi
	callq	halide_error@PLT
	movl	$-41, %ebx
.LBB144_8:                              # %cleanup
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end144:
	.size	halide_device_crop, .Lfunc_end144-halide_device_crop
                                        # -- End function
	.section	.text.halide_device_slice,"ax",@progbits
	.weak	halide_device_slice     # -- Begin function halide_device_slice
	.p2align	4, 0x90
	.type	halide_device_slice,@function
halide_device_slice:                    # @halide_device_slice
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%r8, %r13
	movl	%ecx, %r15d
	movl	%edx, %r12d
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	cmpq	$0, (%rbx)
	je	.LBB145_1
# %bb.2:                                # %if.end
	cmpq	$0, (%r13)
	je	.LBB145_5
# %bb.3:                                # %if.then3
	leaq	.L.str.60(%rip), %rsi
	jmp	.LBB145_4
.LBB145_1:
	xorl	%ebx, %ebx
	jmp	.LBB145_8
.LBB145_5:                              # %if.end4
	movl	36(%r13), %eax
	incl	%eax
	cmpl	%eax, 36(%rbx)
	jne	.LBB145_6
# %bb.7:                                # %if.end7
	movq	8(%rbx), %rax
	movq	120(%rax), %rax
	callq	*(%rax)
	movq	8(%rbx), %rax
	movq	120(%rax), %rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movl	%r12d, %edx
	movl	%r15d, %ecx
	movq	%r13, %r8
	callq	*96(%rax)
	movl	%eax, %ebx
	jmp	.LBB145_8
.LBB145_6:                              # %if.then6
	leaq	.L.str.64(%rip), %rsi
.LBB145_4:                              # %cleanup
	movq	%r14, %rdi
	callq	halide_error@PLT
	movl	$-41, %ebx
.LBB145_8:                              # %cleanup
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end145:
	.size	halide_device_slice, .Lfunc_end145-halide_device_slice
                                        # -- End function
	.section	.text.halide_default_device_release_crop,"ax",@progbits
	.weak	halide_default_device_release_crop # -- Begin function halide_default_device_release_crop
	.p2align	4, 0x90
	.type	halide_default_device_release_crop,@function
halide_default_device_release_crop:     # @halide_default_device_release_crop
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	cmpq	$0, (%rsi)
	je	.LBB146_1
# %bb.2:                                # %if.end
	leaq	.L.str.58.111(%rip), %rsi
	callq	halide_error@PLT
	movl	$-40, %eax
	popq	%rbp
	retq
.LBB146_1:
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end146:
	.size	halide_default_device_release_crop, .Lfunc_end146-halide_default_device_release_crop
                                        # -- End function
	.section	.text.halide_device_release_crop,"ax",@progbits
	.weak	halide_device_release_crop # -- Begin function halide_device_release_crop
	.p2align	4, 0x90
	.type	halide_device_release_crop,@function
halide_device_release_crop:             # @halide_device_release_crop
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	cmpq	$0, (%rsi)
	je	.LBB147_2
# %bb.1:                                # %if.then
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	_ZN6Halide7Runtime8Internal17device_copy_mutexE@GOTPCREL(%rip), %r15
	movq	%r15, %rdi
	callq	halide_mutex_lock@PLT
	movq	8(%rbx), %r12
	movq	120(%r12), %rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	*104(%rax)
	movl	%eax, %r14d
	movq	$0, (%rbx)
	movq	120(%r12), %rax
	callq	*8(%rax)
	movq	$0, 8(%rbx)
	movq	%r15, %rdi
	callq	halide_mutex_unlock@PLT
	movl	%r14d, %eax
	jmp	.LBB147_3
.LBB147_2:                              # %return
	xorl	%eax, %eax
.LBB147_3:                              # %return
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end147:
	.size	halide_device_release_crop, .Lfunc_end147-halide_device_release_crop
                                        # -- End function
	.section	.text.halide_float16_bits_to_float,"ax",@progbits
	.weak	halide_float16_bits_to_float # -- Begin function halide_float16_bits_to_float
	.p2align	4, 0x90
	.type	halide_float16_bits_to_float,@function
halide_float16_bits_to_float:           # @halide_float16_bits_to_float
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, %eax
	shll	$16, %eax
	andl	$-2147483648, %eax      # imm = 0x80000000
	movl	%edi, %ecx
	shrl	$10, %ecx
	andl	$31, %ecx
	andl	$1023, %edi             # imm = 0x3FF
	je	.LBB148_3
# %bb.1:                                # %entry
	testl	%ecx, %ecx
	jne	.LBB148_3
# %bb.2:                                # %if.then
	xorl	%ecx, %ecx
	lzcntl	%edi, %ecx
	xorl	$31, %ecx
	btrl	%ecx, %edi
	movb	$23, %dl
	subb	%cl, %dl
	shlxl	%edx, %edi, %edx
	shll	$23, %ecx
	addl	$864026624, %ecx        # imm = 0x33800000
	movl	%ecx, %edi
	jmp	.LBB148_7
.LBB148_3:                              # %if.else
	shll	$13, %edi
	testl	%ecx, %ecx
	je	.LBB148_4
# %bb.5:                                # %if.else18
	movl	$2139095040, %edx       # imm = 0x7F800000
	cmpl	$31, %ecx
	je	.LBB148_7
# %bb.6:                                # %if.else21
	shll	$23, %ecx
	addl	$939524096, %ecx        # imm = 0x38000000
	movl	%ecx, %edx
	jmp	.LBB148_7
.LBB148_4:
	xorl	%edx, %edx
.LBB148_7:                              # %if.end28
	orl	%eax, %edi
	orl	%edx, %edi
	vmovd	%edi, %xmm0
	popq	%rbp
	retq
.Lfunc_end148:
	.size	halide_float16_bits_to_float, .Lfunc_end148-halide_float16_bits_to_float
                                        # -- End function
	.section	.text.halide_float16_bits_to_double,"ax",@progbits
	.weak	halide_float16_bits_to_double # -- Begin function halide_float16_bits_to_double
	.p2align	4, 0x90
	.type	halide_float16_bits_to_double,@function
halide_float16_bits_to_double:          # @halide_float16_bits_to_double
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	callq	halide_float16_bits_to_float@PLT
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	popq	%rbp
	retq
.Lfunc_end149:
	.size	halide_float16_bits_to_double, .Lfunc_end149-halide_float16_bits_to_double
                                        # -- End function
	.section	.text.halide_error_bounds_inference_call_failed,"ax",@progbits
	.weak	halide_error_bounds_inference_call_failed # -- Begin function halide_error_bounds_inference_call_failed
	.p2align	4, 0x90
	.type	halide_error_bounds_inference_call_failed,@function
halide_error_bounds_inference_call_failed: # @halide_error_bounds_inference_call_failed
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%edx, %r14d
	movq	%rsi, %r13
	movq	%rdi, %r15
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB150_1
# %bb.2:                                # %if.then.i
	leaq	1023(%rbx), %r12
	movb	$0, 1023(%rbx)
	leaq	.L.str.114(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB150_4
.LBB150_5:                              # %if.else.i13
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r13, %rdx
	jmp	.LBB150_6
.LBB150_1:                              # %entry.split
	leaq	.L.str.114(%rip), %rdx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	jne	.LBB150_5
.LBB150_4:                              # %if.then.i11
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
.LBB150_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.1.115(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r14d, %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB150_7
# %bb.8:                                # %if.else.i25
	subq	%rbx, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB150_9
.LBB150_7:                              # %if.then.i24
	leaq	.L.str.111(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
.LBB150_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	%r14d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end150:
	.size	halide_error_bounds_inference_call_failed, .Lfunc_end150-halide_error_bounds_inference_call_failed
                                        # -- End function
	.section	.text.halide_error_extern_stage_failed,"ax",@progbits
	.weak	halide_error_extern_stage_failed # -- Begin function halide_error_extern_stage_failed
	.p2align	4, 0x90
	.type	halide_error_extern_stage_failed,@function
halide_error_extern_stage_failed:       # @halide_error_extern_stage_failed
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%edx, %r14d
	movq	%rsi, %r13
	movq	%rdi, %r15
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB151_1
# %bb.2:                                # %if.then.i
	leaq	1023(%rbx), %r12
	movb	$0, 1023(%rbx)
	leaq	.L.str.2.116(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB151_4
.LBB151_5:                              # %if.else.i13
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r13, %rdx
	jmp	.LBB151_6
.LBB151_1:                              # %entry.split
	leaq	.L.str.2.116(%rip), %rdx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	jne	.LBB151_5
.LBB151_4:                              # %if.then.i11
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
.LBB151_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.1.115(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r14d, %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB151_7
# %bb.8:                                # %if.else.i25
	subq	%rbx, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB151_9
.LBB151_7:                              # %if.then.i24
	leaq	.L.str.111(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
.LBB151_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	%r14d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end151:
	.size	halide_error_extern_stage_failed, .Lfunc_end151-halide_error_extern_stage_failed
                                        # -- End function
	.section	.text.halide_error_explicit_bounds_too_small,"ax",@progbits
	.weak	halide_error_explicit_bounds_too_small # -- Begin function halide_error_explicit_bounds_too_small
	.p2align	4, 0x90
	.type	halide_error_explicit_bounds_too_small,@function
halide_error_explicit_bounds_too_small: # @halide_error_explicit_bounds_too_small
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movl	%r9d, -52(%rbp)         # 4-byte Spill
	movl	%r8d, -48(%rbp)         # 4-byte Spill
	movl	%ecx, -44(%rbp)         # 4-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r13
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.LBB152_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r15), %rbx
	movb	$0, 1023(%r15)
	leaq	.L.str.3.117(%rip), %rdx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB152_4
.LBB152_5:                              # %if.else.i21
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	jmp	.LBB152_6
.LBB152_1:                              # %entry.split
	leaq	.L.str.3.117(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	jne	.LBB152_5
.LBB152_4:                              # %if.then.i19
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB152_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.4.118(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB152_7
# %bb.8:                                # %if.else.i33
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	jmp	.LBB152_9
.LBB152_7:                              # %if.then.i31
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB152_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit35
	callq	halide_string_to_string@PLT
	leaq	.L.str.5.119(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.6.120(%rip), %r12
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movslq	-48(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.7.121(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-52(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movslq	16(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.5.170(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB152_10
# %bb.11:                               # %if.else.i79
	subq	%r15, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	jmp	.LBB152_12
.LBB152_10:                             # %if.then.i78
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB152_12:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-2, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end152:
	.size	halide_error_explicit_bounds_too_small, .Lfunc_end152-halide_error_explicit_bounds_too_small
                                        # -- End function
	.section	.text.halide_error_bad_type,"ax",@progbits
	.weak	halide_error_bad_type   # -- Begin function halide_error_bad_type
	.p2align	4, 0x90
	.type	halide_error_bad_type,@function
halide_error_bad_type:                  # @halide_error_bad_type
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	%edx, -56(%rbp)
	movl	%ecx, -52(%rbp)
	movl	$0, -48(%rbp)
	movl	$0, -40(%rbp)
	leaq	-48(%rbp), %rdi
	leaq	-52(%rbp), %rsi
	movl	$4, %edx
	callq	memcpy@PLT
	leaq	-40(%rbp), %rdi
	leaq	-56(%rbp), %rsi
	movl	$4, %edx
	callq	memcpy@PLT
	movl	$1024, %esi             # imm = 0x400
	movq	%r14, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.LBB153_1
# %bb.2:                                # %if.then.i13
	leaq	1023(%r15), %rbx
	movb	$0, 1023(%r15)
	testq	%r12, %r12
	je	.LBB153_4
.LBB153_5:                              # %if.else.i20
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	jmp	.LBB153_6
.LBB153_1:
	xorl	%ebx, %ebx
	testq	%r12, %r12
	jne	.LBB153_5
.LBB153_4:                              # %if.then.i19
	leaq	.L.str.112(%rip), %rdx
	movq	%r15, %rdi
	movq	%rbx, %rsi
.LBB153_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.9.123(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	leaq	-48(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_type_to_string@PLT
	leaq	.L.str.10.124(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	leaq	-40(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_type_to_string@PLT
	testq	%r15, %r15
	je	.LBB153_7
# %bb.8:                                # %if.else.i
	subq	%r15, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	jmp	.LBB153_9
.LBB153_7:                              # %if.then.i
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB153_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-3, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end153:
	.size	halide_error_bad_type, .Lfunc_end153-halide_error_bad_type
                                        # -- End function
	.section	.text.halide_error_bad_dimensions,"ax",@progbits
	.weak	halide_error_bad_dimensions # -- Begin function halide_error_bad_dimensions
	.p2align	4, 0x90
	.type	halide_error_bad_dimensions,@function
halide_error_bad_dimensions:            # @halide_error_bad_dimensions
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%ecx, %r13d
	movl	%edx, -44(%rbp)         # 4-byte Spill
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB154_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r12), %rbx
	movb	$0, 1023(%r12)
	testq	%r15, %r15
	je	.LBB154_4
.LBB154_5:                              # %if.else.i10
	movq	%r12, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	jmp	.LBB154_6
.LBB154_1:
	xorl	%ebx, %ebx
	testq	%r15, %r15
	jne	.LBB154_5
.LBB154_4:                              # %if.then.i9
	leaq	.L.str.112(%rip), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
.LBB154_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.11.125(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r13d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.12.126(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.13.127(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB154_7
# %bb.8:                                # %if.else.i36
	subq	%r12, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r12, %rsi
	jmp	.LBB154_9
.LBB154_7:                              # %if.then.i35
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB154_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-43, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end154:
	.size	halide_error_bad_dimensions, .Lfunc_end154-halide_error_bad_dimensions
                                        # -- End function
	.section	.text.halide_error_access_out_of_bounds,"ax",@progbits
	.weak	halide_error_access_out_of_bounds # -- Begin function halide_error_access_out_of_bounds
	.p2align	4, 0x90
	.type	halide_error_access_out_of_bounds,@function
halide_error_access_out_of_bounds:      # @halide_error_access_out_of_bounds
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	%rsi, %r14
	movq	%rdi, %rbx
	cmpl	%r9d, %ecx
	jge	.LBB155_10
# %bb.1:                                # %if.then
	movl	%r9d, %r12d
	movl	%ecx, %r15d
	movl	%edx, -44(%rbp)         # 4-byte Spill
	movl	$1024, %esi             # imm = 0x400
	movq	%rbx, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	movq	%rbx, -56(%rbp)         # 8-byte Spill
	je	.LBB155_2
# %bb.3:                                # %if.then.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	testq	%r14, %r14
	je	.LBB155_5
.LBB155_6:                              # %if.else.i29
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	jmp	.LBB155_7
.LBB155_10:                             # %if.else
	movl	16(%rbp), %r15d
	cmpl	%r15d, %r8d
	jle	.LBB155_20
# %bb.11:                               # %if.then8
	movl	%r8d, %r12d
	movl	%edx, -44(%rbp)         # 4-byte Spill
	movl	$1024, %esi             # imm = 0x400
	movq	%rbx, -56(%rbp)         # 8-byte Spill
	movq	%rbx, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB155_12
# %bb.13:                               # %if.then.i69
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	testq	%r14, %r14
	je	.LBB155_15
.LBB155_16:                             # %if.else.i80
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	jmp	.LBB155_17
.LBB155_2:
	xorl	%ebx, %ebx
	testq	%r14, %r14
	jne	.LBB155_6
.LBB155_5:                              # %if.then.i28
	leaq	.L.str.112(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
.LBB155_7:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	leaq	.L.str.14.128(%rip), %rdx
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r15d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.15.129(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r12d, %rdx
	jmp	.LBB155_8
.LBB155_12:
	xorl	%ebx, %ebx
	testq	%r14, %r14
	jne	.LBB155_16
.LBB155_15:                             # %if.then.i78
	leaq	.L.str.112(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
.LBB155_17:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit83
	callq	halide_string_to_string@PLT
	leaq	.L.str.14.128(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r12d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.17.131(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r15d, %rdx
.LBB155_8:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.16.130(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%r13, %r13
	je	.LBB155_9
# %bb.18:                               # %if.else.i123
	subq	%r13, %rax
	incq	%rax
	movq	-56(%rbp), %rbx         # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	halide_error@PLT
	jmp	.LBB155_19
.LBB155_9:                              # %if.then.i58
	leaq	.L.str.111(%rip), %rsi
	movq	-56(%rbp), %rbx         # 8-byte Reload
	movq	%rbx, %rdi
	callq	halide_error@PLT
	xorl	%r13d, %r13d
.LBB155_19:                             # %if.end17.sink.split
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	halide_free@PLT
.LBB155_20:                             # %if.end17
	movl	$-4, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end155:
	.size	halide_error_access_out_of_bounds, .Lfunc_end155-halide_error_access_out_of_bounds
                                        # -- End function
	.section	.text.halide_error_buffer_allocation_too_large,"ax",@progbits
	.weak	halide_error_buffer_allocation_too_large # -- Begin function halide_error_buffer_allocation_too_large
	.p2align	4, 0x90
	.type	halide_error_buffer_allocation_too_large,@function
halide_error_buffer_allocation_too_large: # @halide_error_buffer_allocation_too_large
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB156_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.18.132(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB156_4
.LBB156_5:                              # %if.else.i14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	jmp	.LBB156_6
.LBB156_1:                              # %entry.split
	leaq	.L.str.18.132(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	jne	.LBB156_5
.LBB156_4:                              # %if.then.i12
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB156_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.133(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	leaq	.L.str.20.134(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-48(%rbp), %rdx         # 8-byte Reload
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	testq	%r13, %r13
	je	.LBB156_7
# %bb.8:                                # %if.else.i34
	subq	%r13, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r13, %rsi
	jmp	.LBB156_9
.LBB156_7:                              # %if.then.i33
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB156_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-5, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end156:
	.size	halide_error_buffer_allocation_too_large, .Lfunc_end156-halide_error_buffer_allocation_too_large
                                        # -- End function
	.section	.text.halide_error_buffer_extents_negative,"ax",@progbits
	.weak	halide_error_buffer_extents_negative # -- Begin function halide_error_buffer_extents_negative
	.p2align	4, 0x90
	.type	halide_error_buffer_extents_negative,@function
halide_error_buffer_extents_negative:   # @halide_error_buffer_extents_negative
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%ecx, -44(%rbp)         # 4-byte Spill
	movl	%edx, %r13d
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB157_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r12), %rbx
	movb	$0, 1023(%r12)
	leaq	.L.str.21.135(%rip), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB157_4
.LBB157_5:                              # %if.else.i15
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	jmp	.LBB157_6
.LBB157_1:                              # %entry.split
	leaq	.L.str.21.135(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	jne	.LBB157_5
.LBB157_4:                              # %if.then.i13
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB157_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.22.136(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r13d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.23.137(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.5.170(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB157_7
# %bb.8:                                # %if.else.i41
	subq	%r12, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r12, %rsi
	jmp	.LBB157_9
.LBB157_7:                              # %if.then.i40
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB157_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-28, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end157:
	.size	halide_error_buffer_extents_negative, .Lfunc_end157-halide_error_buffer_extents_negative
                                        # -- End function
	.section	.text.halide_error_buffer_extents_too_large,"ax",@progbits
	.weak	halide_error_buffer_extents_too_large # -- Begin function halide_error_buffer_extents_too_large
	.p2align	4, 0x90
	.type	halide_error_buffer_extents_too_large,@function
halide_error_buffer_extents_too_large:  # @halide_error_buffer_extents_too_large
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB158_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.24.138(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB158_4
.LBB158_5:                              # %if.else.i14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	jmp	.LBB158_6
.LBB158_1:                              # %entry.split
	leaq	.L.str.24.138(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	jne	.LBB158_5
.LBB158_4:                              # %if.then.i12
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB158_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.133(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.20.134(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-48(%rbp), %rdx         # 8-byte Reload
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%r13, %r13
	je	.LBB158_7
# %bb.8:                                # %if.else.i34
	subq	%r13, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r13, %rsi
	jmp	.LBB158_9
.LBB158_7:                              # %if.then.i33
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB158_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-6, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end158:
	.size	halide_error_buffer_extents_too_large, .Lfunc_end158-halide_error_buffer_extents_too_large
                                        # -- End function
	.section	.text.halide_error_constraints_make_required_region_smaller,"ax",@progbits
	.weak	halide_error_constraints_make_required_region_smaller # -- Begin function halide_error_constraints_make_required_region_smaller
	.p2align	4, 0x90
	.type	halide_error_constraints_make_required_region_smaller,@function
halide_error_constraints_make_required_region_smaller: # @halide_error_constraints_make_required_region_smaller
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movl	%r9d, %r13d
	movl	%r8d, %r14d
                                        # kill: def $ecx killed $ecx def $rcx
	movq	%rcx, -72(%rbp)         # 8-byte Spill
	movl	%edx, -48(%rbp)         # 4-byte Spill
	movq	%rsi, %r12
	movl	$1024, %esi             # imm = 0x400
	movq	%rdi, -64(%rbp)         # 8-byte Spill
	callq	halide_malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.LBB159_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r15), %rbx
	movb	$0, 1023(%r15)
	leaq	.L.str.25.139(%rip), %rdx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB159_3
.LBB159_1:                              # %entry.split
	leaq	.L.str.25.139(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB159_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movl	16(%rbp), %ecx
	leal	(%rcx,%r13), %ecx
	addl	$-1, %ecx
	movl	%ecx, -44(%rbp)         # 4-byte Spill
	movq	-72(%rbp), %rcx         # 8-byte Reload
	leal	(%rcx,%r14), %ecx
	addl	$-1, %ecx
	movl	%ecx, -52(%rbp)         # 4-byte Spill
	testq	%r12, %r12
	je	.LBB159_4
# %bb.5:                                # %if.else.i29
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	jmp	.LBB159_6
.LBB159_4:                              # %if.then.i27
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB159_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.26.140(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-48(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.27.141(%rip), %r14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.28.142(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r13d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.6.120(%rip), %r12
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	leaq	.L.str.29.143(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-72(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movslq	-52(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.30.144(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB159_7
# %bb.8:                                # %if.else.i92
	subq	%r15, %rax
	incq	%rax
	movq	-64(%rbp), %rbx         # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	movq	%r15, %rsi
	jmp	.LBB159_9
.LBB159_7:                              # %if.then.i91
	leaq	.L.str.111(%rip), %rsi
	movq	-64(%rbp), %rbx         # 8-byte Reload
	movq	%rbx, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	xorl	%esi, %esi
.LBB159_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-7, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end159:
	.size	halide_error_constraints_make_required_region_smaller, .Lfunc_end159-halide_error_constraints_make_required_region_smaller
                                        # -- End function
	.section	.text.halide_error_constraint_violated,"ax",@progbits
	.weak	halide_error_constraint_violated # -- Begin function halide_error_constraint_violated
	.p2align	4, 0x90
	.type	halide_error_constraint_violated,@function
halide_error_constraint_violated:       # @halide_error_constraint_violated
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%r8d, -48(%rbp)         # 4-byte Spill
	movq	%rcx, %r13
	movl	%edx, -44(%rbp)         # 4-byte Spill
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB160_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r12), %rbx
	movb	$0, 1023(%r12)
	leaq	.L.str.31.145(%rip), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB160_4
.LBB160_5:                              # %if.else.i17
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	jmp	.LBB160_6
.LBB160_1:                              # %entry.split
	leaq	.L.str.31.145(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	jne	.LBB160_5
.LBB160_4:                              # %if.then.i15
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB160_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.32.146(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.33.147(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB160_7
# %bb.8:                                # %if.else.i37
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	jmp	.LBB160_9
.LBB160_7:                              # %if.then.i35
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB160_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit39
	callq	halide_string_to_string@PLT
	leaq	.L.str.32.146(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-48(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.5.170(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB160_10
# %bb.11:                               # %if.else.i57
	subq	%r12, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r12, %rsi
	jmp	.LBB160_12
.LBB160_10:                             # %if.then.i56
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB160_12:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-8, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end160:
	.size	halide_error_constraint_violated, .Lfunc_end160-halide_error_constraint_violated
                                        # -- End function
	.section	.text.halide_error_param_too_small_i64,"ax",@progbits
	.weak	halide_error_param_too_small_i64 # -- Begin function halide_error_param_too_small_i64
	.p2align	4, 0x90
	.type	halide_error_param_too_small_i64,@function
halide_error_param_too_small_i64:       # @halide_error_param_too_small_i64
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB161_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.34.148(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB161_4
.LBB161_5:                              # %if.else.i14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	jmp	.LBB161_6
.LBB161_1:                              # %entry.split
	leaq	.L.str.34.148(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	jne	.LBB161_5
.LBB161_4:                              # %if.then.i12
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB161_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.133(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.35.149(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-48(%rbp), %rdx         # 8-byte Reload
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%r13, %r13
	je	.LBB161_7
# %bb.8:                                # %if.else.i34
	subq	%r13, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r13, %rsi
	jmp	.LBB161_9
.LBB161_7:                              # %if.then.i33
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB161_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-9, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end161:
	.size	halide_error_param_too_small_i64, .Lfunc_end161-halide_error_param_too_small_i64
                                        # -- End function
	.section	.text.halide_error_param_too_small_u64,"ax",@progbits
	.weak	halide_error_param_too_small_u64 # -- Begin function halide_error_param_too_small_u64
	.p2align	4, 0x90
	.type	halide_error_param_too_small_u64,@function
halide_error_param_too_small_u64:       # @halide_error_param_too_small_u64
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB162_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.34.148(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB162_4
.LBB162_5:                              # %if.else.i14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	jmp	.LBB162_6
.LBB162_1:                              # %entry.split
	leaq	.L.str.34.148(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	jne	.LBB162_5
.LBB162_4:                              # %if.then.i12
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB162_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.133(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	leaq	.L.str.35.149(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-48(%rbp), %rdx         # 8-byte Reload
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	testq	%r13, %r13
	je	.LBB162_7
# %bb.8:                                # %if.else.i34
	subq	%r13, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r13, %rsi
	jmp	.LBB162_9
.LBB162_7:                              # %if.then.i33
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB162_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-9, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end162:
	.size	halide_error_param_too_small_u64, .Lfunc_end162-halide_error_param_too_small_u64
                                        # -- End function
	.section	.text.halide_error_param_too_small_f64,"ax",@progbits
	.weak	halide_error_param_too_small_f64 # -- Begin function halide_error_param_too_small_f64
	.p2align	4, 0x90
	.type	halide_error_param_too_small_f64,@function
halide_error_param_too_small_f64:       # @halide_error_param_too_small_f64
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	vmovsd	%xmm1, -48(%rbp)        # 8-byte Spill
	vmovsd	%xmm0, -40(%rbp)        # 8-byte Spill
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.LBB163_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r15), %rbx
	movb	$0, 1023(%r15)
	leaq	.L.str.34.148(%rip), %rdx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB163_4
.LBB163_5:                              # %if.else.i14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	jmp	.LBB163_6
.LBB163_1:                              # %entry.split
	leaq	.L.str.34.148(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	jne	.LBB163_5
.LBB163_4:                              # %if.then.i12
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB163_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.133(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	vmovsd	-40(%rbp), %xmm0        # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movl	$1, %edx
	callq	halide_double_to_string@PLT
	leaq	.L.str.35.149(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	vmovsd	-48(%rbp), %xmm0        # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movl	$1, %edx
	callq	halide_double_to_string@PLT
	testq	%r15, %r15
	je	.LBB163_7
# %bb.8:                                # %if.else.i34
	subq	%r15, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	jmp	.LBB163_9
.LBB163_7:                              # %if.then.i33
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB163_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-9, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end163:
	.size	halide_error_param_too_small_f64, .Lfunc_end163-halide_error_param_too_small_f64
                                        # -- End function
	.section	.text.halide_error_param_too_large_i64,"ax",@progbits
	.weak	halide_error_param_too_large_i64 # -- Begin function halide_error_param_too_large_i64
	.p2align	4, 0x90
	.type	halide_error_param_too_large_i64,@function
halide_error_param_too_large_i64:       # @halide_error_param_too_large_i64
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB164_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.34.148(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB164_4
.LBB164_5:                              # %if.else.i14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	jmp	.LBB164_6
.LBB164_1:                              # %entry.split
	leaq	.L.str.34.148(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	jne	.LBB164_5
.LBB164_4:                              # %if.then.i12
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB164_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.133(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.36.150(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-48(%rbp), %rdx         # 8-byte Reload
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%r13, %r13
	je	.LBB164_7
# %bb.8:                                # %if.else.i34
	subq	%r13, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r13, %rsi
	jmp	.LBB164_9
.LBB164_7:                              # %if.then.i33
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB164_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-10, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end164:
	.size	halide_error_param_too_large_i64, .Lfunc_end164-halide_error_param_too_large_i64
                                        # -- End function
	.section	.text.halide_error_param_too_large_u64,"ax",@progbits
	.weak	halide_error_param_too_large_u64 # -- Begin function halide_error_param_too_large_u64
	.p2align	4, 0x90
	.type	halide_error_param_too_large_u64,@function
halide_error_param_too_large_u64:       # @halide_error_param_too_large_u64
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB165_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.34.148(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB165_4
.LBB165_5:                              # %if.else.i14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	jmp	.LBB165_6
.LBB165_1:                              # %entry.split
	leaq	.L.str.34.148(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	jne	.LBB165_5
.LBB165_4:                              # %if.then.i12
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB165_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.133(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	leaq	.L.str.36.150(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	-48(%rbp), %rdx         # 8-byte Reload
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	testq	%r13, %r13
	je	.LBB165_7
# %bb.8:                                # %if.else.i34
	subq	%r13, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r13, %rsi
	jmp	.LBB165_9
.LBB165_7:                              # %if.then.i33
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB165_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-10, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end165:
	.size	halide_error_param_too_large_u64, .Lfunc_end165-halide_error_param_too_large_u64
                                        # -- End function
	.section	.text.halide_error_param_too_large_f64,"ax",@progbits
	.weak	halide_error_param_too_large_f64 # -- Begin function halide_error_param_too_large_f64
	.p2align	4, 0x90
	.type	halide_error_param_too_large_f64,@function
halide_error_param_too_large_f64:       # @halide_error_param_too_large_f64
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	vmovsd	%xmm1, -48(%rbp)        # 8-byte Spill
	vmovsd	%xmm0, -40(%rbp)        # 8-byte Spill
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.LBB166_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r15), %rbx
	movb	$0, 1023(%r15)
	leaq	.L.str.34.148(%rip), %rdx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB166_4
.LBB166_5:                              # %if.else.i14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	jmp	.LBB166_6
.LBB166_1:                              # %entry.split
	leaq	.L.str.34.148(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	jne	.LBB166_5
.LBB166_4:                              # %if.then.i12
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB166_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.133(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	vmovsd	-40(%rbp), %xmm0        # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movl	$1, %edx
	callq	halide_double_to_string@PLT
	leaq	.L.str.36.150(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	vmovsd	-48(%rbp), %xmm0        # 8-byte Reload
                                        # xmm0 = mem[0],zero
	movl	$1, %edx
	callq	halide_double_to_string@PLT
	testq	%r15, %r15
	je	.LBB166_7
# %bb.8:                                # %if.else.i34
	subq	%r15, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	jmp	.LBB166_9
.LBB166_7:                              # %if.then.i33
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB166_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-10, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end166:
	.size	halide_error_param_too_large_f64, .Lfunc_end166-halide_error_param_too_large_f64
                                        # -- End function
	.section	.text.halide_error_out_of_memory,"ax",@progbits
	.weak	halide_error_out_of_memory # -- Begin function halide_error_out_of_memory
	.p2align	4, 0x90
	.type	halide_error_out_of_memory,@function
halide_error_out_of_memory:             # @halide_error_out_of_memory
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	.L.str.37(%rip), %rsi
	callq	halide_error@PLT
	movl	$-11, %eax
	popq	%rbp
	retq
.Lfunc_end167:
	.size	halide_error_out_of_memory, .Lfunc_end167-halide_error_out_of_memory
                                        # -- End function
	.section	.text.halide_error_buffer_argument_is_null,"ax",@progbits
	.weak	halide_error_buffer_argument_is_null # -- Begin function halide_error_buffer_argument_is_null
	.p2align	4, 0x90
	.type	halide_error_buffer_argument_is_null,@function
halide_error_buffer_argument_is_null:   # @halide_error_buffer_argument_is_null
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB168_1
# %bb.2:                                # %if.then.i
	leaq	1023(%rbx), %r15
	movb	$0, 1023(%rbx)
	leaq	.L.str.38(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB168_4
.LBB168_5:                              # %if.else.i11
	movq	%rax, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	jmp	.LBB168_6
.LBB168_1:                              # %entry.split
	leaq	.L.str.38(%rip), %rdx
	xorl	%r15d, %r15d
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	jne	.LBB168_5
.LBB168_4:                              # %if.then.i9
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r15, %rsi
.LBB168_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.39(%rip), %rdx
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB168_7
# %bb.8:                                # %if.else.i20
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB168_9
.LBB168_7:                              # %if.then.i19
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB168_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-12, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end168:
	.size	halide_error_buffer_argument_is_null, .Lfunc_end168-halide_error_buffer_argument_is_null
                                        # -- End function
	.section	.text.halide_error_debug_to_file_failed,"ax",@progbits
	.weak	halide_error_debug_to_file_failed # -- Begin function halide_error_debug_to_file_failed
	.p2align	4, 0x90
	.type	halide_error_debug_to_file_failed,@function
halide_error_debug_to_file_failed:      # @halide_error_debug_to_file_failed
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%ecx, -44(%rbp)         # 4-byte Spill
	movq	%rdx, %r13
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB169_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r12), %rbx
	movb	$0, 1023(%r12)
	leaq	.L.str.40(%rip), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB169_4
.LBB169_5:                              # %if.else.i14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	jmp	.LBB169_6
.LBB169_1:                              # %entry.split
	leaq	.L.str.40(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	jne	.LBB169_5
.LBB169_4:                              # %if.then.i12
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB169_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.41(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB169_7
# %bb.8:                                # %if.else.i26
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	jmp	.LBB169_9
.LBB169_7:                              # %if.then.i24
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB169_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28
	callq	halide_string_to_string@PLT
	leaq	.L.str.42.151(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	testq	%r12, %r12
	je	.LBB169_10
# %bb.11:                               # %if.else.i40
	subq	%r12, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r12, %rsi
	jmp	.LBB169_12
.LBB169_10:                             # %if.then.i39
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB169_12:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-13, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end169:
	.size	halide_error_debug_to_file_failed, .Lfunc_end169-halide_error_debug_to_file_failed
                                        # -- End function
	.section	.text.halide_error_failed_to_upgrade_buffer_t,"ax",@progbits
	.weak	halide_error_failed_to_upgrade_buffer_t # -- Begin function halide_error_failed_to_upgrade_buffer_t
	.p2align	4, 0x90
	.type	halide_error_failed_to_upgrade_buffer_t,@function
halide_error_failed_to_upgrade_buffer_t: # @halide_error_failed_to_upgrade_buffer_t
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r15
	movq	%rsi, %r13
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB170_1
# %bb.2:                                # %if.then.i
	leaq	1023(%rbx), %r12
	movb	$0, 1023(%rbx)
	leaq	.L.str.43(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB170_4
.LBB170_5:                              # %if.else.i12
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r13, %rdx
	jmp	.LBB170_6
.LBB170_1:                              # %entry.split
	leaq	.L.str.43(%rip), %rdx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	jne	.LBB170_5
.LBB170_4:                              # %if.then.i10
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
.LBB170_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.188(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB170_7
# %bb.8:                                # %if.else.i24
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB170_10
.LBB170_11:                             # %if.else.i30
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB170_12
.LBB170_7:                              # %if.then.i22
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	jne	.LBB170_11
.LBB170_10:                             # %if.then.i29
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB170_12:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-29, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end170:
	.size	halide_error_failed_to_upgrade_buffer_t, .Lfunc_end170-halide_error_failed_to_upgrade_buffer_t
                                        # -- End function
	.section	.text.halide_error_failed_to_downgrade_buffer_t,"ax",@progbits
	.weak	halide_error_failed_to_downgrade_buffer_t # -- Begin function halide_error_failed_to_downgrade_buffer_t
	.p2align	4, 0x90
	.type	halide_error_failed_to_downgrade_buffer_t,@function
halide_error_failed_to_downgrade_buffer_t: # @halide_error_failed_to_downgrade_buffer_t
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r15
	movq	%rsi, %r13
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB171_1
# %bb.2:                                # %if.then.i
	leaq	1023(%rbx), %r12
	movb	$0, 1023(%rbx)
	leaq	.L.str.45(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB171_4
.LBB171_5:                              # %if.else.i12
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r13, %rdx
	jmp	.LBB171_6
.LBB171_1:                              # %entry.split
	leaq	.L.str.45(%rip), %rdx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	jne	.LBB171_5
.LBB171_4:                              # %if.then.i10
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
.LBB171_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.19.188(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB171_7
# %bb.8:                                # %if.else.i24
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB171_10
.LBB171_11:                             # %if.else.i30
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB171_12
.LBB171_7:                              # %if.then.i22
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	jne	.LBB171_11
.LBB171_10:                             # %if.then.i29
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB171_12:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-30, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end171:
	.size	halide_error_failed_to_downgrade_buffer_t, .Lfunc_end171-halide_error_failed_to_downgrade_buffer_t
                                        # -- End function
	.section	.text.halide_error_unaligned_host_ptr,"ax",@progbits
	.weak	halide_error_unaligned_host_ptr # -- Begin function halide_error_unaligned_host_ptr
	.p2align	4, 0x90
	.type	halide_error_unaligned_host_ptr,@function
halide_error_unaligned_host_ptr:        # @halide_error_unaligned_host_ptr
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movl	%edx, %r15d
	movq	%rsi, %r13
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB172_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r12), %rbx
	movb	$0, 1023(%r12)
	leaq	.L.str.46(%rip), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB172_4
.LBB172_5:                              # %if.else.i13
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	jmp	.LBB172_6
.LBB172_1:                              # %entry.split
	leaq	.L.str.46(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	jne	.LBB172_5
.LBB172_4:                              # %if.then.i11
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB172_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.47(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r15d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.48(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB172_7
# %bb.8:                                # %if.else.i30
	subq	%r12, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r12, %rsi
	jmp	.LBB172_9
.LBB172_7:                              # %if.then.i29
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB172_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-24, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end172:
	.size	halide_error_unaligned_host_ptr, .Lfunc_end172-halide_error_unaligned_host_ptr
                                        # -- End function
	.section	.text.halide_error_host_is_null,"ax",@progbits
	.weak	halide_error_host_is_null # -- Begin function halide_error_host_is_null
	.p2align	4, 0x90
	.type	halide_error_host_is_null,@function
halide_error_host_is_null:              # @halide_error_host_is_null
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB173_1
# %bb.2:                                # %if.then.i
	leaq	1023(%rbx), %r15
	movb	$0, 1023(%rbx)
	leaq	.L.str.46(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB173_4
.LBB173_5:                              # %if.else.i11
	movq	%rax, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	jmp	.LBB173_6
.LBB173_1:                              # %entry.split
	leaq	.L.str.46(%rip), %rdx
	xorl	%r15d, %r15d
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	jne	.LBB173_5
.LBB173_4:                              # %if.then.i9
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r15, %rsi
.LBB173_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.49(%rip), %rdx
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB173_7
# %bb.8:                                # %if.else.i20
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB173_9
.LBB173_7:                              # %if.then.i19
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB173_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-34, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end173:
	.size	halide_error_host_is_null, .Lfunc_end173-halide_error_host_is_null
                                        # -- End function
	.section	.text.halide_error_bad_fold,"ax",@progbits
	.weak	halide_error_bad_fold   # -- Begin function halide_error_bad_fold
	.p2align	4, 0x90
	.type	halide_error_bad_fold,@function
halide_error_bad_fold:                  # @halide_error_bad_fold
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r13
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %r15
	testq	%rax, %rax
	je	.LBB174_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r15), %rbx
	movb	$0, 1023(%r15)
	leaq	.L.str.50(%rip), %rdx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB174_4
.LBB174_5:                              # %if.else.i15
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	jmp	.LBB174_6
.LBB174_1:                              # %entry.split
	leaq	.L.str.50(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	jne	.LBB174_5
.LBB174_4:                              # %if.then.i13
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB174_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.51(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB174_7
# %bb.8:                                # %if.else.i27
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	jmp	.LBB174_9
.LBB174_7:                              # %if.then.i25
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB174_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit29
	callq	halide_string_to_string@PLT
	leaq	.L.str.52(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	-48(%rbp), %rdx         # 8-byte Reload
	testq	%rdx, %rdx
	jne	.LBB174_11
# %bb.10:                               # %if.then.i39
	leaq	.L.str.112(%rip), %rdx
.LBB174_11:                             # %if.else.i41
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.30.144(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB174_12
# %bb.13:                               # %if.else.i52
	subq	%r15, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%r15, %rsi
	jmp	.LBB174_14
.LBB174_12:                             # %if.then.i51
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB174_14:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-25, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end174:
	.size	halide_error_bad_fold, .Lfunc_end174-halide_error_bad_fold
                                        # -- End function
	.section	.text.halide_error_bad_extern_fold,"ax",@progbits
	.weak	halide_error_bad_extern_fold # -- Begin function halide_error_bad_extern_fold
	.p2align	4, 0x90
	.type	halide_error_bad_extern_fold,@function
halide_error_bad_extern_fold:           # @halide_error_bad_extern_fold
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movl	%r9d, %r12d
                                        # kill: def $r8d killed $r8d def $r8
	movl	%ecx, %r15d
	movq	%rdi, %rbx
	movl	16(%rbp), %eax
	cmpl	%r9d, %ecx
	movq	%rdi, -48(%rbp)         # 8-byte Spill
	jl	.LBB175_2
# %bb.1:                                # %lor.lhs.false
	leal	(%r8,%r15), %ecx
	addl	%r12d, %eax
	cmpl	%eax, %ecx
	jle	.LBB175_11
.LBB175_2:                              # %if.then
	movq	%r15, -64(%rbp)         # 8-byte Spill
	movl	%edx, %r15d
	movq	%r8, -56(%rbp)          # 8-byte Spill
	movq	%rsi, %r14
	movl	$1024, %esi             # imm = 0x400
	movq	%rbx, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB175_3
# %bb.4:                                # %if.then.i
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.53(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	jmp	.LBB175_5
.LBB175_3:                              # %if.then.split
	leaq	.L.str.53(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB175_5:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movslq	%r15d, %rdx
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.51(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r14, %r14
	je	.LBB175_6
# %bb.7:                                # %if.else.i65
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	jmp	.LBB175_8
.LBB175_6:                              # %if.then.i63
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB175_8:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	-64(%rbp), %r15         # 8-byte Reload
	leaq	.L.str.54(%rip), %rdx
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r15d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.55(%rip), %r14
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	movq	-56(%rbp), %rcx         # 8-byte Reload
	leal	(%rcx,%r15), %ecx
	addl	$-1, %ecx
	movslq	%ecx, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.56(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.57(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r12d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	halide_string_to_string@PLT
	movl	16(%rbp), %ecx
	leal	(%rcx,%r12), %ecx
	addl	$-1, %ecx
	movslq	%ecx, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.58.152(%rip), %rdx
	jmp	.LBB175_9
.LBB175_11:                             # %if.else
	movl	%edx, %r12d
	movl	%ecx, -56(%rbp)         # 4-byte Spill
	movq	%rsi, %r14
	movl	$1024, %esi             # imm = 0x400
	movq	%rbx, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB175_12
# %bb.13:                               # %if.then.i125
	leaq	1023(%r13), %rbx
	movb	$0, 1023(%r13)
	leaq	.L.str.53(%rip), %rdx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	jmp	.LBB175_14
.LBB175_12:                             # %if.else.split
	leaq	.L.str.53(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB175_14:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit129
	callq	halide_string_to_string@PLT
	movslq	%r12d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.51(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	testq	%r14, %r14
	je	.LBB175_15
# %bb.16:                               # %if.else.i152
	movq	%r14, %rdx
	jmp	.LBB175_17
.LBB175_15:                             # %if.then.i150
	leaq	.L.str.112(%rip), %rdx
.LBB175_17:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit155
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.54(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	%r15d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.55(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movl	-56(%rbp), %r12d        # 4-byte Reload
	decl	%r12d
	movslq	%r12d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.56(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.59.153(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.60.154(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movl	16(%rbp), %ecx
	movslq	%ecx, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.30.144(%rip), %rdx
.LBB175_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB175_10
# %bb.18:                               # %if.else.i213
	subq	%r13, %rax
	incq	%rax
	movq	-48(%rbp), %rbx         # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	halide_error@PLT
	jmp	.LBB175_19
.LBB175_10:                             # %if.then.i114
	leaq	.L.str.111(%rip), %rsi
	movq	-48(%rbp), %rbx         # 8-byte Reload
	movq	%rbx, %rdi
	callq	halide_error@PLT
	xorl	%r13d, %r13d
.LBB175_19:                             # %if.end
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	halide_free@PLT
	movl	$-35, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end175:
	.size	halide_error_bad_extern_fold, .Lfunc_end175-halide_error_bad_extern_fold
                                        # -- End function
	.section	.text.halide_error_fold_factor_too_small,"ax",@progbits
	.weak	halide_error_fold_factor_too_small # -- Begin function halide_error_fold_factor_too_small
	.p2align	4, 0x90
	.type	halide_error_fold_factor_too_small,@function
halide_error_fold_factor_too_small:     # @halide_error_fold_factor_too_small
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movl	%r9d, -44(%rbp)         # 4-byte Spill
	movq	%r8, -64(%rbp)          # 8-byte Spill
	movl	%ecx, %r14d
	movq	%rdx, %r13
	movq	%rsi, %r15
	movl	$1024, %esi             # imm = 0x400
	movq	%rdi, -56(%rbp)         # 8-byte Spill
	callq	halide_malloc@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.LBB176_1
# %bb.2:                                # %if.then.i
	leaq	1023(%r12), %rbx
	movb	$0, 1023(%r12)
	leaq	.L.str.61.155(%rip), %rdx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	jmp	.LBB176_3
.LBB176_1:                              # %entry.split
	leaq	.L.str.61.155(%rip), %rdx
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB176_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movslq	%r14d, %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.62(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB176_4
# %bb.5:                                # %if.else.i26
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r13, %rdx
	jmp	.LBB176_6
.LBB176_4:                              # %if.then.i24
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB176_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.51(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB176_7
# %bb.8:                                # %if.else.i38
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	jmp	.LBB176_9
.LBB176_7:                              # %if.then.i36
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
.LBB176_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit40
	callq	halide_string_to_string@PLT
	leaq	.L.str.63(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movq	-64(%rbp), %rdx         # 8-byte Reload
	testq	%rdx, %rdx
	jne	.LBB176_11
# %bb.10:                               # %if.then.i50
	leaq	.L.str.112(%rip), %rdx
.LBB176_11:                             # %if.else.i52
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.32.146(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	movslq	-44(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%rbx, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.64.156(%rip), %rdx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB176_12
# %bb.13:                               # %if.else.i72
	subq	%r12, %rax
	incq	%rax
	movq	-56(%rbp), %rbx         # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	movq	%r12, %rsi
	jmp	.LBB176_14
.LBB176_12:                             # %if.then.i71
	leaq	.L.str.111(%rip), %rsi
	movq	-56(%rbp), %rbx         # 8-byte Reload
	movq	%rbx, %rdi
	callq	halide_error@PLT
	movq	%rbx, %rdi
	xorl	%esi, %esi
.LBB176_14:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-26, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end176:
	.size	halide_error_fold_factor_too_small, .Lfunc_end176-halide_error_fold_factor_too_small
                                        # -- End function
	.section	.text.halide_error_requirement_failed,"ax",@progbits
	.weak	halide_error_requirement_failed # -- Begin function halide_error_requirement_failed
	.p2align	4, 0x90
	.type	halide_error_requirement_failed,@function
halide_error_requirement_failed:        # @halide_error_requirement_failed
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r15
	movq	%rsi, %r13
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB177_1
# %bb.2:                                # %if.then.i
	leaq	1023(%rbx), %r12
	movb	$0, 1023(%rbx)
	leaq	.L.str.65(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB177_4
.LBB177_5:                              # %if.else.i12
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r13, %rdx
	jmp	.LBB177_6
.LBB177_1:                              # %entry.split
	leaq	.L.str.65(%rip), %rdx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	jne	.LBB177_5
.LBB177_4:                              # %if.then.i10
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
.LBB177_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.3.168(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB177_7
# %bb.8:                                # %if.else.i24
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB177_10
.LBB177_11:                             # %if.else.i30
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB177_12
.LBB177_7:                              # %if.then.i22
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	jne	.LBB177_11
.LBB177_10:                             # %if.then.i29
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB177_12:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-27, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end177:
	.size	halide_error_requirement_failed, .Lfunc_end177-halide_error_requirement_failed
                                        # -- End function
	.section	.text.halide_error_specialize_fail,"ax",@progbits
	.weak	halide_error_specialize_fail # -- Begin function halide_error_specialize_fail
	.p2align	4, 0x90
	.type	halide_error_specialize_fail,@function
halide_error_specialize_fail:           # @halide_error_specialize_fail
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB178_1
# %bb.2:                                # %if.then.i
	leaq	1023(%rbx), %r12
	movb	$0, 1023(%rbx)
	leaq	.L.str.67(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	je	.LBB178_4
.LBB178_5:                              # %if.else.i10
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB178_7
.LBB178_8:                              # %if.else.i14
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB178_9
.LBB178_1:                              # %entry.split
	leaq	.L.str.67(%rip), %rdx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r15, %r15
	jne	.LBB178_5
.LBB178_4:                              # %if.then.i8
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	jne	.LBB178_8
.LBB178_7:                              # %if.then.i13
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB178_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-31, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end178:
	.size	halide_error_specialize_fail, .Lfunc_end178-halide_error_specialize_fail
                                        # -- End function
	.section	.text.halide_error_no_device_interface,"ax",@progbits
	.weak	halide_error_no_device_interface # -- Begin function halide_error_no_device_interface
	.p2align	4, 0x90
	.type	halide_error_no_device_interface,@function
halide_error_no_device_interface:       # @halide_error_no_device_interface
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB179_1
# %bb.2:                                # %if.else.i7
	movq	%rax, %rbx
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.68(%rip), %rdx
	movq	%rax, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB179_3
.LBB179_1:                              # %if.then.i6
	leaq	.L.str.68(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB179_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-19, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end179:
	.size	halide_error_no_device_interface, .Lfunc_end179-halide_error_no_device_interface
                                        # -- End function
	.section	.text.halide_error_device_interface_no_device,"ax",@progbits
	.weak	halide_error_device_interface_no_device # -- Begin function halide_error_device_interface_no_device
	.p2align	4, 0x90
	.type	halide_error_device_interface_no_device,@function
halide_error_device_interface_no_device: # @halide_error_device_interface_no_device
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB180_1
# %bb.2:                                # %if.else.i7
	movq	%rax, %rbx
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.69(%rip), %rdx
	movq	%rax, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB180_3
.LBB180_1:                              # %if.then.i6
	leaq	.L.str.69(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB180_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-36, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end180:
	.size	halide_error_device_interface_no_device, .Lfunc_end180-halide_error_device_interface_no_device
                                        # -- End function
	.section	.text.halide_error_host_and_device_dirty,"ax",@progbits
	.weak	halide_error_host_and_device_dirty # -- Begin function halide_error_host_and_device_dirty
	.p2align	4, 0x90
	.type	halide_error_host_and_device_dirty,@function
halide_error_host_and_device_dirty:     # @halide_error_host_and_device_dirty
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB181_1
# %bb.2:                                # %if.else.i7
	movq	%rax, %rbx
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.70(%rip), %rdx
	movq	%rax, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB181_3
.LBB181_1:                              # %if.then.i6
	leaq	.L.str.70(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB181_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-37, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end181:
	.size	halide_error_host_and_device_dirty, .Lfunc_end181-halide_error_host_and_device_dirty
                                        # -- End function
	.section	.text.halide_error_buffer_is_null,"ax",@progbits
	.weak	halide_error_buffer_is_null # -- Begin function halide_error_buffer_is_null
	.p2align	4, 0x90
	.type	halide_error_buffer_is_null,@function
halide_error_buffer_is_null:            # @halide_error_buffer_is_null
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB182_1
# %bb.2:                                # %if.then.i
	leaq	1023(%rbx), %r15
	movb	$0, 1023(%rbx)
	leaq	.L.str.71(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	je	.LBB182_4
.LBB182_5:                              # %if.else.i11
	movq	%rax, %rdi
	movq	%r15, %rsi
	movq	%r12, %rdx
	jmp	.LBB182_6
.LBB182_1:                              # %entry.split
	leaq	.L.str.71(%rip), %rdx
	xorl	%r15d, %r15d
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	testq	%r12, %r12
	jne	.LBB182_5
.LBB182_4:                              # %if.then.i9
	leaq	.L.str.112(%rip), %rdx
	movq	%rax, %rdi
	movq	%r15, %rsi
.LBB182_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	leaq	.L.str.72(%rip), %rdx
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB182_7
# %bb.8:                                # %if.else.i20
	subq	%rbx, %rax
	incq	%rax
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB182_9
.LBB182_7:                              # %if.then.i19
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB182_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-38, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end182:
	.size	halide_error_buffer_is_null, .Lfunc_end182-halide_error_buffer_is_null
                                        # -- End function
	.section	.text.halide_error_integer_division_by_zero,"ax",@progbits
	.weak	halide_error_integer_division_by_zero # -- Begin function halide_error_integer_division_by_zero
	.p2align	4, 0x90
	.type	halide_error_integer_division_by_zero,@function
halide_error_integer_division_by_zero:  # @halide_error_integer_division_by_zero
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	movl	$1024, %esi             # imm = 0x400
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB183_1
# %bb.2:                                # %if.else.i7
	movq	%rax, %rbx
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.73(%rip), %rdx
	movq	%rax, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB183_3
.LBB183_1:                              # %if.then.i6
	leaq	.L.str.73(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB183_3:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movl	$-44, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end183:
	.size	halide_error_integer_division_by_zero, .Lfunc_end183-halide_error_integer_division_by_zero
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t # -- Begin function _ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t,@function
_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t: # @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$4, 36(%rdx)
	cmpl	$0, 16(%rsi)
	je	.LBB184_1
# %bb.7:                                # %for.inc
	cmpl	$0, 20(%rsi)
	je	.LBB184_8
# %bb.15:                               # %for.inc.1
	cmpl	$0, 24(%rsi)
	je	.LBB184_16
# %bb.17:                               # %for.inc.2
	cmpl	$0, 28(%rsi)
	je	.LBB184_18
# %bb.3:                                # %cleanup
	movl	64(%rsi), %eax
	cmpl	$3, %eax
	jg	.LBB184_9
.LBB184_4:                              # %cleanup
	cmpl	$1, %eax
	je	.LBB184_13
# %bb.5:                                # %cleanup
	cmpl	$2, %eax
	jne	.LBB184_12
# %bb.6:                                # %sw.bb3
	movl	$69633, 32(%rdx)        # imm = 0x11001
	xorl	%eax, %eax
	popq	%rbp
	retq
.LBB184_1:
	xorl	%eax, %eax
	movl	%eax, 36(%rdx)
	movl	64(%rsi), %eax
	cmpl	$3, %eax
	jle	.LBB184_4
.LBB184_9:                              # %cleanup
	cmpl	$4, %eax
	je	.LBB184_19
# %bb.10:                               # %cleanup
	cmpl	$8, %eax
	jne	.LBB184_12
# %bb.11:                               # %sw.bb9
	movl	$81921, 32(%rdx)        # imm = 0x14001
	xorl	%eax, %eax
	popq	%rbp
	retq
.LBB184_8:
	movl	$1, %eax
	movl	%eax, 36(%rdx)
	movl	64(%rsi), %eax
	cmpl	$3, %eax
	jle	.LBB184_4
	jmp	.LBB184_9
.LBB184_13:                             # %sw.bb
	movl	$67585, 32(%rdx)        # imm = 0x10801
	xorl	%eax, %eax
	popq	%rbp
	retq
.LBB184_19:                             # %sw.bb6
	movl	$73729, 32(%rdx)        # imm = 0x12001
	xorl	%eax, %eax
	popq	%rbp
	retq
.LBB184_12:                             # %sw.default
	leaq	.L.str.165(%rip), %rsi
	leaq	.L.str.1.166(%rip), %rdx
	popq	%rbp
	jmp	halide_error_failed_to_upgrade_buffer_t@PLT # TAILCALL
.LBB184_16:
	movl	$2, %eax
	movl	%eax, 36(%rdx)
	movl	64(%rsi), %eax
	cmpl	$3, %eax
	jle	.LBB184_4
	jmp	.LBB184_9
.LBB184_18:
	movl	$3, %eax
	movl	%eax, 36(%rdx)
	movl	64(%rsi), %eax
	cmpl	$3, %eax
	jle	.LBB184_4
	jmp	.LBB184_9
.Lfunc_end184:
	.size	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t, .Lfunc_end184-_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
                                        # -- End function
	.section	.text.halide_upgrade_buffer_t,"ax",@progbits
	.weak	halide_upgrade_buffer_t # -- Begin function halide_upgrade_buffer_t
	.p2align	4, 0x90
	.type	halide_upgrade_buffer_t,@function
halide_upgrade_buffer_t:                # @halide_upgrade_buffer_t
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, %r14
	movq	%rdx, %rbx
	movq	%rsi, %r12
	movq	%rdi, %r15
	movq	8(%rdx), %rax
	testq	%rax, %rax
	jne	.LBB185_4
# %bb.1:                                # %lor.lhs.false
	cmpq	$0, (%rbx)
	je	.LBB185_2
.LBB185_4:                              # %if.then
	movzbl	33(%r14), %ecx
	addl	$7, %ecx
	shrl	$3, %ecx
	cmpl	%ecx, 64(%rbx)
	jne	.LBB185_5
# %bb.11:                               # %if.end
	testl	%r8d, %r8d
	je	.LBB185_14
# %bb.12:                               # %if.then14
	cmpq	%rax, 16(%r14)
	je	.LBB185_22
# %bb.13:                               # %if.then18
	leaq	.L.str.6.172(%rip), %rdx
	movq	%r15, %rdi
	movq	%r12, %rsi
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_failed_to_upgrade_buffer_t@PLT # TAILCALL
.LBB185_5:                              # %if.then2
	addq	$32, %r14
	movl	$1024, %esi             # imm = 0x400
	movq	%r15, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	movq	%r12, -48(%rbp)         # 8-byte Spill
	je	.LBB185_6
# %bb.7:                                # %if.then.i97
	leaq	1023(%r13), %r12
	movb	$0, 1023(%r13)
	leaq	.L.str.2.167(%rip), %rdx
	movq	%r13, %rdi
	movq	%r12, %rsi
	jmp	.LBB185_8
.LBB185_14:                             # %if.end22
	movq	(%rbx), %rcx
	movq	%rax, 16(%r14)
	testq	%rcx, %rcx
	je	.LBB185_3
# %bb.15:                               # %if.then27
	movq	(%rcx), %rax
	movq	8(%rcx), %rcx
	movq	%rcx, 8(%r14)
	movq	%rax, (%r14)
	movslq	36(%r14), %rdx
	testq	%rdx, %rdx
	jg	.LBB185_17
	jmp	.LBB185_21
.LBB185_6:                              # %if.then2.split
	leaq	.L.str.2.167(%rip), %rdx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB185_8:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movslq	64(%rbx), %rdx
	movq	%r12, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.3.168(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.4.169(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r12, %rsi
	movq	%r14, %rdx
	callq	halide_type_to_string@PLT
	leaq	.L.str.5.170(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%r13, %r13
	je	.LBB185_9
# %bb.10:                               # %if.else.i
	movq	%rax, %rbx
	subq	%r13, %rbx
	incq	%rbx
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	-48(%rbp), %rsi         # 8-byte Reload
	movq	%r13, %rdx
	callq	halide_error_failed_to_upgrade_buffer_t@PLT
	movl	%eax, %r14d
	movq	%r15, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	halide_free@PLT
	movl	%r14d, %eax
	jmp	.LBB185_23
.LBB185_9:                              # %if.then.i
	leaq	.L.str.111(%rip), %r14
	movq	%r15, %rdi
	movq	-48(%rbp), %rsi         # 8-byte Reload
	movq	%r14, %rdx
	callq	halide_error_failed_to_upgrade_buffer_t@PLT
	movl	%eax, %ebx
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
	callq	halide_free@PLT
	movl	%ebx, %eax
	jmp	.LBB185_23
.LBB185_2:                              # %if.end22.thread
	movq	%rax, 16(%r14)
.LBB185_3:                              # %if.else
	movq	$0, 8(%r14)
	xorl	%eax, %eax
	movq	%rax, (%r14)
	movslq	36(%r14), %rdx
	testq	%rdx, %rdx
	jle	.LBB185_21
.LBB185_17:                             # %for.body.lr.ph
	movq	40(%r14), %r8
	movl	%edx, %ecx
	andl	$1, %ecx
	cmpl	$1, %edx
	jne	.LBB185_24
# %bb.18:
	xorl	%esi, %esi
	testq	%rcx, %rcx
	jne	.LBB185_20
	jmp	.LBB185_21
.LBB185_24:                             # %for.body.lr.ph.new
	leaq	24(%r8), %rdi
	subq	%rcx, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB185_25:                             # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	48(%rbx,%rsi,4), %eax
	movl	%eax, -24(%rdi)
	movl	16(%rbx,%rsi,4), %eax
	movl	%eax, -20(%rdi)
	movl	32(%rbx,%rsi,4), %eax
	movl	%eax, -16(%rdi)
	movl	52(%rbx,%rsi,4), %eax
	movl	%eax, -8(%rdi)
	movl	20(%rbx,%rsi,4), %eax
	movl	%eax, -4(%rdi)
	movl	36(%rbx,%rsi,4), %eax
	movl	%eax, (%rdi)
	addq	$2, %rsi
	addq	$32, %rdi
	cmpq	%rsi, %rdx
	jne	.LBB185_25
# %bb.19:                               # %for.cond.cleanup.loopexit.unr-lcssa
	testq	%rcx, %rcx
	je	.LBB185_21
.LBB185_20:                             # %for.body.epil
	movl	48(%rbx,%rsi,4), %ecx
	movq	%rsi, %rdx
	shlq	$4, %rdx
	movl	%ecx, (%r8,%rdx)
	movl	16(%rbx,%rsi,4), %ecx
	movl	%ecx, 4(%r8,%rdx)
	movl	32(%rbx,%rsi,4), %ecx
	movl	%ecx, 8(%r8,%rdx)
.LBB185_21:                             # %for.cond.cleanup
	movzbl	68(%rbx), %eax
	movq	%rax, %rcx
	orq	$2, %rcx
	cmpb	$0, 69(%rbx)
	cmoveq	%rax, %rcx
	movq	%rcx, 24(%r14)
.LBB185_22:                             # %return
	xorl	%eax, %eax
.LBB185_23:                             # %return
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end185:
	.size	halide_upgrade_buffer_t, .Lfunc_end185-halide_upgrade_buffer_t
                                        # -- End function
	.section	.text.halide_downgrade_buffer_t,"ax",@progbits
	.weak	halide_downgrade_buffer_t # -- Begin function halide_downgrade_buffer_t
	.p2align	4, 0x90
	.type	halide_downgrade_buffer_t,@function
halide_downgrade_buffer_t:              # @halide_downgrade_buffer_t
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rcx, %rbx
	movq	%rdx, %r15
	movq	%rsi, %r14
	movq	%rdi, %r12
	movl	$72, %edx
	movq	%rcx, %rdi
	xorl	%esi, %esi
	callq	memset@PLT
	movl	36(%r15), %eax
	cmpl	$5, %eax
	jl	.LBB186_1
# %bb.5:                                # %if.then
	leaq	.L.str.7.173(%rip), %rdx
	movq	%r12, %rdi
	movq	%r14, %rsi
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_error_failed_to_downgrade_buffer_t@PLT # TAILCALL
.LBB186_1:                              # %if.end
	movq	16(%r15), %rcx
	movq	%rcx, 8(%rbx)
	testl	%eax, %eax
	jle	.LBB186_4
# %bb.2:                                # %for.body.lr.ph
	movq	40(%r15), %rax
	addq	$8, %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB186_3:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-8(%rax), %edx
	movl	%edx, 48(%rbx,%rcx,4)
	movl	-4(%rax), %edx
	movl	%edx, 16(%rbx,%rcx,4)
	movl	(%rax), %edx
	movl	%edx, 32(%rbx,%rcx,4)
	incq	%rcx
	movslq	36(%r15), %rdx
	addq	$16, %rax
	cmpq	%rdx, %rcx
	jl	.LBB186_3
.LBB186_4:                              # %for.cond.cleanup
	movzbl	33(%r15), %eax
	addl	$7, %eax
	shrl	$3, %eax
	movl	%eax, 64(%rbx)
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	movq	%rbx, %rcx
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	halide_downgrade_buffer_t_device_fields@PLT # TAILCALL
.Lfunc_end186:
	.size	halide_downgrade_buffer_t, .Lfunc_end186-halide_downgrade_buffer_t
                                        # -- End function
	.section	.text.halide_downgrade_buffer_t_device_fields,"ax",@progbits
	.weak	halide_downgrade_buffer_t_device_fields # -- Begin function halide_downgrade_buffer_t_device_fields
	.p2align	4, 0x90
	.type	halide_downgrade_buffer_t_device_fields,@function
halide_downgrade_buffer_t_device_fields: # @halide_downgrade_buffer_t_device_fields
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rcx, %rbx
	movb	24(%rdx), %al
	movl	%eax, %ecx
	andb	$1, %cl
	movb	%cl, 68(%rbx)
	shrb	%al
	andb	$1, %al
	movb	%al, 69(%rbx)
	movq	(%rdx), %rax
	movq	(%rbx), %rdi
	testq	%rax, %rax
	je	.LBB187_4
# %bb.1:                                # %if.then
	movq	%rdx, %r14
	testq	%rdi, %rdi
	je	.LBB187_3
# %bb.2:                                # %if.then4
	movq	%rax, (%rdi)
	movq	8(%r14), %rax
	movq	%rax, 8(%rdi)
	jmp	.LBB187_6
.LBB187_4:                              # %if.else15
	testq	%rdi, %rdi
	je	.LBB187_6
# %bb.5:                                # %if.then18
	callq	free@PLT
	movq	$0, (%rbx)
	jmp	.LBB187_6
.LBB187_3:                              # %if.else
	movl	$16, %edi
	callq	malloc@PLT
	vmovups	(%r14), %xmm0
	vmovups	%xmm0, (%rax)
	movq	%rax, (%rbx)
.LBB187_6:                              # %if.end22
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end187:
	.size	halide_downgrade_buffer_t_device_fields, .Lfunc_end187-halide_downgrade_buffer_t_device_fields
                                        # -- End function
	.section	.text.halide_copy_to_host_legacy,"ax",@progbits
	.weak	halide_copy_to_host_legacy # -- Begin function halide_copy_to_host_legacy
	.p2align	4, 0x90
	.type	halide_copy_to_host_legacy,@function
halide_copy_to_host_legacy:             # @halide_copy_to_host_legacy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	andq	$-32, %rsp
	subq	$160, %rsp
	movq	%rsi, %r14
	movq	%rdi, %rbx
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 24(%rsp)
	vmovaps	%ymm0, (%rsp)
	vmovaps	%ymm0, 96(%rsp)
	vmovaps	%ymm0, 64(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	%rsp, %rdx
	vzeroupper
	callq	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t@PLT
	movl	$1, %r15d
	testl	%eax, %eax
	jne	.LBB188_4
# %bb.1:                                # %lor.rhs
	leaq	.L.str.165(%rip), %rsi
	movq	%rsp, %rcx
	movq	%rbx, %rdi
	movq	%r14, %rdx
	xorl	%r8d, %r8d
	callq	halide_upgrade_buffer_t@PLT
	testl	%eax, %eax
	jne	.LBB188_4
# %bb.2:                                # %lor.rhs4
	movq	%rsp, %rsi
	movq	%rbx, %rdi
	callq	halide_copy_to_host@PLT
	testl	%eax, %eax
	jne	.LBB188_4
# %bb.3:                                # %lor.rhs10
	leaq	.L.str.165(%rip), %rsi
	movq	%rsp, %rdx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	halide_downgrade_buffer_t_device_fields@PLT
	xorl	%r15d, %r15d
	testl	%eax, %eax
	setne	%r15b
.LBB188_4:                              # %lor.end13
	movl	%r15d, %eax
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end188:
	.size	halide_copy_to_host_legacy, .Lfunc_end188-halide_copy_to_host_legacy
                                        # -- End function
	.section	.text.halide_copy_to_device_legacy,"ax",@progbits
	.weak	halide_copy_to_device_legacy # -- Begin function halide_copy_to_device_legacy
	.p2align	4, 0x90
	.type	halide_copy_to_device_legacy,@function
halide_copy_to_device_legacy:           # @halide_copy_to_device_legacy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$160, %rsp
	movq	%rdx, %r12
	movq	%rsi, %r14
	movq	%rdi, %rbx
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 24(%rsp)
	vmovaps	%ymm0, (%rsp)
	vmovaps	%ymm0, 96(%rsp)
	vmovaps	%ymm0, 64(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	%rsp, %rdx
	vzeroupper
	callq	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t@PLT
	movl	$1, %r15d
	testl	%eax, %eax
	jne	.LBB189_4
# %bb.1:                                # %lor.rhs
	leaq	.L.str.165(%rip), %rsi
	movq	%rsp, %rcx
	movq	%rbx, %rdi
	movq	%r14, %rdx
	xorl	%r8d, %r8d
	callq	halide_upgrade_buffer_t@PLT
	testl	%eax, %eax
	jne	.LBB189_4
# %bb.2:                                # %lor.rhs5
	movq	%rsp, %rsi
	movq	%rbx, %rdi
	movq	%r12, %rdx
	callq	halide_copy_to_device@PLT
	testl	%eax, %eax
	jne	.LBB189_4
# %bb.3:                                # %lor.rhs11
	leaq	.L.str.165(%rip), %rsi
	movq	%rsp, %rdx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	halide_downgrade_buffer_t_device_fields@PLT
	xorl	%r15d, %r15d
	testl	%eax, %eax
	setne	%r15b
.LBB189_4:                              # %lor.end14
	movl	%r15d, %eax
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end189:
	.size	halide_copy_to_device_legacy, .Lfunc_end189-halide_copy_to_device_legacy
                                        # -- End function
	.section	.text.halide_device_sync_legacy,"ax",@progbits
	.weak	halide_device_sync_legacy # -- Begin function halide_device_sync_legacy
	.p2align	4, 0x90
	.type	halide_device_sync_legacy,@function
halide_device_sync_legacy:              # @halide_device_sync_legacy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	andq	$-32, %rsp
	subq	$160, %rsp
	movq	%rsi, %r14
	movq	%rdi, %rbx
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 24(%rsp)
	vmovaps	%ymm0, (%rsp)
	vmovaps	%ymm0, 96(%rsp)
	vmovaps	%ymm0, 64(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	%rsp, %rdx
	vzeroupper
	callq	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t@PLT
	movl	$1, %r15d
	testl	%eax, %eax
	jne	.LBB190_4
# %bb.1:                                # %lor.rhs
	leaq	.L.str.165(%rip), %rsi
	movq	%rsp, %rcx
	movq	%rbx, %rdi
	movq	%r14, %rdx
	xorl	%r8d, %r8d
	callq	halide_upgrade_buffer_t@PLT
	testl	%eax, %eax
	jne	.LBB190_4
# %bb.2:                                # %lor.rhs4
	movq	%rsp, %rsi
	movq	%rbx, %rdi
	callq	halide_device_sync@PLT
	testl	%eax, %eax
	jne	.LBB190_4
# %bb.3:                                # %lor.rhs10
	leaq	.L.str.165(%rip), %rsi
	movq	%rsp, %rdx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	halide_downgrade_buffer_t_device_fields@PLT
	xorl	%r15d, %r15d
	testl	%eax, %eax
	setne	%r15b
.LBB190_4:                              # %lor.end13
	movl	%r15d, %eax
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end190:
	.size	halide_device_sync_legacy, .Lfunc_end190-halide_device_sync_legacy
                                        # -- End function
	.section	.text.halide_device_malloc_legacy,"ax",@progbits
	.weak	halide_device_malloc_legacy # -- Begin function halide_device_malloc_legacy
	.p2align	4, 0x90
	.type	halide_device_malloc_legacy,@function
halide_device_malloc_legacy:            # @halide_device_malloc_legacy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$160, %rsp
	movq	%rdx, %r12
	movq	%rsi, %r14
	movq	%rdi, %rbx
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 24(%rsp)
	vmovaps	%ymm0, (%rsp)
	vmovaps	%ymm0, 96(%rsp)
	vmovaps	%ymm0, 64(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	%rsp, %rdx
	vzeroupper
	callq	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t@PLT
	movl	$1, %r15d
	testl	%eax, %eax
	jne	.LBB191_4
# %bb.1:                                # %lor.rhs
	leaq	.L.str.165(%rip), %rsi
	movq	%rsp, %rcx
	movq	%rbx, %rdi
	movq	%r14, %rdx
	xorl	%r8d, %r8d
	callq	halide_upgrade_buffer_t@PLT
	testl	%eax, %eax
	jne	.LBB191_4
# %bb.2:                                # %lor.rhs5
	movq	%rsp, %rsi
	movq	%rbx, %rdi
	movq	%r12, %rdx
	callq	halide_device_malloc@PLT
	testl	%eax, %eax
	jne	.LBB191_4
# %bb.3:                                # %lor.rhs11
	leaq	.L.str.165(%rip), %rsi
	movq	%rsp, %rdx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	halide_downgrade_buffer_t_device_fields@PLT
	xorl	%r15d, %r15d
	testl	%eax, %eax
	setne	%r15b
.LBB191_4:                              # %lor.end14
	movl	%r15d, %eax
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end191:
	.size	halide_device_malloc_legacy, .Lfunc_end191-halide_device_malloc_legacy
                                        # -- End function
	.section	.text.halide_device_free_legacy,"ax",@progbits
	.weak	halide_device_free_legacy # -- Begin function halide_device_free_legacy
	.p2align	4, 0x90
	.type	halide_device_free_legacy,@function
halide_device_free_legacy:              # @halide_device_free_legacy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	andq	$-32, %rsp
	subq	$160, %rsp
	movq	%rsi, %r14
	movq	%rdi, %rbx
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 24(%rsp)
	vmovaps	%ymm0, (%rsp)
	vmovaps	%ymm0, 96(%rsp)
	vmovaps	%ymm0, 64(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	%rsp, %rdx
	vzeroupper
	callq	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t@PLT
	movl	$1, %r15d
	testl	%eax, %eax
	jne	.LBB192_4
# %bb.1:                                # %lor.rhs
	leaq	.L.str.165(%rip), %rsi
	movq	%rsp, %rcx
	movq	%rbx, %rdi
	movq	%r14, %rdx
	xorl	%r8d, %r8d
	callq	halide_upgrade_buffer_t@PLT
	testl	%eax, %eax
	jne	.LBB192_4
# %bb.2:                                # %lor.rhs4
	movq	%rsp, %rsi
	movq	%rbx, %rdi
	callq	halide_device_free@PLT
	testl	%eax, %eax
	jne	.LBB192_4
# %bb.3:                                # %lor.rhs10
	leaq	.L.str.165(%rip), %rsi
	movq	%rsp, %rdx
	movq	%rbx, %rdi
	movq	%r14, %rcx
	callq	halide_downgrade_buffer_t_device_fields@PLT
	xorl	%r15d, %r15d
	testl	%eax, %eax
	setne	%r15b
.LBB192_4:                              # %lor.end13
	movl	%r15d, %eax
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end192:
	.size	halide_device_free_legacy, .Lfunc_end192-halide_device_free_legacy
                                        # -- End function
	.section	.text.halide_profiler_shutdown,"ax",@progbits
	.weak	halide_profiler_shutdown # -- Begin function halide_profiler_shutdown
	.p2align	4, 0x90
	.type	halide_profiler_shutdown,@function
halide_profiler_shutdown:               # @halide_profiler_shutdown
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	callq	halide_profiler_get_state@PLT
	movq	40(%rax), %rdi
	testq	%rdi, %rdi
	je	.LBB193_1
# %bb.2:                                # %if.end
	movq	%rax, %rbx
	movl	$-2, 16(%rax)
	callq	halide_join_thread@PLT
	movq	$0, 40(%rbx)
	movl	$-1, 16(%rbx)
	xorl	%edi, %edi
	movq	%rbx, %rsi
	callq	halide_profiler_report_unlocked@PLT
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	halide_profiler_reset_unlocked@PLT # TAILCALL
.LBB193_1:                              # %cleanup
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end193:
	.size	halide_profiler_shutdown, .Lfunc_end193-halide_profiler_shutdown
                                        # -- End function
	.section	.text.halide_profiler_get_state,"ax",@progbits
	.weak	halide_profiler_get_state # -- Begin function halide_profiler_get_state
	.p2align	4, 0x90
	.type	halide_profiler_get_state,@function
halide_profiler_get_state:              # @halide_profiler_get_state
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	_ZZ25halide_profiler_get_stateE1s(%rip), %rax
	popq	%rbp
	retq
.Lfunc_end194:
	.size	halide_profiler_get_state, .Lfunc_end194-halide_profiler_get_state
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2               # -- Begin function halide_profiler_report_unlocked
.LCPI195_0:
	.long	1232348160              # float 1.0E+6
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI195_1:
	.long	1127219200              # 0x43300000
	.long	1160773632              # 0x45300000
	.long	0                       # 0x0
	.long	0                       # 0x0
.LCPI195_2:
	.quad	4841369599423283200     # double 4503599627370496
	.quad	4985484787499139072     # double 1.9342813113834067E+25
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI195_3:
	.quad	4457293557087583675     # double 1.0E-10
	.section	.text.halide_profiler_report_unlocked,"ax",@progbits
	.weak	halide_profiler_report_unlocked
	.p2align	4, 0x90
	.type	halide_profiler_report_unlocked,@function
halide_profiler_report_unlocked:        # @halide_profiler_report_unlocked
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$1096, %rsp             # imm = 0x448
	movq	%rdi, -80(%rbp)         # 8-byte Spill
	leaq	-1136(%rbp), %rcx
	movb	$0, -113(%rbp)
	movq	24(%rsi), %rsi
	movl	$1, %eax
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	subq	%rcx, %rax
	movq	%rax, -72(%rbp)         # 8-byte Spill
	testq	%rsi, %rsi
	je	.LBB195_65
# %bb.1:                                # %for.body.preheader
	leaq	-113(%rbp), %r14
	leaq	-1136(%rbp), %r15
	leaq	.L.str.20.189(%rip), %r12
	movq	%r15, -48(%rbp)         # 8-byte Spill
	movq	(%rsi), %rax
	testq	%rax, %rax
	jns	.LBB195_4
	jmp	.LBB195_3
	.p2align	4, 0x90
.LBB195_64:                             # %cleanup191
	movq	64(%rsi), %rsi
	testq	%rsi, %rsi
	je	.LBB195_65
# %bb.2:                                # %for.body
	movq	(%rsi), %rax
	testq	%rax, %rax
	js	.LBB195_3
.LBB195_4:                              # %for.body
	vcvtsi2ss	%rax, %xmm1, %xmm0
	cmpl	$0, 80(%rsi)
	jne	.LBB195_6
	jmp	.LBB195_64
	.p2align	4, 0x90
.LBB195_3:
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1, %eax
	orq	%rcx, %rax
	vcvtsi2ss	%rax, %xmm4, %xmm0
	vaddss	%xmm0, %xmm0, %xmm0
	cmpl	$0, 80(%rsi)
	je	.LBB195_64
.LBB195_6:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5clearEv.exit
	vdivss	.LCPI195_0(%rip), %xmm0, %xmm0
	movb	$0, -1136(%rbp)
	movq	32(%rsi), %rax
	movq	%rax, -104(%rbp)        # 8-byte Spill
	movq	40(%rsi), %rax
	movq	%rax, -96(%rbp)         # 8-byte Spill
	movq	48(%rsi), %rdx
	testq	%rdx, %rdx
	vmovss	%xmm0, -48(%rbp)        # 4-byte Spill
	movq	%rsi, %rbx
	movq	%r15, %rdi
	movq	%r14, %rsi
	jne	.LBB195_8
# %bb.7:                                # %if.then.i290
	leaq	.L.str.112(%rip), %rdx
.LBB195_8:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EElsEPKc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	leaq	.L.str.3.215(%rip), %rdx
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.8.177(%rip), %rdx
	callq	halide_string_to_string@PLT
	vmovss	-48(%rbp), %xmm0        # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	%rax, %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.9.178(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.10.179(%rip), %rdx
	callq	halide_string_to_string@PLT
	movslq	84(%rbx), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.11.180(%rip), %rdx
	callq	halide_string_to_string@PLT
	movslq	80(%rbx), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.12.181(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rbx, %r13
	vcvtsi2ssl	80(%rbx), %xmm2, %xmm0
	vmovss	-48(%rbp), %xmm1        # 4-byte Reload
                                        # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	%rax, %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.13.182(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	-104(%rbp), %rcx        # 8-byte Reload
	movq	-96(%rbp), %rdx         # 8-byte Reload
	cmpq	%rdx, %rcx
	je	.LBB195_10
# %bb.9:                                # %if.then31
	vmovq	%rcx, %xmm0
	vmovdqa	.LCPI195_1(%rip), %xmm1 # xmm1 = [1127219200,1160773632,0,0]
	vmovdqa	%xmm1, %xmm2
	vpunpckldq	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	vmovapd	.LCPI195_2(%rip), %xmm1 # xmm1 = [4.503599627370496E+15,1.9342813113834067E+25]
	vmovapd	%xmm1, %xmm3
	vsubpd	%xmm1, %xmm0, %xmm0
	vhaddpd	%xmm0, %xmm0, %xmm0
	vmovq	%rdx, %xmm1
	vpunpckldq	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	vsubpd	%xmm3, %xmm1, %xmm1
	vhaddpd	%xmm1, %xmm1, %xmm1
	vaddsd	.LCPI195_3(%rip), %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -48(%rbp)        # 4-byte Spill
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.14.183(%rip), %rdx
	callq	halide_string_to_string@PLT
	vmovss	-48(%rbp), %xmm0        # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	%rax, %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.3.215(%rip), %rdx
	callq	halide_string_to_string@PLT
.LBB195_10:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE3strEv.exit401
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.15.184(%rip), %rdx
	callq	halide_string_to_string@PLT
	movslq	88(%r13), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.16.185(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	16(%r13), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.17.186(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rcx
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	leaq	(%rcx,%rax), %rdx
	movq	%r13, -64(%rbp)         # 8-byte Spill
	movq	-80(%rbp), %rbx         # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rdi
	movq	-64(%rbp), %rbx         # 8-byte Reload
	movq	%r15, %rsi
	callq	halide_print@PLT
	movq	%rbx, %rsi
	cmpq	$0, (%rbx)
	jne	.LBB195_16
# %bb.11:                               # %lor.end
	cmpq	$0, 24(%rsi)
	je	.LBB195_12
.LBB195_16:                             # %for.cond62.preheader
	movl	72(%rsi), %eax
	testl	%eax, %eax
	jle	.LBB195_64
# %bb.17:                               # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5clearEv.exit407.lr.ph
	xorl	%edx, %edx
	jmp	.LBB195_18
	.p2align	4, 0x90
.LBB195_62:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE3strEv.exit
                                        #   in Loop: Header=BB195_18 Depth=1
	leaq	.L.str.3.215(%rip), %rdx
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rcx
	movq	-72(%rbp), %rax         # 8-byte Reload
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	leaq	(%rcx,%rax), %rdx
	movq	-80(%rbp), %rbx         # 8-byte Reload
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	halide_print@PLT
	movq	-64(%rbp), %rsi         # 8-byte Reload
	movl	72(%rsi), %eax
	movq	-112(%rbp), %rdx        # 8-byte Reload
.LBB195_63:                             # %cleanup182
                                        #   in Loop: Header=BB195_18 Depth=1
	incq	%rdx
	movslq	%eax, %rcx
	cmpq	%rcx, %rdx
	jge	.LBB195_64
.LBB195_18:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5clearEv.exit407
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB195_23 Depth 2
                                        #     Child Loop BB195_31 Depth 2
                                        #     Child Loop BB195_38 Depth 2
                                        #     Child Loop BB195_44 Depth 2
                                        #     Child Loop BB195_54 Depth 2
                                        #     Child Loop BB195_58 Depth 2
	movb	$0, -1136(%rbp)
	movq	56(%rsi), %rbx
	leaq	(%rdx,%rdx,8), %rcx
	leaq	(%rbx,%rcx,8), %r13
	testq	%rdx, %rdx
	jne	.LBB195_20
# %bb.19:                               # %land.lhs.true
                                        #   in Loop: Header=BB195_18 Depth=1
	cmpq	$0, (%r13)
	movq	%r15, -48(%rbp)         # 8-byte Spill
	je	.LBB195_63
.LBB195_20:                             # %if.end75
                                        #   in Loop: Header=BB195_18 Depth=1
	movq	%rdx, -112(%rbp)        # 8-byte Spill
	movq	%r15, %rdi
	movq	%r14, %rsi
	leaq	.L.str.18.187(%rip), %rdx
	movq	%rcx, -48(%rbp)         # 8-byte Spill
	callq	halide_string_to_string@PLT
	movq	%rbx, -56(%rbp)         # 8-byte Spill
	movq	-48(%rbp), %rcx         # 8-byte Reload
	movq	56(%rbx,%rcx,8), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	testq	%rdx, %rdx
	jne	.LBB195_22
# %bb.21:                               # %if.then.i418
                                        #   in Loop: Header=BB195_18 Depth=1
	leaq	.L.str.112(%rip), %rdx
.LBB195_22:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EElsEPKc.exit423
                                        #   in Loop: Header=BB195_18 Depth=1
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.19.188(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rcx
	subq	%r15, %rcx
	cmpq	$24, %rcx
	ja	.LBB195_24
	.p2align	4, 0x90
.LBB195_23:                             # %while.body
                                        #   Parent Loop BB195_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rcx
	subq	%r15, %rcx
	cmpq	$25, %rcx
	jb	.LBB195_23
.LBB195_24:                             # %while.end
                                        #   in Loop: Header=BB195_18 Depth=1
	movq	(%r13), %rcx
	testq	%rcx, %rcx
	js	.LBB195_25
# %bb.26:                               # %while.end
                                        #   in Loop: Header=BB195_18 Depth=1
	vcvtsi2ss	%rcx, %xmm4, %xmm0
	jmp	.LBB195_27
	.p2align	4, 0x90
.LBB195_25:                             #   in Loop: Header=BB195_18 Depth=1
	movq	%rcx, %rdx
	shrq	%rdx
	andl	$1, %ecx
	orq	%rdx, %rcx
	vcvtsi2ss	%rcx, %xmm4, %xmm0
	vaddss	%xmm0, %xmm0, %xmm0
.LBB195_27:                             # %while.end
                                        #   in Loop: Header=BB195_18 Depth=1
	movq	-64(%rbp), %rcx         # 8-byte Reload
	vcvtsi2ssl	80(%rcx), %xmm4, %xmm1
	vmulss	.LCPI195_0(%rip), %xmm1, %xmm1
	vdivss	%xmm1, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	%rax, %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	testq	%rax, %rax
	je	.LBB195_28
# %bb.29:                               # %if.then.i446
                                        #   in Loop: Header=BB195_18 Depth=1
	addq	$-3, %rax
	cmpq	%r15, %rax
	cmovbq	%r15, %rax
	movb	$0, (%rax)
	jmp	.LBB195_30
	.p2align	4, 0x90
.LBB195_28:                             #   in Loop: Header=BB195_18 Depth=1
	xorl	%eax, %eax
.LBB195_30:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5eraseEi.exit
                                        #   in Loop: Header=BB195_18 Depth=1
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.21.190(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	subq	%r15, %rax
	cmpq	$34, %rax
	ja	.LBB195_32
	.p2align	4, 0x90
.LBB195_31:                             # %while.body95
                                        #   Parent Loop BB195_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r14, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	subq	%r15, %rax
	cmpq	$35, %rax
	jb	.LBB195_31
.LBB195_32:                             # %while.end97
                                        #   in Loop: Header=BB195_18 Depth=1
	movq	-64(%rbp), %rax         # 8-byte Reload
	movq	(%rax), %rcx
	testq	%rcx, %rcx
	je	.LBB195_33
# %bb.34:                               # %if.then100
                                        #   in Loop: Header=BB195_18 Depth=1
	imulq	$100, (%r13), %rax
	movq	%rax, %rdx
	orq	%rcx, %rdx
	shrq	$32, %rdx
	je	.LBB195_35
# %bb.36:                               #   in Loop: Header=BB195_18 Depth=1
	xorl	%edx, %edx
	divq	%rcx
	movq	%rax, %r13
	jmp	.LBB195_37
	.p2align	4, 0x90
.LBB195_33:                             #   in Loop: Header=BB195_18 Depth=1
	xorl	%r13d, %r13d
	jmp	.LBB195_37
	.p2align	4, 0x90
.LBB195_35:                             #   in Loop: Header=BB195_18 Depth=1
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%ecx
	movl	%eax, %r13d
.LBB195_37:                             # %if.end106
                                        #   in Loop: Header=BB195_18 Depth=1
	movq	-56(%rbp), %rbx         # 8-byte Reload
	movq	%r14, %rsi
	leaq	.L.str.22.191(%rip), %rdx
	callq	halide_string_to_string@PLT
	movslq	%r13d, %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.23.192(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	subq	%r15, %rax
	cmpq	$42, %rax
	ja	.LBB195_39
	.p2align	4, 0x90
.LBB195_38:                             # %while.body114
                                        #   Parent Loop BB195_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r14, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	subq	%r15, %rax
	cmpq	$43, %rax
	jb	.LBB195_38
.LBB195_39:                             # %while.end116
                                        #   in Loop: Header=BB195_18 Depth=1
	movl	$58, %r13d
	movq	-96(%rbp), %rax         # 8-byte Reload
	cmpq	%rax, -104(%rbp)        # 8-byte Folded Reload
	movq	-48(%rbp), %rsi         # 8-byte Reload
	je	.LBB195_46
# %bb.40:                               # %if.then118
                                        #   in Loop: Header=BB195_18 Depth=1
	vmovsd	40(%rbx,%rsi,8), %xmm0  # xmm0 = mem[0],zero
	vmovapd	.LCPI195_1(%rip), %xmm1 # xmm1 = [1127219200,1160773632,0,0]
	vmovapd	%xmm1, %xmm2
	vunpcklps	%xmm1, %xmm0, %xmm0 # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	vmovapd	.LCPI195_2(%rip), %xmm1 # xmm1 = [4.503599627370496E+15,1.9342813113834067E+25]
	vmovapd	%xmm1, %xmm3
	vsubpd	%xmm1, %xmm0, %xmm0
	vhaddpd	%xmm0, %xmm0, %xmm0
	vmovsd	48(%rbx,%rsi,8), %xmm1  # xmm1 = mem[0],zero
	vunpcklps	%xmm2, %xmm1, %xmm1 # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	vsubpd	%xmm3, %xmm1, %xmm1
	vhaddpd	%xmm1, %xmm1, %xmm1
	vaddsd	.LCPI195_3(%rip), %xmm1, %xmm1
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, -88(%rbp)        # 4-byte Spill
	movq	%r14, %rsi
	leaq	.L.str.24.193(%rip), %rdx
	callq	halide_string_to_string@PLT
	vmovss	-88(%rbp), %xmm0        # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	movq	%rax, %rdi
	movq	%r14, %rsi
	xorl	%edx, %edx
	callq	halide_double_to_string@PLT
	testq	%rax, %rax
	je	.LBB195_41
# %bb.42:                               # %if.then.i510
                                        #   in Loop: Header=BB195_18 Depth=1
	movq	%rax, %rdi
	addq	$-3, %rdi
	cmpq	%r15, %rdi
	cmovbq	%r15, %rdi
	movb	$0, (%rdi)
	jmp	.LBB195_43
.LBB195_41:                             #   in Loop: Header=BB195_18 Depth=1
	xorl	%edi, %edi
.LBB195_43:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5eraseEi.exit511
                                        #   in Loop: Header=BB195_18 Depth=1
	movq	-48(%rbp), %rsi         # 8-byte Reload
	movq	%rdi, %rax
	subq	%r15, %rax
	movl	$73, %r13d
	cmpq	$57, %rax
	ja	.LBB195_46
	.p2align	4, 0x90
.LBB195_44:                             # %while.body133
                                        #   Parent Loop BB195_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%r14, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	subq	%r15, %rax
	cmpq	$58, %rax
	jb	.LBB195_44
# %bb.45:                               # %if.end136.loopexit
                                        #   in Loop: Header=BB195_18 Depth=1
	movq	-48(%rbp), %rsi         # 8-byte Reload
.LBB195_46:                             # %if.end136
                                        #   in Loop: Header=BB195_18 Depth=1
	movslq	64(%rbx,%rsi,8), %rcx
	testq	%rcx, %rcx
	je	.LBB195_47
# %bb.48:                               # %if.then140
                                        #   in Loop: Header=BB195_18 Depth=1
	movq	24(%rbx,%rsi,8), %rax
	movq	%rax, %rdx
	orq	%rcx, %rdx
	shrq	$32, %rdx
	je	.LBB195_49
# %bb.50:                               #   in Loop: Header=BB195_18 Depth=1
	xorl	%edx, %edx
	divq	%rcx
	cmpq	$0, 16(%rbx,%rsi,8)
	jne	.LBB195_52
	jmp	.LBB195_60
	.p2align	4, 0x90
.LBB195_47:                             #   in Loop: Header=BB195_18 Depth=1
	xorl	%eax, %eax
	cmpq	$0, 16(%rbx,%rsi,8)
	jne	.LBB195_52
	jmp	.LBB195_60
	.p2align	4, 0x90
.LBB195_49:                             #   in Loop: Header=BB195_18 Depth=1
                                        # kill: def $eax killed $eax killed $rax
	xorl	%edx, %edx
	divl	%ecx
                                        # kill: def $eax killed $eax def $rax
	cmpq	$0, 16(%rbx,%rsi,8)
	je	.LBB195_60
.LBB195_52:                             # %if.then149
                                        #   in Loop: Header=BB195_18 Depth=1
	movq	%rax, -88(%rbp)         # 8-byte Spill
	leaq	(%rbx,%rsi,8), %rbx
	addq	$64, %rbx
	movq	%r14, %rsi
	leaq	.L.str.25.194(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	-48(%rbx), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	.p2align	4, 0x90
.LBB195_54:                             # %while.body157
                                        #   Parent Loop BB195_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, %rcx
	subq	%r15, %rcx
	movq	%rax, %rdi
	movq	%r14, %rsi
	cmpq	%r13, %rcx
	jae	.LBB195_55
# %bb.53:                               # %while.body157
                                        #   in Loop: Header=BB195_54 Depth=2
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	jmp	.LBB195_54
	.p2align	4, 0x90
.LBB195_55:                             # %while.end159
                                        #   in Loop: Header=BB195_18 Depth=1
	leaq	.L.str.26.195(%rip), %rdx
	callq	halide_string_to_string@PLT
	movslq	(%rbx), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	addq	$15, %r13
	movq	%rax, %rcx
	subq	%r15, %rcx
	cmpq	%r13, %rcx
	jae	.LBB195_56
# %bb.57:                               # %while.body167.preheader
                                        #   in Loop: Header=BB195_18 Depth=1
	movq	-56(%rbp), %rbx         # 8-byte Reload
	.p2align	4, 0x90
.LBB195_58:                             # %while.body167
                                        #   Parent Loop BB195_18 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	%rax, %rdi
	movq	%r14, %rsi
	movq	%r12, %rdx
	callq	halide_string_to_string@PLT
	movq	%rax, %rcx
	subq	%r15, %rcx
	cmpq	%r13, %rcx
	jb	.LBB195_58
	jmp	.LBB195_59
	.p2align	4, 0x90
.LBB195_56:                             #   in Loop: Header=BB195_18 Depth=1
	movq	-56(%rbp), %rbx         # 8-byte Reload
.LBB195_59:                             # %while.end169
                                        #   in Loop: Header=BB195_18 Depth=1
	movq	%rax, %rdi
	movq	%r14, %rsi
	leaq	.L.str.27.196(%rip), %rdx
	callq	halide_string_to_string@PLT
	movslq	-88(%rbp), %rdx         # 4-byte Folded Reload
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	movq	%rax, %rdi
	movq	-48(%rbp), %rsi         # 8-byte Reload
.LBB195_60:                             # %if.end172
                                        #   in Loop: Header=BB195_18 Depth=1
	cmpq	$0, 32(%rbx,%rsi,8)
	je	.LBB195_62
# %bb.61:                               # %if.then175
                                        #   in Loop: Header=BB195_18 Depth=1
	leaq	(%rbx,%rsi,8), %rbx
	addq	$32, %rbx
	movq	%r14, %rsi
	leaq	.L.str.28.197(%rip), %rdx
	callq	halide_string_to_string@PLT
	movq	(%rbx), %rdx
	movq	%rax, %rdi
	movq	%r14, %rsi
	movl	$1, %ecx
	callq	halide_uint64_to_string@PLT
	movq	%rax, %rdi
	jmp	.LBB195_62
.LBB195_12:                             # %for.cond50.preheader
	movslq	72(%rsi), %rax
	testq	%rax, %rax
	jle	.LBB195_64
# %bb.13:                               # %for.body53.lr.ph
	movq	56(%rsi), %rcx
	addq	$32, %rcx
	.p2align	4, 0x90
.LBB195_15:                             # %for.body53
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$0, (%rcx)
	jne	.LBB195_16
# %bb.14:                               # %for.cond50
                                        #   in Loop: Header=BB195_15 Depth=1
	addq	$72, %rcx
	decq	%rax
	jne	.LBB195_15
	jmp	.LBB195_64
.LBB195_65:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EED2Ev.exit
	movq	-48(%rbp), %rdx         # 8-byte Reload
	addq	-72(%rbp), %rdx         # 8-byte Folded Reload
	leaq	-1136(%rbp), %rsi
	movq	-80(%rbp), %rdi         # 8-byte Reload
	callq	halide_msan_annotate_memory_is_initialized@PLT
	addq	$1096, %rsp             # imm = 0x448
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end195:
	.size	halide_profiler_report_unlocked, .Lfunc_end195-halide_profiler_report_unlocked
                                        # -- End function
	.section	.text.halide_profiler_reset_unlocked,"ax",@progbits
	.weak	halide_profiler_reset_unlocked # -- Begin function halide_profiler_reset_unlocked
	.p2align	4, 0x90
	.type	halide_profiler_reset_unlocked,@function
halide_profiler_reset_unlocked:         # @halide_profiler_reset_unlocked
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.LBB196_3
	.p2align	4, 0x90
.LBB196_1:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	movq	64(%rbx), %rax
	movq	%rax, 24(%r14)
	movq	56(%rbx), %rdi
	callq	free@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	movq	24(%r14), %rbx
	testq	%rbx, %rbx
	jne	.LBB196_1
.LBB196_3:                              # %while.end
	movl	$0, 12(%r14)
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end196:
	.size	halide_profiler_reset_unlocked, .Lfunc_end196-halide_profiler_reset_unlocked
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy # -- Begin function _ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy,@function
_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy: # @_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdx, %r12
	movl	%esi, %r14d
	movq	%rdi, %r13
	callq	halide_profiler_get_state@PLT
	movq	%rax, %r15
	movq	24(%rax), %rbx
	testq	%rbx, %rbx
	jne	.LBB197_2
.LBB197_5:                              # %for.end.critedge
	movl	$96, %edi
	callq	malloc@PLT
	testq	%rax, %rax
	je	.LBB197_17
# %bb.6:                                # %if.end7
	movq	%rax, %rbx
	movq	24(%r15), %rax
	movq	%rax, 64(%rbx)
	movq	%r13, 48(%rbx)
	movl	12(%r15), %eax
	movl	%eax, 76(%rbx)
	movl	%r14d, 72(%rbx)
	movq	$0, 80(%rbx)
	movl	$0, 88(%rbx)
	movslq	%r14d, %rax
	shlq	$3, %rax
	leaq	(%rax,%rax,8), %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, (%rbx)
	vmovups	%ymm0, 16(%rbx)
	vzeroupper
	callq	malloc@PLT
	movq	%rax, 56(%rbx)
	testq	%rax, %rax
	je	.LBB197_16
# %bb.7:                                # %for.cond17.preheader
	testl	%r14d, %r14d
	jle	.LBB197_13
# %bb.8:                                # %for.body20.lr.ph
	movl	%r14d, %edx
	leaq	-1(%rdx), %rsi
	movl	%edx, %r8d
	andl	$3, %r8d
	cmpq	$3, %rsi
	jae	.LBB197_14
# %bb.9:
	xorl	%esi, %esi
	testq	%r8, %r8
	jne	.LBB197_11
	jmp	.LBB197_13
	.p2align	4, 0x90
.LBB197_4:                              # %for.inc
                                        #   in Loop: Header=BB197_2 Depth=1
	movq	64(%rbx), %rbx
	testq	%rbx, %rbx
	je	.LBB197_5
.LBB197_2:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%r13, 48(%rbx)
	jne	.LBB197_4
# %bb.3:                                # %land.lhs.true
                                        #   in Loop: Header=BB197_2 Depth=1
	cmpl	%r14d, 72(%rbx)
	jne	.LBB197_4
	jmp	.LBB197_18
.LBB197_16:                             # %if.then15
	movq	%rbx, %rdi
	callq	free@PLT
.LBB197_17:                             # %cleanup62
	xorl	%ebx, %ebx
	jmp	.LBB197_18
.LBB197_14:                             # %for.body20.lr.ph.new
	leaq	280(%rax), %rdi
	subq	%r8, %rdx
	xorl	%esi, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB197_15:                             # %for.body20
                                        # =>This Inner Loop Header: Depth=1
	movq	$0, -280(%rdi)
	movq	(%r12,%rsi,8), %rcx
	movq	%rcx, -224(%rdi)
	movl	$0, -216(%rdi)
	vmovups	%ymm0, -272(%rdi)
	vmovups	%ymm0, -256(%rdi)
	movq	$0, -208(%rdi)
	movq	8(%r12,%rsi,8), %rcx
	movq	%rcx, -152(%rdi)
	movl	$0, -144(%rdi)
	vmovups	%ymm0, -200(%rdi)
	vmovups	%ymm0, -184(%rdi)
	movq	$0, -136(%rdi)
	movq	16(%r12,%rsi,8), %rcx
	movq	%rcx, -80(%rdi)
	movl	$0, -72(%rdi)
	vmovups	%ymm0, -128(%rdi)
	vmovups	%ymm0, -112(%rdi)
	movq	$0, -64(%rdi)
	movq	24(%r12,%rsi,8), %rcx
	movq	%rcx, -8(%rdi)
	movl	$0, (%rdi)
	addq	$4, %rsi
	vmovups	%ymm0, -56(%rdi)
	vmovups	%ymm0, -40(%rdi)
	addq	$288, %rdi              # imm = 0x120
	cmpq	%rsi, %rdx
	jne	.LBB197_15
# %bb.10:                               # %for.cond.cleanup19.loopexit.unr-lcssa
	testq	%r8, %r8
	je	.LBB197_13
.LBB197_11:                             # %for.body20.epil.preheader
	leaq	(%rsi,%rsi,8), %rdx
	leaq	(%rax,%rdx,8), %rax
	addq	$64, %rax
	leaq	(%r12,%rsi,8), %rdx
	xorl	%esi, %esi
	vxorps	%xmm0, %xmm0, %xmm0
	.p2align	4, 0x90
.LBB197_12:                             # %for.body20.epil
                                        # =>This Inner Loop Header: Depth=1
	movq	$0, -64(%rax)
	movq	(%rdx,%rsi,8), %rdi
	movq	%rdi, -8(%rax)
	movl	$0, (%rax)
	vmovups	%ymm0, -56(%rax)
	vmovups	%ymm0, -40(%rax)
	addq	$72, %rax
	incq	%rsi
	cmpq	%rsi, %r8
	jne	.LBB197_12
.LBB197_13:                             # %for.cond.cleanup19
	addl	%r14d, 12(%r15)
	movq	%rbx, 24(%r15)
.LBB197_18:                             # %cleanup62
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
.Lfunc_end197:
	.size	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy, .Lfunc_end197-_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4               # -- Begin function _ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
.LCPI198_0:
	.zero	8
	.quad	1                       # 0x1
	.section	.text._ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi,@function
_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi: # @_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	24(%rdi), %r8
	testq	%r8, %r8
	je	.LBB198_8
# %bb.1:                                # %for.body.preheader
	xorl	%r10d, %r10d
	movq	%r8, %rax
	movq	%rax, %r11
	movslq	76(%rax), %r9
	cmpl	%esi, %r9d
	jle	.LBB198_4
	.p2align	4, 0x90
.LBB198_2:                              # %if.end23
                                        # =>This Inner Loop Header: Depth=1
	movq	64(%r11), %rax
	movq	%r11, %r10
	testq	%rax, %rax
	je	.LBB198_8
# %bb.3:                                # %for.body
                                        #   in Loop: Header=BB198_2 Depth=1
	movq	%rax, %r11
	movslq	76(%rax), %r9
	cmpl	%esi, %r9d
	jg	.LBB198_2
.LBB198_4:                              # %land.lhs.true
	movl	72(%r11), %eax
	addl	%r9d, %eax
	cmpl	%esi, %eax
	jle	.LBB198_2
# %bb.5:                                # %if.then
	testq	%r10, %r10
	je	.LBB198_7
# %bb.6:                                # %if.then4
	movq	64(%r11), %rax
	movq	%rax, 64(%r10)
	movq	%r8, 64(%r11)
	movq	%r11, 24(%rdi)
.LBB198_7:                              # %if.end
	movslq	%esi, %rax
	leaq	(%rax,%rax,8), %rax
	shlq	$3, %rax
	addq	56(%r11), %rax
	negq	%r9
	leaq	(%r9,%r9,8), %rsi
	addq	%rdx, (%rax,%rsi,8)
	movslq	%ecx, %rcx
	vmovdqa	.LCPI198_0(%rip), %xmm0 # xmm0 = <u,1>
	vpinsrq	$0, %rcx, %xmm0, %xmm0
	vpaddq	40(%rax,%rsi,8), %xmm0, %xmm1
	vmovdqu	%xmm1, 40(%rax,%rsi,8)
	addq	%rdx, (%r11)
	incl	84(%r11)
	vpaddq	32(%r11), %xmm0, %xmm0
	vmovdqu	%xmm0, 32(%r11)
.LBB198_8:                              # %cleanup25
	popq	%rbp
	retq
.Lfunc_end198:
	.size	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi, .Lfunc_end198-_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv # -- Begin function _ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv,@function
_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv: # @_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	callq	halide_profiler_get_state@PLT
	movq	%rax, %r13
	movq	%rax, %rdi
	callq	halide_mutex_lock@PLT
	cmpl	$-2, 16(%r13)
	je	.LBB199_11
# %bb.1:                                # %while.body.lr.ph
	leaq	-48(%rbp), %r14
	leaq	-44(%rbp), %r15
	jmp	.LBB199_2
	.p2align	4, 0x90
.LBB199_10:                             # %cleanup
                                        #   in Loop: Header=BB199_2 Depth=1
	cmpl	$-2, 16(%r13)
	je	.LBB199_11
.LBB199_2:                              # %while.body
                                        # =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	callq	halide_current_time_ns@PLT
	movq	%rax, %r12
	movq	32(%r13), %rax
	testq	%rax, %rax
	jne	.LBB199_4
	jmp	.LBB199_5
	.p2align	4, 0x90
.LBB199_9:                              # %if.end14
                                        #   in Loop: Header=BB199_2 Depth=1
	movl	8(%r13), %r12d
	movq	%r13, %rdi
	callq	halide_mutex_unlock@PLT
	xorl	%edi, %edi
	movl	%r12d, %esi
	callq	halide_sleep_ms@PLT
	movq	%r13, %rdi
	callq	halide_mutex_lock@PLT
	movq	%rbx, %r12
	movq	32(%r13), %rax
	testq	%rax, %rax
	je	.LBB199_5
.LBB199_4:                              # %if.then
                                        #   in Loop: Header=BB199_2 Depth=1
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	*%rax
	jmp	.LBB199_6
	.p2align	4, 0x90
.LBB199_5:                              # %if.else
                                        #   in Loop: Header=BB199_2 Depth=1
	movl	16(%r13), %eax
	movl	%eax, -48(%rbp)
	movl	20(%r13), %eax
	movl	%eax, -44(%rbp)
.LBB199_6:                              # %if.end
                                        #   in Loop: Header=BB199_2 Depth=1
	xorl	%edi, %edi
	callq	halide_current_time_ns@PLT
	movl	-48(%rbp), %esi
	cmpl	$-2, %esi
	je	.LBB199_10
# %bb.7:                                # %if.else10
                                        #   in Loop: Header=BB199_2 Depth=1
	movq	%rax, %rbx
	testl	%esi, %esi
	js	.LBB199_9
# %bb.8:                                # %if.then12
                                        #   in Loop: Header=BB199_2 Depth=1
	movq	%rbx, %rdx
	subq	%r12, %rdx
	movl	-44(%rbp), %ecx
	movq	%r13, %rdi
	callq	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi@PLT
	jmp	.LBB199_9
.LBB199_11:                             # %while.end19
	movq	%r13, %rdi
	callq	halide_mutex_unlock@PLT
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end199:
	.size	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv, .Lfunc_end199-_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
                                        # -- End function
	.section	.text.halide_profiler_get_pipeline_state,"ax",@progbits
	.weak	halide_profiler_get_pipeline_state # -- Begin function halide_profiler_get_pipeline_state
	.p2align	4, 0x90
	.type	halide_profiler_get_pipeline_state,@function
halide_profiler_get_pipeline_state:     # @halide_profiler_get_pipeline_state
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %r15
	callq	halide_profiler_get_state@PLT
	movq	%rax, %r14
	movq	%rax, %rdi
	callq	halide_mutex_lock@PLT
	movq	24(%r14), %rbx
	testq	%rbx, %rbx
	je	.LBB200_4
	.p2align	4, 0x90
.LBB200_2:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%r15, 48(%rbx)
	je	.LBB200_5
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB200_2 Depth=1
	movq	64(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.LBB200_2
.LBB200_4:
	xorl	%ebx, %ebx
.LBB200_5:                              # %cleanup
	movq	%r14, %rdi
	callq	halide_mutex_unlock@PLT
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end200:
	.size	halide_profiler_get_pipeline_state, .Lfunc_end200-halide_profiler_get_pipeline_state
                                        # -- End function
	.section	.text.halide_profiler_pipeline_start,"ax",@progbits
	.weak	halide_profiler_pipeline_start # -- Begin function halide_profiler_pipeline_start
	.p2align	4, 0x90
	.type	halide_profiler_pipeline_start,@function
halide_profiler_pipeline_start:         # @halide_profiler_pipeline_start
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rcx, %r15
	movl	%edx, %r12d
	movq	%rsi, %r13
	movq	%rdi, %r14
	callq	halide_profiler_get_state@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	halide_mutex_lock@PLT
	cmpq	$0, 40(%rbx)
	jne	.LBB201_2
# %bb.1:                                # %if.then
	movq	%r14, %rdi
	callq	halide_start_clock@PLT
	movq	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv@GOTPCREL(%rip), %rdi
	xorl	%esi, %esi
	callq	halide_spawn_thread@PLT
	movq	%rax, 40(%rbx)
.LBB201_2:                              # %if.end
	movq	%r13, %rdi
	movl	%r12d, %esi
	movq	%r15, %rdx
	callq	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy@PLT
	testq	%rax, %rax
	je	.LBB201_3
# %bb.4:                                # %if.end9
	incl	80(%rax)
	movl	76(%rax), %r14d
	jmp	.LBB201_5
.LBB201_3:                              # %if.then7
	movq	%r14, %rdi
	callq	halide_error_out_of_memory@PLT
	movl	%eax, %r14d
.LBB201_5:                              # %cleanup
	movq	%rbx, %rdi
	callq	halide_mutex_unlock@PLT
	movl	%r14d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end201:
	.size	halide_profiler_pipeline_start, .Lfunc_end201-halide_profiler_pipeline_start
                                        # -- End function
	.section	.text.halide_profiler_stack_peak_update,"ax",@progbits
	.weak	halide_profiler_stack_peak_update # -- Begin function halide_profiler_stack_peak_update
	.p2align	4, 0x90
	.type	halide_profiler_stack_peak_update,@function
halide_profiler_stack_peak_update:      # @halide_profiler_stack_peak_update
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdx, %r14
	movq	%rsi, %rbx
	testq	%rsi, %rsi
	je	.LBB202_1
# %bb.2:                                # %if.end
	movl	72(%rbx), %eax
	testl	%eax, %eax
	jle	.LBB202_10
.LBB202_3:                              # %for.body.lr.ph
	xorl	%edx, %edx
	movq	(%r14,%rdx,8), %rsi
	testq	%rsi, %rsi
	jne	.LBB202_5
	jmp	.LBB202_9
	.p2align	4, 0x90
.LBB202_8:                              # %for.inc.loopexit
	movl	72(%rbx), %eax
.LBB202_9:                              # %for.inc
                                        # =>This Inner Loop Header: Depth=1
	incq	%rdx
	movslq	%eax, %rcx
	cmpq	%rcx, %rdx
	jge	.LBB202_10
# %bb.4:                                # %for.body
                                        #   in Loop: Header=BB202_9 Depth=1
	movq	(%r14,%rdx,8), %rsi
	testq	%rsi, %rsi
	je	.LBB202_9
.LBB202_5:                              # %if.then3
	movq	56(%rbx), %rax
	leaq	(%rdx,%rdx,8), %rcx
	leaq	(%rax,%rcx,8), %rdi
	addq	$32, %rdi
	movq	32(%rax,%rcx,8), %rcx
	.p2align	4, 0x90
.LBB202_6:                              # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rsi, %rcx
	jae	.LBB202_8
# %bb.7:                                # %while.body.i
                                        #   in Loop: Header=BB202_6 Depth=1
	movq	%rcx, %rax
	lock		cmpxchgq	%rsi, (%rdi)
	cmpq	%rax, %rcx
	movq	%rax, %rcx
	jne	.LBB202_6
	jmp	.LBB202_8
.LBB202_1:                              # %if.then
	leaq	.L.str.198(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	movl	72(%rbx), %eax
	testl	%eax, %eax
	jg	.LBB202_3
.LBB202_10:                             # %for.cond.cleanup
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end202:
	.size	halide_profiler_stack_peak_update, .Lfunc_end202-halide_profiler_stack_peak_update
                                        # -- End function
	.section	.text.halide_profiler_memory_allocate,"ax",@progbits
	.weak	halide_profiler_memory_allocate # -- Begin function halide_profiler_memory_allocate
	.p2align	4, 0x90
	.type	halide_profiler_memory_allocate,@function
halide_profiler_memory_allocate:        # @halide_profiler_memory_allocate
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	testq	%rcx, %rcx
	je	.LBB203_13
# %bb.1:                                # %if.end
	movq	%rcx, %r14
	movl	%edx, %r15d
	movq	%rsi, %rbx
	movq	%rdi, %r12
	testq	%rsi, %rsi
	je	.LBB203_2
# %bb.3:                                # %if.end3
	testl	%r15d, %r15d
	js	.LBB203_4
.LBB203_5:                              # %if.end6
	cmpl	%r15d, 72(%rbx)
	jg	.LBB203_7
.LBB203_6:                              # %if.then8
	leaq	.L.str.3.201(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB203_7:                              # %if.end9
	movq	56(%rbx), %rdx
	lock		incl	88(%rbx)
	lock		addq	%r14, 24(%rbx)
	movq	%r14, %rsi
	lock		xaddq	%rsi, 8(%rbx)
	movslq	%r15d, %rdi
	addq	%r14, %rsi
	movq	16(%rbx), %rcx
	.p2align	4, 0x90
.LBB203_8:                              # %while.cond.i
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rsi, %rcx
	jae	.LBB203_10
# %bb.9:                                # %while.body.i
                                        #   in Loop: Header=BB203_8 Depth=1
	movq	%rcx, %rax
	lock		cmpxchgq	%rsi, 16(%rbx)
	cmpq	%rax, %rcx
	movq	%rax, %rcx
	jne	.LBB203_8
.LBB203_10:                             # %_ZN12_GLOBAL__N_125sync_compare_max_and_swapIyEEvPT_S1_.exit
	leaq	(%rdi,%rdi,8), %rax
	lock		incl	64(%rdx,%rax,8)
	lock		addq	%r14, 24(%rdx,%rax,8)
	movq	%r14, %rsi
	lock		xaddq	%rsi, 8(%rdx,%rax,8)
	addq	%r14, %rsi
	leaq	(%rdx,%rax,8), %rdi
	addq	$16, %rdi
	movq	16(%rdx,%rax,8), %rcx
	.p2align	4, 0x90
.LBB203_11:                             # %while.cond.i37
                                        # =>This Inner Loop Header: Depth=1
	cmpq	%rsi, %rcx
	jae	.LBB203_13
# %bb.12:                               # %while.body.i39
                                        #   in Loop: Header=BB203_11 Depth=1
	movq	%rcx, %rax
	lock		cmpxchgq	%rsi, (%rdi)
	cmpq	%rax, %rcx
	movq	%rax, %rcx
	jne	.LBB203_11
.LBB203_13:                             # %return
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB203_2:                              # %if.then2
	leaq	.L.str.1.199(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	testl	%r15d, %r15d
	jns	.LBB203_5
.LBB203_4:                              # %if.then5
	leaq	.L.str.2.200(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	cmpl	%r15d, 72(%rbx)
	jle	.LBB203_6
	jmp	.LBB203_7
.Lfunc_end203:
	.size	halide_profiler_memory_allocate, .Lfunc_end203-halide_profiler_memory_allocate
                                        # -- End function
	.section	.text.halide_profiler_memory_free,"ax",@progbits
	.weak	halide_profiler_memory_free # -- Begin function halide_profiler_memory_free
	.p2align	4, 0x90
	.type	halide_profiler_memory_free,@function
halide_profiler_memory_free:            # @halide_profiler_memory_free
# %bb.0:                                # %entry
	testq	%rcx, %rcx
	je	.LBB204_8
# %bb.1:                                # %if.end
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rcx, %r14
	movl	%edx, %r15d
	movq	%rsi, %rbx
	movq	%rdi, %r12
	testq	%rsi, %rsi
	je	.LBB204_2
# %bb.3:                                # %if.end3
	testl	%r15d, %r15d
	js	.LBB204_4
.LBB204_5:                              # %if.end6
	cmpl	%r15d, 72(%rbx)
	jg	.LBB204_7
.LBB204_6:                              # %if.then8
	leaq	.L.str.6.204(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB204_7:                              # %if.end9
	movq	56(%rbx), %rax
	movslq	%r15d, %rcx
	lock		subq	%r14, 8(%rbx)
	leaq	(%rcx,%rcx,8), %rcx
	lock		subq	%r14, 8(%rax,%rcx,8)
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
.LBB204_8:                              # %return
	retq
.LBB204_2:                              # %if.then2
	leaq	.L.str.4.202(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	testl	%r15d, %r15d
	jns	.LBB204_5
.LBB204_4:                              # %if.then5
	leaq	.L.str.5.203(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	cmpl	%r15d, 72(%rbx)
	jle	.LBB204_6
	jmp	.LBB204_7
.Lfunc_end204:
	.size	halide_profiler_memory_free, .Lfunc_end204-halide_profiler_memory_free
                                        # -- End function
	.section	.text.halide_profiler_report,"ax",@progbits
	.weak	halide_profiler_report  # -- Begin function halide_profiler_report
	.p2align	4, 0x90
	.type	halide_profiler_report,@function
halide_profiler_report:                 # @halide_profiler_report
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %r14
	callq	halide_profiler_get_state@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	halide_mutex_lock@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_profiler_report_unlocked@PLT
	movq	%rbx, %rdi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	halide_mutex_unlock@PLT # TAILCALL
.Lfunc_end205:
	.size	halide_profiler_report, .Lfunc_end205-halide_profiler_report
                                        # -- End function
	.section	.text.halide_profiler_reset,"ax",@progbits
	.weak	halide_profiler_reset   # -- Begin function halide_profiler_reset
	.p2align	4, 0x90
	.type	halide_profiler_reset,@function
halide_profiler_reset:                  # @halide_profiler_reset
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	callq	halide_profiler_get_state@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	halide_mutex_lock@PLT
	movq	%rbx, %rdi
	callq	halide_profiler_reset_unlocked@PLT
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	halide_mutex_unlock@PLT # TAILCALL
.Lfunc_end206:
	.size	halide_profiler_reset, .Lfunc_end206-halide_profiler_reset
                                        # -- End function
	.section	.text.halide_profiler_pipeline_end,"ax",@progbits
	.weak	halide_profiler_pipeline_end # -- Begin function halide_profiler_pipeline_end
	.p2align	4, 0x90
	.type	halide_profiler_pipeline_end,@function
halide_profiler_pipeline_end:           # @halide_profiler_pipeline_end
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$-1, 16(%rsi)
	popq	%rbp
	retq
.Lfunc_end207:
	.size	halide_profiler_pipeline_end, .Lfunc_end207-halide_profiler_pipeline_end
                                        # -- End function
	.section	.text.halide_msan_annotate_memory_is_initialized,"ax",@progbits
	.weak	halide_msan_annotate_memory_is_initialized # -- Begin function halide_msan_annotate_memory_is_initialized
	.p2align	4, 0x90
	.type	halide_msan_annotate_memory_is_initialized,@function
halide_msan_annotate_memory_is_initialized: # @halide_msan_annotate_memory_is_initialized
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end208:
	.size	halide_msan_annotate_memory_is_initialized, .Lfunc_end208-halide_msan_annotate_memory_is_initialized
                                        # -- End function
	.section	.text.halide_msan_annotate_buffer_is_initialized,"ax",@progbits
	.weak	halide_msan_annotate_buffer_is_initialized # -- Begin function halide_msan_annotate_buffer_is_initialized
	.p2align	4, 0x90
	.type	halide_msan_annotate_buffer_is_initialized,@function
halide_msan_annotate_buffer_is_initialized: # @halide_msan_annotate_buffer_is_initialized
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end209:
	.size	halide_msan_annotate_buffer_is_initialized, .Lfunc_end209-halide_msan_annotate_buffer_is_initialized
                                        # -- End function
	.section	.text.halide_msan_annotate_buffer_is_initialized_as_destructor,"ax",@progbits
	.weak	halide_msan_annotate_buffer_is_initialized_as_destructor # -- Begin function halide_msan_annotate_buffer_is_initialized_as_destructor
	.p2align	4, 0x90
	.type	halide_msan_annotate_buffer_is_initialized_as_destructor,@function
halide_msan_annotate_buffer_is_initialized_as_destructor: # @halide_msan_annotate_buffer_is_initialized_as_destructor
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	retq
.Lfunc_end210:
	.size	halide_msan_annotate_buffer_is_initialized_as_destructor, .Lfunc_end210-halide_msan_annotate_buffer_is_initialized_as_destructor
                                        # -- End function
	.section	.text.halide_default_can_use_target_features,"ax",@progbits
	.weak	halide_default_can_use_target_features # -- Begin function halide_default_can_use_target_features
	.p2align	4, 0x90
	.type	halide_default_can_use_target_features,@function
halide_default_can_use_target_features: # @halide_default_can_use_target_features
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	movq	%rsi, %r14
	movl	%edi, %ebx
	movq	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE@GOTPCREL(%rip), %r12
	cmpb	$0, (%r12)
	je	.LBB211_1
# %bb.2:                                # %if.end
	movq	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	cmpl	$2, %ebx
	jne	.LBB211_3
.LBB211_4:                              # %if.end2
	movq	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rdx
	andq	(%r14), %rdx
	je	.LBB211_6
.LBB211_5:                              # %if.then7
	movq	16(%rcx), %rsi
	xorl	%eax, %eax
	andnq	%rdx, %rsi, %rdx
	je	.LBB211_6
	jmp	.LBB211_9
.LBB211_1:                              # %if.then
	leaq	-64(%rbp), %r15
	movq	%r15, %rdi
	callq	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv@PLT
	movq	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE@GOTPCREL(%rip), %rdi
	movl	$32, %edx
	movq	%r15, %rsi
	callq	memcpy@PLT
	movb	$1, (%r12)
	movq	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	cmpl	$2, %ebx
	je	.LBB211_4
.LBB211_3:                              # %if.then1
	leaq	.L.str.209(%rip), %rsi
	xorl	%edi, %edi
	callq	halide_error@PLT
	movq	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rdx
	andq	(%r14), %rdx
	jne	.LBB211_5
.LBB211_6:                              # %for.inc
	movq	8(%rcx), %rdx
	andq	8(%r14), %rdx
	je	.LBB211_8
# %bb.7:                                # %if.then7.1
	movq	24(%rcx), %rcx
	xorl	%eax, %eax
	andnq	%rdx, %rcx, %rcx
	jne	.LBB211_9
.LBB211_8:                              # %for.inc.1
	movl	$1, %eax
.LBB211_9:                              # %cleanup15
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end211:
	.size	halide_default_can_use_target_features, .Lfunc_end211-halide_default_can_use_target_features
                                        # -- End function
	.section	.text.halide_set_custom_can_use_target_features,"ax",@progbits
	.weak	halide_set_custom_can_use_target_features # -- Begin function halide_set_custom_can_use_target_features
	.p2align	4, 0x90
	.type	halide_set_custom_can_use_target_features,@function
halide_set_custom_can_use_target_features: # @halide_set_custom_can_use_target_features
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rdi, (%rcx)
	popq	%rbp
	retq
.Lfunc_end212:
	.size	halide_set_custom_can_use_target_features, .Lfunc_end212-halide_set_custom_can_use_target_features
                                        # -- End function
	.section	.text.halide_can_use_target_features,"ax",@progbits
	.weak	halide_can_use_target_features # -- Begin function halide_can_use_target_features
	.p2align	4, 0x90
	.type	halide_can_use_target_features,@function
halide_can_use_target_features:         # @halide_can_use_target_features
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end213:
	.size	halide_can_use_target_features, .Lfunc_end213-halide_can_use_target_features
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv # -- Begin function _ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv,@function
_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv: # @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	movq	%rdi, %r8
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, 8(%rdi)
	movq	$0, 24(%rdi)
	movabsq	$2061584302832, %rax    # imm = 0x1E0000002F0
	movq	%rax, (%rdi)
	movl	$1, -40(%rbp)
	#APP

	xchgl	%esi, %ebx
	movl	-40(%rbp), %eax
	movl	$0, %ecx
	cpuid
	movl	%eax, -40(%rbp)
	movl	%ebx, -36(%rbp)
	movl	%ecx, -32(%rbp)
	movl	%edx, -28(%rbp)
	xchgl	%esi, %ebx

	#NO_APP
	movl	-32(%rbp), %eax
	movq	%rax, %rcx
	shrq	$15, %rcx
	andl	$16, %ecx
	movq	%rax, %rdx
	shrq	$23, %rdx
	andl	$32, %edx
	orq	%rcx, %rdx
	movq	%rax, %rcx
	shrq	$20, %rcx
	andl	$512, %ecx              # imm = 0x200
	leaq	(%rdx,%rcx), %rsi
	testl	$4096, %eax             # imm = 0x1000
	leaq	128(%rcx,%rdx), %rdi
	cmoveq	%rsi, %rdi
	testl	$805834752, %eax        # imm = 0x30081000
	je	.LBB214_2
# %bb.1:
	movq	%rdi, 16(%r8)
.LBB214_2:
	andl	$1879048192, %eax       # imm = 0x70000000
	cmpl	$1879048192, %eax       # imm = 0x70000000
	jne	.LBB214_8
# %bb.3:                                # %if.then30
	movl	$7, -24(%rbp)
	#APP

	xchgl	%esi, %ebx
	movl	-24(%rbp), %eax
	movl	$0, %ecx
	cpuid
	movl	%eax, -24(%rbp)
	movl	%ebx, -20(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%edx, -12(%rbp)
	xchgl	%esi, %ebx

	#NO_APP
	movl	-20(%rbp), %eax
	testb	$32, %al
	je	.LBB214_5
# %bb.4:                                # %if.then35
	orq	$64, %rdi
	movq	%rdi, 16(%r8)
.LBB214_5:                              # %if.end36
	movl	%eax, %ecx
	andl	$268500992, %ecx        # imm = 0x10010000
	cmpl	$268500992, %ecx        # imm = 0x10010000
	jne	.LBB214_8
# %bb.6:                                # %if.then40
	movl	%eax, %ecx
	andl	$469827584, %ecx        # imm = 0x1C010000
	xorl	%edx, %edx
	cmpl	$469827584, %ecx        # imm = 0x1C010000
	sete	%dl
	shlq	$38, %rdx
	orq	%rdi, %rdx
	movabsq	$137438953472, %rsi     # imm = 0x2000000000
	orq	%rdx, %rsi
	movl	%eax, %edi
	andl	$-805109760, %edi       # imm = 0xD0030000
	movabsq	$687194767360, %rcx     # imm = 0xA000000000
	orq	%rdx, %rcx
	cmpl	$-805109760, %edi       # imm = 0xD0030000
	cmovneq	%rsi, %rcx
	movq	%rcx, 16(%r8)
	andl	$-803012608, %eax       # imm = 0xD0230000
	cmpl	$-803012608, %eax       # imm = 0xD0230000
	jne	.LBB214_8
# %bb.7:                                # %if.then54
	movabsq	$1099511627776, %rax    # imm = 0x10000000000
	orq	%rax, %rcx
	movq	%rcx, 16(%r8)
.LBB214_8:                              # %if.end57
	movq	%r8, %rax
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end214:
	.size	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv, .Lfunc_end214-_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv # -- Begin function _ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv,@function
_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv: # @_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	retq
.Lfunc_end215:
	.size	_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv, .Lfunc_end215-_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv # -- Begin function _ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv,@function
_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv: # @_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	retq
.Lfunc_end216:
	.size	_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv, .Lfunc_end216-_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv
                                        # -- End function
	.section	.text.halide_hexagon_device_malloc,"ax",@progbits
	.weak	halide_hexagon_device_malloc # -- Begin function halide_hexagon_device_malloc
	.p2align	4, 0x90
	.type	halide_hexagon_device_malloc,@function
halide_hexagon_device_malloc:           # @halide_hexagon_device_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %r15
	movq	%rdi, %r14
	callq	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB217_65
# %bb.1:                                # %if.end
	cmpq	$0, (%r15)
	je	.LBB217_2
.LBB217_64:                             # %cleanup69
	xorl	%ebx, %ebx
.LBB217_65:                             # %cleanup69
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB217_2:                              # %if.end6
	movslq	36(%r15), %r10
	testq	%r10, %r10
	movq	%r14, -48(%rbp)         # 8-byte Spill
	jle	.LBB217_3
# %bb.17:                               # %for.body.lr.ph.i.i
	movq	40(%r15), %r8
	leaq	-1(%r10), %r11
	movl	%r10d, %edi
	andl	$3, %edi
	cmpq	$3, %r11
	jae	.LBB217_32
# %bb.18:
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	jmp	.LBB217_19
.LBB217_3:                              # %_ZNK15halide_buffer_t3endEv.exit.thread.i
	movb	33(%r15), %r9b
	movl	$1, %r14d
	xorl	%esi, %esi
	jmp	.LBB217_4
.LBB217_32:                             # %for.body.lr.ph.i.i.new
	leaq	56(%r8), %rdx
	movq	%r10, %r9
	subq	%rdi, %r9
	xorl	%ebx, %ebx
	xorl	%r14d, %r14d
	movslq	-48(%rdx), %rsi
	testq	%rsi, %rsi
	jg	.LBB217_34
	jmp	.LBB217_35
	.p2align	4, 0x90
.LBB217_41:                             # %for.inc.i.i.3
                                        #   in Loop: Header=BB217_35 Depth=1
	addq	$4, %rbx
	addq	$64, %rdx
	cmpq	%rbx, %r9
	je	.LBB217_19
# %bb.33:                               # %for.body.i.i
                                        #   in Loop: Header=BB217_35 Depth=1
	movslq	-48(%rdx), %rsi
	testq	%rsi, %rsi
	jle	.LBB217_35
.LBB217_34:                             # %if.then.i.i
	movslq	-52(%rdx), %rax
	decq	%rax
	imulq	%rsi, %rax
	addq	%rax, %r14
.LBB217_35:                             # %for.inc.i.i
                                        # =>This Inner Loop Header: Depth=1
	movslq	-32(%rdx), %rsi
	testq	%rsi, %rsi
	jle	.LBB217_37
# %bb.36:                               # %if.then.i.i.1
                                        #   in Loop: Header=BB217_35 Depth=1
	movslq	-36(%rdx), %rax
	decq	%rax
	imulq	%rsi, %rax
	addq	%rax, %r14
.LBB217_37:                             # %for.inc.i.i.1
                                        #   in Loop: Header=BB217_35 Depth=1
	movslq	-16(%rdx), %rsi
	testq	%rsi, %rsi
	jle	.LBB217_39
# %bb.38:                               # %if.then.i.i.2
                                        #   in Loop: Header=BB217_35 Depth=1
	movslq	-20(%rdx), %rax
	decq	%rax
	imulq	%rsi, %rax
	addq	%rax, %r14
.LBB217_39:                             # %for.inc.i.i.2
                                        #   in Loop: Header=BB217_35 Depth=1
	movslq	(%rdx), %rsi
	testq	%rsi, %rsi
	jle	.LBB217_41
# %bb.40:                               # %if.then.i.i.3
                                        #   in Loop: Header=BB217_35 Depth=1
	movslq	-4(%rdx), %rax
	decq	%rax
	imulq	%rsi, %rax
	addq	%rax, %r14
	jmp	.LBB217_41
.LBB217_19:                             # %for.body.lr.ph.i5.i.unr-lcssa
	testq	%rdi, %rdi
	je	.LBB217_24
# %bb.20:                               # %for.body.i.i.epil.preheader
	shlq	$4, %rbx
	leaq	(%r8,%rbx), %rax
	addq	$8, %rax
	movslq	(%rax), %rdx
	testq	%rdx, %rdx
	jg	.LBB217_22
	.p2align	4, 0x90
.LBB217_23:                             # %for.inc.i.i.epil
	addq	$16, %rax
	decq	%rdi
	je	.LBB217_24
.LBB217_21:                             # %for.body.i.i.epil
	movslq	(%rax), %rdx
	testq	%rdx, %rdx
	jle	.LBB217_23
.LBB217_22:                             # %if.then.i.i.epil
	movslq	-4(%rax), %rsi
	decq	%rsi
	imulq	%rdx, %rsi
	addq	%rsi, %r14
	addq	$16, %rax
	decq	%rdi
	jne	.LBB217_21
.LBB217_24:                             # %for.body.lr.ph.i5.i
	movb	33(%r15), %r9b
	movl	%r10d, %edi
	andl	$3, %edi
	cmpq	$3, %r11
	jae	.LBB217_42
# %bb.25:
	xorl	%edx, %edx
	xorl	%esi, %esi
	jmp	.LBB217_26
.LBB217_42:                             # %for.body.lr.ph.i5.i.new
	leaq	56(%r8), %rbx
	movq	%r10, %r11
	subq	%rdi, %r11
	xorl	%edx, %edx
	xorl	%esi, %esi
	movslq	-48(%rbx), %rax
	testq	%rax, %rax
	jns	.LBB217_45
	jmp	.LBB217_44
	.p2align	4, 0x90
.LBB217_51:                             # %for.inc.i26.i.3
	addq	$4, %rdx
	addq	$64, %rbx
	cmpq	%rdx, %r11
	je	.LBB217_26
# %bb.43:                               # %for.body.i16.i
	movslq	-48(%rbx), %rax
	testq	%rax, %rax
	js	.LBB217_44
.LBB217_45:                             # %for.inc.i26.i
	movslq	-32(%rbx), %rax
	testq	%rax, %rax
	js	.LBB217_46
.LBB217_47:                             # %for.inc.i26.i.1
	movslq	-16(%rbx), %rax
	testq	%rax, %rax
	js	.LBB217_48
.LBB217_49:                             # %for.inc.i26.i.2
	movslq	(%rbx), %rax
	testq	%rax, %rax
	jns	.LBB217_51
	jmp	.LBB217_50
	.p2align	4, 0x90
.LBB217_44:                             # %if.then.i22.i
	movslq	-52(%rbx), %rcx
	decq	%rcx
	imulq	%rax, %rcx
	addq	%rcx, %rsi
	movslq	-32(%rbx), %rax
	testq	%rax, %rax
	jns	.LBB217_47
.LBB217_46:                             # %if.then.i22.i.1
	movslq	-36(%rbx), %rcx
	decq	%rcx
	imulq	%rax, %rcx
	addq	%rcx, %rsi
	movslq	-16(%rbx), %rax
	testq	%rax, %rax
	jns	.LBB217_49
.LBB217_48:                             # %if.then.i22.i.2
	movslq	-20(%rbx), %rcx
	decq	%rcx
	imulq	%rax, %rcx
	addq	%rcx, %rsi
	movslq	(%rbx), %rax
	testq	%rax, %rax
	jns	.LBB217_51
.LBB217_50:                             # %if.then.i22.i.3
	movslq	-4(%rbx), %rcx
	decq	%rcx
	imulq	%rax, %rcx
	addq	%rcx, %rsi
	jmp	.LBB217_51
.LBB217_26:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit.unr-lcssa
	testq	%rdi, %rdi
	je	.LBB217_31
# %bb.27:                               # %for.body.i16.i.epil.preheader
	shlq	$4, %rdx
	leaq	(%r8,%rdx), %rax
	addq	$8, %rax
	movslq	(%rax), %rdx
	testq	%rdx, %rdx
	js	.LBB217_29
	.p2align	4, 0x90
.LBB217_30:                             # %for.inc.i26.i.epil
	addq	$16, %rax
	decq	%rdi
	je	.LBB217_31
.LBB217_28:                             # %for.body.i16.i.epil
	movslq	(%rax), %rdx
	testq	%rdx, %rdx
	jns	.LBB217_30
.LBB217_29:                             # %if.then.i22.i.epil
	movslq	-4(%rax), %rcx
	decq	%rcx
	imulq	%rdx, %rcx
	addq	%rcx, %rsi
	addq	$16, %rax
	decq	%rdi
	jne	.LBB217_28
.LBB217_31:                             # %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	incq	%r14
.LBB217_4:                              # %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	subq	%rsi, %r14
	movzbl	%r9b, %r12d
	addq	$7, %r12
	shrq	$3, %r12
	imulq	%r14, %r12
	testq	%r12, %r12
	jne	.LBB217_6
# %bb.5:                                # %if.then9
	leaq	.L.str.65.216(%rip), %rsi
	movq	-48(%rbp), %rdi         # 8-byte Reload
	callq	halide_print@PLT
	callq	abort@PLT
	movl	36(%r15), %r10d
.LBB217_6:                              # %if.end10
	subq	$-128, %r12
	testl	%r10d, %r10d
	jle	.LBB217_11
# %bb.7:                                # %for.body.lr.ph
	movl	$8, %ebx
	xorl	%r14d, %r14d
	leaq	.L.str.66.217(%rip), %r13
	movq	40(%r15), %rax
	cmpl	$0, (%rax,%rbx)
	js	.LBB217_9
	.p2align	4, 0x90
.LBB217_10:                             # %for.inc
                                        # =>This Inner Loop Header: Depth=1
	incq	%r14
	movslq	%r10d, %rax
	addq	$16, %rbx
	cmpq	%rax, %r14
	jge	.LBB217_11
# %bb.8:                                # %for.body
                                        #   in Loop: Header=BB217_10 Depth=1
	movq	40(%r15), %rax
	cmpl	$0, (%rax,%rbx)
	jns	.LBB217_10
.LBB217_9:                              # %if.then13
	movq	-48(%rbp), %rdi         # 8-byte Reload
	movq	%r13, %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	movl	36(%r15), %r10d
	jmp	.LBB217_10
.LBB217_11:                             # %for.cond.cleanup
	cmpq	$4095, %r12             # imm = 0xFFF
	jbe	.LBB217_54
# %bb.12:                               # %if.then20
	movq	_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE@GOTPCREL(%rip), %rax
	movq	%r12, %rdi
	callq	*(%rax)
	movq	%rax, %r13
	testq	%rax, %rax
	movq	-48(%rbp), %r14         # 8-byte Reload
	jne	.LBB217_58
# %bb.13:                               # %if.then31
	movl	$1024, %esi             # imm = 0x400
	movq	%r14, %rdi
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB217_14
# %bb.52:                               # %if.else.i138
	movq	%rax, %rbx
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.70.218(%rip), %rdx
	jmp	.LBB217_53
.LBB217_54:                             # %if.else
	movq	-48(%rbp), %r14         # 8-byte Reload
	movq	%r14, %rdi
	movq	%r12, %rsi
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB217_55
.LBB217_58:                             # %if.end49
	movq	%r14, %rdi
	movq	%r15, %rsi
	movq	%r13, %rdx
	movq	%r12, %rcx
	callq	halide_hexagon_wrap_device_handle@PLT
	testl	%eax, %eax
	je	.LBB217_62
# %bb.59:                               # %if.then52
	movl	%eax, %ebx
	cmpq	$4096, %r12             # imm = 0x1000
	jb	.LBB217_61
# %bb.60:                               # %if.then54
	movq	_ZN6Halide7Runtime8Internal7Hexagon9host_freeE@GOTPCREL(%rip), %rax
	movq	%r13, %rdi
	callq	*(%rax)
	jmp	.LBB217_65
.LBB217_62:                             # %if.end57
	cmpq	$0, 16(%r15)
	jne	.LBB217_64
# %bb.63:                               # %if.then59
	movq	%r13, 16(%r15)
	jmp	.LBB217_64
.LBB217_61:                             # %if.else55
	movq	%r14, %rdi
	movq	%r13, %rsi
	callq	halide_free@PLT
	jmp	.LBB217_65
.LBB217_55:                             # %if.then45
	movl	$1024, %esi             # imm = 0x400
	movq	%r14, %rdi
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB217_56
# %bb.57:                               # %if.else.i
	movq	%rax, %rbx
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.72.219(%rip), %rdx
.LBB217_53:                             # %cleanup69
	movq	%rbx, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB217_16
.LBB217_14:                             # %if.then.i132
	leaq	.L.str.70.218(%rip), %rdx
	jmp	.LBB217_15
.LBB217_56:                             # %if.then.i
	leaq	.L.str.72.219(%rip), %rdx
.LBB217_15:                             # %cleanup69
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB217_16:                             # %cleanup69
	callq	halide_free@PLT
	movl	$-1, %ebx
	jmp	.LBB217_65
.Lfunc_end217:
	.size	halide_hexagon_device_malloc, .Lfunc_end217-halide_hexagon_device_malloc
                                        # -- End function
	.section	.text.halide_hexagon_device_free,"ax",@progbits
	.weak	halide_hexagon_device_free # -- Begin function halide_hexagon_device_free
	.p2align	4, 0x90
	.type	halide_hexagon_device_free,@function
halide_hexagon_device_free:             # @halide_hexagon_device_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %rbx
	movq	%rdi, %r15
	callq	halide_hexagon_get_device_size@PLT
	movq	%rax, %r12
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_hexagon_get_device_handle@PLT
	movq	%rax, %r14
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_hexagon_detach_device_handle@PLT
	cmpq	$4096, %r12             # imm = 0x1000
	jb	.LBB218_2
# %bb.1:                                # %if.then
	movq	_ZN6Halide7Runtime8Internal7Hexagon9host_freeE@GOTPCREL(%rip), %rax
	movq	%r14, %rdi
	callq	*(%rax)
	cmpq	%r14, 16(%rbx)
	jne	.LBB218_5
	jmp	.LBB218_4
.LBB218_2:                              # %if.else
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_free@PLT
	cmpq	%r14, 16(%rbx)
	jne	.LBB218_5
.LBB218_4:                              # %if.then16
	movq	$0, 16(%rbx)
.LBB218_5:                              # %if.end20
	andb	$-3, 24(%rbx)
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end218:
	.size	halide_hexagon_device_free, .Lfunc_end218-halide_hexagon_device_free
                                        # -- End function
	.section	.text.halide_hexagon_device_sync,"ax",@progbits
	.weak	halide_hexagon_device_sync # -- Begin function halide_hexagon_device_sync
	.p2align	4, 0x90
	.type	halide_hexagon_device_sync,@function
halide_hexagon_device_sync:             # @halide_hexagon_device_sync
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end219:
	.size	halide_hexagon_device_sync, .Lfunc_end219-halide_hexagon_device_sync
                                        # -- End function
	.section	.text.halide_hexagon_device_release,"ax",@progbits
	.weak	halide_hexagon_device_release # -- Begin function halide_hexagon_device_release
	.p2align	4, 0x90
	.type	halide_hexagon_device_release,@function
halide_hexagon_device_release:          # @halide_hexagon_device_release
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdi, %r15
	movq	_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon10state_listE@GOTPCREL(%rip), %r14
	movq	(%r14), %rbx
	testq	%rbx, %rbx
	je	.LBB220_5
# %bb.1:                                # %while.body.preheader
	movq	_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE@GOTPCREL(%rip), %r12
	movl	(%rbx), %edi
	testl	%edi, %edi
	jne	.LBB220_3
	.p2align	4, 0x90
.LBB220_4:                              # %if.end
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.LBB220_5
.LBB220_2:                              # %while.body
	movl	(%rbx), %edi
	testl	%edi, %edi
	je	.LBB220_4
.LBB220_3:                              # %if.then
	callq	*(%r12)
	movq	%r15, %rdi
	callq	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv@PLT
	movl	$0, (%rbx)
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	jne	.LBB220_2
.LBB220_5:                              # %while.end
	movq	$0, (%r14)
	movq	_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE@GOTPCREL(%rip), %rbx
	movl	(%rbx), %edi
	testl	%edi, %edi
	je	.LBB220_7
# %bb.6:                                # %if.then18
	movq	_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE@GOTPCREL(%rip), %rax
	callq	*(%rax)
	movq	%r15, %rdi
	callq	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv@PLT
	movl	$0, (%rbx)
.LBB220_7:                              # %if.end31
	movq	_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end220:
	.size	halide_hexagon_device_release, .Lfunc_end220-halide_hexagon_device_release
                                        # -- End function
	.section	.text.halide_hexagon_copy_to_host,"ax",@progbits
	.weak	halide_hexagon_copy_to_host # -- Begin function halide_hexagon_copy_to_host
	.p2align	4, 0x90
	.type	halide_hexagon_copy_to_host,@function
halide_hexagon_copy_to_host:            # @halide_hexagon_copy_to_host
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$440, %rsp              # imm = 0x1B8
	movq	%rsi, %rbx
	movq	%rdi, %r14
	cmpq	$0, 16(%rsi)
	je	.LBB221_2
# %bb.1:                                # %land.lhs.true
	cmpq	$0, (%rbx)
	jne	.LBB221_3
.LBB221_2:                              # %if.then
	leaq	.L.str.81(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB221_3:                              # %if.end
	leaq	-456(%rbp), %r15
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	_ZN6Halide7Runtime8Internal24make_device_to_host_copyEPK15halide_buffer_t@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_hexagon_get_device_handle@PLT
	movq	%rax, -32(%rbp)
	leaq	-40(%rbp), %rdi
	leaq	-32(%rbp), %rsi
	movl	$8, %edx
	callq	memcpy@PLT
	movq	-40(%rbp), %rax
	movq	%rax, -456(%rbp)
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv@PLT
	xorl	%eax, %eax
	addq	$440, %rsp              # imm = 0x1B8
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end221:
	.size	halide_hexagon_copy_to_host, .Lfunc_end221-halide_hexagon_copy_to_host
                                        # -- End function
	.section	.text.halide_hexagon_copy_to_device,"ax",@progbits
	.weak	halide_hexagon_copy_to_device # -- Begin function halide_hexagon_copy_to_device
	.p2align	4, 0x90
	.type	halide_hexagon_copy_to_device,@function
halide_hexagon_copy_to_device:          # @halide_hexagon_copy_to_device
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$432, %rsp              # imm = 0x1B0
	movq	%rsi, %rbx
	movq	%rdi, %r14
	callq	halide_hexagon_device_malloc@PLT
	movl	%eax, %r15d
	testl	%eax, %eax
	jne	.LBB222_5
# %bb.1:                                # %if.end
	cmpq	$0, 16(%rbx)
	je	.LBB222_3
# %bb.2:                                # %land.lhs.true
	cmpq	$0, (%rbx)
	jne	.LBB222_4
.LBB222_3:                              # %if.then7
	leaq	.L.str.79(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB222_4:                              # %if.end8
	leaq	-464(%rbp), %r12
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	_ZN6Halide7Runtime8Internal24make_host_to_device_copyEPK15halide_buffer_t@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_hexagon_get_device_handle@PLT
	movq	%rax, -40(%rbp)
	leaq	-48(%rbp), %rdi
	leaq	-40(%rbp), %rsi
	movl	$8, %edx
	callq	memcpy@PLT
	movq	-48(%rbp), %rax
	movq	%rax, -456(%rbp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	callq	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv@PLT
.LBB222_5:                              # %cleanup
	movl	%r15d, %eax
	addq	$432, %rsp              # imm = 0x1B0
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end222:
	.size	halide_hexagon_copy_to_device, .Lfunc_end222-halide_hexagon_copy_to_device
                                        # -- End function
	.section	.text.halide_hexagon_device_and_host_malloc,"ax",@progbits
	.weak	halide_hexagon_device_and_host_malloc # -- Begin function halide_hexagon_device_and_host_malloc
	.p2align	4, 0x90
	.type	halide_hexagon_device_and_host_malloc,@function
halide_hexagon_device_and_host_malloc:  # @halide_hexagon_device_and_host_malloc
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %r14
	movq	%rdi, %r15
	callq	halide_hexagon_device_malloc@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB223_2
# %bb.1:                                # %if.then
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_hexagon_get_device_handle@PLT
	movq	%rax, 16(%r14)
.LBB223_2:                              # %if.end
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end223:
	.size	halide_hexagon_device_and_host_malloc, .Lfunc_end223-halide_hexagon_device_and_host_malloc
                                        # -- End function
	.section	.text.halide_hexagon_device_and_host_free,"ax",@progbits
	.weak	halide_hexagon_device_and_host_free # -- Begin function halide_hexagon_device_and_host_free
	.p2align	4, 0x90
	.type	halide_hexagon_device_and_host_free,@function
halide_hexagon_device_and_host_free:    # @halide_hexagon_device_and_host_free
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	movq	%rsi, %rbx
	callq	halide_hexagon_device_free@PLT
	movq	$0, 16(%rbx)
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end224:
	.size	halide_hexagon_device_and_host_free, .Lfunc_end224-halide_hexagon_device_and_host_free
                                        # -- End function
	.section	.text.halide_hexagon_buffer_copy,"ax",@progbits
	.weak	halide_hexagon_buffer_copy # -- Begin function halide_hexagon_buffer_copy
	.p2align	4, 0x90
	.type	halide_hexagon_buffer_copy,@function
halide_hexagon_buffer_copy:             # @halide_hexagon_buffer_copy
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$440, %rsp              # imm = 0x1B8
	movq	%rcx, %r14
	movq	%rdx, %r12
	movq	%rsi, %r13
	movq	%rdi, %r15
	testq	%rdx, %rdx
	je	.LBB225_3
# %bb.1:                                # %entry
	cmpq	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE@GOTPCREL(%rip), %r12
	je	.LBB225_3
# %bb.2:                                # %if.then
	leaq	.L.str.89(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB225_3:                              # %if.end
	movq	24(%r13), %rax
	testb	$2, %al
	jne	.LBB225_5
# %bb.4:                                # %lor.lhs.false2
	cmpq	$0, 16(%r13)
	je	.LBB225_5
# %bb.8:                                # %if.end9
	movq	8(%r13), %rcx
	movb	$1, %bl
	cmpq	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE@GOTPCREL(%rip), %rcx
	jne	.LBB225_13
	jmp	.LBB225_9
.LBB225_5:                              # %land.lhs.true
	movq	8(%r13), %rcx
	cmpq	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE@GOTPCREL(%rip), %rcx
	je	.LBB225_9
# %bb.6:                                # %if.then5
	movl	$-42, %ebx
	cmpq	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE@GOTPCREL(%rip), %r12
	je	.LBB225_21
# %bb.7:                                # %if.then7
	leaq	.L.str.90(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	jmp	.LBB225_21
.LBB225_9:                              # %lor.lhs.false12
	movb	$1, %bl
	cmpq	$0, (%r13)
	je	.LBB225_13
# %bb.10:                               # %lor.rhs
	testb	$1, %al
	je	.LBB225_12
# %bb.11:                               # %lor.end
	cmpq	$0, 16(%r13)
	jne	.LBB225_13
.LBB225_12:                             # %lor.lhs.false19
	xorl	%ebx, %ebx
.LBB225_13:                             # %if.end23
	testq	%r12, %r12
	je	.LBB225_16
# %bb.14:                               # %lor.lhs.false25
	cmpq	$0, (%r14)
	jne	.LBB225_16
# %bb.15:                               # %if.then28
	leaq	.L.str.92(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB225_16:                             # %if.end29
	xorl	%r8d, %r8d
	testq	%r12, %r12
	sete	%r8b
	movzbl	%bl, %ebx
	leaq	-472(%rbp), %rdi
	movq	%r13, %rsi
	movl	%ebx, %edx
	movq	%r14, %rcx
	callq	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b@PLT
	testb	%bl, %bl
	jne	.LBB225_18
# %bb.17:                               # %if.then33
	movq	%r15, %rdi
	movq	%r13, %rsi
	callq	halide_hexagon_get_device_handle@PLT
	movq	%rax, -48(%rbp)
	leaq	-56(%rbp), %rdi
	leaq	-48(%rbp), %rsi
	movl	$8, %edx
	callq	memcpy@PLT
	movq	-56(%rbp), %rax
	movq	%rax, -472(%rbp)
.LBB225_18:                             # %if.end37
	testq	%r12, %r12
	je	.LBB225_20
# %bb.19:                               # %if.then39
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_hexagon_get_device_handle@PLT
	movq	%rax, -48(%rbp)
	leaq	-56(%rbp), %rdi
	leaq	-48(%rbp), %rsi
	movl	$8, %edx
	callq	memcpy@PLT
	movq	-56(%rbp), %rax
	movq	%rax, -464(%rbp)
.LBB225_20:                             # %if.end44
	leaq	-472(%rbp), %rdi
	movq	%r15, %rsi
	callq	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv@PLT
	xorl	%ebx, %ebx
.LBB225_21:                             # %return
	movl	%ebx, %eax
	addq	$440, %rsp              # imm = 0x1B8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end225:
	.size	halide_hexagon_buffer_copy, .Lfunc_end225-halide_hexagon_buffer_copy
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function halide_hexagon_device_crop
.LCPI226_0:
	.quad	25769803778             # 0x600000002
.LCPI226_1:
	.quad	17179869184             # 0x400000000
	.section	.text.halide_hexagon_device_crop,"ax",@progbits
	.weak	halide_hexagon_device_crop
	.p2align	4, 0x90
	.type	halide_hexagon_device_crop,@function
halide_hexagon_device_crop:             # @halide_hexagon_device_crop
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	andq	$-32, %rsp
	subq	$96, %rsp
	movq	%rsi, %rdi
	movslq	36(%rsi), %r9
	testq	%r9, %r9
	jle	.LBB226_1
# %bb.2:                                # %for.body.lr.ph.i
	movq	40(%rdx), %r8
	movq	40(%rdi), %rbx
	cmpl	$17, %r9d
	jae	.LBB226_4
# %bb.3:
	xorl	%r11d, %r11d
	xorl	%ecx, %ecx
	jmp	.LBB226_7
.LBB226_1:
	xorl	%ecx, %ecx
	jmp	.LBB226_9
.LBB226_4:                              # %vector.ph
	movl	%r9d, %eax
	andl	$15, %eax
	testq	%rax, %rax
	movl	$16, %ecx
	cmovneq	%rax, %rcx
	movq	%r9, %r11
	subq	%rcx, %r11
	vpxor	%xmm14, %xmm14, %xmm14
	movl	$192, %ecx
	vbroadcastsd	.LCPI226_0(%rip), %ymm0 # ymm0 = [25769803778,25769803778,25769803778,25769803778]
	vmovaps	%ymm0, 32(%rsp)         # 32-byte Spill
	vpbroadcastq	.LCPI226_1(%rip), %ymm0 # ymm0 = [17179869184,17179869184,17179869184,17179869184]
	vmovdqa	%ymm0, (%rsp)           # 32-byte Spill
	movq	%r11, %r10
	vpxor	%xmm3, %xmm3, %xmm3
	vpxor	%xmm4, %xmm4, %xmm4
	vpxor	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
.LBB226_5:                              # %vector.body
                                        # =>This Inner Loop Header: Depth=1
	vmovdqu	-192(%r8,%rcx), %ymm7
	vmovdqu	-160(%r8,%rcx), %ymm8
	vmovdqu	-128(%r8,%rcx), %ymm9
	vmovdqu	-192(%rbx,%rcx), %xmm6
	vpunpckhdq	-176(%rbx,%rcx), %xmm6, %xmm6 # xmm6 = xmm6[2],mem[2],xmm6[3],mem[3]
	vmovdqu	-160(%rbx,%rcx), %ymm10
	vmovdqa	32(%rsp), %ymm0         # 32-byte Reload
	vpermd	%ymm10, %ymm0, %ymm11
	vpblendd	$12, %xmm11, %xmm6, %xmm6 # xmm6 = xmm6[0,1],xmm11[2,3]
	vmovdqu	-128(%rbx,%rcx), %xmm1
	vpunpckhdq	-112(%rbx,%rcx), %xmm1, %xmm1 # xmm1 = xmm1[2],mem[2],xmm1[3],mem[3]
	vmovdqu	-96(%rbx,%rcx), %ymm11
	vpermd	%ymm11, %ymm0, %ymm13
	vpblendd	$12, %xmm13, %xmm1, %xmm15 # xmm15 = xmm1[0,1],xmm13[2,3]
	vmovdqu	-96(%r8,%rcx), %ymm1
	vpsubd	-192(%rbx,%rcx), %ymm7, %ymm7
	vpsubd	%ymm10, %ymm8, %ymm8
	vextracti128	$1, %ymm7, %xmm2
	vpunpckldq	%xmm2, %xmm7, %xmm2 # xmm2 = xmm7[0],xmm2[0],xmm7[1],xmm2[1]
	vmovdqu	-64(%rbx,%rcx), %xmm7
	vpunpckhdq	-48(%rbx,%rcx), %xmm7, %xmm7 # xmm7 = xmm7[2],mem[2],xmm7[3],mem[3]
	vmovdqa	(%rsp), %ymm13          # 32-byte Reload
	vpermd	%ymm8, %ymm13, %ymm8
	vpblendd	$12, %xmm8, %xmm2, %xmm2 # xmm2 = xmm2[0,1],xmm8[2,3]
	vmovdqu	-32(%rbx,%rcx), %ymm8
	vpmulld	%xmm6, %xmm2, %xmm12
	vpermd	%ymm8, %ymm0, %ymm6
	vpblendd	$12, %xmm6, %xmm7, %xmm6 # xmm6 = xmm7[0,1],xmm6[2,3]
	vmovdqu	-64(%r8,%rcx), %ymm7
	vpsubd	-128(%rbx,%rcx), %ymm9, %ymm9
	vpsubd	%ymm11, %ymm1, %ymm10
	vextracti128	$1, %ymm9, %xmm1
	vpunpckldq	%xmm1, %xmm9, %xmm1 # xmm1 = xmm9[0],xmm1[0],xmm9[1],xmm1[1]
	vmovdqu	(%rbx,%rcx), %xmm2
	vpunpckhdq	16(%rbx,%rcx), %xmm2, %xmm2 # xmm2 = xmm2[2],mem[2],xmm2[3],mem[3]
	vpermd	%ymm10, %ymm13, %ymm9
	vpblendd	$12, %xmm9, %xmm1, %xmm1 # xmm1 = xmm1[0,1],xmm9[2,3]
	vmovdqu	32(%rbx,%rcx), %ymm9
	vpmulld	%xmm15, %xmm1, %xmm11
	vpermd	%ymm9, %ymm0, %ymm10
	vpblendd	$12, %xmm10, %xmm2, %xmm2 # xmm2 = xmm2[0,1],xmm10[2,3]
	vmovdqu	-32(%r8,%rcx), %ymm10
	vpsubd	-64(%rbx,%rcx), %ymm7, %ymm7
	vpsubd	%ymm8, %ymm10, %ymm8
	vextracti128	$1, %ymm7, %xmm1
	vpunpckldq	%xmm1, %xmm7, %xmm1 # xmm1 = xmm7[0],xmm1[0],xmm7[1],xmm1[1]
	vpermd	%ymm8, %ymm13, %ymm7
	vpblendd	$12, %xmm7, %xmm1, %xmm1 # xmm1 = xmm1[0,1],xmm7[2,3]
	vmovdqu	(%r8,%rcx), %ymm7
	vpmulld	%xmm6, %xmm1, %xmm1
	vmovdqu	32(%r8,%rcx), %ymm6
	vpsubd	%ymm9, %ymm6, %ymm6
	vpsubd	(%rbx,%rcx), %ymm7, %ymm7
	vextracti128	$1, %ymm7, %xmm0
	vpunpckldq	%xmm0, %xmm7, %xmm0 # xmm0 = xmm7[0],xmm0[0],xmm7[1],xmm0[1]
	vpermd	%ymm6, %ymm13, %ymm6
	vpblendd	$12, %xmm6, %xmm0, %xmm0 # xmm0 = xmm0[0,1],xmm6[2,3]
	vpmulld	%xmm2, %xmm0, %xmm0
	vpmovsxdq	%xmm12, %ymm2
	vpaddq	%ymm2, %ymm14, %ymm14
	vpmovsxdq	%xmm11, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm3
	vpmovsxdq	%xmm1, %ymm1
	vpaddq	%ymm1, %ymm4, %ymm4
	vpmovsxdq	%xmm0, %ymm0
	vpaddq	%ymm0, %ymm5, %ymm5
	addq	$256, %rcx              # imm = 0x100
	addq	$-16, %r10
	jne	.LBB226_5
# %bb.6:                                # %middle.block
	vpaddq	%ymm14, %ymm3, %ymm0
	vpaddq	%ymm0, %ymm4, %ymm0
	vpaddq	%ymm0, %ymm5, %ymm0
	vextracti128	$1, %ymm0, %xmm1
	vpaddq	%xmm1, %xmm0, %xmm0
	vpshufd	$78, %xmm0, %xmm1       # xmm1 = xmm0[2,3,0,1]
	vpaddq	%xmm1, %xmm0, %xmm0
	vmovq	%xmm0, %rcx
.LBB226_7:                              # %for.body.i.preheader
	subq	%r11, %r9
	shlq	$4, %r11
	.p2align	4, 0x90
.LBB226_8:                              # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	movslq	(%r8,%r11), %rax
	movslq	(%rbx,%r11), %rsi
	subq	%rsi, %rax
	movslq	8(%rbx,%r11), %rsi
	imulq	%rax, %rsi
	addq	%rsi, %rcx
	addq	$16, %r11
	decq	%r9
	jne	.LBB226_8
.LBB226_9:                              # %_ZN6Halide7Runtime8Internal28calc_device_crop_byte_offsetEPK15halide_buffer_tPS2_.exit
	movzbl	33(%rdi), %esi
	addq	$7, %rsi
	shrq	$3, %rsi
	imulq	%rcx, %rsi
	leaq	-8(%rbp), %rsp
	popq	%rbx
	popq	%rbp
	vzeroupper
	jmp	hexagon_device_crop_from_offset@PLT # TAILCALL
.Lfunc_end226:
	.size	halide_hexagon_device_crop, .Lfunc_end226-halide_hexagon_device_crop
                                        # -- End function
	.section	.text.halide_hexagon_device_slice,"ax",@progbits
	.weak	halide_hexagon_device_slice # -- Begin function halide_hexagon_device_slice
	.p2align	4, 0x90
	.type	halide_hexagon_device_slice,@function
halide_hexagon_device_slice:            # @halide_hexagon_device_slice
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rsi, %rdi
	movq	40(%rsi), %rax
	movslq	%edx, %rdx
	shlq	$4, %rdx
	movslq	(%rax,%rdx), %rsi
	movslq	%ecx, %rcx
	subq	%rsi, %rcx
	movslq	8(%rax,%rdx), %rax
	movzbl	33(%rdi), %esi
	addq	$7, %rsi
	shrq	$3, %rsi
	imulq	%rax, %rsi
	imulq	%rcx, %rsi
	movq	%r8, %rdx
	popq	%rbp
	jmp	hexagon_device_crop_from_offset@PLT # TAILCALL
.Lfunc_end227:
	.size	halide_hexagon_device_slice, .Lfunc_end227-halide_hexagon_device_slice
                                        # -- End function
	.section	.text.halide_hexagon_device_release_crop,"ax",@progbits
	.weak	halide_hexagon_device_release_crop # -- Begin function halide_hexagon_device_release_crop
	.p2align	4, 0x90
	.type	halide_hexagon_device_release_crop,@function
halide_hexagon_device_release_crop:     # @halide_hexagon_device_release_crop
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	(%rsi), %rdi
	callq	free@PLT
	xorl	%eax, %eax
	popq	%rbp
	retq
.Lfunc_end228:
	.size	halide_hexagon_device_release_crop, .Lfunc_end228-halide_hexagon_device_release_crop
                                        # -- End function
	.section	.text.hexagon_device_crop_from_offset,"ax",@progbits
	.weak	hexagon_device_crop_from_offset # -- Begin function hexagon_device_crop_from_offset
	.p2align	4, 0x90
	.type	hexagon_device_crop_from_offset,@function
hexagon_device_crop_from_offset:        # @hexagon_device_crop_from_offset
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	movq	(%rdi), %rbx
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, -40(%rbp)
	testq	%rax, %rax
	je	.LBB229_1
# %bb.2:                                # %if.end
	movq	(%rbx), %rcx
	addq	%r15, %rcx
	movq	%rcx, (%rax)
	movq	8(%rbx), %rcx
	subq	%r15, %rcx
	movq	%rcx, 8(%rax)
	leaq	-48(%rbp), %rdi
	leaq	-40(%rbp), %rsi
	movl	$8, %edx
	callq	memcpy@PLT
	movq	-48(%rbp), %rax
	movq	%rax, (%r14)
	movq	8(%r12), %rax
	movq	%rax, 8(%r14)
	movq	24(%r14), %rax
	movq	%rax, %rcx
	andq	$-3, %rcx
	orq	$2, %rax
	testb	$2, 24(%r12)
	cmoveq	%rcx, %rax
	movq	%rax, 24(%r14)
	xorl	%eax, %eax
	jmp	.LBB229_3
.LBB229_1:
	movl	$-11, %eax
.LBB229_3:                              # %cleanup
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end229:
	.size	hexagon_device_crop_from_offset, .Lfunc_end229-hexagon_device_crop_from_offset
                                        # -- End function
	.section	.text.halide_hexagon_get_device_handle,"ax",@progbits
	.weak	halide_hexagon_get_device_handle # -- Begin function halide_hexagon_get_device_handle
	.p2align	4, 0x90
	.type	halide_hexagon_get_device_handle,@function
halide_hexagon_get_device_handle:       # @halide_hexagon_get_device_handle
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	cmpq	$0, (%rsi)
	je	.LBB230_1
# %bb.2:                                # %if.end
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	cmpq	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE@GOTPCREL(%rip), %rax
	je	.LBB230_4
# %bb.3:                                # %if.then2
	leaq	.L.str.85(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB230_4:                              # %if.end3
	leaq	-16(%rbp), %rdi
	movl	$8, %edx
	movq	%rbx, %rsi
	callq	memcpy@PLT
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.LBB230_1:
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end230:
	.size	halide_hexagon_get_device_handle, .Lfunc_end230-halide_hexagon_get_device_handle
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv # -- Begin function _ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv,@function
_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv: # @_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$1032, %rsp             # imm = 0x408
	movq	_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE@GOTPCREL(%rip), %r13
	movq	(%r13), %rax
	testq	%rax, %rax
	je	.LBB231_13
# %bb.1:                                # %while.body.preheader
	movq	%rdi, %r15
	movl	$0, -44(%rbp)
	leaq	-1068(%rbp), %rdi
	leaq	-44(%rbp), %rdx
	movl	$1024, %esi             # imm = 0x400
	callq	*%rax
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB231_6
# %bb.2:
	leaq	-1068(%rbp), %r14
	leaq	-44(%rbp), %r12
	.p2align	4, 0x90
.LBB231_3:                              # %if.end5
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, -44(%rbp)
	jle	.LBB231_13
# %bb.4:                                # %if.then7
                                        #   in Loop: Header=BB231_3 Depth=1
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_print@PLT
	movl	$0, -44(%rbp)
	movq	%r14, %rdi
	movl	$1024, %esi             # imm = 0x400
	movq	%r12, %rdx
	callq	*(%r13)
	testl	%eax, %eax
	je	.LBB231_3
# %bb.5:
	movl	%eax, %ebx
.LBB231_6:                              # %if.then1
	movl	$1024, %esi             # imm = 0x400
	movq	%r15, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %r14
	testq	%rax, %rax
	je	.LBB231_7
# %bb.8:                                # %if.then.i
	leaq	1023(%r14), %r12
	movb	$0, 1023(%r14)
	leaq	.L.str.4.214(%rip), %rdx
	movq	%r14, %rdi
	movq	%r12, %rsi
	jmp	.LBB231_9
.LBB231_7:                              # %if.then1.split
	leaq	.L.str.4.214(%rip), %rdx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB231_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi0ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	movslq	%ebx, %rdx
	movq	%r12, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.3.215(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%r14, %r14
	je	.LBB231_10
# %bb.11:                               # %if.else.i27
	subq	%r14, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_print@PLT
	movq	%r15, %rdi
	movq	%r14, %rsi
	jmp	.LBB231_12
.LBB231_10:                             # %if.then.i26
	leaq	.L.str.111(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
.LBB231_12:                             # %while.end
	callq	halide_free@PLT
.LBB231_13:                             # %while.end
	addq	$1032, %rsp             # imm = 0x408
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end231:
	.size	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv, .Lfunc_end231-_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv
                                        # -- End function
	.section	.text.halide_hexagon_get_device_size,"ax",@progbits
	.weak	halide_hexagon_get_device_size # -- Begin function halide_hexagon_get_device_size
	.p2align	4, 0x90
	.type	halide_hexagon_get_device_size,@function
halide_hexagon_get_device_size:         # @halide_hexagon_get_device_size
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	cmpq	$0, (%rsi)
	je	.LBB232_1
# %bb.2:                                # %if.end
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	cmpq	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE@GOTPCREL(%rip), %rax
	je	.LBB232_4
# %bb.3:                                # %if.then2
	leaq	.L.str.86(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB232_4:                              # %if.end3
	leaq	-16(%rbp), %rdi
	movl	$8, %edx
	movq	%rbx, %rsi
	callq	memcpy@PLT
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.LBB232_1:
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end232:
	.size	halide_hexagon_get_device_size, .Lfunc_end232-halide_hexagon_get_device_size
                                        # -- End function
	.section	.text.halide_hexagon_detach_device_handle,"ax",@progbits
	.weak	halide_hexagon_detach_device_handle # -- Begin function halide_hexagon_detach_device_handle
	.p2align	4, 0x90
	.type	halide_hexagon_detach_device_handle,@function
halide_hexagon_detach_device_handle:    # @halide_hexagon_detach_device_handle
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	cmpq	$0, (%rsi)
	je	.LBB233_4
# %bb.1:                                # %if.end
	movq	%rsi, %rbx
	movq	8(%rsi), %rax
	cmpq	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE@GOTPCREL(%rip), %rax
	je	.LBB233_3
# %bb.2:                                # %if.then2
	leaq	.L.str.84(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB233_3:                              # %if.end3
	leaq	-16(%rbp), %rdi
	movl	$8, %edx
	movq	%rbx, %rsi
	callq	memcpy@PLT
	movq	-16(%rbp), %rdi
	callq	free@PLT
	movq	8(%rbx), %rax
	movq	120(%rax), %rax
	callq	*8(%rax)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, (%rbx)
.LBB233_4:                              # %return
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end233:
	.size	halide_hexagon_detach_device_handle, .Lfunc_end233-halide_hexagon_detach_device_handle
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv # -- Begin function _ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv,@function
_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv: # @_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	movq	%rdi, %r15
	movq	_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE@GOTPCREL(%rip), %r13
	xorl	%r12d, %r12d
	cmpq	$0, (%r13)
	movq	_ZN6Halide7Runtime8Internal7Hexagon10remote_runE@GOTPCREL(%rip), %rcx
	movq	_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE@GOTPCREL(%rip), %rax
	je	.LBB234_3
# %bb.1:                                # %entry
	cmpq	$0, (%rcx)
	je	.LBB234_3
# %bb.2:                                # %entry
	cmpq	$0, (%rax)
	jne	.LBB234_78
.LBB234_3:                              # %if.end
	leaq	.L.str.6.220(%rip), %rdi
	callq	halide_load_library@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.LBB234_5
# %bb.4:                                # %if.then5
	leaq	.L.str.7.221(%rip), %rdi
	callq	halide_load_library@PLT
	movq	%rax, %rbx
.LBB234_5:                              # %if.end7
	leaq	.L.str.10.222(%rip), %rsi
	movq	%rbx, %rdi
	callq	halide_get_library_symbol@PLT
	movq	%rax, (%r13)
	testq	%rax, %rax
	jne	.LBB234_13
# %bb.6:                                # %if.then.i
	movl	$1024, %esi             # imm = 0x400
	movq	%r15, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %r14
	testq	%rax, %rax
	je	.LBB234_7
# %bb.8:                                # %if.then.i38.i
	leaq	1023(%r14), %r12
	movb	$0, 1023(%r14)
	leaq	.L.str.115(%rip), %rdx
	movq	%r14, %rdi
	movq	%r12, %rsi
	jmp	.LBB234_9
.LBB234_7:                              # %if.then.i.split
	leaq	.L.str.115(%rip), %rdx
	xorl	%r12d, %r12d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB234_9:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	leaq	.L.str.10.222(%rip), %rdx
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.116(%rip), %rdx
	movq	%rax, %rdi
	movq	%r12, %rsi
	callq	halide_string_to_string@PLT
	testq	%r14, %r14
	je	.LBB234_10
# %bb.11:                               # %if.else.i.i
	subq	%r14, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%r14, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	halide_error@PLT
	movq	%r15, %rdi
	movq	%r14, %rsi
	jmp	.LBB234_12
.LBB234_10:                             # %if.then.i.i
	leaq	.L.str.111(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
.LBB234_12:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit.i
	callq	halide_free@PLT
	movq	(%r13), %rax
.LBB234_13:                             # %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFiPKciPKhiPiEEEvPvSB_S5_RT_b.exit
	movl	$-1, %r12d
	testq	%rax, %rax
	je	.LBB234_78
# %bb.14:                               # %if.end12
	leaq	.L.str.11.223(%rip), %rsi
	movq	%rbx, -48(%rbp)         # 8-byte Spill
	movq	%rbx, %rdi
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE@GOTPCREL(%rip), %r14
	movq	%rax, (%r14)
	testq	%rax, %rax
	jne	.LBB234_22
# %bb.15:                               # %if.then.i79
	movl	$1024, %esi             # imm = 0x400
	movq	%r15, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB234_16
# %bb.17:                               # %if.then.i38.i81
	leaq	1023(%rbx), %r13
	movb	$0, 1023(%rbx)
	leaq	.L.str.115(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	jmp	.LBB234_18
.LBB234_16:                             # %if.then.i79.split
	leaq	.L.str.115(%rip), %rdx
	xorl	%r13d, %r13d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB234_18:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i84
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	leaq	.L.str.11.223(%rip), %rdx
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.116(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB234_19
# %bb.20:                               # %if.else.i.i91
	subq	%rbx, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB234_21
.LBB234_19:                             # %if.then.i.i87
	leaq	.L.str.111(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
.LBB234_21:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit.i92
	callq	halide_free@PLT
	movq	(%r14), %rax
.LBB234_22:                             # %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFiiPKciPiEEEvPvS9_S5_RT_b.exit
	testq	%rax, %rax
	je	.LBB234_78
# %bb.23:                               # %if.end15
	leaq	.L.str.12.224(%rip), %rsi
	movq	-48(%rbp), %r14         # 8-byte Reload
	movq	%r14, %rdi
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon10remote_runE@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	testq	%rax, %rax
	jne	.LBB234_31
# %bb.24:                               # %if.then.i97
	movl	$1024, %esi             # imm = 0x400
	movq	%r15, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB234_25
# %bb.26:                               # %if.then.i38.i99
	leaq	1023(%rbx), %r13
	movb	$0, 1023(%rbx)
	leaq	.L.str.115(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	jmp	.LBB234_27
.LBB234_25:                             # %if.then.i97.split
	leaq	.L.str.115(%rip), %rdx
	xorl	%r13d, %r13d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB234_27:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i102
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	leaq	.L.str.12.224(%rip), %rdx
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.116(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB234_28
# %bb.29:                               # %if.else.i.i109
	subq	%rbx, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB234_30
.LBB234_28:                             # %if.then.i.i105
	leaq	.L.str.111(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
.LBB234_30:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit.i110
	callq	halide_free@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon10remote_runE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
.LBB234_31:                             # %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFiiiPKNS2_25_remote_buffer__seq_octetEiS6_iPS4_iEEEvPvSA_PKcRT_b.exit
	testq	%rax, %rax
	je	.LBB234_78
# %bb.32:                               # %if.end18
	leaq	.L.str.13.225(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	testq	%rax, %rax
	jne	.LBB234_40
# %bb.33:                               # %if.then.i115
	movl	$1024, %esi             # imm = 0x400
	movq	%r15, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB234_34
# %bb.35:                               # %if.then.i38.i117
	leaq	1023(%rbx), %r13
	movb	$0, 1023(%rbx)
	leaq	.L.str.115(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	jmp	.LBB234_36
.LBB234_34:                             # %if.then.i115.split
	leaq	.L.str.115(%rip), %rdx
	xorl	%r13d, %r13d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB234_36:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i120
	callq	halide_string_to_string@PLT
	leaq	.L.str.13.225(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.116(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB234_37
# %bb.38:                               # %if.else.i.i127
	subq	%rbx, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB234_39
.LBB234_37:                             # %if.then.i.i123
	leaq	.L.str.111(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
.LBB234_39:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit.i128
	callq	halide_free@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
.LBB234_40:                             # %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFiiEEEvPvS6_PKcRT_b.exit
	testq	%rax, %rax
	je	.LBB234_78
# %bb.41:                               # %if.end21
	leaq	.L.str.14.226(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	testq	%rax, %rax
	jne	.LBB234_49
# %bb.42:                               # %if.then.i133
	movl	$1024, %esi             # imm = 0x400
	movq	%r15, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB234_43
# %bb.44:                               # %if.then.i38.i135
	leaq	1023(%rbx), %r13
	movb	$0, 1023(%rbx)
	leaq	.L.str.115(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	jmp	.LBB234_45
.LBB234_43:                             # %if.then.i133.split
	leaq	.L.str.115(%rip), %rdx
	xorl	%r13d, %r13d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB234_45:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i138
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	leaq	.L.str.14.226(%rip), %rdx
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.116(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB234_46
# %bb.47:                               # %if.else.i.i145
	subq	%rbx, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB234_48
.LBB234_46:                             # %if.then.i.i141
	leaq	.L.str.111(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
.LBB234_48:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit.i146
	callq	halide_free@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
.LBB234_49:                             # %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFvvEEEvPvS6_PKcRT_b.exit
	testq	%rax, %rax
	je	.LBB234_78
# %bb.50:                               # %if.end24
	leaq	.L.str.15.227(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon18host_malloc_deinitE@GOTPCREL(%rip), %r14
	movq	%rax, (%r14)
	testq	%rax, %rax
	jne	.LBB234_58
# %bb.51:                               # %if.then.i151
	movl	$1024, %esi             # imm = 0x400
	movq	%r15, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB234_52
# %bb.53:                               # %if.then.i38.i153
	leaq	1023(%rbx), %r13
	movb	$0, 1023(%rbx)
	leaq	.L.str.115(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	jmp	.LBB234_54
.LBB234_52:                             # %if.then.i151.split
	leaq	.L.str.115(%rip), %rdx
	xorl	%r13d, %r13d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB234_54:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i156
	callq	halide_string_to_string@PLT
	leaq	.L.str.15.227(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.116(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB234_55
# %bb.56:                               # %if.else.i.i163
	subq	%rbx, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB234_57
.LBB234_55:                             # %if.then.i.i159
	leaq	.L.str.111(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
.LBB234_57:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit.i164
	callq	halide_free@PLT
	movq	(%r14), %rax
.LBB234_58:                             # %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFvvEEEvPvS6_PKcRT_b.exit165
	testq	%rax, %rax
	je	.LBB234_78
# %bb.59:                               # %if.end27
	leaq	.L.str.16.228(%rip), %rsi
	movq	-48(%rbp), %rdi         # 8-byte Reload
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE@GOTPCREL(%rip), %r14
	movq	%rax, (%r14)
	testq	%rax, %rax
	jne	.LBB234_67
# %bb.60:                               # %if.then.i170
	movl	$1024, %esi             # imm = 0x400
	movq	%r15, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB234_61
# %bb.62:                               # %if.then.i38.i172
	leaq	1023(%rbx), %r13
	movb	$0, 1023(%rbx)
	leaq	.L.str.115(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	jmp	.LBB234_63
.LBB234_61:                             # %if.then.i170.split
	leaq	.L.str.115(%rip), %rdx
	xorl	%r13d, %r13d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB234_63:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i175
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	leaq	.L.str.16.228(%rip), %rdx
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.116(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB234_64
# %bb.65:                               # %if.else.i.i182
	subq	%rbx, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB234_66
.LBB234_64:                             # %if.then.i.i178
	leaq	.L.str.111(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
.LBB234_66:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit.i183
	callq	halide_free@PLT
	movq	(%r14), %rax
.LBB234_67:                             # %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFPvmEEEvS4_S4_PKcRT_b.exit
	testq	%rax, %rax
	je	.LBB234_78
# %bb.68:                               # %if.end30
	leaq	.L.str.17.229(%rip), %rsi
	movq	-48(%rbp), %rdi         # 8-byte Reload
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon9host_freeE@GOTPCREL(%rip), %r14
	movq	%rax, (%r14)
	testq	%rax, %rax
	jne	.LBB234_76
# %bb.69:                               # %if.then.i188
	movl	$1024, %esi             # imm = 0x400
	movq	%r15, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB234_70
# %bb.71:                               # %if.then.i38.i190
	leaq	1023(%rbx), %r13
	movb	$0, 1023(%rbx)
	leaq	.L.str.115(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	jmp	.LBB234_72
.LBB234_70:                             # %if.then.i188.split
	leaq	.L.str.115(%rip), %rdx
	xorl	%r13d, %r13d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB234_72:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i193
	callq	halide_string_to_string@PLT
	leaq	.L.str.17.229(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	leaq	.L.str.116(%rip), %rdx
	movq	%rax, %rdi
	movq	%r13, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB234_73
# %bb.74:                               # %if.else.i.i200
	subq	%rbx, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB234_75
.LBB234_73:                             # %if.then.i.i196
	leaq	.L.str.111(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
.LBB234_75:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit.i201
	callq	halide_free@PLT
	movq	(%r14), %rax
.LBB234_76:                             # %_ZN6Halide7Runtime8Internal7Hexagon10get_symbolIPFvPvEEEvS4_S4_PKcRT_b.exit
	testq	%rax, %rax
	je	.LBB234_78
# %bb.77:                               # %if.end33
	leaq	.L.str.18.230(%rip), %rsi
	movq	-48(%rbp), %rbx         # 8-byte Reload
	movq	%rbx, %rdi
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	leaq	.L.str.19.231(%rip), %rsi
	movq	%rbx, %rdi
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	leaq	.L.str.20.232(%rip), %rsi
	movq	%rbx, %rdi
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	leaq	.L.str.21.233(%rip), %rsi
	movq	%rbx, %rdi
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	leaq	.L.str.22.234(%rip), %rsi
	movq	%rbx, %rdi
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	leaq	.L.str.23.235(%rip), %rsi
	movq	%rbx, %rdi
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	leaq	.L.str.24.236(%rip), %rsi
	movq	%rbx, %rdi
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	leaq	.L.str.25.237(%rip), %rsi
	movq	%rbx, %rdi
	callq	halide_get_library_symbol@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE@GOTPCREL(%rip), %rax
	callq	*(%rax)
	xorl	%r12d, %r12d
.LBB234_78:                             # %return
	movl	%r12d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end234:
	.size	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv, .Lfunc_end234-_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv
                                        # -- End function
	.section	.text.halide_hexagon_wrap_device_handle,"ax",@progbits
	.weak	halide_hexagon_wrap_device_handle # -- Begin function halide_hexagon_wrap_device_handle
	.p2align	4, 0x90
	.type	halide_hexagon_wrap_device_handle,@function
halide_hexagon_wrap_device_handle:      # @halide_hexagon_wrap_device_handle
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$24, %rsp
	movq	%rcx, %r14
	movq	%rdx, %r15
	movq	%rsi, %rbx
	cmpq	$0, (%rsi)
	je	.LBB235_2
# %bb.1:                                # %if.end
	leaq	.L.str.83(%rip), %rsi
	callq	halide_print@PLT
	callq	abort@PLT
	movl	$-2, %eax
	cmpq	$0, (%rbx)
	jne	.LBB235_5
.LBB235_2:                              # %if.end4
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, -32(%rbp)
	testq	%rax, %rax
	je	.LBB235_3
# %bb.4:                                # %if.end6
	movq	%r15, (%rax)
	movq	%r14, 8(%rax)
	movq	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE@GOTPCREL(%rip), %rax
	movq	%rax, 8(%rbx)
	movq	120(%rax), %rax
	callq	*(%rax)
	leaq	-40(%rbp), %rdi
	leaq	-32(%rbp), %rsi
	movl	$8, %edx
	callq	memcpy@PLT
	movq	-40(%rbp), %rax
	movq	%rax, (%rbx)
	xorl	%eax, %eax
	jmp	.LBB235_5
.LBB235_3:
	movl	$-1, %eax
.LBB235_5:                              # %return
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end235:
	.size	halide_hexagon_wrap_device_handle, .Lfunc_end235-halide_hexagon_wrap_device_handle
                                        # -- End function
	.section	.text.halide_hexagon_cleanup,"ax",@progbits
	.weak	halide_hexagon_cleanup  # -- Begin function halide_hexagon_cleanup
	.p2align	4, 0x90
	.type	halide_hexagon_cleanup,@function
halide_hexagon_cleanup:                 # @halide_hexagon_cleanup
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	xorl	%edi, %edi
	popq	%rbp
	jmp	halide_hexagon_device_release@PLT # TAILCALL
.Lfunc_end236:
	.size	halide_hexagon_cleanup, .Lfunc_end236-halide_hexagon_cleanup
                                        # -- End function
	.section	.text._ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_ # -- Begin function _ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_
	.p2align	4, 0x90
	.type	_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_,@function
_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_: # @_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %r14
	movq	%rdi, %r15
	movq	_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE@GOTPCREL(%rip), %r12
	movq	(%r12), %rax
	testq	%rax, %rax
	jne	.LBB237_5
# %bb.1:                                # %if.then
	movl	$1024, %esi             # imm = 0x400
	xorl	%edi, %edi
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB237_2
# %bb.3:                                # %if.else.i7
	movq	%rax, %rbx
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.5.239(%rip), %rdx
	movq	%rax, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	xorl	%edi, %edi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	xorl	%edi, %edi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	xorl	%edi, %edi
	movq	%rbx, %rsi
	jmp	.LBB237_4
.LBB237_2:                              # %if.then.i6
	leaq	.L.str.5.239(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	xorl	%edi, %edi
	callq	halide_error@PLT
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB237_4:                              # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	callq	halide_free@PLT
	movq	(%r12), %rax
.LBB237_5:                              # %if.end
	movq	%r15, %rdi
	movq	%r14, %rsi
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	jmpq	*%rax                   # TAILCALL
.Lfunc_end237:
	.size	_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_, .Lfunc_end237-_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_
                                        # -- End function
	.section	.text.halide_is_hexagon_available,"ax",@progbits
	.weak	halide_is_hexagon_available # -- Begin function halide_is_hexagon_available
	.p2align	4, 0x90
	.type	halide_is_hexagon_available,@function
halide_is_hexagon_available:            # @halide_is_hexagon_available
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	callq	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv@PLT
	testl	%eax, %eax
	sete	%al
	popq	%rbp
	retq
.Lfunc_end238:
	.size	halide_is_hexagon_available, .Lfunc_end238-halide_is_hexagon_available
                                        # -- End function
	.section	.text.halide_hexagon_initialize_kernels,"ax",@progbits
	.weak	halide_hexagon_initialize_kernels # -- Begin function halide_hexagon_initialize_kernels
	.p2align	4, 0x90
	.type	halide_hexagon_initialize_kernels,@function
halide_hexagon_initialize_kernels:      # @halide_hexagon_initialize_kernels
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
	movq	%r9, -104(%rbp)         # 8-byte Spill
	movq	%r8, -48(%rbp)          # 8-byte Spill
	movq	%rcx, %r13
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %r14
	callq	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB239_31
# %bb.1:                                # %if.end
	movq	-104(%rbp), %rbx        # 8-byte Reload
	movq	%r15, -88(%rbp)         # 8-byte Spill
	movq	%r13, -96(%rbp)         # 8-byte Spill
	testq	%r12, %r12
	jne	.LBB239_3
# %bb.2:                                # %if.then18
	leaq	.L.str.31.240(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
.LBB239_3:                              # %if.end19
	movq	_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_lock@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE@GOTPCREL(%rip), %rax
	cmpl	$0, (%rax)
	movq	-48(%rbp), %rdx         # 8-byte Reload
	je	.LBB239_4
.LBB239_7:                              # %if.end56
	movq	(%r12), %rax
	testq	%rax, %rax
	je	.LBB239_8
.LBB239_9:                              # %if.end66
	xorl	%ebx, %ebx
	cmpl	$0, (%rax)
	jne	.LBB239_30
	jmp	.LBB239_10
.LBB239_4:                              # %if.then20
	movq	%rbx, %rcx
	vmovups	.L__const.halide_hexagon_initialize_kernels.soname+12(%rip), %xmm0
	vmovups	%xmm0, -68(%rbp)
	vmovups	.L__const.halide_hexagon_initialize_kernels.soname(%rip), %xmm0
	vmovaps	%xmm0, -80(%rbp)
	movq	_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE@GOTPCREL(%rip), %rax
	movq	_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE@GOTPCREL(%rip), %r15
	leaq	-80(%rbp), %rdi
	movl	$28, %esi
                                        # kill: def $ecx killed $ecx killed $rcx
	movq	%r15, %r8
	callq	*(%rax)
	movl	%eax, %ebx
	movq	%r14, %rdi
	callq	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv@PLT
	testl	%ebx, %ebx
	je	.LBB239_5
# %bb.12:                               # %if.else
	movl	$1024, %esi             # imm = 0x400
	movq	%r14, %rdi
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB239_13
# %bb.14:                               # %if.else.i234
	movq	%rax, %rbx
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.37.242(%rip), %rdx
	movq	%rax, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB239_15
.LBB239_5:                              # %if.then31
	cmpl	$0, (%r15)
	jne	.LBB239_7
# %bb.6:                                # %if.then38
	leaq	.L.str.36.241(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	movq	(%r12), %rax
	testq	%rax, %rax
	jne	.LBB239_9
.LBB239_8:                              # %if.then58
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, (%r12)
	movl	$0, (%rax)
	movq	_ZN6Halide7Runtime8Internal7Hexagon10state_listE@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rdx
	movq	%rdx, 8(%rax)
	movq	%rax, (%rcx)
	movq	(%r12), %rax
	xorl	%ebx, %ebx
	cmpl	$0, (%rax)
	jne	.LBB239_30
.LBB239_10:                             # %if.then69
	movl	$1024, %esi             # imm = 0x400
	movq	%r14, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.LBB239_11
# %bb.16:                               # %if.then.i221
	leaq	1023(%r13), %r15
	movb	$0, 1023(%r13)
	leaq	.L.str.40.243(%rip), %rdx
	movq	%r13, %rdi
	movq	%r15, %rsi
	jmp	.LBB239_17
.LBB239_11:                             # %if.then69.split
	leaq	.L.str.40.243(%rip), %rdx
	xorl	%r15d, %r15d
	xorl	%edi, %edi
	xorl	%esi, %esi
.LBB239_17:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EEC2EPvPc.exit
	callq	halide_string_to_string@PLT
	movq	%r12, -48(%rbp)         # 8-byte Spill
	movslq	_ZZ33halide_hexagon_initialize_kernelsE9unique_id(%rip), %rdx
	leal	1(%rdx), %ecx
	movl	%ecx, _ZZ33halide_hexagon_initialize_kernelsE9unique_id(%rip)
	movq	%rax, %rdi
	movq	%r15, %rsi
	movl	$1, %ecx
	callq	halide_int64_to_string@PLT
	leaq	.L.str.41.244(%rip), %rdx
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rbx
	testq	%r13, %r13
	je	.LBB239_18
# %bb.19:                               # %if.then.i188
	movq	%rbx, %r15
	subq	%r13, %rbx
	incq	%rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movl	$0, -80(%rbp)
	movq	_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE@GOTPCREL(%rip), %rax
	movq	(%rax), %r12
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	movq	%r15, %rbx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r13, %rdi
	jmp	.LBB239_20
.LBB239_18:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE3strEv.exit199.thread
	movl	$0, -80(%rbp)
	movq	_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE@GOTPCREL(%rip), %rax
	movq	(%rax), %r12
	leaq	.L.str.111(%rip), %rdi
.LBB239_20:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE3strEv.exit
	movl	%ebx, %esi
	subl	%r13d, %esi
	incl	%esi
	leaq	-80(%rbp), %r8
	movq	-88(%rbp), %rdx         # 8-byte Reload
	movq	-96(%rbp), %rcx         # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx
	callq	*%r12
	movl	%eax, %r15d
	movq	%r14, %rdi
	callq	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv@PLT
	testl	%r15d, %r15d
	je	.LBB239_21
# %bb.22:                               # %if.else93
	movq	%rbx, %r12
	movl	$1024, %esi             # imm = 0x400
	movq	%r14, %rdi
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB239_23
# %bb.24:                               # %if.else.i167
	movq	%rax, %rbx
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.37.242(%rip), %rdx
	movq	%rax, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_free@PLT
	movq	%r12, %rbx
	testq	%r13, %r13
	jne	.LBB239_28
	jmp	.LBB239_27
.LBB239_21:                             # %if.then86
	movl	-80(%rbp), %eax
	movq	-48(%rbp), %rcx         # 8-byte Reload
	movq	(%rcx), %rcx
	movl	%eax, (%rcx)
	testq	%r13, %r13
	jne	.LBB239_28
.LBB239_27:                             # %if.then.i
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
	jmp	.LBB239_29
.LBB239_13:                             # %if.then.i228
	leaq	.L.str.37.242(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB239_15:                             # %if.end46
	callq	halide_free@PLT
	movl	$0, (%r15)
	movl	$-1, %ebx
	jmp	.LBB239_30
.LBB239_23:                             # %if.then.i161
	leaq	.L.str.37.242(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
	callq	halide_free@PLT
	movq	%r12, %rbx
	testq	%r13, %r13
	je	.LBB239_27
.LBB239_28:                             # %if.else.i
	subq	%r13, %rbx
	incq	%rbx
	movq	%r14, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%r13, %rsi
.LBB239_29:                             # %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EED2Ev.exit
	callq	halide_free@PLT
	negl	%r15d
	sbbl	%ebx, %ebx
.LBB239_30:                             # %cleanup
	movq	_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE@GOTPCREL(%rip), %rdi
	callq	halide_mutex_unlock@PLT
.LBB239_31:                             # %cleanup111
	movl	%ebx, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end239:
	.size	halide_hexagon_initialize_kernels, .Lfunc_end239-halide_hexagon_initialize_kernels
                                        # -- End function
	.section	.text.map_arguments,"ax",@progbits
	.weak	map_arguments           # -- Begin function map_arguments
	.p2align	4, 0x90
	.type	map_arguments,@function
map_arguments:                          # @map_arguments
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	testl	%esi, %esi
	jle	.LBB240_11
# %bb.1:                                # %for.body.lr.ph
	movq	%rdx, %rbx
	movq	24(%rbp), %rdi
	movl	16(%rbp), %r10d
	movl	%esi, %r15d
	xorl	%r14d, %r14d
	xorl	%eax, %eax
	movl	%r9d, -44(%rbp)         # 4-byte Spill
	movq	%r8, -64(%rbp)          # 8-byte Spill
	movq	%rcx, -56(%rbp)         # 8-byte Spill
	jmp	.LBB240_6
.LBB240_2:                              # %if.else22
                                        #   in Loop: Header=BB240_6 Depth=1
	movq	(%rcx,%r14,8), %rdx
	movq	%rdx, (%r13)
.LBB240_3:                              # %for.inc
                                        #   in Loop: Header=BB240_6 Depth=1
	movl	(%rbx), %edx
.LBB240_4:                              # %for.inc
                                        #   in Loop: Header=BB240_6 Depth=1
	movl	%edx, 8(%rdi,%r12)
.LBB240_5:                              # %for.inc
                                        #   in Loop: Header=BB240_6 Depth=1
	incq	%r14
	addq	$8, %rbx
	decq	%r15
	je	.LBB240_12
.LBB240_6:                              # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	(%r8,%r14,4), %esi
	movl	%esi, %edx
	andl	%r9d, %edx
	cmpl	%r10d, %edx
	jne	.LBB240_5
# %bb.7:                                # %if.end
                                        #   in Loop: Header=BB240_6 Depth=1
	movslq	%eax, %r12
	incl	%eax
	shlq	$4, %r12
	leaq	(%rdi,%r12), %r13
	testl	%esi, %esi
	je	.LBB240_2
# %bb.8:                                # %if.then7
                                        #   in Loop: Header=BB240_6 Depth=1
	movq	(%rcx,%r14,8), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, -72(%rbp)
	testq	%rdx, %rdx
	je	.LBB240_10
# %bb.9:                                # %if.then12
                                        #   in Loop: Header=BB240_6 Depth=1
	movl	$8, %edx
	leaq	-80(%rbp), %rdi
	movl	%eax, -48(%rbp)         # 4-byte Spill
	leaq	-72(%rbp), %rsi
	callq	memcpy@PLT
	movl	-48(%rbp), %eax         # 4-byte Reload
	movl	16(%rbp), %r10d
	movq	24(%rbp), %rdi
	movq	-56(%rbp), %rcx         # 8-byte Reload
	movq	-64(%rbp), %r8          # 8-byte Reload
	movl	-44(%rbp), %r9d         # 4-byte Reload
	movq	-80(%rbp), %rsi
	movq	(%rsi), %rdx
	movq	%rdx, (%r13)
	addq	$8, %rsi
	movl	(%rsi), %edx
	jmp	.LBB240_4
.LBB240_10:                             # %if.else
                                        #   in Loop: Header=BB240_6 Depth=1
	movq	8(%rsi), %rdx
	movq	%rdx, (%r13)
	movq	%rbx, %rsi
	jmp	.LBB240_3
.LBB240_11:
	xorl	%eax, %eax
.LBB240_12:                             # %for.cond.cleanup
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end240:
	.size	map_arguments, .Lfunc_end240-map_arguments
                                        # -- End function
	.section	.text.halide_hexagon_run,"ax",@progbits
	.weak	halide_hexagon_run      # -- Begin function halide_hexagon_run
	.p2align	4, 0x90
	.type	halide_hexagon_run,@function
halide_hexagon_run:                     # @halide_hexagon_run
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	movq	%r9, %r13
	movq	%r8, %rbx
	movq	%rcx, %r12
	movq	%rdx, -56(%rbp)         # 8-byte Spill
	movq	%rsi, %r14
	movq	%rdi, %r15
	testq	%rsi, %rsi
	je	.LBB241_1
# %bb.2:                                # %if.end
	testq	%r12, %r12
	je	.LBB241_3
.LBB241_4:                              # %if.end3
	movq	%r15, %rdi
	callq	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv@PLT
	testl	%eax, %eax
	jne	.LBB241_36
.LBB241_5:                              # %if.end6
	testq	%r14, %r14
	je	.LBB241_6
# %bb.7:                                # %cond.true
	movl	(%r14), %eax
	movl	%eax, -44(%rbp)         # 4-byte Spill
	cmpl	$0, (%r12)
	jne	.LBB241_21
	jmp	.LBB241_9
.LBB241_1:                              # %if.then
	leaq	.L.str.44.245(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	testq	%r12, %r12
	jne	.LBB241_4
.LBB241_3:                              # %if.then2
	leaq	.L.str.45.246(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_print@PLT
	callq	abort@PLT
	movq	%r15, %rdi
	callq	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv@PLT
	testl	%eax, %eax
	jne	.LBB241_36
	jmp	.LBB241_5
.LBB241_6:
	movl	$0, -44(%rbp)           # 4-byte Folded Spill
	cmpl	$0, (%r12)
	jne	.LBB241_21
.LBB241_9:                              # %if.then25
	movl	$0, -60(%rbp)
	movq	_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -72(%rbp)         # 8-byte Spill
	movq	-56(%rbp), %r14         # 8-byte Reload
	movq	%r14, %rdi
	callq	strlen@PLT
	leal	1(%rax), %edx
	leaq	-60(%rbp), %rcx
	movl	-44(%rbp), %edi         # 4-byte Reload
	movq	%r14, %rsi
	callq	*-72(%rbp)              # 8-byte Folded Reload
	xorl	%ecx, %ecx
	testl	%eax, %eax
	jne	.LBB241_11
# %bb.10:                               # %if.then25
	movl	-60(%rbp), %ecx
.LBB241_11:                             # %if.then25
	movl	%ecx, (%r12)
	movq	%r15, %rdi
	callq	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv@PLT
	cmpl	$0, (%r12)
	je	.LBB241_12
.LBB241_21:                             # %while.cond.preheader
	movq	%r12, -72(%rbp)         # 8-byte Spill
	movq	%r15, -56(%rbp)         # 8-byte Spill
	movq	16(%rbp), %r8
	movq	$-1, %r15
	.p2align	4, 0x90
.LBB241_22:                             # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpq	$0, 8(%rbx,%r15,8)
	leaq	1(%r15), %r15
	jne	.LBB241_22
# %bb.23:                               # %while.end
	movq	%rsp, %r12
	movq	%r15, %rax
	shlq	$4, %rax
	subq	%rax, %r12
	movq	%r12, %rsp
	movq	-56(%rbp), %r14         # 8-byte Reload
	movq	%r14, %rdi
	movl	%r15d, %esi
	movq	%rbx, %rdx
	movq	%r13, %rcx
	movl	$3, %r9d
	pushq	%r12
	pushq	$1
	callq	map_arguments@PLT
	addq	$16, %rsp
	testl	%eax, %eax
	js	.LBB241_36
# %bb.24:                               # %if.end56
	movq	%r13, %rcx
	movl	%eax, -80(%rbp)         # 4-byte Spill
	movslq	%eax, %r13
	shlq	$4, %r13
	addq	%r12, %r13
	movq	%r14, %rdi
	movl	%r15d, %esi
	movq	%rbx, %rdx
	movq	%rcx, -96(%rbp)         # 8-byte Spill
	movq	16(%rbp), %r8
	movl	$2, %r9d
	pushq	%r13
	pushq	$2
	callq	map_arguments@PLT
	addq	$16, %rsp
	testl	%eax, %eax
	js	.LBB241_36
# %bb.25:                               # %if.end60
	movl	%eax, -76(%rbp)         # 4-byte Spill
	cltq
	shlq	$4, %rax
	movq	%r13, -88(%rbp)         # 8-byte Spill
	addq	%r13, %rax
	movq	%r14, %rdi
	movq	%rax, %r14
	movl	%r15d, %esi
	movq	%rbx, %rdx
	movq	-96(%rbp), %rcx         # 8-byte Reload
	movq	16(%rbp), %r8
	movl	$3, %r9d
	pushq	%rax
	pushq	$0
	callq	map_arguments@PLT
	addq	$16, %rsp
	movl	%eax, %ebx
	testl	%eax, %eax
	js	.LBB241_26
# %bb.27:                               # %if.end66
	movq	_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE@GOTPCREL(%rip), %rax
	cmpq	$0, (%rax)
	je	.LBB241_30
# %bb.28:                               # %if.then68
	callq	halide_profiler_get_state@PLT
	movq	_ZN6Halide7Runtime8Internal7Hexagon25get_remote_profiler_stateEPiS3_@GOTPCREL(%rip), %rcx
	movq	%rcx, 32(%rax)
	movq	_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE@GOTPCREL(%rip), %rax
	movq	(%rax), %r15
	testq	%r15, %r15
	je	.LBB241_30
# %bb.29:                               # %if.then71
	callq	halide_profiler_get_state@PLT
	movl	16(%rax), %edi
	callq	*%r15
.LBB241_30:                             # %if.end75
	movq	_ZN6Halide7Runtime8Internal7Hexagon10remote_runE@GOTPCREL(%rip), %rax
	movq	-72(%rbp), %rcx         # 8-byte Reload
	movl	(%rcx), %esi
	movl	-44(%rbp), %edi         # 4-byte Reload
	movq	%r12, %rdx
	movl	-80(%rbp), %ecx         # 4-byte Reload
	movq	-88(%rbp), %r8          # 8-byte Reload
	movl	-76(%rbp), %r9d         # 4-byte Reload
	pushq	%rbx
	pushq	%r14
	callq	*(%rax)
	addq	$16, %rsp
	movl	%eax, %ebx
	movq	-56(%rbp), %r14         # 8-byte Reload
	movq	%r14, %rdi
	callq	_ZN6Halide7Runtime8Internal7Hexagon8poll_logEPv@PLT
	testl	%ebx, %ebx
	je	.LBB241_35
# %bb.31:                               # %if.then84
	movl	%ebx, %r15d
	movl	$1024, %esi             # imm = 0x400
	movq	%r14, %rdi
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB241_32
# %bb.34:                               # %if.else.i
	movq	%rax, %rbx
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.59.249(%rip), %rdx
	movq	%rax, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r14, %rdi
	movq	%rbx, %rsi
	jmp	.LBB241_33
.LBB241_12:                             # %if.then43
	movl	$1024, %esi             # imm = 0x400
	movq	%r15, %rdi
	callq	halide_malloc@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.LBB241_13
# %bb.14:                               # %if.then.i226
	leaq	1023(%rbx), %r14
	movb	$0, 1023(%rbx)
	leaq	.L.str.56.247(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movq	-56(%rbp), %rdx         # 8-byte Reload
	testq	%rdx, %rdx
	jne	.LBB241_17
.LBB241_16:                             # %if.then.i208
	leaq	.L.str.112(%rip), %rdx
.LBB241_17:                             # %if.else.i210
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	movq	%rax, %rdi
	leaq	.L.str.57.248(%rip), %rdx
	movq	%r14, %rsi
	callq	halide_string_to_string@PLT
	testq	%rbx, %rbx
	je	.LBB241_18
# %bb.20:                               # %if.else.i194
	subq	%rbx, %rax
	incq	%rax
	movq	%r15, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB241_19
.LBB241_26:
	movl	%ebx, %eax
	jmp	.LBB241_36
.LBB241_35:                             # %if.end87
	callq	halide_profiler_get_state@PLT
	movq	$0, 32(%rax)
	xorl	%eax, %eax
	jmp	.LBB241_36
.LBB241_32:                             # %if.then.i
	leaq	.L.str.59.249(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	movq	%r14, %rdi
	callq	halide_error@PLT
	movq	%r14, %rdi
	xorl	%esi, %esi
.LBB241_33:                             # %cleanup101
	callq	halide_free@PLT
	movl	%r15d, %eax
	jmp	.LBB241_36
.LBB241_13:                             # %if.then43.split
	leaq	.L.str.56.247(%rip), %rdx
	xorl	%r14d, %r14d
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	movq	-56(%rbp), %rdx         # 8-byte Reload
	testq	%rdx, %rdx
	jne	.LBB241_17
	jmp	.LBB241_16
.LBB241_18:                             # %if.then.i188
	leaq	.L.str.111(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
.LBB241_19:                             # %cleanup101
	callq	halide_free@PLT
	movl	$-1, %eax
.LBB241_36:                             # %cleanup101
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end241:
	.size	halide_hexagon_run, .Lfunc_end241-halide_hexagon_run
                                        # -- End function
	.section	.text.halide_hexagon_power_hvx_on,"ax",@progbits
	.weak	halide_hexagon_power_hvx_on # -- Begin function halide_hexagon_power_hvx_on
	.p2align	4, 0x90
	.type	halide_hexagon_power_hvx_on,@function
halide_hexagon_power_hvx_on:            # @halide_hexagon_power_hvx_on
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdi, %r12
	callq	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.LBB242_1
.LBB242_7:                              # %cleanup
	movl	%ebx, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB242_1:                              # %if.end
	movq	_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	xorl	%ebx, %ebx
	testq	%rcx, %rcx
	je	.LBB242_7
# %bb.2:                                # %if.end2
	callq	*%rcx
	testl	%eax, %eax
	je	.LBB242_7
# %bb.3:                                # %if.then11
	movl	%eax, %r14d
	movl	$1024, %esi             # imm = 0x400
	movq	%r12, %rdi
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB242_4
# %bb.5:                                # %if.else.i
	movq	%rax, %r15
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.98(%rip), %rdx
	movq	%rax, %rdi
	callq	halide_string_to_string@PLT
	subq	%r15, %rax
	leaq	1(%rax), %rdx
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	halide_error@PLT
	movq	%r12, %rdi
	movq	%r15, %rsi
	jmp	.LBB242_6
.LBB242_4:                              # %if.then.i
	leaq	.L.str.98(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_error@PLT
	movq	%r12, %rdi
	xorl	%esi, %esi
.LBB242_6:                              # %cleanup
	callq	halide_free@PLT
	movl	%r14d, %ebx
	jmp	.LBB242_7
.Lfunc_end242:
	.size	halide_hexagon_power_hvx_on, .Lfunc_end242-halide_hexagon_power_hvx_on
                                        # -- End function
	.section	.text.halide_hexagon_power_hvx_off,"ax",@progbits
	.weak	halide_hexagon_power_hvx_off # -- Begin function halide_hexagon_power_hvx_off
	.p2align	4, 0x90
	.type	halide_hexagon_power_hvx_off,@function
halide_hexagon_power_hvx_off:           # @halide_hexagon_power_hvx_off
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rdi, %r12
	callq	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.LBB243_1
.LBB243_7:                              # %cleanup
	movl	%ebx, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB243_1:                              # %if.end
	movq	_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	xorl	%ebx, %ebx
	testq	%rcx, %rcx
	je	.LBB243_7
# %bb.2:                                # %if.end2
	callq	*%rcx
	testl	%eax, %eax
	je	.LBB243_7
# %bb.3:                                # %if.then11
	movl	%eax, %r14d
	movl	$1024, %esi             # imm = 0x400
	movq	%r12, %rdi
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB243_4
# %bb.5:                                # %if.else.i
	movq	%rax, %r15
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.101(%rip), %rdx
	movq	%rax, %rdi
	callq	halide_string_to_string@PLT
	subq	%r15, %rax
	leaq	1(%rax), %rdx
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	halide_error@PLT
	movq	%r12, %rdi
	movq	%r15, %rsi
	jmp	.LBB243_6
.LBB243_4:                              # %if.then.i
	leaq	.L.str.101(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_error@PLT
	movq	%r12, %rdi
	xorl	%esi, %esi
.LBB243_6:                              # %cleanup
	callq	halide_free@PLT
	movl	%r14d, %ebx
	jmp	.LBB243_7
.Lfunc_end243:
	.size	halide_hexagon_power_hvx_off, .Lfunc_end243-halide_hexagon_power_hvx_off
                                        # -- End function
	.section	.text.halide_hexagon_power_hvx_off_as_destructor,"ax",@progbits
	.weak	halide_hexagon_power_hvx_off_as_destructor # -- Begin function halide_hexagon_power_hvx_off_as_destructor
	.p2align	4, 0x90
	.type	halide_hexagon_power_hvx_off_as_destructor,@function
halide_hexagon_power_hvx_off_as_destructor: # @halide_hexagon_power_hvx_off_as_destructor
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	popq	%rbp
	jmp	halide_hexagon_power_hvx_off@PLT # TAILCALL
.Lfunc_end244:
	.size	halide_hexagon_power_hvx_off_as_destructor, .Lfunc_end244-halide_hexagon_power_hvx_off_as_destructor
                                        # -- End function
	.section	.text.halide_hexagon_set_performance_mode,"ax",@progbits
	.weak	halide_hexagon_set_performance_mode # -- Begin function halide_hexagon_set_performance_mode
	.p2align	4, 0x90
	.type	halide_hexagon_set_performance_mode,@function
halide_hexagon_set_performance_mode:    # @halide_hexagon_set_performance_mode
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movl	%esi, %r14d
	movq	%rdi, %r12
	callq	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.LBB245_1
.LBB245_7:                              # %cleanup
	movl	%ebx, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB245_1:                              # %if.end
	movq	_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	xorl	%ebx, %ebx
	testq	%rcx, %rcx
	je	.LBB245_7
# %bb.2:                                # %if.end2
	movl	%r14d, %edi
	callq	*%rcx
	testl	%eax, %eax
	je	.LBB245_7
# %bb.3:                                # %if.then11
	movl	%eax, %r14d
	movl	$1024, %esi             # imm = 0x400
	movq	%r12, %rdi
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB245_4
# %bb.5:                                # %if.else.i
	movq	%rax, %r15
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.104(%rip), %rdx
	movq	%rax, %rdi
	callq	halide_string_to_string@PLT
	subq	%r15, %rax
	leaq	1(%rax), %rdx
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	halide_error@PLT
	movq	%r12, %rdi
	movq	%r15, %rsi
	jmp	.LBB245_6
.LBB245_4:                              # %if.then.i
	leaq	.L.str.104(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_error@PLT
	movq	%r12, %rdi
	xorl	%esi, %esi
.LBB245_6:                              # %cleanup
	callq	halide_free@PLT
	movl	%r14d, %ebx
	jmp	.LBB245_7
.Lfunc_end245:
	.size	halide_hexagon_set_performance_mode, .Lfunc_end245-halide_hexagon_set_performance_mode
                                        # -- End function
	.section	.text.halide_hexagon_set_performance,"ax",@progbits
	.weak	halide_hexagon_set_performance # -- Begin function halide_hexagon_set_performance
	.p2align	4, 0x90
	.type	halide_hexagon_set_performance,@function
halide_hexagon_set_performance:         # @halide_hexagon_set_performance
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movq	%rsi, %rbx
	movq	%rdi, %r15
	callq	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv@PLT
	movl	%eax, %r12d
	testl	%eax, %eax
	je	.LBB246_1
.LBB246_7:                              # %cleanup
	movl	%r12d, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB246_1:                              # %if.end
	movq	_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE@GOTPCREL(%rip), %rax
	movq	(%rax), %r10
	xorl	%r12d, %r12d
	testq	%r10, %r10
	je	.LBB246_7
# %bb.2:                                # %if.end2
	movzbl	(%rbx), %edi
	movl	4(%rbx), %esi
	movl	8(%rbx), %edx
	movzbl	12(%rbx), %ecx
	movl	16(%rbx), %r8d
	movzwl	20(%rbx), %r9d
	movzbl	22(%rbx), %eax
	movl	24(%rbx), %ebx
	pushq	%rbx
	pushq	%rax
	callq	*%r10
	addq	$16, %rsp
	testl	%eax, %eax
	je	.LBB246_7
# %bb.3:                                # %if.then17
	movl	%eax, %r14d
	movl	$1024, %esi             # imm = 0x400
	movq	%r15, %rdi
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB246_4
# %bb.5:                                # %if.else.i
	movq	%rax, %rbx
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.107(%rip), %rdx
	movq	%rax, %rdi
	callq	halide_string_to_string@PLT
	subq	%rbx, %rax
	leaq	1(%rax), %rdx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	callq	halide_error@PLT
	movq	%r15, %rdi
	movq	%rbx, %rsi
	jmp	.LBB246_6
.LBB246_4:                              # %if.then.i
	leaq	.L.str.107(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	movq	%r15, %rdi
	callq	halide_error@PLT
	movq	%r15, %rdi
	xorl	%esi, %esi
.LBB246_6:                              # %cleanup
	callq	halide_free@PLT
	movl	%r14d, %r12d
	jmp	.LBB246_7
.Lfunc_end246:
	.size	halide_hexagon_set_performance, .Lfunc_end246-halide_hexagon_set_performance
                                        # -- End function
	.section	.text.halide_hexagon_set_thread_priority,"ax",@progbits
	.weak	halide_hexagon_set_thread_priority # -- Begin function halide_hexagon_set_thread_priority
	.p2align	4, 0x90
	.type	halide_hexagon_set_thread_priority,@function
halide_hexagon_set_thread_priority:     # @halide_hexagon_set_thread_priority
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	movl	%esi, %r14d
	movq	%rdi, %r12
	callq	_ZN6Halide7Runtime8Internal7Hexagon20init_hexagon_runtimeEPv@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	je	.LBB247_1
.LBB247_7:                              # %cleanup
	movl	%ebx, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB247_1:                              # %if.end
	movq	_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	xorl	%ebx, %ebx
	testq	%rcx, %rcx
	je	.LBB247_7
# %bb.2:                                # %if.end2
	movl	%r14d, %edi
	callq	*%rcx
	testl	%eax, %eax
	je	.LBB247_7
# %bb.3:                                # %if.then11
	movl	%eax, %r14d
	movl	$1024, %esi             # imm = 0x400
	movq	%r12, %rdi
	callq	halide_malloc@PLT
	testq	%rax, %rax
	je	.LBB247_4
# %bb.5:                                # %if.else.i
	movq	%rax, %r15
	leaq	1023(%rax), %rsi
	movb	$0, 1023(%rax)
	leaq	.L.str.110(%rip), %rdx
	movq	%rax, %rdi
	callq	halide_string_to_string@PLT
	subq	%r15, %rax
	leaq	1(%rax), %rdx
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	halide_msan_annotate_memory_is_initialized@PLT
	movq	%r12, %rdi
	movq	%r15, %rsi
	callq	halide_error@PLT
	movq	%r12, %rdi
	movq	%r15, %rsi
	jmp	.LBB247_6
.LBB247_4:                              # %if.then.i
	leaq	.L.str.110(%rip), %rdx
	xorl	%edi, %edi
	xorl	%esi, %esi
	callq	halide_string_to_string@PLT
	leaq	.L.str.111(%rip), %rsi
	movq	%r12, %rdi
	callq	halide_error@PLT
	movq	%r12, %rdi
	xorl	%esi, %esi
.LBB247_6:                              # %cleanup
	callq	halide_free@PLT
	movl	%r14d, %ebx
	jmp	.LBB247_7
.Lfunc_end247:
	.size	halide_hexagon_set_thread_priority, .Lfunc_end247-halide_hexagon_set_thread_priority
                                        # -- End function
	.section	.text.halide_hexagon_device_interface,"ax",@progbits
	.weak	halide_hexagon_device_interface # -- Begin function halide_hexagon_device_interface
	.p2align	4, 0x90
	.type	halide_hexagon_device_interface,@function
halide_hexagon_device_interface:        # @halide_hexagon_device_interface
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE@GOTPCREL(%rip), %rax
	popq	%rbp
	retq
.Lfunc_end248:
	.size	halide_hexagon_device_interface, .Lfunc_end248-halide_hexagon_device_interface
                                        # -- End function
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5               # -- Begin function halide_blur
.LCPI249_0:
	.quad	8                       # 0x8
	.quad	8                       # 0x8
	.quad	60                      # 0x3c
	.quad	8                       # 0x8
.LCPI249_1:
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.quad	1                       # 0x1
	.quad	0                       # 0x0
	.section	.text.halide_blur,"ax",@progbits
	.globl	halide_blur
	.p2align	4, 0x90
	.type	halide_blur,@function
halide_blur:                            # @halide_blur
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$576, %rsp              # imm = 0x240
	movq	%rsi, %r14
	movq	%rdi, %r13
	leaq	.Lhexagon_module_state_buf.data(%rip), %rsi
	leaq	.Lhalide_hexagon_code.data(%rip), %rdx
	leaq	.Lhalide_shared_runtime.data(%rip), %r8
	movl	$8752, %ecx             # imm = 0x2230
	movl	$62040, %r9d            # imm = 0xF258
	xorl	%edi, %edi
	callq	halide_hexagon_initialize_kernels@PLT
	testl	%eax, %eax
	jne	.LBB249_1
# %bb.4:                                # %"assert succeeded"
	testq	%r13, %r13
	je	.LBB249_5
# %bb.7:                                # %"assert succeeded2"
	testq	%r14, %r14
	je	.LBB249_8
# %bb.9:                                # %"assert succeeded4"
	leaq	32(%r14), %rsi
	leaq	28(%rsp), %rdi
	movl	$4, %edx
	callq	memcpy@PLT
	movl	28(%rsp), %eax
	movl	%eax, 64(%rsp)          # 4-byte Spill
	movl	36(%r14), %eax
	movl	%eax, 56(%rsp)          # 4-byte Spill
	movq	40(%r14), %rax
	movl	(%rax), %ecx
	movq	%rcx, 32(%rsp)          # 8-byte Spill
	movl	8(%rax), %ecx
	movl	%ecx, 92(%rsp)          # 4-byte Spill
	movslq	4(%rax), %r12
	movl	16(%rax), %r15d
	movslq	20(%rax), %rbx
	movl	24(%rax), %eax
	movl	%eax, 100(%rsp)         # 4-byte Spill
	movq	16(%r13), %rax
	movq	%rax, 336(%rsp)         # 8-byte Spill
	leaq	32(%r13), %rsi
	leaq	28(%rsp), %rdi
	movl	$4, %edx
	callq	memcpy@PLT
	movq	%rbx, %r10
	leal	-1(%r12), %r9d
	movl	%r9d, %r11d
	andl	$-256, %r11d
	leal	-256(%r12), %edi
	cmpl	%r11d, %edi
	cmovlel	%edi, %r11d
	cmpq	$257, %r12              # imm = 0x101
	movl	$256, %eax              # imm = 0x100
	cmovll	%r12d, %eax
	movq	%rax, 200(%rsp)         # 8-byte Spill
	leal	-1(%rbx), %r8d
	andl	$-128, %r8d
	leal	-128(%rbx), %ecx
	cmpl	%r8d, %ecx
	cmovlel	%ecx, %r8d
	cmpq	$129, %rbx
	movl	28(%rsp), %eax
	movl	%eax, 88(%rsp)          # 4-byte Spill
	movq	40(%r13), %rcx
	movl	(%rcx), %eax
	movq	%rax, 104(%rsp)         # 8-byte Spill
	movl	4(%rcx), %eax
	movq	%rax, 48(%rsp)          # 8-byte Spill
	movl	8(%rcx), %eax
	movl	%eax, 84(%rsp)          # 4-byte Spill
	movl	16(%rcx), %eax
	movq	%rax, 112(%rsp)         # 8-byte Spill
	movl	20(%rcx), %eax
	movq	%rax, 208(%rsp)         # 8-byte Spill
	movl	$128, %eax
	cmovll	%r10d, %eax
	movq	%rax, 192(%rsp)         # 8-byte Spill
	movl	24(%rcx), %eax
	movl	%eax, 96(%rsp)          # 4-byte Spill
	cmpq	$0, 16(%r14)
	movl	36(%r13), %eax
	movl	%eax, 80(%rsp)          # 4-byte Spill
	jne	.LBB249_12
# %bb.10:                               # %_halide_buffer_is_bounds_query.exit
	cmpq	$0, (%r14)
	je	.LBB249_11
.LBB249_12:                             # %after_bb
	cmpq	$0, 16(%r13)
	movl	64(%rsp), %eax          # 4-byte Reload
	movl	56(%rsp), %esi          # 4-byte Reload
	jne	.LBB249_15
.LBB249_13:                             # %_halide_buffer_is_bounds_query.exit107
	cmpq	$0, (%r13)
	jne	.LBB249_15
# %bb.14:                               # %true_bb5
	movq	40(%r13), %rcx
	cmpl	$129, %r12d
	movl	$128, %edx
	cmovll	%r12d, %edx
	movl	$128, %esi
	cmpl	$127, %r12d
	cmovgl	%r12d, %esi
	movq	32(%rsp), %rax          # 8-byte Reload
	leal	(%rax,%rdx), %edx
	addl	$-128, %edx
	addl	$2, %esi
	leal	2(%r10), %eax
	movl	%edx, 160(%rsp)
	movl	%esi, 164(%rsp)
	movq	$1, 168(%rsp)
	movl	%r15d, 176(%rsp)
	movl	%eax, 180(%rsp)
	movl	64(%rsp), %eax          # 4-byte Reload
	movl	%esi, 184(%rsp)
	movl	56(%rsp), %esi          # 4-byte Reload
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, (%r13)
	movl	$0, 188(%rsp)
	movq	$0, 16(%r13)
	movabsq	$8590004225, %rdx       # imm = 0x200011001
	movq	%rdx, 32(%r13)
	movl	160(%rsp), %edx
	movl	%edx, (%rcx)
	movl	164(%rsp), %edx
	movl	%edx, 4(%rcx)
	movq	168(%rsp), %rdx
	movq	%rdx, 8(%rcx)
	movq	40(%r13), %rcx
	movl	176(%rsp), %edx
	movl	%edx, 16(%rcx)
	movl	180(%rsp), %edx
	movl	%edx, 20(%rcx)
	movl	184(%rsp), %edx
	movl	%edx, 24(%rcx)
	movl	188(%rsp), %edx
	movl	%edx, 28(%rcx)
	movq	$0, 24(%r13)
	cmpq	$0, 16(%r14)
	jne	.LBB249_16
	jmp	.LBB249_17
.LBB249_11:                             # %true_bb
	movl	%r11d, %ecx
	movq	200(%rsp), %rsi         # 8-byte Reload
	subl	%esi, %ecx
	movq	40(%r14), %rdx
	movq	32(%rsp), %rax          # 8-byte Reload
	leal	(%rax,%rsi), %eax
	addl	$-256, %eax
	movl	%eax, 40(%rsp)          # 4-byte Spill
	addl	$512, %ecx              # imm = 0x200
	movq	192(%rsp), %rax         # 8-byte Reload
	leal	(%r15,%rax), %esi
	addl	$-128, %esi
	movl	%r8d, %ebx
	subl	%eax, %ebx
	addl	$256, %ebx              # imm = 0x100
	movl	40(%rsp), %eax          # 4-byte Reload
	movl	%eax, 128(%rsp)
	movl	%ecx, 132(%rsp)
	movq	$1, 136(%rsp)
	movl	%esi, 144(%rsp)
	movl	%ebx, 148(%rsp)
	movl	%ecx, 152(%rsp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, (%r14)
	movl	$0, 156(%rsp)
	movq	$0, 16(%r14)
	movabsq	$8590004225, %rcx       # imm = 0x200011001
	movq	%rcx, 32(%r14)
	movl	128(%rsp), %ecx
	movl	%ecx, (%rdx)
	movl	132(%rsp), %ecx
	movl	%ecx, 4(%rdx)
	movq	136(%rsp), %rcx
	movq	%rcx, 8(%rdx)
	movq	40(%r14), %rcx
	movl	144(%rsp), %edx
	movl	%edx, 16(%rcx)
	movl	148(%rsp), %edx
	movl	%edx, 20(%rcx)
	movl	152(%rsp), %edx
	movl	%edx, 24(%rcx)
	movl	156(%rsp), %edx
	movl	%edx, 28(%rcx)
	movq	$0, 24(%r14)
	cmpq	$0, 16(%r13)
	movl	64(%rsp), %eax          # 4-byte Reload
	movl	56(%rsp), %esi          # 4-byte Reload
	je	.LBB249_13
.LBB249_15:                             # %after_bb7
	cmpq	$0, 16(%r14)
	je	.LBB249_17
.LBB249_16:
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	cmpq	$0, 16(%r13)
	movl	$0, %edx
	je	.LBB249_19
.LBB249_20:                             # %_halide_buffer_is_bounds_query.exit75
	orb	%dl, %cl
	je	.LBB249_21
	jmp	.LBB249_2
.LBB249_17:                             # %land.rhs.i80
	cmpq	$0, (%r14)
	sete	%cl
	xorl	%ebx, %ebx
	cmpq	$0, 16(%r13)
	movl	$0, %edx
	jne	.LBB249_20
.LBB249_19:                             # %land.rhs.i74
	cmpq	$0, (%r13)
	sete	%dl
	orb	%dl, %cl
	jne	.LBB249_2
.LBB249_21:                             # %true_bb8
	movq	%r9, 328(%rsp)          # 8-byte Spill
	movl	%edi, 124(%rsp)         # 4-byte Spill
	movq	%r14, 216(%rsp)         # 8-byte Spill
	cmpl	$128, %r10d
	setl	%dil
	cmpl	$256, %r12d             # imm = 0x100
	setl	%dl
	xorl	%ecx, %ecx
	cmpl	$69633, %eax            # imm = 0x11001
	setne	%cl
	movq	%rcx, 320(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	cmpl	$2, %esi
	setne	%al
	movq	%rax, 312(%rsp)         # 8-byte Spill
	xorl	%eax, %eax
	cmpl	$69633, 88(%rsp)        # 4-byte Folded Reload
                                        # imm = 0x11001
	setne	%al
	movq	%rax, 304(%rsp)         # 8-byte Spill
	xorl	%r9d, %r9d
	cmpl	$2, 80(%rsp)            # 4-byte Folded Reload
	setne	%r9b
	shlq	$3, %r9
	movq	32(%rsp), %rax          # 8-byte Reload
	leal	(%r11,%rax), %esi
	addl	$256, %esi              # imm = 0x100
	leal	(%r12,%rax), %ecx
	movl	%ecx, 24(%rsp)          # 4-byte Spill
	cmpl	%ecx, %esi
	setg	%cl
	orb	%dl, %cl
	movzbl	%cl, %ecx
	shlq	$4, %rcx
	movq	%rcx, 296(%rsp)         # 8-byte Spill
	leal	(%r8,%r15), %ecx
	addl	$128, %ecx
	leal	(%r10,%r15), %edx
	movl	%edx, 120(%rsp)         # 4-byte Spill
	cmpl	%edx, %ecx
	setg	%cl
	orb	%dil, %cl
	movzbl	%cl, %edx
	shlq	$5, %rdx
	movq	104(%rsp), %rbx         # 8-byte Reload
	cmpl	%ebx, %eax
	setl	%cl
	leal	2(%r12,%rax), %edi
	movq	48(%rsp), %rsi          # 8-byte Reload
	leal	(%rsi,%rbx), %eax
	movl	%eax, 72(%rsp)          # 4-byte Spill
	cmpl	%eax, %edi
	setg	%bl
	orb	%cl, %bl
	movzbl	%bl, %edi
	shlq	$6, %rdi
	movq	%rsi, %rcx
	shrq	$24, %rcx
	andl	$-128, %ecx
	movq	112(%rsp), %rax         # 8-byte Reload
	cmpl	%r15d, %eax
	setg	%bl
	movq	%r15, 40(%rsp)          # 8-byte Spill
	leal	2(%r10,%r15), %r15d
	movq	208(%rsp), %rsi         # 8-byte Reload
	addl	%esi, %eax
	movl	%eax, 76(%rsp)          # 4-byte Spill
	cmpl	%eax, %r15d
	setg	%al
	orb	%bl, %al
	movzbl	%al, %r15d
	shlq	$8, %r15
	movq	%rsi, %rbx
	shrq	$22, %rbx
	andl	$512, %ebx              # imm = 0x200
	xorl	%eax, %eax
	cmpl	$1, 92(%rsp)            # 4-byte Folded Reload
	setne	%al
	shlq	$10, %rax
	xorl	%r14d, %r14d
	cmpl	$1, 84(%rsp)            # 4-byte Folded Reload
	setne	%r14b
	shlq	$11, %r14
	orq	%rdi, %r14
	orq	%rbx, %r14
	orq	%r15, %r14
	movq	320(%rsp), %rdi         # 8-byte Reload
	movq	312(%rsp), %rbx         # 8-byte Reload
	leaq	(%rdi,%rbx,2), %rdi
	orq	%rax, %rdi
	addq	296(%rsp), %rdi         # 8-byte Folded Reload
	movq	304(%rsp), %rax         # 8-byte Reload
	leaq	(%rdi,%rax,4), %rax
	orq	%r9, %rdx
	orq	%rcx, %rdx
	orq	%rax, %rdx
	movabsq	$-9223372036854775808, %rax # imm = 0x8000000000000000
	orq	%rax, %r14
	orq	%rdx, %r14
	xorl	%ecx, %ecx
	tzcntq	%r14, %rcx
	cmpl	$11, %ecx
	jbe	.LBB249_22
# %bb.23:                               # %no_errors_bb
	movslq	100(%rsp), %rax         # 4-byte Folded Reload
	movq	48(%rsp), %rbx          # 8-byte Reload
	movslq	%ebx, %r14
	movslq	%esi, %rdi
	imulq	%r10, %rax
	movq	%r10, 64(%rsp)          # 8-byte Spill
	movq	%r10, %rdx
	imulq	%r12, %rdx
	movq	%rdi, %r8
	imulq	%r14, %r8
	movq	%r12, %r9
	negq	%r9
	cmovlq	%r12, %r9
	xorl	%ecx, %ecx
	cmpq	$2147483647, %r9        # imm = 0x7FFFFFFF
	seta	%cl
	movq	%rax, %r10
	negq	%r10
	cmovlq	%rax, %r10
	xorl	%esi, %esi
	cmpq	$2147483647, %r10       # imm = 0x7FFFFFFF
	seta	%sil
	xorl	%r11d, %r11d
	cmpq	$2147483647, %rdx       # imm = 0x7FFFFFFF
	setg	%r11b
	movq	%r14, %r15
	negq	%r15
	testl	%ebx, %ebx
	movslq	96(%rsp), %rbx          # 4-byte Folded Reload
	cmovnsq	%r14, %r15
	xorl	%r14d, %r14d
	cmpq	$2147483647, %r15       # imm = 0x7FFFFFFF
	seta	%r14b
	imulq	%rdi, %rbx
	movq	%rbx, %rax
	negq	%rax
	cmovlq	%rbx, %rax
	leaq	(%rcx,%r11,4), %rcx
	xorl	%edi, %edi
	cmpq	$2147483647, %rax       # imm = 0x7FFFFFFF
	seta	%dil
	leaq	(%rcx,%rsi,2), %rcx
	shlq	$4, %rdi
	leaq	(%rcx,%r14,8), %rcx
	xorl	%esi, %esi
	cmpq	$2147483647, %r8        # imm = 0x7FFFFFFF
	setg	%sil
	shlq	$5, %rsi
	orq	%rsi, %rcx
	orq	%rdi, %rcx
	movabsq	$-9223372036854775808, %rsi # imm = 0x8000000000000000
	orq	%rsi, %rcx
	tzcntq	%rcx, %rcx
	cmpl	$5, %ecx
	jbe	.LBB249_24
# %bb.50:                               # %"produce blur_y"
	callq	halide_hexagon_device_interface@PLT
	xorl	%edi, %edi
	movq	216(%rsp), %r14         # 8-byte Reload
	movq	%r14, %rsi
	movq	%rax, %rdx
	callq	halide_copy_to_device@PLT
	testl	%eax, %eax
	jne	.LBB249_1
# %bb.51:                               # %"assert succeeded30"
	callq	halide_hexagon_device_interface@PLT
	xorl	%edi, %edi
	movq	%r13, %rsi
	movq	%rax, %rdx
	callq	halide_copy_to_device@PLT
	testl	%eax, %eax
	movq	40(%rsp), %r9           # 8-byte Reload
	movq	%r13, 56(%rsp)          # 8-byte Spill
	jne	.LBB249_1
# %bb.52:                               # %"assert succeeded32"
	movq	32(%rsp), %r11          # 8-byte Reload
	movl	%r11d, %esi
	movq	104(%rsp), %r8          # 8-byte Reload
	subl	%r8d, %esi
	setge	48(%rsp)                # 1-byte Folded Spill
	movl	%r9d, %edi
	movl	100(%rsp), %r10d        # 4-byte Reload
	imull	%r10d, %edi
	movl	%edi, %r15d
	negl	%r15d
	movq	328(%rsp), %rbx         # 8-byte Reload
	andl	$-128, %ebx
	leal	-128(%r12), %ecx
	cmpl	%ebx, %ecx
	cmovlel	%ecx, %ebx
	movq	112(%rsp), %rdx         # 8-byte Reload
	movl	%edx, %eax
	movl	96(%rsp), %r14d         # 4-byte Reload
	imull	%r14d, %eax
	leal	(%rbx,%r11), %ecx
	addl	$130, %ecx
                                        # kill: def $ebx killed $ebx killed $rbx
	addl	$130, %ebx
	cmpl	72(%rsp), %ecx          # 4-byte Folded Reload
	setle	%r11b
	movl	24(%rsp), %r13d         # 4-byte Reload
	subl	%r8d, %r13d
	subl	%eax, %r13d
	subl	%eax, %esi
	movl	124(%rsp), %ecx         # 4-byte Reload
	subl	%edi, %ecx
	movl	%r12d, 224(%rsp)
	movq	64(%rsp), %rax          # 8-byte Reload
	movl	%eax, 228(%rsp)
	movl	%r9d, 232(%rsp)
	movl	%r10d, 236(%rsp)
	movl	%r14d, 240(%rsp)
	addl	$127, %eax
	sarl	$7, %eax
	movl	%eax, 244(%rsp)
	subl	$-128, %edx
	movl	%edx, 248(%rsp)
	movl	76(%rsp), %eax          # 4-byte Reload
	movl	%eax, 252(%rsp)
	movl	%esi, 256(%rsp)
	movl	%ebx, 260(%rsp)
	movl	%r12d, %eax
	sarl	$7, %eax
	movl	%eax, 264(%rsp)
	movl	%r13d, 268(%rsp)
	movl	%r12d, %eax
	sarl	$8, %eax
	movl	%eax, 272(%rsp)
	movl	%r15d, 276(%rsp)
	movl	%ecx, 280(%rsp)
	movq	216(%rsp), %r14         # 8-byte Reload
	movq	(%r14), %rax
	movq	%rax, 352(%rsp)
	movq	16(%r14), %rax
	movq	%rax, 360(%rsp)
	andb	48(%rsp), %r11b         # 1-byte Folded Reload
	testb	$127, %r12b
	setne	22(%rsp)
	testb	%r12b, %r12b
	movq	56(%rsp), %rcx          # 8-byte Reload
	movq	(%rcx), %rax
	movq	%rax, 368(%rsp)
	movq	16(%rcx), %rax
	movq	%rax, 376(%rsp)
	movq	$0, 384(%rsp)
	leaq	224(%rsp), %rax
	movq	%rax, 392(%rsp)
	movq	336(%rsp), %rax         # 8-byte Reload
	movq	%rax, 344(%rsp)
	vmovaps	.LCPI249_0(%rip), %ymm0 # ymm0 = [8,8,60,8]
	vmovups	%ymm0, 488(%rsp)
	vmovaps	.LCPI249_1(%rip), %ymm0 # ymm0 = [1,1,1,0]
	vmovups	%ymm0, 520(%rsp)
	movb	%r11b, 21(%rsp)
	leaq	352(%rsp), %rax
	movq	%rax, 400(%rsp)
	leaq	368(%rsp), %rax
	movq	%rax, 408(%rsp)
	leaq	384(%rsp), %rax
	movq	%rax, 416(%rsp)
	leaq	344(%rsp), %rax
	movq	%rax, 424(%rsp)
	leaq	21(%rsp), %rax
	movq	%rax, 432(%rsp)
	leaq	22(%rsp), %rax
	movq	%rax, 440(%rsp)
	leaq	23(%rsp), %rax
	movq	%rax, 448(%rsp)
	movabsq	$4294967298, %rax       # imm = 0x100000002
	movq	%rax, 460(%rsp)
	movq	.Lhexagon_module_state_buf.data(%rip), %rsi
	setne	23(%rsp)
	movl	$1, 468(%rsp)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%xmm0, 472(%rsp)
	leaq	460(%rsp), %rax
	movq	%rax, (%rsp)
	leaq	.Lstr.256(%rip), %rdx
	leaq	.Loffload_rpc.blur_y.s0.__outermost_buf.data(%rip), %rcx
	xorl	%ebx, %ebx
	leaq	488(%rsp), %r8
	leaq	400(%rsp), %r9
	xorl	%edi, %edi
	vzeroupper
	callq	halide_hexagon_run@PLT
	testl	%eax, %eax
	jne	.LBB249_1
# %bb.53:                               # %"assert succeeded34"
	orb	$2, 24(%r14)
.LBB249_2:                              # %destructor_block
	movl	%ebx, %eax
.LBB249_3:                              # %destructor_block
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB249_1:
	movl	%eax, %ebx
	jmp	.LBB249_2
.LBB249_5:                              # %"assert failed1"
	leaq	.Lstr(%rip), %rsi
	jmp	.LBB249_6
.LBB249_8:                              # %"assert failed3"
	leaq	.Lstr.250(%rip), %rsi
.LBB249_6:                              # %"assert failed1"
	xorl	%edi, %edi
	callq	halide_error_buffer_argument_is_null@PLT
	jmp	.LBB249_3
.LBB249_22:                             # %true_bb8
	movl	120(%rsp), %edx         # 4-byte Reload
	leaq	.LJTI249_0(%rip), %rax
	movslq	(%rax,%rcx,4), %rcx
	addq	%rax, %rcx
	jmpq	*%rcx
.LBB249_25:                             # %assert_failed
	leaq	.Lstr.251(%rip), %rsi
	xorl	%edi, %edi
	movl	64(%rsp), %edx          # 4-byte Reload
	jmp	.LBB249_26
.LBB249_24:                             # %no_errors_bb
	leaq	.LJTI249_1(%rip), %rsi
	movslq	(%rsi,%rcx,4), %rcx
	addq	%rsi, %rcx
	jmpq	*%rcx
.LBB249_42:                             # %assert_failed23
	leaq	.Lstr.250(%rip), %rsi
	movl	$2147483647, %ecx       # imm = 0x7FFFFFFF
	xorl	%edi, %edi
	movq	%r9, %rdx
	callq	halide_error_buffer_allocation_too_large@PLT
	jmp	.LBB249_3
.LBB249_44:                             # %assert_failed24
	leaq	.Lstr.250(%rip), %rsi
	movl	$2147483647, %ecx       # imm = 0x7FFFFFFF
	xorl	%edi, %edi
	movq	%r10, %rdx
	callq	halide_error_buffer_allocation_too_large@PLT
	jmp	.LBB249_3
.LBB249_45:                             # %assert_failed25
	leaq	.Lstr.250(%rip), %rsi
	movl	$2147483647, %ecx       # imm = 0x7FFFFFFF
	xorl	%edi, %edi
	callq	halide_error_buffer_extents_too_large@PLT
	jmp	.LBB249_3
.LBB249_47:                             # %assert_failed26
	leaq	.Lstr(%rip), %rsi
	movl	$2147483647, %ecx       # imm = 0x7FFFFFFF
	xorl	%edi, %edi
	movq	%r15, %rdx
	callq	halide_error_buffer_allocation_too_large@PLT
	jmp	.LBB249_3
.LBB249_48:                             # %assert_failed27
	leaq	.Lstr(%rip), %rsi
	movl	$2147483647, %ecx       # imm = 0x7FFFFFFF
	xorl	%edi, %edi
	movq	%rax, %rdx
	callq	halide_error_buffer_allocation_too_large@PLT
	jmp	.LBB249_3
.LBB249_49:                             # %assert_failed28
	leaq	.Lstr(%rip), %rsi
	movl	$2147483647, %ecx       # imm = 0x7FFFFFFF
	xorl	%edi, %edi
	movq	%r8, %rdx
	callq	halide_error_buffer_extents_too_large@PLT
	jmp	.LBB249_3
.LBB249_27:                             # %assert_failed11
	leaq	.Lstr.251(%rip), %rsi
	xorl	%edi, %edi
	movl	56(%rsp), %edx          # 4-byte Reload
	jmp	.LBB249_28
.LBB249_29:                             # %assert_failed12
	leaq	.Lstr.252(%rip), %rsi
	xorl	%edi, %edi
	movl	88(%rsp), %edx          # 4-byte Reload
.LBB249_26:                             # %assert_failed
	movl	$69633, %ecx            # imm = 0x11001
	callq	halide_error_bad_type@PLT
	jmp	.LBB249_3
.LBB249_30:                             # %assert_failed13
	leaq	.Lstr.252(%rip), %rsi
	xorl	%edi, %edi
	movl	80(%rsp), %edx          # 4-byte Reload
.LBB249_28:                             # %assert_failed11
	movl	$2, %ecx
	callq	halide_error_bad_dimensions@PLT
	jmp	.LBB249_3
.LBB249_31:                             # %assert_failed14
	movq	32(%rsp), %r9           # 8-byte Reload
	addl	%r9d, %r11d
	movq	200(%rsp), %rax         # 8-byte Reload
	leal	(%r9,%rax), %ecx
	addl	$-256, %ecx
	addl	$255, %r11d
	movl	24(%rsp), %eax          # 4-byte Reload
	decl	%eax
	movl	%eax, (%rsp)
	leaq	.Lstr.251(%rip), %rsi
	xorl	%edi, %edi
	xorl	%edx, %edx
	movl	%r11d, %r8d
                                        # kill: def $r9d killed $r9d killed $r9
	callq	halide_error_access_out_of_bounds@PLT
	jmp	.LBB249_3
.LBB249_32:                             # %assert_failed15
	movq	40(%rsp), %r9           # 8-byte Reload
	addl	%r9d, %r8d
	movq	192(%rsp), %rax         # 8-byte Reload
	leal	(%r9,%rax), %ecx
	addl	$-128, %ecx
	addl	$127, %r8d
	decl	%edx
	movl	%edx, (%rsp)
	leaq	.Lstr.251(%rip), %rsi
	xorl	%edi, %edi
	movl	$1, %edx
                                        # kill: def $r8d killed $r8d killed $r8
                                        # kill: def $r9d killed $r9d killed $r9
	callq	halide_error_access_out_of_bounds@PLT
	jmp	.LBB249_3
.LBB249_34:                             # %assert_failed16
	movl	24(%rsp), %r8d          # 4-byte Reload
	incl	%r8d
	movl	72(%rsp), %eax          # 4-byte Reload
	decl	%eax
	movl	%eax, (%rsp)
	leaq	.Lstr.252(%rip), %rsi
	xorl	%edi, %edi
	xorl	%edx, %edx
	movq	32(%rsp), %rcx          # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx
	movq	104(%rsp), %r9          # 8-byte Reload
                                        # kill: def $r9d killed $r9d killed $r9
	callq	halide_error_access_out_of_bounds@PLT
	jmp	.LBB249_3
.LBB249_35:                             # %assert_failed17
	leaq	.Lstr.252(%rip), %rsi
	xorl	%edi, %edi
	xorl	%edx, %edx
	movq	48(%rsp), %rcx          # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx
	callq	halide_error_buffer_extents_negative@PLT
	jmp	.LBB249_3
.LBB249_37:                             # %assert_failed18
	movl	%edx, %r8d
	incl	%r8d
	movl	76(%rsp), %eax          # 4-byte Reload
	decl	%eax
	movl	%eax, (%rsp)
	leaq	.Lstr.252(%rip), %rsi
	xorl	%edi, %edi
	movl	$1, %edx
	movq	40(%rsp), %rcx          # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx
	movq	112(%rsp), %r9          # 8-byte Reload
                                        # kill: def $r9d killed $r9d killed $r9
	callq	halide_error_access_out_of_bounds@PLT
	jmp	.LBB249_3
.LBB249_38:                             # %assert_failed19
	leaq	.Lstr.252(%rip), %rsi
	xorl	%edi, %edi
	movl	$1, %edx
	movq	208(%rsp), %rcx         # 8-byte Reload
                                        # kill: def $ecx killed $ecx killed $rcx
	callq	halide_error_buffer_extents_negative@PLT
	jmp	.LBB249_3
.LBB249_39:                             # %assert_failed20
	leaq	.Lstr.253(%rip), %rsi
	leaq	.Lstr.254(%rip), %rcx
	xorl	%edi, %edi
	movl	92(%rsp), %edx          # 4-byte Reload
	jmp	.LBB249_40
.LBB249_41:                             # %assert_failed21
	leaq	.Lstr.255(%rip), %rsi
	leaq	.Lstr.254(%rip), %rcx
	xorl	%edi, %edi
	movl	84(%rsp), %edx          # 4-byte Reload
.LBB249_40:                             # %assert_failed20
	movl	$1, %r8d
	callq	halide_error_constraint_violated@PLT
	jmp	.LBB249_3
.Lfunc_end249:
	.size	halide_blur, .Lfunc_end249-halide_blur
	.section	.rodata.halide_blur,"a",@progbits
	.p2align	2
.LJTI249_0:
	.long	.LBB249_25-.LJTI249_0
	.long	.LBB249_27-.LJTI249_0
	.long	.LBB249_29-.LJTI249_0
	.long	.LBB249_30-.LJTI249_0
	.long	.LBB249_31-.LJTI249_0
	.long	.LBB249_32-.LJTI249_0
	.long	.LBB249_34-.LJTI249_0
	.long	.LBB249_35-.LJTI249_0
	.long	.LBB249_37-.LJTI249_0
	.long	.LBB249_38-.LJTI249_0
	.long	.LBB249_39-.LJTI249_0
	.long	.LBB249_41-.LJTI249_0
.LJTI249_1:
	.long	.LBB249_42-.LJTI249_1
	.long	.LBB249_44-.LJTI249_1
	.long	.LBB249_45-.LJTI249_1
	.long	.LBB249_47-.LJTI249_1
	.long	.LBB249_48-.LJTI249_1
	.long	.LBB249_49-.LJTI249_1
                                        # -- End function
	.section	.text.halide_blur_argv,"ax",@progbits
	.globl	halide_blur_argv        # -- Begin function halide_blur_argv
	.p2align	4, 0x90
	.type	halide_blur_argv,@function
halide_blur_argv:                       # @halide_blur_argv
# %bb.0:                                # %entry
	movq	(%rdi), %rax
	movq	8(%rdi), %rsi
	movq	%rax, %rdi
	jmp	halide_blur@PLT         # TAILCALL
.Lfunc_end250:
	.size	halide_blur_argv, .Lfunc_end250-halide_blur_argv
                                        # -- End function
	.section	.text.halide_blur_metadata,"ax",@progbits
	.globl	halide_blur_metadata    # -- Begin function halide_blur_metadata
	.p2align	4, 0x90
	.type	halide_blur_metadata,@function
halide_blur_metadata:                   # @halide_blur_metadata
# %bb.0:                                # %entry
	leaq	.Lhalide_blur_metadata_storage(%rip), %rax
	retq
.Lfunc_end251:
	.size	halide_blur_metadata, .Lfunc_end251-halide_blur_metadata
                                        # -- End function
	.type	_ZN6Halide7Runtime8Internal13custom_mallocE,@object # @_ZN6Halide7Runtime8Internal13custom_mallocE
	.data
	.weak	_ZN6Halide7Runtime8Internal13custom_mallocE
	.p2align	3
_ZN6Halide7Runtime8Internal13custom_mallocE:
	.quad	halide_default_malloc
	.size	_ZN6Halide7Runtime8Internal13custom_mallocE, 8

	.type	_ZN6Halide7Runtime8Internal11custom_freeE,@object # @_ZN6Halide7Runtime8Internal11custom_freeE
	.weak	_ZN6Halide7Runtime8Internal11custom_freeE
	.p2align	3
_ZN6Halide7Runtime8Internal11custom_freeE:
	.quad	halide_default_free
	.size	_ZN6Halide7Runtime8Internal11custom_freeE, 8

	.type	_ZN6Halide7Runtime8Internal13error_handlerE,@object # @_ZN6Halide7Runtime8Internal13error_handlerE
	.weak	_ZN6Halide7Runtime8Internal13error_handlerE
	.p2align	3
_ZN6Halide7Runtime8Internal13error_handlerE:
	.quad	halide_default_error
	.size	_ZN6Halide7Runtime8Internal13error_handlerE, 8

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Error: "
	.size	.L.str, 8

	.type	_ZN6Halide7Runtime8Internal12custom_printE,@object # @_ZN6Halide7Runtime8Internal12custom_printE
	.data
	.weak	_ZN6Halide7Runtime8Internal12custom_printE
	.p2align	3
_ZN6Halide7Runtime8Internal12custom_printE:
	.quad	halide_default_print
	.size	_ZN6Halide7Runtime8Internal12custom_printE, 8

	.type	halide_reference_clock_inited,@object # @halide_reference_clock_inited
	.bss
	.weak	halide_reference_clock_inited
halide_reference_clock_inited:
	.byte	0                       # 0x0
	.size	halide_reference_clock_inited, 1

	.type	halide_reference_clock,@object # @halide_reference_clock
	.weak	halide_reference_clock
	.p2align	3
halide_reference_clock:
	.zero	16
	.size	halide_reference_clock, 16

	.type	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE,@object # @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
	.weak	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
_ZN6Halide7Runtime8Internal15Synchronization13table_storageE:
	.zero	24576
	.size	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE, 24576

	.type	_ZN6Halide7Runtime8Internal10work_queueE,@object # @_ZN6Halide7Runtime8Internal10work_queueE
	.weak	_ZN6Halide7Runtime8Internal10work_queueE
	.p2align	3
_ZN6Halide7Runtime8Internal10work_queueE:
	.zero	8
	.long	0                       # 0x0
	.long	0                       # 0x0
	.quad	0
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	0                       # 0x0
	.zero	4
	.zero	8
	.zero	8
	.zero	8
	.long	0                       # 0x0
	.long	0                       # 0x0
	.zero	2048
	.byte	0                       # 0x0
	.byte	0                       # 0x0
	.zero	2
	.long	0                       # 0x0
	.size	_ZN6Halide7Runtime8Internal10work_queueE, 2128

	.type	_ZN6Halide7Runtime8Internal14custom_do_taskE,@object # @_ZN6Halide7Runtime8Internal14custom_do_taskE
	.data
	.weak	_ZN6Halide7Runtime8Internal14custom_do_taskE
	.p2align	3
_ZN6Halide7Runtime8Internal14custom_do_taskE:
	.quad	halide_default_do_task
	.size	_ZN6Halide7Runtime8Internal14custom_do_taskE, 8

	.type	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE,@object # @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.weak	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.p2align	3
_ZN6Halide7Runtime8Internal19custom_do_loop_taskE:
	.quad	halide_default_do_loop_task
	.size	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, 8

	.type	_ZN6Halide7Runtime8Internal17custom_do_par_forE,@object # @_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.weak	_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.p2align	3
_ZN6Halide7Runtime8Internal17custom_do_par_forE:
	.quad	halide_default_do_par_for
	.size	_ZN6Halide7Runtime8Internal17custom_do_par_forE, 8

	.type	.L.str.5,@object        # @.str.5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.5:
	.asciz	"/home/jason/code/Halide/src/runtime/synchronization_common.h:381 Assert failed: next != NULL\n"
	.size	.L.str.5, 94

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"/home/jason/code/Halide/src/runtime/synchronization_common.h:1096 Assert failed: val & 0x1\n"
	.size	.L.str.6, 92

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"/home/jason/code/Halide/src/runtime/thread_pool_common.h:151 Assert failed: bytes == limit && \"Logic error in thread pool work queue initialization.\\n\"\n"
	.size	.L.str.7, 153

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"/home/jason/code/Halide/src/runtime/thread_pool_common.h:498 Assert failed: (min_threads <= ((task_parent->task.min_threads * task_parent->active_workers) - task_parent->threads_reserved)) && \"Logic error: thread over commit.\\n\"\n"
	.size	.L.str.3, 230

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"HL_NUM_THREADS"
	.size	.L.str.1, 15

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"HL_NUMTHREADS"
	.size	.L.str.2, 14

	.type	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE,@object # @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.data
	.weak	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.p2align	3
_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE:
	.quad	halide_default_do_parallel_tasks
	.size	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, 8

	.type	_ZN6Halide7Runtime8Internal21custom_semaphore_initE,@object # @_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.weak	_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.p2align	3
_ZN6Halide7Runtime8Internal21custom_semaphore_initE:
	.quad	halide_default_semaphore_init
	.size	_ZN6Halide7Runtime8Internal21custom_semaphore_initE, 8

	.type	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE,@object # @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.weak	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.p2align	3
_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE:
	.quad	halide_default_semaphore_try_acquire
	.size	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, 8

	.type	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE,@object # @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.weak	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.p2align	3
_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE:
	.quad	halide_default_semaphore_release
	.size	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, 8

	.section	.fini_array,"aw",@fini_array
	.p2align	3
	.quad	halide_thread_pool_cleanup
	.quad	halide_trace_cleanup
	.quad	halide_cache_cleanup
	.quad	halide_profiler_shutdown
	.quad	halide_hexagon_cleanup
	.type	.L.str.4,@object        # @.str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4:
	.asciz	"halide_set_num_threads: must be >= 0."
	.size	.L.str.4, 38

	.type	_ZN6Halide7Runtime8Internal17custom_get_symbolE,@object # @_ZN6Halide7Runtime8Internal17custom_get_symbolE
	.data
	.weak	_ZN6Halide7Runtime8Internal17custom_get_symbolE
	.p2align	3
_ZN6Halide7Runtime8Internal17custom_get_symbolE:
	.quad	halide_default_get_symbol
	.size	_ZN6Halide7Runtime8Internal17custom_get_symbolE, 8

	.type	_ZN6Halide7Runtime8Internal19custom_load_libraryE,@object # @_ZN6Halide7Runtime8Internal19custom_load_libraryE
	.weak	_ZN6Halide7Runtime8Internal19custom_load_libraryE
	.p2align	3
_ZN6Halide7Runtime8Internal19custom_load_libraryE:
	.quad	halide_default_load_library
	.size	_ZN6Halide7Runtime8Internal19custom_load_libraryE, 8

	.type	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE,@object # @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	.weak	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	.p2align	3
_ZN6Halide7Runtime8Internal25custom_get_library_symbolE:
	.quad	halide_default_get_library_symbol
	.size	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, 8

	.type	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE,@object # @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	.bss
	.weak	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	.p2align	2
_ZN6Halide7Runtime8Internal17halide_gpu_deviceE:
	.long	0                       # 0x0
	.size	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, 4

	.type	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE,@object # @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
	.weak	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
	.p2align	2
_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE:
	.long	0                       # 0x0
	.size	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE, 4

	.type	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE,@object # @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
	.weak	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE:
	.byte	0                       # 0x0
	.size	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, 1

	.type	.L.str.8,@object        # @.str.8
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.8:
	.asciz	"HL_GPU_DEVICE"
	.size	.L.str.8, 14

	.type	_ZN6Halide7Runtime8Internal19halide_trace_bufferE,@object # @_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	.bss
	.weak	_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	.p2align	3
_ZN6Halide7Runtime8Internal19halide_trace_bufferE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal19halide_trace_bufferE, 8

	.type	_ZN6Halide7Runtime8Internal17halide_trace_fileE,@object # @_ZN6Halide7Runtime8Internal17halide_trace_fileE
	.data
	.weak	_ZN6Halide7Runtime8Internal17halide_trace_fileE
	.p2align	2
_ZN6Halide7Runtime8Internal17halide_trace_fileE:
	.long	4294967295              # 0xffffffff
	.size	_ZN6Halide7Runtime8Internal17halide_trace_fileE, 4

	.type	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE,@object # @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE
	.p2align	2
_ZN6Halide7Runtime8Internal22halide_trace_file_lockE:
	.long	0                       # 0x0
	.size	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE, 4

	.type	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE,@object # @_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE
	.weak	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE
_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE:
	.byte	0                       # 0x0
	.size	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE, 1

	.type	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE,@object # @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE
	.weak	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE
	.p2align	3
_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, 8

	.type	_ZN6Halide7Runtime8Internal19halide_custom_traceE,@object # @_ZN6Halide7Runtime8Internal19halide_custom_traceE
	.data
	.weak	_ZN6Halide7Runtime8Internal19halide_custom_traceE
	.p2align	3
_ZN6Halide7Runtime8Internal19halide_custom_traceE:
	.quad	halide_default_trace
	.size	_ZN6Halide7Runtime8Internal19halide_custom_traceE, 8

	.type	_ZZ20halide_default_traceE3ids,@object # @_ZZ20halide_default_traceE3ids
	.p2align	2
_ZZ20halide_default_traceE3ids:
	.long	1                       # 0x1
	.size	_ZZ20halide_default_traceE3ids, 4

	.type	.L.str.32,@object       # @.str.32
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.32:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:115 Assert failed: success && \"Could not write to trace file\"\n"
	.size	.L.str.32, 111

	.type	.L.str.31,@object       # @.str.31
.L.str.31:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:86 Assert failed: size <= buffer_size\n"
	.size	.L.str.31, 87

	.type	.L.str.2.11,@object     # @.str.2.11
.L.str.2.11:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:215 Assert failed: print_bits <= 64 && \"Tracing bad type\"\n"
	.size	.L.str.2.11, 107

	.type	.L__const.halide_default_trace.event_types,@object # @__const.halide_default_trace.event_types
	.section	.data.rel.ro,"aw",@progbits
	.p2align	3
.L__const.halide_default_trace.event_types:
	.quad	.L.str.3.12
	.quad	.L.str.4.13
	.quad	.L.str.5.14
	.quad	.L.str.6.15
	.quad	.L.str.7.16
	.quad	.L.str.8.17
	.quad	.L.str.9.18
	.quad	.L.str.10
	.quad	.L.str.11
	.quad	.L.str.12
	.quad	.L.str.13
	.size	.L__const.halide_default_trace.event_types, 88

	.type	.L.str.17,@object       # @.str.17
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.17:
	.asciz	"<"
	.size	.L.str.17, 2

	.type	.L.str.20,@object       # @.str.20
.L.str.20:
	.asciz	">)"
	.size	.L.str.20, 3

	.type	.L.str.18,@object       # @.str.18
.L.str.18:
	.asciz	">, <"
	.size	.L.str.18, 5

	.type	.L.str.22,@object       # @.str.22
.L.str.22:
	.asciz	" = <"
	.size	.L.str.22, 5

	.type	.L.str.23,@object       # @.str.23
.L.str.23:
	.asciz	" = "
	.size	.L.str.23, 4

	.type	.L.str.24,@object       # @.str.24
.L.str.24:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:284 Assert failed: print_bits >= 16 && \"Tracing a bad type\"\n"
	.size	.L.str.24, 109

	.type	.L.str.25,@object       # @.str.25
.L.str.25:
	.asciz	">"
	.size	.L.str.25, 2

	.type	.L.str.26,@object       # @.str.26
.L.str.26:
	.asciz	" tag = \""
	.size	.L.str.26, 9

	.type	.L.str.27,@object       # @.str.27
.L.str.27:
	.asciz	"\""
	.size	.L.str.27, 2

	.type	.L.str.3.12,@object     # @.str.3.12
.L.str.3.12:
	.asciz	"Load"
	.size	.L.str.3.12, 5

	.type	.L.str.4.13,@object     # @.str.4.13
.L.str.4.13:
	.asciz	"Store"
	.size	.L.str.4.13, 6

	.type	.L.str.5.14,@object     # @.str.5.14
.L.str.5.14:
	.asciz	"Begin realization"
	.size	.L.str.5.14, 18

	.type	.L.str.6.15,@object     # @.str.6.15
.L.str.6.15:
	.asciz	"End realization"
	.size	.L.str.6.15, 16

	.type	.L.str.7.16,@object     # @.str.7.16
.L.str.7.16:
	.asciz	"Produce"
	.size	.L.str.7.16, 8

	.type	.L.str.8.17,@object     # @.str.8.17
.L.str.8.17:
	.asciz	"End produce"
	.size	.L.str.8.17, 12

	.type	.L.str.9.18,@object     # @.str.9.18
.L.str.9.18:
	.asciz	"Consume"
	.size	.L.str.9.18, 8

	.type	.L.str.10,@object       # @.str.10
.L.str.10:
	.asciz	"End consume"
	.size	.L.str.10, 12

	.type	.L.str.11,@object       # @.str.11
.L.str.11:
	.asciz	"Begin pipeline"
	.size	.L.str.11, 15

	.type	.L.str.12,@object       # @.str.12
.L.str.12:
	.asciz	"End pipeline"
	.size	.L.str.12, 13

	.type	.L.str.13,@object       # @.str.13
.L.str.13:
	.asciz	"Tag"
	.size	.L.str.13, 4

	.type	.L.str.28,@object       # @.str.28
.L.str.28:
	.asciz	"HL_TRACE_FILE"
	.size	.L.str.28, 14

	.type	.L.str.29,@object       # @.str.29
.L.str.29:
	.asciz	"ab"
	.size	.L.str.29, 3

	.type	.L.str.30,@object       # @.str.30
.L.str.30:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:345 Assert failed: file && \"Failed to open trace file\\n\"\n"
	.size	.L.str.30, 106

	.type	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE,@object # @_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE
	.data
	.weak	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE
	.p2align	1
_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE:
	.short	3                       # 0x3
	.short	3                       # 0x3
	.short	1                       # 0x1
	.short	2                       # 0x2
	.short	1                       # 0x1
	.short	2                       # 0x2
	.short	1                       # 0x1
	.short	2                       # 0x2
	.short	1                       # 0x1
	.short	2                       # 0x2
	.size	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE, 20

	.type	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE,@object # @_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE
	.weak	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE
_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE:
	.ascii	"\007\006\t\b\013\n\r\f\017\016"
	.size	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE, 10

	.type	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE,@object # @_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE
	.weak	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE
_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE:
	.ascii	"\007\t\002\001\004\003\006\005\r\f"
	.size	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE, 10

	.type	.L.str.35,@object       # @.str.35
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.35:
	.asciz	"Bounds query buffer passed to halide_debug_to_file"
	.size	.L.str.35, 51

	.type	.L.str.1.36,@object     # @.str.1.36
.L.str.1.36:
	.asciz	"Can't debug_to_file a Func with more than four dimensions\n"
	.size	.L.str.1.36, 59

	.type	.L.str.2.37,@object     # @.str.2.37
.L.str.2.37:
	.asciz	"wb"
	.size	.L.str.2.37, 3

	.type	.L.str.3.38,@object     # @.str.3.38
.L.str.3.38:
	.asciz	".tiff"
	.size	.L.str.3.38, 6

	.type	.L.str.4.39,@object     # @.str.4.39
.L.str.4.39:
	.asciz	".tif"
	.size	.L.str.4.39, 5

	.type	.L.str.5.40,@object     # @.str.5.40
.L.str.5.40:
	.asciz	".mat"
	.size	.L.str.5.40, 5

	.type	.L__const.halide_debug_to_file.header,@object # @__const.halide_debug_to_file.header
	.section	.rodata,"a",@progbits
.L__const.halide_debug_to_file.header:
	.asciz	"MATLAB 5.0 MAT-file, produced by Halide                                                                                     \000\001IM"
	.size	.L__const.halide_debug_to_file.header, 129

	.type	.L.str.6.41,@object     # @.str.6.41
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6.41:
	.asciz	"Can't debug_to_file to a .mat file greater than 4GB\n"
	.size	.L.str.6.41, 53

	.type	.L.str.7.42,@object     # @.str.7.42
.L.str.7.42:
	.asciz	"Unexpectedly large final_padding_bytes"
	.size	.L.str.7.42, 39

	.type	_ZN6Halide7Runtime8Internal16memoization_lockE,@object # @_ZN6Halide7Runtime8Internal16memoization_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal16memoization_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal16memoization_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal16memoization_lockE, 8

	.type	_ZN6Halide7Runtime8Internal13cache_entriesE,@object # @_ZN6Halide7Runtime8Internal13cache_entriesE
	.weak	_ZN6Halide7Runtime8Internal13cache_entriesE
	.p2align	3
_ZN6Halide7Runtime8Internal13cache_entriesE:
	.zero	2048
	.size	_ZN6Halide7Runtime8Internal13cache_entriesE, 2048

	.type	_ZN6Halide7Runtime8Internal18most_recently_usedE,@object # @_ZN6Halide7Runtime8Internal18most_recently_usedE
	.weak	_ZN6Halide7Runtime8Internal18most_recently_usedE
	.p2align	3
_ZN6Halide7Runtime8Internal18most_recently_usedE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal18most_recently_usedE, 8

	.type	_ZN6Halide7Runtime8Internal19least_recently_usedE,@object # @_ZN6Halide7Runtime8Internal19least_recently_usedE
	.weak	_ZN6Halide7Runtime8Internal19least_recently_usedE
	.p2align	3
_ZN6Halide7Runtime8Internal19least_recently_usedE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal19least_recently_usedE, 8

	.type	_ZN6Halide7Runtime8Internal14max_cache_sizeE,@object # @_ZN6Halide7Runtime8Internal14max_cache_sizeE
	.data
	.weak	_ZN6Halide7Runtime8Internal14max_cache_sizeE
	.p2align	3
_ZN6Halide7Runtime8Internal14max_cache_sizeE:
	.quad	1048576                 # 0x100000
	.size	_ZN6Halide7Runtime8Internal14max_cache_sizeE, 8

	.type	_ZN6Halide7Runtime8Internal18current_cache_sizeE,@object # @_ZN6Halide7Runtime8Internal18current_cache_sizeE
	.bss
	.weak	_ZN6Halide7Runtime8Internal18current_cache_sizeE
	.p2align	3
_ZN6Halide7Runtime8Internal18current_cache_sizeE:
	.quad	0                       # 0x0
	.size	_ZN6Halide7Runtime8Internal18current_cache_sizeE, 8

	.type	.L.str.4.44,@object     # @.str.4.44
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4.44:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:273 Assert failed: prev_hash_entry != NULL\n"
	.size	.L.str.4.44, 90

	.type	.L.str.5.45,@object     # @.str.5.45
.L.str.5.45:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:360 Assert failed: entry->more_recent != NULL\n"
	.size	.L.str.5.45, 93

	.type	.L.str.6.46,@object     # @.str.6.46
.L.str.6.46:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:364 Assert failed: least_recently_used == entry\n"
	.size	.L.str.6.46, 95

	.type	.L.str.7.47,@object     # @.str.7.47
.L.str.7.47:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:367 Assert failed: entry->more_recent != NULL\n"
	.size	.L.str.7.47, 93

	.type	.L.str.9.48,@object     # @.str.9.48
.L.str.9.48:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:458 Assert failed: no_host_pointers_equal\n"
	.size	.L.str.9.48, 89

	.type	.L.str.12.49,@object    # @.str.12.49
.L.str.12.49:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:536 Assert failed: entry->in_use_count > 0\n"
	.size	.L.str.12.49, 90

	.type	.L.str.58,@object       # @.str.58
.L.str.58:
	.asciz	"-nan"
	.size	.L.str.58, 5

	.type	.L.str.1.59,@object     # @.str.1.59
.L.str.1.59:
	.asciz	"nan"
	.size	.L.str.1.59, 4

	.type	.L.str.2.60,@object     # @.str.2.60
.L.str.2.60:
	.asciz	"-inf"
	.size	.L.str.2.60, 5

	.type	.L.str.3.61,@object     # @.str.3.61
.L.str.3.61:
	.asciz	"inf"
	.size	.L.str.3.61, 4

	.type	.L.str.4.62,@object     # @.str.4.62
.L.str.4.62:
	.asciz	"-0.000000e+00"
	.size	.L.str.4.62, 14

	.type	.L.str.5.63,@object     # @.str.5.63
.L.str.5.63:
	.asciz	"0.000000e+00"
	.size	.L.str.5.63, 13

	.type	.L.str.6.64,@object     # @.str.6.64
.L.str.6.64:
	.asciz	"-0.000000"
	.size	.L.str.6.64, 10

	.type	.L.str.7.65,@object     # @.str.7.65
.L.str.7.65:
	.asciz	"0.000000"
	.size	.L.str.7.65, 9

	.type	.L.str.8.66,@object     # @.str.8.66
.L.str.8.66:
	.asciz	"-"
	.size	.L.str.8.66, 2

	.type	.L.str.10.68,@object    # @.str.10.68
.L.str.10.68:
	.asciz	"e+"
	.size	.L.str.10.68, 3

	.type	.L.str.11.69,@object    # @.str.11.69
.L.str.11.69:
	.asciz	"e-"
	.size	.L.str.11.69, 3

	.type	.L.str.12.72,@object    # @.str.12.72
.L.str.12.72:
	.asciz	"0123456789abcdef"
	.size	.L.str.12.72, 17

	.type	.L.str.17.73,@object    # @.str.17.73
.L.str.17.73:
	.asciz	"bad_type_code"
	.size	.L.str.17.73, 14

	.type	.L.str.16.74,@object    # @.str.16.74
.L.str.16.74:
	.asciz	"handle"
	.size	.L.str.16.74, 7

	.type	.L.str.15.75,@object    # @.str.15.75
.L.str.15.75:
	.asciz	"float"
	.size	.L.str.15.75, 6

	.type	.L.str.14.76,@object    # @.str.14.76
.L.str.14.76:
	.asciz	"uint"
	.size	.L.str.14.76, 5

	.type	.L.str.13.77,@object    # @.str.13.77
.L.str.13.77:
	.asciz	"int"
	.size	.L.str.13.77, 4

	.type	.L.str.18.78,@object    # @.str.18.78
.L.str.18.78:
	.asciz	"x"
	.size	.L.str.18.78, 2

	.type	.L.str.19.79,@object    # @.str.19.79
.L.str.19.79:
	.asciz	"NULL"
	.size	.L.str.19.79, 5

	.type	.L.str.20.80,@object    # @.str.20.80
.L.str.20.80:
	.asciz	"buffer("
	.size	.L.str.20.80, 8

	.type	.L.str.22.83,@object    # @.str.22.83
.L.str.22.83:
	.asciz	", {"
	.size	.L.str.22.83, 4

	.type	.L.str.23.84,@object    # @.str.23.84
.L.str.23.84:
	.asciz	"}"
	.size	.L.str.23.84, 2

	.type	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE,@object # @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
	.bss
	.weak	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE:
	.byte	0                       # 0x0
	.size	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, 1

	.type	_ZN6Halide7Runtime8Internal21allocation_pools_lockE,@object # @_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	.weak	_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal21allocation_pools_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal21allocation_pools_lockE, 8

	.type	_ZN6Halide7Runtime8Internal23device_allocation_poolsE,@object # @_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.weak	_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.p2align	3
_ZN6Halide7Runtime8Internal23device_allocation_poolsE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal23device_allocation_poolsE, 8

	.type	_ZN6Halide7Runtime8Internal17device_copy_mutexE,@object # @_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.weak	_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.p2align	3
_ZN6Halide7Runtime8Internal17device_copy_mutexE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal17device_copy_mutexE, 8

	.type	.L.str.9.89,@object     # @.str.9.89
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.9.89:
	.asciz	"halide_copy_to_host"
	.size	.L.str.9.89, 20

	.type	.L.str.10.90,@object    # @.str.10.90
.L.str.10.90:
	.asciz	"halide_copy_to_device"
	.size	.L.str.10.90, 22

	.type	.L.str.12.91,@object    # @.str.12.91
.L.str.12.91:
	.asciz	"halide_copy_to_device does not support switching interfaces\n"
	.size	.L.str.12.91, 61

	.type	.L.str.18.92,@object    # @.str.18.92
.L.str.18.92:
	.asciz	"halide_device_malloc"
	.size	.L.str.18.92, 21

	.type	.L.str.20.93,@object    # @.str.20.93
.L.str.20.93:
	.asciz	"halide_device_malloc doesn't support switching interfaces\n"
	.size	.L.str.20.93, 59

	.type	.L.str.17.94,@object    # @.str.17.94
.L.str.17.94:
	.asciz	"halide_device_sync"
	.size	.L.str.17.94, 19

	.type	.L.str.21.97,@object    # @.str.21.97
.L.str.21.97:
	.asciz	"halide_device_free"
	.size	.L.str.21.97, 19

	.type	.L.str.22.98,@object    # @.str.22.98
.L.str.22.98:
	.asciz	"/home/jason/code/Halide/src/runtime/device_interface.cpp:247 Assert failed: buf->device == 0\n"
	.size	.L.str.22.98, 94

	.type	.L.str.23.99,@object    # @.str.23.99
.L.str.23.99:
	.asciz	"halide_device_and_host_malloc"
	.size	.L.str.23.99, 30

	.type	.L.str.25.100,@object   # @.str.25.100
.L.str.25.100:
	.asciz	"halide_device_and_host_malloc doesn't support switching interfaces\n"
	.size	.L.str.25.100, 68

	.type	.L.str.26.101,@object   # @.str.26.101
.L.str.26.101:
	.asciz	"allocating host and device memory failed\n"
	.size	.L.str.26.101, 42

	.type	.L.str.27.102,@object   # @.str.27.102
.L.str.27.102:
	.asciz	"halide_device_and_host_free"
	.size	.L.str.27.102, 28

	.type	.L.str.28.103,@object   # @.str.28.103
.L.str.28.103:
	.asciz	"/home/jason/code/Halide/src/runtime/device_interface.cpp:312 Assert failed: buf->device == 0\n"
	.size	.L.str.28.103, 94

	.type	.L.str.29.104,@object   # @.str.29.104
.L.str.29.104:
	.asciz	"halide_default_device_and_host_malloc"
	.size	.L.str.29.104, 38

	.type	.L.str.30.105,@object   # @.str.30.105
.L.str.30.105:
	.asciz	"halide_default_device_and_host_free"
	.size	.L.str.30.105, 36

	.type	.L.str.31.106,@object   # @.str.31.106
.L.str.31.106:
	.asciz	"halide_device_wrap_native"
	.size	.L.str.31.106, 26

	.type	.L.str.32.107,@object   # @.str.32.107
.L.str.32.107:
	.asciz	"halide_device_wrap_native doesn't support switching interfaces\n"
	.size	.L.str.32.107, 64

	.type	.L.str.33.108,@object   # @.str.33.108
.L.str.33.108:
	.asciz	"halide_device_detach_native"
	.size	.L.str.33.108, 28

	.type	.L.str.34.109,@object   # @.str.34.109
.L.str.34.109:
	.asciz	"/home/jason/code/Halide/src/runtime/device_interface.cpp:399 Assert failed: buf->device == 0\n"
	.size	.L.str.34.109, 94

	.type	.L.str.35.110,@object   # @.str.35.110
.L.str.35.110:
	.asciz	"halide_default_device_wrap_native"
	.size	.L.str.35.110, 34

	.type	.L.str.36,@object       # @.str.36
.L.str.36:
	.asciz	"halide_default_device_detach_native"
	.size	.L.str.36, 36

	.type	.L.str.42,@object       # @.str.42
.L.str.42:
	.asciz	"halide_buffer_copy does not support switching device interfaces"
	.size	.L.str.42, 64

	.type	.L.str.58.111,@object   # @.str.58.111
.L.str.58.111:
	.asciz	"device_interface does not support cropping\n"
	.size	.L.str.58.111, 44

	.type	.L.str.59,@object       # @.str.59
.L.str.59:
	.asciz	"device_interface does not support slicing\n"
	.size	.L.str.59, 43

	.type	.L.str.60,@object       # @.str.60
.L.str.60:
	.asciz	"destination buffer already has a device allocation\n"
	.size	.L.str.60, 52

	.type	.L.str.61,@object       # @.str.61
.L.str.61:
	.asciz	"src and dst must have identical dimensionality\n"
	.size	.L.str.61, 48

	.type	.L.str.64,@object       # @.str.64
.L.str.64:
	.asciz	"dst must have exactly one fewer dimension than src\n"
	.size	.L.str.64, 52

	.type	.L.str.114,@object      # @.str.114
.L.str.114:
	.asciz	"Bounds inference call to external stage "
	.size	.L.str.114, 41

	.type	.L.str.1.115,@object    # @.str.1.115
.L.str.1.115:
	.asciz	" returned non-zero value: "
	.size	.L.str.1.115, 27

	.type	.L.str.2.116,@object    # @.str.2.116
.L.str.2.116:
	.asciz	"Call to external stage "
	.size	.L.str.2.116, 24

	.type	.L.str.3.117,@object    # @.str.3.117
.L.str.3.117:
	.asciz	"Bounds given for "
	.size	.L.str.3.117, 18

	.type	.L.str.4.118,@object    # @.str.4.118
.L.str.4.118:
	.asciz	" in "
	.size	.L.str.4.118, 5

	.type	.L.str.5.119,@object    # @.str.5.119
.L.str.5.119:
	.asciz	" (from "
	.size	.L.str.5.119, 8

	.type	.L.str.6.120,@object    # @.str.6.120
.L.str.6.120:
	.asciz	" to "
	.size	.L.str.6.120, 5

	.type	.L.str.7.121,@object    # @.str.7.121
.L.str.7.121:
	.asciz	") do not cover required region (from "
	.size	.L.str.7.121, 38

	.type	.L.str.9.123,@object    # @.str.9.123
.L.str.9.123:
	.asciz	" has type "
	.size	.L.str.9.123, 11

	.type	.L.str.10.124,@object   # @.str.10.124
.L.str.10.124:
	.asciz	" but type of the buffer passed in is "
	.size	.L.str.10.124, 38

	.type	.L.str.11.125,@object   # @.str.11.125
.L.str.11.125:
	.asciz	" requires a buffer of exactly "
	.size	.L.str.11.125, 31

	.type	.L.str.12.126,@object   # @.str.12.126
.L.str.12.126:
	.asciz	" dimensions, but the buffer passed in has "
	.size	.L.str.12.126, 43

	.type	.L.str.13.127,@object   # @.str.13.127
.L.str.13.127:
	.asciz	" dimensions"
	.size	.L.str.13.127, 12

	.type	.L.str.14.128,@object   # @.str.14.128
.L.str.14.128:
	.asciz	" is accessed at "
	.size	.L.str.14.128, 17

	.type	.L.str.15.129,@object   # @.str.15.129
.L.str.15.129:
	.asciz	", which is before the min ("
	.size	.L.str.15.129, 28

	.type	.L.str.16.130,@object   # @.str.16.130
.L.str.16.130:
	.asciz	") in dimension "
	.size	.L.str.16.130, 16

	.type	.L.str.17.131,@object   # @.str.17.131
.L.str.17.131:
	.asciz	", which is beyond the max ("
	.size	.L.str.17.131, 28

	.type	.L.str.18.132,@object   # @.str.18.132
.L.str.18.132:
	.asciz	"Total allocation for buffer "
	.size	.L.str.18.132, 29

	.type	.L.str.19.133,@object   # @.str.19.133
.L.str.19.133:
	.asciz	" is "
	.size	.L.str.19.133, 5

	.type	.L.str.20.134,@object   # @.str.20.134
.L.str.20.134:
	.asciz	", which exceeds the maximum size of "
	.size	.L.str.20.134, 37

	.type	.L.str.21.135,@object   # @.str.21.135
.L.str.21.135:
	.asciz	"The extents for buffer "
	.size	.L.str.21.135, 24

	.type	.L.str.22.136,@object   # @.str.22.136
.L.str.22.136:
	.asciz	" dimension "
	.size	.L.str.22.136, 12

	.type	.L.str.23.137,@object   # @.str.23.137
.L.str.23.137:
	.asciz	" is negative ("
	.size	.L.str.23.137, 15

	.type	.L.str.24.138,@object   # @.str.24.138
.L.str.24.138:
	.asciz	"Product of extents for buffer "
	.size	.L.str.24.138, 31

	.type	.L.str.25.139,@object   # @.str.25.139
.L.str.25.139:
	.asciz	"Applying the constraints on "
	.size	.L.str.25.139, 29

	.type	.L.str.26.140,@object   # @.str.26.140
.L.str.26.140:
	.asciz	" to the required region made it smaller in dimension "
	.size	.L.str.26.140, 54

	.type	.L.str.27.141,@object   # @.str.27.141
.L.str.27.141:
	.asciz	". "
	.size	.L.str.27.141, 3

	.type	.L.str.28.142,@object   # @.str.28.142
.L.str.28.142:
	.asciz	"Required size: "
	.size	.L.str.28.142, 16

	.type	.L.str.29.143,@object   # @.str.29.143
.L.str.29.143:
	.asciz	"Constrained size: "
	.size	.L.str.29.143, 19

	.type	.L.str.30.144,@object   # @.str.30.144
.L.str.30.144:
	.asciz	"."
	.size	.L.str.30.144, 2

	.type	.L.str.31.145,@object   # @.str.31.145
.L.str.31.145:
	.asciz	"Constraint violated: "
	.size	.L.str.31.145, 22

	.type	.L.str.32.146,@object   # @.str.32.146
.L.str.32.146:
	.asciz	" ("
	.size	.L.str.32.146, 3

	.type	.L.str.33.147,@object   # @.str.33.147
.L.str.33.147:
	.asciz	") == "
	.size	.L.str.33.147, 6

	.type	.L.str.34.148,@object   # @.str.34.148
.L.str.34.148:
	.asciz	"Parameter "
	.size	.L.str.34.148, 11

	.type	.L.str.35.149,@object   # @.str.35.149
.L.str.35.149:
	.asciz	" but must be at least "
	.size	.L.str.35.149, 23

	.type	.L.str.36.150,@object   # @.str.36.150
.L.str.36.150:
	.asciz	" but must be at most "
	.size	.L.str.36.150, 22

	.type	.L.str.37,@object       # @.str.37
.L.str.37:
	.asciz	"Out of memory (halide_malloc returned NULL)"
	.size	.L.str.37, 44

	.type	.L.str.38,@object       # @.str.38
.L.str.38:
	.asciz	"Buffer argument "
	.size	.L.str.38, 17

	.type	.L.str.39,@object       # @.str.39
.L.str.39:
	.asciz	" is NULL"
	.size	.L.str.39, 9

	.type	.L.str.40,@object       # @.str.40
.L.str.40:
	.asciz	"Failed to dump function "
	.size	.L.str.40, 25

	.type	.L.str.41,@object       # @.str.41
.L.str.41:
	.asciz	" to file "
	.size	.L.str.41, 10

	.type	.L.str.42.151,@object   # @.str.42.151
.L.str.42.151:
	.asciz	" with error "
	.size	.L.str.42.151, 13

	.type	.L.str.43,@object       # @.str.43
.L.str.43:
	.asciz	"Failed to upgrade buffer_t to halide_buffer_t for "
	.size	.L.str.43, 51

	.type	.L.str.45,@object       # @.str.45
.L.str.45:
	.asciz	"Failed to downgrade halide_buffer_t to buffer_t for "
	.size	.L.str.45, 53

	.type	.L.str.46,@object       # @.str.46
.L.str.46:
	.asciz	"The host pointer of "
	.size	.L.str.46, 21

	.type	.L.str.47,@object       # @.str.47
.L.str.47:
	.asciz	" is not aligned to a "
	.size	.L.str.47, 22

	.type	.L.str.48,@object       # @.str.48
.L.str.48:
	.asciz	" bytes boundary."
	.size	.L.str.48, 17

	.type	.L.str.49,@object       # @.str.49
.L.str.49:
	.asciz	" is null, but the pipeline will access it on the host."
	.size	.L.str.49, 55

	.type	.L.str.50,@object       # @.str.50
.L.str.50:
	.asciz	"The folded storage dimension "
	.size	.L.str.50, 30

	.type	.L.str.51,@object       # @.str.51
.L.str.51:
	.asciz	" of "
	.size	.L.str.51, 5

	.type	.L.str.52,@object       # @.str.52
.L.str.52:
	.asciz	" was accessed out of order by loop "
	.size	.L.str.52, 36

	.type	.L.str.53,@object       # @.str.53
.L.str.53:
	.asciz	"Cannot fold dimension "
	.size	.L.str.53, 23

	.type	.L.str.54,@object       # @.str.54
.L.str.54:
	.asciz	" because an extern stage accesses ["
	.size	.L.str.54, 36

	.type	.L.str.55,@object       # @.str.55
.L.str.55:
	.asciz	", "
	.size	.L.str.55, 3

	.type	.L.str.56,@object       # @.str.56
.L.str.56:
	.asciz	"],"
	.size	.L.str.56, 3

	.type	.L.str.57,@object       # @.str.57
.L.str.57:
	.asciz	" which is outside the range currently valid: ["
	.size	.L.str.57, 47

	.type	.L.str.58.152,@object   # @.str.58.152
.L.str.58.152:
	.asciz	"]."
	.size	.L.str.58.152, 3

	.type	.L.str.59.153,@object   # @.str.59.153
.L.str.59.153:
	.asciz	" which wraps around the boundary of the fold, "
	.size	.L.str.59.153, 47

	.type	.L.str.60.154,@object   # @.str.60.154
.L.str.60.154:
	.asciz	"which occurs at multiples of "
	.size	.L.str.60.154, 30

	.type	.L.str.61.155,@object   # @.str.61.155
.L.str.61.155:
	.asciz	"The fold factor ("
	.size	.L.str.61.155, 18

	.type	.L.str.62,@object       # @.str.62
.L.str.62:
	.asciz	") of dimension "
	.size	.L.str.62, 16

	.type	.L.str.63,@object       # @.str.63
.L.str.63:
	.asciz	" is too small to store the required region accessed by loop "
	.size	.L.str.63, 61

	.type	.L.str.64.156,@object   # @.str.64.156
.L.str.64.156:
	.asciz	")."
	.size	.L.str.64.156, 3

	.type	.L.str.65,@object       # @.str.65
.L.str.65:
	.asciz	"Requirement Failed: ("
	.size	.L.str.65, 22

	.type	.L.str.67,@object       # @.str.67
.L.str.67:
	.asciz	"A schedule specialized with specialize_fail() was chosen: "
	.size	.L.str.67, 59

	.type	.L.str.68,@object       # @.str.68
.L.str.68:
	.asciz	"Buffer has a non-zero device but no device interface.\n"
	.size	.L.str.68, 55

	.type	.L.str.69,@object       # @.str.69
.L.str.69:
	.asciz	"Buffer has a non-null devie_interface but device is 0.\n"
	.size	.L.str.69, 56

	.type	.L.str.70,@object       # @.str.70
.L.str.70:
	.asciz	"Buffer has both host and device dirty bits set.\n"
	.size	.L.str.70, 49

	.type	.L.str.71,@object       # @.str.71
.L.str.71:
	.asciz	"Buffer pointer passed to "
	.size	.L.str.71, 26

	.type	.L.str.72,@object       # @.str.72
.L.str.72:
	.asciz	" is null.\n"
	.size	.L.str.72, 11

	.type	.L.str.73,@object       # @.str.73
.L.str.73:
	.asciz	"Integer division or modulo by zero.\n"
	.size	.L.str.73, 37

	.type	.L.str.165,@object      # @.str.165
.L.str.165:
	.zero	1
	.size	.L.str.165, 1

	.type	.L.str.1.166,@object    # @.str.1.166
.L.str.1.166:
	.asciz	"elem_size of buffer was not in [1, 2, 4, 8]"
	.size	.L.str.1.166, 44

	.type	.L.str.2.167,@object    # @.str.2.167
.L.str.2.167:
	.asciz	"buffer has incorrect elem_size ("
	.size	.L.str.2.167, 33

	.type	.L.str.3.168,@object    # @.str.3.168
.L.str.3.168:
	.asciz	") "
	.size	.L.str.3.168, 3

	.type	.L.str.4.169,@object    # @.str.4.169
.L.str.4.169:
	.asciz	"for expected type ("
	.size	.L.str.4.169, 20

	.type	.L.str.5.170,@object    # @.str.5.170
.L.str.5.170:
	.asciz	")"
	.size	.L.str.5.170, 2

	.type	.L.str.6.172,@object    # @.str.6.172
.L.str.6.172:
	.asciz	"Internal error: buffer host mismatch in halide_upgrade_buffer_t."
	.size	.L.str.6.172, 65

	.type	.L.str.7.173,@object    # @.str.7.173
.L.str.7.173:
	.asciz	"buffer has more than four dimensions"
	.size	.L.str.7.173, 37

	.type	.L.str.8.177,@object    # @.str.8.177
.L.str.8.177:
	.asciz	" total time: "
	.size	.L.str.8.177, 14

	.type	.L.str.9.178,@object    # @.str.9.178
.L.str.9.178:
	.asciz	" ms"
	.size	.L.str.9.178, 4

	.type	.L.str.10.179,@object   # @.str.10.179
.L.str.10.179:
	.asciz	"  samples: "
	.size	.L.str.10.179, 12

	.type	.L.str.11.180,@object   # @.str.11.180
.L.str.11.180:
	.asciz	"  runs: "
	.size	.L.str.11.180, 9

	.type	.L.str.12.181,@object   # @.str.12.181
.L.str.12.181:
	.asciz	"  time/run: "
	.size	.L.str.12.181, 13

	.type	.L.str.13.182,@object   # @.str.13.182
.L.str.13.182:
	.asciz	" ms\n"
	.size	.L.str.13.182, 5

	.type	.L.str.14.183,@object   # @.str.14.183
.L.str.14.183:
	.asciz	" average threads used: "
	.size	.L.str.14.183, 24

	.type	.L.str.15.184,@object   # @.str.15.184
.L.str.15.184:
	.asciz	" heap allocations: "
	.size	.L.str.15.184, 20

	.type	.L.str.16.185,@object   # @.str.16.185
.L.str.16.185:
	.asciz	"  peak heap usage: "
	.size	.L.str.16.185, 20

	.type	.L.str.17.186,@object   # @.str.17.186
.L.str.17.186:
	.asciz	" bytes\n"
	.size	.L.str.17.186, 8

	.type	.L.str.18.187,@object   # @.str.18.187
.L.str.18.187:
	.asciz	"  "
	.size	.L.str.18.187, 3

	.type	.L.str.19.188,@object   # @.str.19.188
.L.str.19.188:
	.asciz	": "
	.size	.L.str.19.188, 3

	.type	.L.str.20.189,@object   # @.str.20.189
.L.str.20.189:
	.asciz	" "
	.size	.L.str.20.189, 2

	.type	.L.str.21.190,@object   # @.str.21.190
.L.str.21.190:
	.asciz	"ms"
	.size	.L.str.21.190, 3

	.type	.L.str.22.191,@object   # @.str.22.191
.L.str.22.191:
	.asciz	"("
	.size	.L.str.22.191, 2

	.type	.L.str.23.192,@object   # @.str.23.192
.L.str.23.192:
	.asciz	"%)"
	.size	.L.str.23.192, 3

	.type	.L.str.24.193,@object   # @.str.24.193
.L.str.24.193:
	.asciz	"threads: "
	.size	.L.str.24.193, 10

	.type	.L.str.25.194,@object   # @.str.25.194
.L.str.25.194:
	.asciz	" peak: "
	.size	.L.str.25.194, 8

	.type	.L.str.26.195,@object   # @.str.26.195
.L.str.26.195:
	.asciz	" num: "
	.size	.L.str.26.195, 7

	.type	.L.str.27.196,@object   # @.str.27.196
.L.str.27.196:
	.asciz	" avg: "
	.size	.L.str.27.196, 7

	.type	.L.str.28.197,@object   # @.str.28.197
.L.str.28.197:
	.asciz	" stack: "
	.size	.L.str.28.197, 9

	.type	_ZZ25halide_profiler_get_stateE1s,@object # @_ZZ25halide_profiler_get_stateE1s
	.data
	.p2align	3
_ZZ25halide_profiler_get_stateE1s:
	.zero	8
	.long	1                       # 0x1
	.long	0                       # 0x0
	.long	0                       # 0x0
	.long	0                       # 0x0
	.quad	0
	.quad	0
	.quad	0
	.size	_ZZ25halide_profiler_get_stateE1s, 48

	.type	.L.str.198,@object      # @.str.198
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.198:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:201 Assert failed: p_stats != NULL\n"
	.size	.L.str.198, 85

	.type	.L.str.1.199,@object    # @.str.1.199
.L.str.1.199:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:228 Assert failed: p_stats != NULL\n"
	.size	.L.str.1.199, 85

	.type	.L.str.2.200,@object    # @.str.2.200
.L.str.2.200:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:229 Assert failed: func_id >= 0\n"
	.size	.L.str.2.200, 82

	.type	.L.str.3.201,@object    # @.str.3.201
.L.str.3.201:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:230 Assert failed: func_id < p_stats->num_funcs\n"
	.size	.L.str.3.201, 98

	.type	.L.str.4.202,@object    # @.str.4.202
.L.str.4.202:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:264 Assert failed: p_stats != NULL\n"
	.size	.L.str.4.202, 85

	.type	.L.str.5.203,@object    # @.str.5.203
.L.str.5.203:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:265 Assert failed: func_id >= 0\n"
	.size	.L.str.5.203, 82

	.type	.L.str.6.204,@object    # @.str.6.204
.L.str.6.204:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:266 Assert failed: func_id < p_stats->num_funcs\n"
	.size	.L.str.6.204, 98

	.type	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE,@object # @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.data
	.weak	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.p2align	3
_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE:
	.quad	halide_default_can_use_target_features
	.size	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, 8

	.type	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE,@object # @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE, 8

	.type	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE,@object # @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
	.weak	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE:
	.byte	0                       # 0x0
	.size	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, 1

	.type	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE,@object # @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.weak	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.p2align	3
_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE:
	.zero	32
	.size	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, 32

	.type	.L.str.209,@object      # @.str.209
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.209:
	.asciz	"Internal error: wrong structure size passed to halide_can_use_target_features()\n"
	.size	.L.str.209, 81

	.type	_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE,@object # @_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal7Hexagon11thread_lockE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE,@object # @_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon19remote_load_libraryE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE,@object # @_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon17remote_get_symbolE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon10remote_runE,@object # @_ZN6Halide7Runtime8Internal7Hexagon10remote_runE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon10remote_runE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon10remote_runE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon10remote_runE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE,@object # @_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon22remote_release_libraryE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE,@object # @_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon15remote_poll_logE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE,@object # @_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon26remote_poll_profiler_stateE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE,@object # @_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon32remote_profiler_set_current_funcE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE,@object # @_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon19remote_power_hvx_onE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE,@object # @_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon20remote_power_hvx_offE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE,@object # @_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon22remote_set_performanceE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE,@object # @_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon27remote_set_performance_modeE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE,@object # @_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon26remote_set_thread_priorityE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE,@object # @_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon16host_malloc_initE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon18host_malloc_deinitE,@object # @_ZN6Halide7Runtime8Internal7Hexagon18host_malloc_deinitE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon18host_malloc_deinitE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon18host_malloc_deinitE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon18host_malloc_deinitE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE,@object # @_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon11host_mallocE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon9host_freeE,@object # @_ZN6Halide7Runtime8Internal7Hexagon9host_freeE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon9host_freeE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon9host_freeE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon9host_freeE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon10state_listE,@object # @_ZN6Halide7Runtime8Internal7Hexagon10state_listE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon10state_listE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon10state_listE:
	.quad	0
	.size	_ZN6Halide7Runtime8Internal7Hexagon10state_listE, 8

	.type	_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE,@object # @_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE
	.p2align	2
_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE:
	.long	0                       # 0x0
	.size	_ZN6Halide7Runtime8Internal7Hexagon14shared_runtimeE, 4

	.type	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE,@object # @_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE
	.data
	.weak	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE:
	.quad	halide_device_malloc
	.quad	halide_device_free
	.quad	halide_device_sync
	.quad	halide_device_release
	.quad	halide_copy_to_host
	.quad	halide_copy_to_device
	.quad	halide_device_and_host_malloc
	.quad	halide_device_and_host_free
	.quad	halide_buffer_copy
	.quad	halide_device_crop
	.quad	halide_device_slice
	.quad	halide_device_release_crop
	.quad	halide_device_wrap_native
	.quad	halide_device_detach_native
	.quad	0
	.quad	_ZN6Halide7Runtime8Internal7Hexagon29hexagon_device_interface_implE
	.size	_ZN6Halide7Runtime8Internal7Hexagon24hexagon_device_interfaceE, 128

	.type	_ZN6Halide7Runtime8Internal7Hexagon29hexagon_device_interface_implE,@object # @_ZN6Halide7Runtime8Internal7Hexagon29hexagon_device_interface_implE
	.weak	_ZN6Halide7Runtime8Internal7Hexagon29hexagon_device_interface_implE
	.p2align	3
_ZN6Halide7Runtime8Internal7Hexagon29hexagon_device_interface_implE:
	.quad	_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv
	.quad	_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv
	.quad	halide_hexagon_device_malloc
	.quad	halide_hexagon_device_free
	.quad	halide_hexagon_device_sync
	.quad	halide_hexagon_device_release
	.quad	halide_hexagon_copy_to_host
	.quad	halide_hexagon_copy_to_device
	.quad	halide_hexagon_device_and_host_malloc
	.quad	halide_hexagon_device_and_host_free
	.quad	halide_hexagon_buffer_copy
	.quad	halide_hexagon_device_crop
	.quad	halide_hexagon_device_slice
	.quad	halide_hexagon_device_release_crop
	.quad	halide_default_device_wrap_native
	.quad	halide_default_device_detach_native
	.size	_ZN6Halide7Runtime8Internal7Hexagon29hexagon_device_interface_implE, 128

	.type	.L.str.89,@object       # @.str.89
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.89:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:720 Assert failed: dst_device_interface == NULL || dst_device_interface == &hexagon_device_interface\n"
	.size	.L.str.89, 155

	.type	.L.str.90,@object       # @.str.90
.L.str.90:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:724 Assert failed: dst_device_interface == &hexagon_device_interface\n"
	.size	.L.str.90, 123

	.type	.L.str.92,@object       # @.str.92
.L.str.92:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:735 Assert failed: to_host || dst->device\n"
	.size	.L.str.92, 96

	.type	.L.str.85,@object       # @.str.85
.L.str.85:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:685 Assert failed: buf->device_interface == &hexagon_device_interface\n"
	.size	.L.str.85, 124

	.type	.L.str.79,@object       # @.str.79
.L.str.79:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:602 Assert failed: buf->host && buf->device\n"
	.size	.L.str.79, 98

	.type	.L.str.81,@object       # @.str.81
.L.str.81:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:626 Assert failed: buf->host && buf->device\n"
	.size	.L.str.81, 98

	.type	.L.str.4.214,@object    # @.str.4.214
.L.str.4.214:
	.asciz	"Hexagon: remote_poll_log failed "
	.size	.L.str.4.214, 33

	.type	.L.str.3.215,@object    # @.str.3.215
.L.str.3.215:
	.asciz	"\n"
	.size	.L.str.3.215, 2

	.type	.L.str.111,@object      # @.str.111
.L.str.111:
	.asciz	"Printer buffer allocation failed.\n"
	.size	.L.str.111, 35

	.type	.L.str.84,@object       # @.str.84
.L.str.84:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:671 Assert failed: buf->device_interface == &hexagon_device_interface\n"
	.size	.L.str.84, 124

	.type	.L.str.86,@object       # @.str.86
.L.str.86:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:694 Assert failed: buf->device_interface == &hexagon_device_interface\n"
	.size	.L.str.86, 124

	.type	.L.str.65.216,@object   # @.str.65.216
.L.str.65.216:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:491 Assert failed: size != 0\n"
	.size	.L.str.65.216, 83

	.type	.L.str.66.217,@object   # @.str.66.217
.L.str.66.217:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:499 Assert failed: buf->dim[i].stride >= 0\n"
	.size	.L.str.66.217, 97

	.type	.L.str.70.218,@object   # @.str.70.218
.L.str.70.218:
	.asciz	"host_malloc failed\n"
	.size	.L.str.70.218, 20

	.type	.L.str.72.219,@object   # @.str.72.219
.L.str.72.219:
	.asciz	"halide_malloc failed\n"
	.size	.L.str.72.219, 22

	.type	.L.str.83,@object       # @.str.83
.L.str.83:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:650 Assert failed: buf->device == 0\n"
	.size	.L.str.83, 90

	.type	.L.str.6.220,@object    # @.str.6.220
.L.str.6.220:
	.asciz	"libhalide_hexagon_host.so"
	.size	.L.str.6.220, 26

	.type	.L.str.7.221,@object    # @.str.7.221
.L.str.7.221:
	.asciz	"libhalide_hexagon_host.dll"
	.size	.L.str.7.221, 27

	.type	.L.str.10.222,@object   # @.str.10.222
.L.str.10.222:
	.asciz	"halide_hexagon_remote_load_library"
	.size	.L.str.10.222, 35

	.type	.L.str.115,@object      # @.str.115
.L.str.115:
	.asciz	"Required Hexagon runtime symbol '"
	.size	.L.str.115, 34

	.type	.L.str.116,@object      # @.str.116
.L.str.116:
	.asciz	"' not found.\n"
	.size	.L.str.116, 14

	.type	.L.str.11.223,@object   # @.str.11.223
.L.str.11.223:
	.asciz	"halide_hexagon_remote_get_symbol_v4"
	.size	.L.str.11.223, 36

	.type	.L.str.12.224,@object   # @.str.12.224
.L.str.12.224:
	.asciz	"halide_hexagon_remote_run"
	.size	.L.str.12.224, 26

	.type	.L.str.13.225,@object   # @.str.13.225
.L.str.13.225:
	.asciz	"halide_hexagon_remote_release_library"
	.size	.L.str.13.225, 38

	.type	.L.str.14.226,@object   # @.str.14.226
.L.str.14.226:
	.asciz	"halide_hexagon_host_malloc_init"
	.size	.L.str.14.226, 32

	.type	.L.str.15.227,@object   # @.str.15.227
.L.str.15.227:
	.asciz	"halide_hexagon_host_malloc_deinit"
	.size	.L.str.15.227, 34

	.type	.L.str.16.228,@object   # @.str.16.228
.L.str.16.228:
	.asciz	"halide_hexagon_host_malloc"
	.size	.L.str.16.228, 27

	.type	.L.str.17.229,@object   # @.str.17.229
.L.str.17.229:
	.asciz	"halide_hexagon_host_free"
	.size	.L.str.17.229, 25

	.type	.L.str.18.230,@object   # @.str.18.230
.L.str.18.230:
	.asciz	"halide_hexagon_remote_poll_log"
	.size	.L.str.18.230, 31

	.type	.L.str.19.231,@object   # @.str.19.231
.L.str.19.231:
	.asciz	"halide_hexagon_remote_poll_profiler_state"
	.size	.L.str.19.231, 42

	.type	.L.str.20.232,@object   # @.str.20.232
.L.str.20.232:
	.asciz	"halide_hexagon_remote_profiler_set_current_func"
	.size	.L.str.20.232, 48

	.type	.L.str.21.233,@object   # @.str.21.233
.L.str.21.233:
	.asciz	"halide_hexagon_remote_power_hvx_on"
	.size	.L.str.21.233, 35

	.type	.L.str.22.234,@object   # @.str.22.234
.L.str.22.234:
	.asciz	"halide_hexagon_remote_power_hvx_off"
	.size	.L.str.22.234, 36

	.type	.L.str.23.235,@object   # @.str.23.235
.L.str.23.235:
	.asciz	"halide_hexagon_remote_set_performance"
	.size	.L.str.23.235, 38

	.type	.L.str.24.236,@object   # @.str.24.236
.L.str.24.236:
	.asciz	"halide_hexagon_remote_set_performance_mode"
	.size	.L.str.24.236, 43

	.type	.L.str.25.237,@object   # @.str.25.237
.L.str.25.237:
	.asciz	"halide_hexagon_remote_set_thread_priority"
	.size	.L.str.25.237, 42

	.type	.L.str.5.239,@object    # @.str.5.239
.L.str.5.239:
	.asciz	"Hexagon: remote_poll_profiler_func not found\n"
	.size	.L.str.5.239, 46

	.type	.L.str.31.240,@object   # @.str.31.240
.L.str.31.240:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:218 Assert failed: state_ptr != NULL\n"
	.size	.L.str.31.240, 91

	.type	.L__const.halide_hexagon_initialize_kernels.soname,@object # @__const.halide_hexagon_initialize_kernels.soname
.L__const.halide_hexagon_initialize_kernels.soname:
	.asciz	"libhalide_shared_runtime.so"
	.size	.L__const.halide_hexagon_initialize_kernels.soname, 28

	.type	.L.str.36.241,@object   # @.str.36.241
.L.str.36.241:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:245 Assert failed: shared_runtime != 0\n"
	.size	.L.str.36.241, 93

	.type	.L.str.37.242,@object   # @.str.37.242
.L.str.37.242:
	.asciz	"Initialization of Hexagon kernels failed\n"
	.size	.L.str.37.242, 42

	.type	.L.str.40.243,@object   # @.str.40.243
.L.str.40.243:
	.asciz	"libhalide_kernels"
	.size	.L.str.40.243, 18

	.type	_ZZ33halide_hexagon_initialize_kernelsE9unique_id,@object # @_ZZ33halide_hexagon_initialize_kernelsE9unique_id
	.local	_ZZ33halide_hexagon_initialize_kernelsE9unique_id
	.comm	_ZZ33halide_hexagon_initialize_kernelsE9unique_id,4,4
	.type	.L.str.41.244,@object   # @.str.41.244
.L.str.41.244:
	.asciz	".so"
	.size	.L.str.41.244, 4

	.type	.L.str.44.245,@object   # @.str.44.245
.L.str.44.245:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:346 Assert failed: state_ptr != NULL\n"
	.size	.L.str.44.245, 91

	.type	.L.str.45.246,@object   # @.str.45.246
.L.str.45.246:
	.asciz	"/home/jason/code/Halide/src/runtime/hexagon_host.cpp:347 Assert failed: function != NULL\n"
	.size	.L.str.45.246, 90

	.type	.L.str.56.247,@object   # @.str.56.247
.L.str.56.247:
	.asciz	"Failed to find function "
	.size	.L.str.56.247, 25

	.type	.L.str.112,@object      # @.str.112
.L.str.112:
	.asciz	"<NULL>"
	.size	.L.str.112, 7

	.type	.L.str.57.248,@object   # @.str.57.248
.L.str.57.248:
	.asciz	" in module.\n"
	.size	.L.str.57.248, 13

	.type	.L.str.59.249,@object   # @.str.59.249
.L.str.59.249:
	.asciz	"Hexagon pipeline failed.\n"
	.size	.L.str.59.249, 26

	.type	.L.str.98,@object       # @.str.98
.L.str.98:
	.asciz	"remote_power_hvx_on failed.\n"
	.size	.L.str.98, 29

	.type	.L.str.101,@object      # @.str.101
.L.str.101:
	.asciz	"remote_power_hvx_off failed.\n"
	.size	.L.str.101, 30

	.type	.L.str.104,@object      # @.str.104
.L.str.104:
	.asciz	"remote_set_performance_mode failed.\n"
	.size	.L.str.104, 37

	.type	.L.str.107,@object      # @.str.107
.L.str.107:
	.asciz	"remote_set_performance failed.\n"
	.size	.L.str.107, 32

	.type	.L.str.110,@object      # @.str.110
.L.str.110:
	.asciz	"remote_set_thread_priority failed.\n"
	.size	.L.str.110, 36

	.type	.Lhexagon_module_state_buf.data,@object # @hexagon_module_state_buf.data
	.local	.Lhexagon_module_state_buf.data
	.comm	.Lhexagon_module_state_buf.data,8,32
	.type	.Loffload_rpc.blur_y.s0.__outermost_buf.data,@object # @offload_rpc.blur_y.s0.__outermost_buf.data
	.local	.Loffload_rpc.blur_y.s0.__outermost_buf.data
	.comm	.Loffload_rpc.blur_y.s0.__outermost_buf.data,8,32
	.type	.Lhalide_hexagon_code.data,@object # @halide_hexagon_code.data
	.section	.rodata,"a",@progbits
	.p2align	5
.Lhalide_hexagon_code.data:
	.asciz	"\177ELF\001\001\001\000\000\000\000\000\000\000\000\000\003\000\244\000\001\000\000\000\000\000\000\0004\000\000\000\000 \000\000`\000\000\0004\000 \000\003\000(\000\016\000\f\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\020\000\000\000\020\000\000\005\000\000\000\000\020\000\000\001\000\000\000\000\020\000\000\000\020\000\000\000\020\000\000\000\020\000\000\000\020\000\000\006\000\000\000\000\020\000\000\002\000\000\000\f\035\000\000\f\035\000\000\f\035\000\000\210\000\000\000\210\000\000\000\004\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000B@\000\000\016\306Ij\034\300\216\221\000\300\234RB@\000\000\016\300Ij\034\300\216\221\000\300\234RA@\000\000\016\332Ij\034\300\216\221\000\300\234RA@\000\000\016\324Ij\034\300\216\221\000\300\234RA@\000\000\016\316Ij\034\300\216\221\000\300\234RA@\000\000\016\310Ij\034\300\216\221\000\300\234RA@\000\000\016\302Ij\034\300\216\221\000\300\234R@@\000\000\016\334Ij\034\300\216\221\000\300\234R@@\000\000\016\326Ij\034\300\216\221\000\300\234R@@\000\000\016\320Ij\034\300\216\221\000\300\234R@@\000\000\016\312Ij\034\300\216\221\000\300\234R\020` s\000H\001u\020\034\364\353\n@\000\\\000\300\000x&X \\\000P\001u \300\000x\374\177\377\017`\300\000Z\000@\000u\000`\021t\020@\335C\036\330\036\226\374\177\377\017P@\000Z\000@pp\001\300\002x6\300\000\020-@\000\000\202TIj\021@`p\341\377 \260\024\300\000X\374\177\377\017\000@\000Z\000@pp\001\300\002x(\300\000\020+@\000\000\002^Ij\021@`p\341\377 \260\000@qp\003@\000x\377\342\261\243\373\177\377\017@\300\000Z1B\200\333\000\320\021\365\373\177\377\017@@\000Z\003\337\002\214\032@\000X\000\320\021\365,@\000\000\202@Ij\n\300\000X*@\000\000\002\330Ij\372\177\377\017P@\000Z\000<\t(*@\000\000\001_Ij\000\300pp\372\177\377\017`\300\000Z\372\177\377\017p@\000Z\000P\021\365\361\377\337x\000@qp@\037\004>\020@`p\020\034\364\353\372\177\377\017P\300\000Z\000@\000u\000`\000~\020@\335C\036\330\036\226\371\177\377\017\000@\000Z\000@pp\001\300\002x\"@\000\020\021\300`p*@\000\000\202IIj\341\1771\260\000\300qp\370\177\377\017P@\000Z\003@\000x\377\342\261\2431B\200\333\000\320\021\365\370\177\377\017@@\000Z\003\337\002\214\024@\000X\000\320\021\365)@\000\000\202KIj\000\300\000|\367\177\377\017`\300\000Z(@\000\000\001EIj\000\300pp\367\177\377\017x\300\000Z\370\177\377\017\b@\000Z\000\320\021\365\340\177\337x@\037\004>\375\177\377\017 \300\000X\000\000\000\000\000\000\000\000\343O\000x\013\300\235\240A\300\201\221\000C\201\307z\310 \\H\300\200\221\000C\210\307\202\310 \\\006B\000\365\342O\000x@\300\202\221\000B\200\307\206\310 \\\000@\005\205\001@\004\205\245A\201\221\016\301\201\221\n@\201\221\000\322\275\241\211A\201\221l\301\201\221*@\201\221\001\322\275\241MA\201\221\243\300\201\221J@\201\221\002\322\275\241\304A\201\221\002\314=\221\234@\201\221j\300\201\221\357@\201\221\005\334\235\241\001@B\205<@\200z\312@\201\221\003\312\235\241\002@\000x!A\201\221\n\322\275\241!@\200z\tN\235\241\021\304\235\241\000@\000x@A\035\241\022\300\235\241\002@\000\000\001TIj\004@\035\260.\300\000z\004H\235\241\030\334\035\241\007J\235\241\b\317\235\241\013M\235\2410\316\035\241\rL\235\241\016\311\235\2416\t\365\350\364\177\377\017(@\000Z\024H\235\241\025\307\235\241\036\300\036\226%@\000\000\001XIj\000@\000x\002\320\000x\364\177\377\017\000@\000X\036\300\036\220%@\000\000\001ZIj\000@\000x\002\320\000x\363\177\377\017H@\000X\036\300\036\220%@\000\000\001\\Ij\000@\000x\002\320\000x\363\177\377\017\020@\000X\036\300\036\220\000\000\000\000\000\000\000\000\000\000\000\000\021@ap\001P\000x0\035\364\353P\300\202\221\215\n+\300\177\n/\301\206\n#\303\265@\202\221\016\330\335\241\026A\202\221\r\332\335\241\031C\"\221\000\300\235\241FA\202\221\022\322\275\241'A\202\221\027\322\275\241\005F\"\221\003\303\235\241\372@\202\221\024\305\235\241\244A\202\221\026\322\275\241\307A\202\221\025\322\275\241\006H\"\221\023\322\275\241tA\202\221%\302\202\221DB\202\221\001\305\235\241\370A\202\221\002\304\235\241\361\177\377\0178@\000Z\233\302\202\221\034@\000\0000@@\020\022\300`p\000@Y\205\000\360\000x\340\300\021\304\000\300\267\325\000\320\000\363\001\300Z\362\000A\340k$\310\000\\A@\000\260 \326\202 \002`5s\000p\340\277t\035!=\004U\000\357AA\001\214F\320\000xBa\002\200\000@A\204\000D\000\000\007\300\000x\302P@\202 \333\004\304B\306\342\323\000\302\200\246\000\300\000x\001\300\323\325 \\\001\214\032@\000\000x\300B$$C\201\336\354\177\377\017`@\000Z\000\300\235\221\033@\000\000 \300\000\020DG\021\214\005p\367\2772=\001P\004D\245\325Ep\033\260f@\235\221\005\324\275\241GA\006\214E`\033\260\004\322\275\241\005P\004\363\252n\252\n\247(\264j @\244\031G@\033\260\t\322\275\241\030E\006\357GP\033\260\b\322\275\241\001@B\205\007`\033\260\200B\235\221\007\324\275\241DA\030\214\207p\033\260\006@ep\006\324\275\241'@\005\260H@\005\260\305(%\334\000@@\205\002@A\211 @\024v\013\324\275\241\004@\000\000\005N\004\333BA\025\214\t\340\001\260CA\023\214\f@\000x\034T \363\002\300Tu\032@\000X#@\024u*@\000x\000\300\000\177,@\f\260GB\235\221(\302\235\221\001P\fu(@\b\2606=wQ\244<fQ\310A\001\\\016\304\016\363d@\007ve@\bv\001@\fu\023\306\235\241\004D\003\355f@\006v\017\324\275\241\004E\003\355\007@ ~\022\307\235\241\004F\003\355\016D\235\241\020\316\235\241\021H\235\241\r\304\235\241G@\254th`\200z\204A\235\221\356\302\235\221\fD\007\363%A\235\221\024\314\235\241\016L\025\357\004H\f\363\255@\235\221\347\300\235\221%E\016\304\004D,\363\006A\235\221\310\300\235\221&F\016\304'G\016\304\217\300\235\221(H\016\304-\315\016\304\000D$`.O\016\304\004\300lp\036B\000\\x\300\004v\022A\000X\000@\000\177\000\300\000\177\005B\005\363\006B\006\363'8D1\bB\b\363,\200\f\260\rB\r\363\016\302\016\363:\301\000X\374B \\x\300\004v\300C\000\\\031\300\000x6A\034\214o@\fv\342\347\b(\017O\003\355\372\177\366\277\344\300\007(\024O\t\363!@\226u\343\300\b(\030I\032`Y@\031\260\345\301\007(\021@%\260\242Bd\034\346\300\016(\013@&\260\022@'\260\347\300\r(\020@(\260\242Fb\034\350\345\b(\027@4\260\017@-\260\351\346\b(\006C \034\026@.\260\344\346\007(\002B \034\201GF\037\345\347\007(\244Hd\034\202CB\037\350\300\005(\032@tpFA\212\031\351\300\006(BB\212\031\244\310d\034\346\3014(\b\305 \034\bD \034\205\311H\037\203\311H\037^A \\\000@\000\177\000@\000\177A\305\212\031\000\300\000\177\032@wpCC\212\031\345\300\020(\027@7\260Y@\031\260\351\301\022(\344\347\020(\350\300\022(\026@6\260\244Dh\034\352\300\026(\017@/\260\353\300\017(\244Jd\034\347\346\020(\020@0\260\346\345\020(\355\347\022(\022@2\260\354\346\022(\013@+\260\246Fl\034\351\300\013(\021@1\260\350\300\021(\bE \034\246\310f\034\004D \034\210IH\037\342\3004(\nG \034\204ED\037\341\3474(\bF \034GH\212\031\205\313J\037BD\212\031\203IH\037\343\3464(\024\200zpAE\212\031\347\301:(CC\212\031\341\347:(\342\300:(\343\346:(8\340\000\022\013S\030\355\357\302\235\221\017U\004\357\353\313\031\304\357\317\031\304/\333\017\304\220@\017\260\222P\017\260Q@\017\260T\320\017\260\342\300\020(\344\300\017(/A\013\304\345\301\017(\343\300\022(\242Bd\034\346\300\021(\347\300\024(\242\306b\034\004\302 \034\002C \034\201\305D\037\202\303B\037A\301\212\031B\302\212\031\341\300/(\342\301/(\364\300\377\\+@\030\260\317\302\235\221\017U\004\357\013\323\013\355/[\017\304+\301\013\304\220`\357\277\222p\357\277Q`\357\277T\360\357\277\342\300\020(\344\346\017(\345\347\017(\343\300\022(\242Bd\034\346\300\021(\347\300\024(\242\306b\034\004\302 \034\002C \034\201\305D\037\202\303B\037A\301\212\031B\302\212\031\341\346+(\300~\377Y\000@\000\177\342\347+(\000\300\000\177\244B\235\221\016\302\235\221\262\300\304\022\344\301\235\221\bD\t\363\304\301\235\221\fD\t\363\244\301\235\221\005D\t\363\006@,\260\342\300\f(\004@(\260\007@%\260\344\300\005(\343\301\f(\345\301\005(\242Bd\034\346\300\b(\347\301\b(\242Fb\034\350\346\f(\351\347\f(\006C \034\352\346\005(\002B \034\201GF\037\353\347\005(\244Hj\034\206CB\037\354\346\b(\005@.\260GA\212\031\355\347\b(AF\212\031\244Ld\034\254\302\235\221\350\177\354\277\347\301.(\020B\b`\bE \034!@\214u\f\300np\bD \034\b@np\205\311H\037\203\311H\037RA \\B\305\212\031\b@epCC\212\031\345\301\007(\r@$\260\005@%\260\347\301\006(\344\300\007(\346\300\006(\244Fd\034\351\347\007(\007@'\260\350\346\007(\347\347\006(\006@&\260\346\346\006(\246Fh\034\351\301\004(\350\300\004(\244Hd\034\353\347\004(\004@mp\352\346\004(\bE \034\246\312f\034\004D \034\202IH\037\342\347,(\bG \034\201ED\037\341\300,(EB\212\031\204IH\037\343\346,(\002F \034\f@hpA\301\212\031B\204\212\031\203CB\037\345\301((CC\212\031\342\347((\341\300((\343\346((dA\235\221\214\302\235\221\001@D\205\226\371\376\\6\034\304<\004D\f\363%@\235\221H\300\235\221\005F\004\357G@\004\260&@\004\260d\300\004v%H\005\304g@\007vf@\006v$\300\004\260\004S\004\355f1w1\007S\007\355$\301\004\304'A\007\304\006\323\006\355&A\006\304\346\344\004(\344\344\007(\347\345\004(\345\345\007(\244Df\034\342\344\006(\343\345\006(\242Bd\034\350\346\004(\351\347\004(\352\346\007(\353\347\007(\244Jh\034\346\346\006(\347\347\006(\006B \034\244\306d\034\002C \034\201\307F\037\006D \034\202\303B\037\004E \034AA\212\031\203\307F\037BB\212\031\204\305D\037CC\212\031\341\300%(DD\212\031\342\301%(\343\302%(.}\377Y\344\303%(\020\300\235\221\323\177\377\017`@\000Z\2000\n(\333\177\377\017h@\000Z \3400s\000@rp\215\036\224>\177\036\206>\330A\335\221\272\301\335\221\036\300\036\226\006@\000\000\001XIj@A\001\214\020\300\235\221\002` s\377\177\377\007\005(\364+\323\177\377\017H@\000ZBB\002\200\000\300pp\n\300\000X\020\300\235\221\323\177\377\0178@\000Z\000\300pp\316\3120\027\000\000\000\000\000\000\000\000\000\000\000\000\001\300\235\240\006\006\004\004\003\000\005\005\000@cp\002\002\001\001D\020U\020\331\177\377\017p@\000Z\003@&\221\000\322\275\241\036\300\036\226\000\000\000\000\021@\000\000\000HIj\000\300\237R\000\000\000\000HVX lock size must be 64 or 128.\n\000Printer buffer allocation failed.\n\000qurt_hvx_lock failed\n\000qurt_hvx_unlock failed\n\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000scalar_indices\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000input\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000blur_y\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000blur_x\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000t83\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000t92\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000t97\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000hexagon-32-noos-hvx_128-no_runtime\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000offload_rpc.blur_y.s0.__outermost\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\001zR\000\004|\037\001\020\f\036\000\030\000\000\000\030\000\000\000t\363\377\377T\001\000\000\000B\f\036\b\237\001\236\002\000\000\0000\000\000\0004\000\000\000\270\364\377\377\004\b\000\000\000C\f\036\b\237\001\236\002\221\003\220\004\223\005\222\006\225\007\224\b\227\t\226\n\231\013\230\f\233\r\232\016\000\000\000\030\000\000\000h\000\000\000\224\374\377\377,\000\000\000\000A\f\036\b\237\001\236\002\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\001\020\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\001\000\000\000\000 \001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\001\020\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\003@\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\001\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\001\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\001\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\007\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000?\000\000\000\000\020\000\000\000\000\000\000\003\000\006\000?\000\000\000\200\r\000\000\000\000\000\000\003\000\004\000?\000\000\000\300\f\000\000\000\000\000\000\003\000\003\000?\000\000\000\020\003\000\000\000\000\000\000\003\000\002\000?\000\000\000\200\f\000\000\000\000\000\000\003\000\002\000?\000\000\000p\004\000\000\000\000\000\000\003\000\002\000@\000\000\000\300\f\000\000\"\000\000\000\001\000\003\000G\000\000\000\005\r\000\000\026\000\000\000\001\000\003\000P\000\000\000\033\r\000\000\030\000\000\000\001\000\003\000Y\000\000\000\342\f\000\000#\000\000\000\001\000\003\000b\000\000\000 \021\000\000\004\000\000\000\001\000\007\000k\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000x\000\000\000p\004\000\000\004\b\000\000\002\000\002\000\260\000\000\000\020\001\000\000\020\000\000\000\002\000\001\000\306\000\000\000\340\000\000\000\020\000\000\000\002\000\001\000\327\000\000\0000\001\000\000\020\000\000\000\002\000\001\000\004\001\000\000@\001\000\000\020\000\000\000\002\000\001\000#\001\000\000 \001\000\000\020\000\000\000\002\000\001\000G\001\000\000\360\000\000\000\020\000\000\000\002\000\001\000W\001\000\000\260\000\000\000\020\000\000\000\002\000\001\000i\001\000\000\320\000\000\000\020\000\000\000\002\000\001\000\230\001\000\000\300\000\000\000\020\000\000\000\002\000\001\000\264\001\000\000\240\000\000\000\020\000\000\000\002\000\001\000\306\001\000\000\000\001\000\000\020\000\000\000\002\000\001\000\332\001\000\000\000\000\000\000\000\000\000\000\020\000\000\000\354\001\000\000\000\000\000\000\000\000\000\000 \000\000\000\371\001\000\000\000\000\000\000\000\000\000\000\020\000\000\000\"\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000=\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000]\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000i\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000w\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000\242\002\000\000P\001\000\000\000\001\000\000\"\000\002\000\267\002\000\000P\002\000\000\260\000\000\000\"\000\002\000\316\002\000\000\000\003\000\000\b\000\000\000\"\000\002\000\363\002\000\000\000\000\000\000\000\000\000\000 \000\000\000\013\003\000\000\020\003\000\000T\001\000\000\022\000\002\000-\003\000\000\200\f\000\000,\000\000\000\022\000\002\000T\003\000\000\260\f\000\000\f\000\000\000\022\000\002\000\177\003\000\000\000\000\000\000\000\000\000\000\020\000\000\000\215\003\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000?\000\000\000\000\020\000\000\000\000\000\000\003\000\006\000?\000\000\000\200\r\000\000\000\000\000\000\003\000\004\000?\000\000\000\300\f\000\000\000\000\000\000\003\000\003\000?\000\000\000\020\003\000\000\000\000\000\000\003\000\002\000?\000\000\000\200\f\000\000\000\000\000\000\003\000\002\000?\000\000\000p\004\000\000\000\000\000\000\003\000\002\000@\000\000\000\300\f\000\000\"\000\000\000\001\000\003\000G\000\000\000\005\r\000\000\026\000\000\000\001\000\003\000P\000\000\000\033\r\000\000\030\000\000\000\001\000\003\000Y\000\000\000\342\f\000\000#\000\000\000\001\000\003\000b\000\000\000 \021\000\000\004\000\000\000\001\000\007\000k\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000x\000\000\000p\004\000\000\004\b\000\000\002\000\002\000\260\000\000\000\020\001\000\000\020\000\000\000\002\000\001\000\306\000\000\000\340\000\000\000\020\000\000\000\002\000\001\000\327\000\000\0000\001\000\000\020\000\000\000\002\000\001\000\004\001\000\000@\001\000\000\020\000\000\000\002\000\001\000#\001\000\000 \001\000\000\020\000\000\000\002\000\001\000G\001\000\000\360\000\000\000\020\000\000\000\002\000\001\000W\001\000\000\260\000\000\000\020\000\000\000\002\000\001\000i\001\000\000\320\000\000\000\020\000\000\000\002\000\001\000\230\001\000\000\300\000\000\000\020\000\000\000\002\000\001\000\264\001\000\000\240\000\000\000\020\000\000\000\002\000\001\000\306\001\000\000\000\001\000\000\020\000\000\000\002\000\001\000\332\001\000\000\000\000\000\000\000\000\000\000\020\000\000\000\354\001\000\000\000\000\000\000\000\000\000\000 \000\000\000\371\001\000\000\000\000\000\000\000\000\000\000\020\000\000\000\"\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000=\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000]\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000i\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000w\002\000\000\000\000\000\000\000\000\000\000\020\000\000\000\242\002\000\000P\001\000\000\000\001\000\000\"\000\002\000\267\002\000\000P\002\000\000\260\000\000\000\"\000\002\000\316\002\000\000\000\003\000\000\b\000\000\000\"\000\002\000\363\002\000\000\000\000\000\000\000\000\000\000 \000\000\000\013\003\000\000\020\003\000\000T\001\000\000\022\000\002\000-\003\000\000\200\f\000\000,\000\000\000\022\000\002\000T\003\000\000\260\f\000\000\f\000\000\000\022\000\002\000\177\003\000\000\000\000\000\000\000\000\000\000\020\000\000\000\215\003\000\000\000\000\000\000\000\000\000\000\020\000\000\000\001\000\000\000*\000\000\000)\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\002\000\000\000\003\000\000\000\004\000\000\000\005\000\000\000\006\000\000\000\007\000\000\000\b\000\000\000\t\000\000\000\n\000\000\000\013\000\000\000\f\000\000\000\r\000\000\000\016\000\000\000\017\000\000\000\020\000\000\000\021\000\000\000\022\000\000\000\023\000\000\000\024\000\000\000\025\000\000\000\026\000\000\000\027\000\000\000\030\000\000\000\031\000\000\000\032\000\000\000\033\000\000\000\034\000\000\000\035\000\000\000\036\000\000\000\037\000\000\000 \000\000\000!\000\000\000\"\000\000\000#\000\000\000$\000\000\000%\000\000\000&\000\000\000'\000\000\000(\000\000\000\000\000\000\000,\021\000\000\"(\000\000\000\000\000\0000\021\000\000\"\037\000\000\000\000\000\0004\021\000\000\"$\000\000\000\000\000\0008\021\000\000\" \000\000\000\000\000\000<\021\000\000\"\032\000\000\000\000\000\000@\021\000\000\"\036\000\000\000\000\000\000D\021\000\000\")\000\000\000\000\000\000H\021\000\000\"\031\000\000\000\000\000\000L\021\000\000\"\035\000\000\000\000\000\000P\021\000\000\"\033\000\000\000\000\000\000T\021\000\000\"\034\000\000\000\000\000\000\000\020\000\000#\000\000\000\240\r\000\000$\020\000\000#\000\000\000\200\r\000\000H\020\000\000#\000\000\000\300\r\000\000l\020\000\000#\000\000\000\240\r\000\000\220\020\000\000#\000\000\000\000\016\000\000\264\020\000\000#\000\000\000 \016\000\000\330\020\000\000#\000\000\000@\016\000\000\b\021\000\000#\000\000\000\000\020\000\000\f\021\000\000#\000\000\000\200\016\000\000\020\021\000\000#\000\000\000\000\017\000\000\000\000\000\000\000.plt\000.text\000.rodata.str1.1\000.rodata\000.eh_frame\000.data.rel.ro\000.got\000\000.L.str\000.L.str.5\000.L.str.7\000.L.str.8\000_DYNAMIC\000buffer_t.cpp\000offload_rpc.blur_y.s0.__outermost.par_for.blur_y.s0.y.y\000plt_halide_do_par_for\000plt_halide_error\000plt_halide_error_buffer_allocation_too_large\000plt_halide_error_out_of_memory\000plt_halide_error_unaligned_host_ptr\000plt_halide_free\000plt_halide_malloc\000plt_halide_msan_annotate_memory_is_initialized\000plt_halide_string_to_string\000plt_qurt_hvx_lock\000plt_qurt_hvx_unlock\000halide_do_par_for\000halide_error\000halide_error_buffer_allocation_too_large\000halide_error_out_of_memory\000halide_error_unaligned_host_ptr\000halide_free\000halide_malloc\000halide_msan_annotate_memory_is_initialized\000halide_qurt_hvx_lock\000halide_qurt_hvx_unlock\000halide_qurt_hvx_unlock_as_destructor\000halide_string_to_string\000offload_rpc.blur_y.s0.__outermost\000offload_rpc.blur_y.s0.__outermost_argv\000offload_rpc.blur_y.s0.__outermost_metadata\000qurt_hvx_lock\000qurt_hvx_unlock\000.symtab\000.dynsym\000.hash\000.rela.got\000libhalide_hexagon_code.so\000libhalide_hexagon_remote_skel.so\000.dynamic\000.strtab\000\000\000\000\001\000\000\000\327\003\000\000\016\000\000\000\275\003\000\000\020\000\000\000\000\000\000\000\004\000\000\000H\027\000\000\006\000\000\000\250\024\000\000\013\000\000\000\020\000\000\000\005\000\000\000\000\031\000\000\n\000\000\000\t\004\000\000\003\000\000\000 \021\000\000\027\000\000\000\000\030\000\000\024\000\000\000\007\000\000\000\002\000\000\000\204\000\000\000\007\000\000\000\204\030\000\000\b\000\000\000x\000\000\000\t\000\000\000\f\000\000\000\001\000\000p\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\001\000\000\000\006\000\000\000\240\000\000\000\240\000\000\000\260\000\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\006\000\000\000\001\000\000\000\006\000\000\000P\001\000\000P\001\000\000l\013\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\f\000\000\000\001\000\000\0002\000\000\000\300\f\000\000\300\f\000\000s\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\033\000\000\000\001\000\000\000\002\000\000\000\200\r\000\000\200\r\000\000\242\001\000\000\000\000\000\000\000\000\000\000\200\000\000\000\000\000\000\000#\000\000\000\001\000\000\000\002\000\000\000\200\017\000\000\200\017\000\000\200\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000-\000\000\000\001\000\000\000\003\000\000\000\000\020\000\000\000\020\000\000\024\001\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000:\000\000\000\001\000\000\000\002\000\000\000 \021\000\000 \021\000\000\350\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\235\003\000\000\002\000\000\000\002\000\000\000\b\022\000\000\b\022\000\000\240\002\000\000\f\000\000\000\031\000\000\000\004\000\000\000\020\000\000\000\245\003\000\000\013\000\000\000\002\000\000\000\250\024\000\000\250\024\000\000\240\002\000\000\f\000\000\000\031\000\000\000\004\000\000\000\020\000\000\000\255\003\000\000\005\000\000\000\002\000\000\000H\027\000\000H\027\000\000\264\000\000\000\t\000\000\000\000\000\000\000\004\000\000\000\004\000\000\000\263\003\000\000\004\000\000\000\002\000\000\000\000\030\000\000\000\030\000\000\374\000\000\000\b\000\000\000\007\000\000\000\b\000\000\000\f\000\000\000\001\004\000\000\003\000\000\000\002\000\000\000\000\031\000\000\000\031\000\000\t\004\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\370\003\000\000\006\000\000\000\002\000\000\000\f\035\000\000\f\035\000\000\210\000\000\000\f\000\000\000\000\000\000\000\004\000\000\000\b\000\000"
	.size	.Lhalide_hexagon_code.data, 8752

	.type	.Lhalide_shared_runtime.data,@object # @halide_shared_runtime.data
	.p2align	5
.Lhalide_shared_runtime.data:
	.asciz	"\177ELF\001\001\001\000\000\000\000\000\000\000\000\000\003\000\244\000\001\000\000\000\000\000\000\0004\000\000\000\000\360\000\000`\000\000\0004\000 \000\003\000(\000\017\000\r\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\220\000\000\000\220\000\000\005\000\000\000\000\020\000\000\001\000\000\000\000\220\000\000\000\220\000\000\000\220\000\000\000`\000\000\000`\000\000\006\000\000\000\000\020\000\000\002\000\000\000\310\350\000\000\310\350\000\000\310\350\000\000\210\000\000\000\210\000\000\000\004\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000BB\000\000\016\324Ij\034\300\216\221\000\300\234RBB\000\000\016\316Ij\034\300\216\221\000\300\234RBB\000\000\016\310Ij\034\300\216\221\000\300\234RBB\000\000\016\302Ij\034\300\216\221\000\300\234RAB\000\000\016\334Ij\034\300\216\221\000\300\234RAB\000\000\016\326Ij\034\300\216\221\000\300\234RAB\000\000\016\320Ij\034\300\216\221\000\300\234RAB\000\000\016\312Ij\034\300\216\221\000\300\234RAB\000\000\016\304Ij\034\300\216\221\000\300\234R@B\000\000\016\336Ij\034\300\216\221\000\300\234R@B\000\000\016\330Ij\034\300\216\221\000\300\234R@B\000\000\016\322Ij\034\300\216\221\000\300\234R@B\000\000\016\314Ij\034\300\216\221\000\300\234R@B\000\000\016\306Ij\034\300\216\221\000\300\234R@B\000\000\016\300Ij\034\300\216\221\000\300\234R\341b`\333\020@`p\020\034\364\353\021\300Pv\000\321\002\361\373\177\377\017x@\000Z\000\320\000\363`A\020\333\000\300\000u\002Q\001\361\020\300\335\221\001@\202s\377\177\377\017\340\340\202D@?\020P\306?\000Y\373\177\377\0178@\000X\340\377\200\227=B\000\000\000NIj\020\034\364\353\001@\000\000\020\311\200\221\377\177\377\0178@\000Z\000\300\220\221\377\177\377\017 @\000Z \300\220\221\377\177\377\017\b@\000Z@\300\220\221\376\177\377\017p@\000Z`\300\220\221\376\177\377\017X@\000Z\200\300\220\221\376\177\377\017@@\000Z\240\300\220\221\376\177\377\017(@\000Z\300\300\220\221\376\177\377\017\020@\000Z\340\300\220\221\375\177\377\017x@\000Z\000\301\220\221\004>\200\t\375\177\377\017X@\000X\036\300\036\220\000D\000\000\000@\201u\020\034\364\353\002\340\000\\:B\000\000\000^Ij#\300\000x\001@\000\000\202\311\000\260\004\300\202\221\004\300\004\222\n\340D\020\002\300\202\221\000\303\242\240\362\340\377\\\316\300\003\026\003\300\202\221\203\300\003\260\003\300\003\222\f\300C\020$\000\023H\204\300\004\260\000\303\244\240\362\340\377\\\274\300\000X#@\000x\000@\000\177\000\300\000\177\004\300\202\221\004\301\004\260\004\300\004\222\f\300D\020\004\300\202\221\004\301\004\260\000\303\244\240\362\340\377\\\244\302\003\026#@\000x\000@\000\177\000\300\000\177\004\300\202\221\204\301\004\260\004\300\004\222\f\300D\020\004\300\202\221\204\301\004\260\000\303\244\240\362\340\377\\\214\303\003\026#@\000x\000@\000\177\000\300\000\177\004\300\202\221\004\302\004\260\004\300\004\222\f\300D\020\004\300\202\221\004\302\004\260\000\303\244\240\362\340\377\\t\304\003\026$@\000x\000@\000\177\000\300\000\177\003\300\202\221\203\302\003\260\003\300\003\222\016\300C\020\003\300\202\221\203\302\003\260\243@\000x\000\304\243\240\360\340\377\\Z\300\000X$@\000x\000\300\000\177\003\300\202\221\003\303\003\260\003\300\003\222\016\300C\020\003\300\202\221\003\303\003\260\303@\000x\000\304\243\240\360\340\377\\B\300\000X$\300\000x\003\300\202\221\203\303\003\260\003\300\003\222\016\300C\020\003\300\202\221\203\303\003\260\343@\000x\000\304\243\240\360\340\377\\,\300\000X$\300\000x\003\300\202\221\003\304\003\260\003\300\003\222\016\300C\020\003\300\202\221\003\304\003\260\003A\000x\000\304\243\240\360\340\377\\\026\300\000X$\300\000x\003\300\202\221\203\304\003\260\003\300\003\222(\300C\020\003\300\202\221\203\304\003\260#A\000x\000\304\243\240\360\340\377\\\001@\000\000\002\311\200\221\000\343\202:\000@\000u\020@\335G\036\370\036\226PB\003\304\000P\000x\000D\000\000\001\300\000x\364\177\377\017@\300\000Z\200 \004\236\036\300\036\226\000P\000x\000\037\004>\364\177\377\017\020\300\000X2B\000\000\000VIj\004\300\000x\001@\000\000\003\311\000\260\002\300\203\221\002\300\202\221\000A\002\362\002@\000x\001@\000\000\200\301\200C\000@_S\002\344\2004\004\300\203\221$@\204\221:\301\002 \004\300\203\221D@\204\221>\301\002 \004\300\203\221d@\204\221B\301\002 \004\300\203\221\204@\204\221F\301\002 \004\300\203\221\244@\204\221J\301\002 \004\300\203\221\304@\204\221N\301\002 \004\300\203\221\344@\204\221R\301\002 \004\300\203\221\004A\204\221V\301\002 \003\300\203\221#A\203\221Z\301\002 \362\177\377\017@@\000X\000\300ap$@\000x\001@\000\000\200\311\200\221\000@\237R\002\344\200;D@\000x\001@\000\000\200\311\200\221\000@\237R\002\344\200;d@\000x\001@\000\000\200\311\200\221\000@\237R\002\344\200;\204@\000x\001@\000\000\200\311\200\221\000@\237R\002\344\200;\244@\000x\001@\000\000\200\311\200\221\000@\237R\002\344\200;\304@\000x\001@\000\000\200\311\200\221\000@\237R\002\344\200;\344@\000x\001@\000\000\200\311\200\221\000@\237R\002\344\200;\004A\000x\001@\000\000\200\311\200\221\000@\237R\002\344\200;$A\000x\001@\000\000\200\311\200\221\000@\237R\002\344\200;\020@`p\020\034\364\353\256A\000\000\001DIj\000\300\000x\352\177\377\017x\300\000Z,B\000\000\000\330Ij\001@\000\000\001\312\200\221\030\000\020\200@\037\004>\000\000\000\000\000\000\000\000\000\000\000\000\020@`p\020\034\364\353\255A\000\000\001DIj\000\300\000x\351\177\377\017x\300\000Z+B\000\000\000\330Ij\001@\000\000\201\312\200\221\030\000\020\200@\037\004>\000\000\000\000\000\000\000\000\000\000\000\000\360\177\377\017\000\300\000X\000\000\000\000\000\000\000\000\370\177\377\017 \300\000X\000\000\000\000\000\000\000\000\001@bp\002@cp\000<\024p\000\300\244P\036\300\036\226\000\000\000\000\000\000\000\000\000\000\000\000\001@bp\002@cpC0\0260\000@\246P\000<Tp\036\300\036\226\000\000\000\000\000\000\000\000\000@Cu0\034\364\353 @ \\\006\n\r\352\020D\002\365\022A\000\365\024B\003\363\000\300\000\177\001@\000\000\000@\000Z\000S\022\365\002\321\020\365\b\300@\0201@\021\260\366\364\262!\000\300\000x\r\036\024>@\037\006>\000@\000x\r\036\024>@\037\006>\000\000\000\000\000\000\000\000\000\000\000\000(B\000\000\004FIj\000\300\235\240\001@\000\000\004\313\204\221\004\300\204\221\000\300\244P\036\300\036\226\251A\000\000\201NIj\000<\000h\345\177\377\017h\300\000Z@?\000Z\000\000\000\000\000\000\000\000\252A\000\000\001@Ij\000<\000h\345\177\377\017(\300\000Z@?\000H\000\000\000\000\000\000\000\000\252A\000\000\001PIj\000<\000h\344\177\377\017h\300\000Z@?\000H\000\000\000\000\000\000\000\000\253A\000\000\201CIj\000<\000h\344\177\377\017(\300\000Z@?\000H\000\000\000\000\000\000\000\000\253A\000\000\001UIj\000<\000h\343\177\377\017h\300\000Z@?\000H\000\000\000\000\000\000\000\000\254A\000\000\001@Ij\000\300\000x\343\177\377\017(\300\000X\000\000\000\000\000\000\000\000\000\000\000\000\000\300\237R\000\000\000\000\000\000\000\000\000\000\000\000\000\300\237R\000\000\000\000\000\000\000\000\000\000\000\000\000\300\237R\000\000\000\000\000\000\000\000\000\000\000\000 `\000~\306?\001Y\253A\000\000\201NIj\000<\000h\341\177\377\017x\300\000Z\000?\020H\000\300\237R\000\000\000\000\000\000\000\000\000\000\000\000#B\000\000\001\306Ij\001@\000\000\002\313\201\221 \000!\200\300?\020P\000\000\000\000\000\000\000\000\"B\000\000\001\326Ij\001@\000\000\202\313\201\221 \000!\200\300?\020P\000\000\000\000\000\000\000\000\"B\000\000\005FIj\000\300\235\240\001@\000\000\205\313\205\221\005\300\205\221\000\300\245P\036\300\036\226!B\000\000\006VIj\000\300\235\240\001@\000\000\006\314\206\221\006\300\206\221\000\300\246P\036\300\036\226!B\000\000\004FIj\000\300\235\240\001@\000\000\204\314\204\221\004\300\204\221\000\300\244P\036\300\036\226 B\000\000\002VIj\000\300\235\240\001@\000\000\002\315\202\221\002\300\202\221\000\300\242P\036\300\036\226 B\000\000\002FIj\000\300\235\240\001@\000\000\202\315\202\221\002\300\202\221\000\300\242P\036\300\036\226\037B\000\000\002VIj\000\300\235\240\001@\000\000\002\316\202\221\002\300\202\221\000\300\242P\000\300@\205 @\000z\036\300\036\226\000\000\000\000\000\000\000\000\036B\000\000\001\336Ij\001@\000\000\202\316\201\221\000\300\202\241\001@\000\000\000\317\201\221\000@\237R\001\300\000<\000\000\000\000\000\000\000\000\000\000\000\000\036B\000\000\020FIj\020\034\364\353 \300\000x\001@\000\000\201\317\220\221\002\300\001\222\000\300\241\240\001\300\302\214\002\300\201t\364\340r\020\001@\000\000\000\317\220\221\000@\000\221\022\300\002$\001@\000\000\200\316\220\221\000@\200\221\001@\000\000\201\317\220\221\000\300A<@\037\004>\245A\000\000\000QIj\333\177\377\0170\300\000Z\b\300\000\020\333\177\377\017(\300\000Z\004\300\000X\340\377\337x\001@\000\000\201\316\220\221\000\300\201\241\001@\000\000\001\317\220\221\001\300\001<\001@\000\000\201\317\220\221\000\300A<@\037\004>\000\000\000\000\000\000\000\000\000\000\000\000\024\340A\025\003\301 \363\020@\003`\000\300\000\177\004@\002\221\000\302\240\241\306?@Y \200\000\260\"1\003002\020p\000\300\237R\000\000\000\000@<\003|\000F\202\322\005@\035\260&@\000x\200\317\035<J@\000\\\305C\005\260\000\300\000\177\bB\003\3653s\314\f\242\301\000x\nBH\3453s\314\f\203A\000x\307\376\337x\016CH\345\f\340+s\nL\r\365\f\300np\n\302I\347\352\314\n\323\f\300kp\nL\r\365\f\300op\n\303I\347\342L\n\323\n\340\004|\"C\002\200\200\312\210\322\fGB\345f1g0-\300\202\341M\301\203\341\350\310\f\323\314`\337\\\bF\b\260x\302\245\253\306\347\264\024\374\177\377\017p@\000Z\"\300\005\260\036\300\036\226\370\340\364\020\272\377\377Y\006\300\001\025\375\177\377\017\030\300\000X\346\377\177|@F\202\322\372\370\337\\\242@\202\200\245E\000x\b\302\240\253\374\177\377\017X\300\000X\000\000\000\000\020A\000\365\376p\335\247J\300\235\240\000A=\260\001\302=\260\032@\000|\026B\003\365FV\335\241D\332\335\241\002A\000x\022@dpBB\335\241H\322\335\241GT\335\241E\330\335\241\325\177\377\017(@\000ZA\332\335\2414\310\335\221\223KU\215 \364\024\200\031T\025\215`\301 \201\024X \\\037@\000\000\340\307\023u\025\300yp\000Z\224\322\332\310\000\\\336\300\000\020\236A\000\000\002HIj2\301\000X\030@tp\001\300\022u\000Z\230\322\022\310 \\\016\300K\020\322A\000\\\000\300\000u\000\340\000\\\235A\000\000\002[Ij\034\301\000X\316\300@\020\344\301\000\\\030@\000x\000@\377\003\031@\000x\022\300\000x@X\366\322a\330\366\322\000A k\032\330\000\\\000P\002\004\f(\r(\323\177\377\017\000@\000Z\000V\027\365\002\324\025\365 @\370\322\370x\337\\\026@\001\365\362\377\362\277B\326\335\241\000P\002\004\f(\r( V\364\322a\326\364\322\000A k\030X\000\\\000\300\000\177\322\177\377\017 @\000Z\000V\027\365\002\324\025\365@T\340\322\370x\337\\\026@\001\3652\300\022\260B\326\335\241\000V\027\365\022z\022\004\002(\003(\321\177\377\017 \300\000Z\000@\376\003\002(\003(\321\177\377\017@\300\000Z\346@\340\200\323X{\r`\303\000xzo1\004A\300\000x\004@F\345\b\301F\345\002\340%s\004B\003\365\002\300hp\004\300G\347\344\302\004\323\002\300ep\004B\003\365\002\300ip\004\301G\347\340B\004\323$\300\000x\"R\000\214#R\001\214\367B\377\017\000\300\000x\302\322!\217\032\300B\345;\300\202\341\033C\000\357\000\321\020\365\367\177\377\017x@\000Z\364\306\032\323\270A\000\000\202VIj\001\300pp\364\177\377\017\b\300\000Z\002T\025\365\2010d(\367\177\377\017(\300\000ZT\301\312\021\231A\000\000\002AIj\001\300pp\363\177\377\0178\300\000ZT\300\000X:\300\000\020\227A\000\000\202VIj\\\300\000X\227A\000\000\202NIjV\300\000XL\300\000\\\227A\000\000\202ZIjN\300\000X\227A\000\000\002^Ij\003@A\211\000\321\020\365\362\177\377\017(@\000Z\021\300cpW_\327\214\t0\2210\001@A\205$y\377\\B\326\335\2418\300\013\020\025T\331\214\266y\263\277@\300\302&\204O\016\027\022\300\000|\226A\000\000\002AIj$\300\000X\226A\000\000\002DIj\036\300\000X\226A\000\000\202PIj\001\300pp\360\177\377\017p@\000Z\022\300Rv\023_\022\214\2010$(VB\000X\002\322\023\365\225A\000\000\202\325Ij\360\177\377\017(@\000Z\000\321\020\365L\302\000X\000Q\020\365\001<\004(\364\177\377\017\030\300\000ZB\302\000X\fX\000\\`yvu\030@\000x\027\300\000x\f@\000X\031\300\000x\020@\000\000`\306SvX\300\224\303\224\300\230\313B@\364\200\022z\022\004\000(\001(\300t\026\202\311\177\377\017X\300\000Z\000@\376\003\002(\003(\311\177\377\017p\300\000Z\342@\340\200\t}\000\000\"<\006(\007\300\000xH@\342\200\000\300\002\205\001H\340\322\340\302$\323\000\300\001k\342D\030\323\000B\000\364\001\303\001\364\000\306\200\322\024X\002\364\022@\027\364\025Y\003\364\023\301\027\364\002T\025\365 ,\024(\024|\000\260\001\300 \260\360\177\377\017X@\000Z\000\300tp\316\300\337\020\341\377\367\277`bQ\021a\300\027v\002\327!\363#B\002\214\"\306\000x\030B#`\000T\000\362\0030\005(\024\300 \\^\300\000X\364\177\343\277\377\342\003\247\000@\000\177\000\200\000\177\000\300\000\177B\301\000XPL\000\024\0030\005(\006t\337x\003@4\363\007@`p\344\377 \227\306A\004\216\350\177\343\277 @\203u\344\377\340\277\000B\b`\003E&\361\005\300`p&@ \\\b@\243p\306~\343\277\000\300\000\177\000\300\000\177 AHu\005@dp\bt\337x\344\377$\227\310A\004\216\006@\203t\344\177\345\277)\300\000z\006F\006\260\007@ep\003I(\361\377\346\247\247\b\200\243p\306\376\343\277 AHu\006\340\203t\003F\006\260\377\342\245\247\343_\024t\003@\224t\377\177\377\017\370\342\024@PC\000\024\0040\006(\007t\337x\004@#\363\b@`p\345\377 \227\307A\005\216\351\177\344\277 @\204u\345\377\340\277\000B\t`\004F'\361\006\300`p&@ \\\t@\244p\307~\344\277\000\300\000\177\000\300\000\177 AIu\006@ep\tt\337x\345\377%\227\311A\005\216\007@\204t\345\177\346\277,\300\000z\007F\007\260\b@fp\004L)\361\377\346\250\247\t\200\244p\307\376\344\277 AIu\007\340\204t\004F\007\260\377\342\246\247\344_\003t\004@\203t\377\177\377\017\370\342\003@PD\000\024\0030\006(\007t\337x\003@$\363\b@`p\345\377 \227\307A\005\216\351\177\343\277 @\203u\345\377\340\277\000B\t`\003F'\361\006\300`p&@ \\\t@\243p\307~\343\277\000\300\000\177\000\300\000\177 AIu\006@ep\tt\337x\345\377%\227\311A\005\216\007@\203t\345\177\346\277,\300\000z\007F\007\260\b@fp\003L)\361\377\346\250\247\t\200\243p\307\376\343\277 AIu\007\340\203t\003F\007\260\377\342\246\247\343_\004t\003@\204t\377\177\377\017\370\342\004@\bC0\024\f0\004(\006t\337x\005@#\363\b@`p\347\377 \227\306A\007\216\351\177\345\277 @\205u\345\377\340\277\000B\t`\004D&\361\006\300`p&@ \\\t@\244p\307~\344\277\000\300\000\177\000\300\000\177 AIu\006@ep\tt\337x\345\377%\227\311A\005\216\007@\204t\345\177\346\277,\300\000z\007F\007\260\b@fp\004L)\361\377\346\250\247\t\200\244p\307\376\344\277 AIu\007\340\204t\300@\337\\\004F\007\260\377\342\246\247\024@cp\000\200\000\177\000\300\000\177l@\001\020\002\300tp\000E!`\000T\000\362\001(\023+&@ \\\002\300`p\026@\000X\000@\000\177\000\300\000\177 AGu\342\177\024t\005`\201t\002\340\224t\001F\005\260\377\342\244\247\377\177\377\017\370\343\024@\024@bp\000\200\000\177\000\300\000\177B\300\000X\370L0\024\0020\001(\004t\337x\002@4\363\006@`p\345\377 \227\304A\005\216 @\202u\0023'3\030A\007`\001A$\361\004\300`p\320`\377\\\007@\241p\305~\341\277\000\300\000\177 AGu\004@bp\007t\337x\342\377\"\227\307A\002\216\005@\201t\342\177\344\277(\300\000z\005F\005\260\006@dp\001H'\361\377\346\246\247\007\200\241p\305\376\341\277\254\377\377Y\002\300tp\336\177\377\017@@\000Z\000\321\020\365\242A\000\000\202XIj\001\300pp\336\177\377\017\020\300\000Z\002R\023\365\2010d(\341\177\377\0170\300\000Z0I\335\221\022\311\335\221\364H\335\221\326\310\335\221\270H\335\221\232\310\335\221\036\300\036\226\000\000\000\000\202A\000\000\bXIj0<\002|#@\000x\t@\035\260\006`\"s\000\302]<\"B\t\260\000@\000\177\002\n\n\352\000@\000\177\000\300\000\177\354A\006v\t@bp\340A\203u\342\377\342\277\016@\000\\\fL(:\001\302\251\241\206\\\006\201#\300\003\260\000D\206\322\356\370\377\\\003F\000xx\300\t<\333\177\377\017X@\000Z\377\343\t\247\036\300\036\226\000\000\000\000\000\000\000\000\000\000\000\000\020@bp\021@ap \034\364\353\002\300\002\221\000\322\335\241\n\343\002\021\366A\000\000\001\302Ij\b@\000X\002\342\201:\200A\000\000\202\314Ij\332\177\377\017@@\000Z\001\300qp\001@qp$@\000x\212\021\013H\332\177\377\017p@\000Z\002\322\023\365!\300P\221 @\001u0@\335C\022\300\335C\036\320\036\226\177A\000\000\202^Ij\001\300qp\331\177\377\0178\300\000Z\001@qp$@\000x\f\036\212)\002R\023\365\000\037\005>\331\177\377\017`\300\000X\000\000\000\000\000\000\000\000\000@\002u\020@ap@\034\364\353\016\n\025\352\260@\000\\\000\326\335\241~A\000\000\002ZIj\2010)0\330\177\377\017\030\300\000Z\001@pp$@\000x\002\300\321\221\245A\000\000\022BIj\330\177\377\017P\300\000Z\327\177\377\017P@\000Z\2420\2010\372\177\377\017\030@\000Z\222\002\201P\327\177\377\017 @\000Z\2420\2010\371\177\377\017h@\000Z\222\003\201P\326\177\377\017p@\000Z\2420\2010\001@pp$@\000xB\300\321\221\327\177\377\017 \300\000Z\326\177\377\0170@\000Z\2420\2010\372\177\377\017x@\000Z\002C\021\260\001\300pp\341@\221\221X\340\302$|A\000\000\022LIj\016(\r(\242A\000\000\023\332Ij|A\000\000\024DIj\000@\000\177\000\300\000\177\325\177\377\017 @\000Z\2420\2010\221\b\024H\001@pp\002\325\201:\330\177\377\0170@\000Z\003\337\002\214\324\177\377\017X@\000Z\2620\2010\221\b\024H\001\325\001\363\022\001\201P\327\177\377\017h@\000Z\003\337\002\214\324\177\377\017\020@\000Z\2620\2010\221\b\024H\001\325\001\363\022\002\201P\327\177\377\017 @\000Z\003\337\002\214\323\177\377\017H@\000Z\3020\2010\221\007\rA6@\026\260\302\341\262!\252A\000\000\202OIj\n\300\000XyA\000\000\202\313Ij\001@pp\025\036\034>\007\036\016>\322\177\377\017X@\000X\036\300\036\220\000@\001\205\020@`p \034\364\353\021\300\000x\355A\000\000\022VIj\000\322\335\241\002@\000\000\002\320\222\221*@\000\\\000\301\002\241\310\177\377\017H@\000Z\002@\000\000\200\320\222\221\021@\000x\002@\000\000\000\321\222\221\023@\200\221\020\340\002$\261\000\200P\000\300\241P\000@\000u\021`\200t3@\223\221\374\340r$\307\177\377\017p@\000Z\002@\000\000\200\320\222\221\000@qp\005\036\f>\036\300\036\226\000\000\000\000\000\000\000\000\000\000\000\000\353A\000\000\000\326Ij\002@\000\000\000\320\200\221\300?\000\020\000\000\000\000\000\000\000\000\000\000\000\000\020@`p \034\364\353\353A\000\000\022BIj\000\322\335\241\002@\000\000\221\320\222\221\306\177\377\017\b@\000Z\000\300qp\000@qp\002@\000\000\001Q\222\221\022\300\335\221\002@\201\221\001\322\260\241\030 \f\236\305\177\377\017X@\000X\036\300\036\220\340\177au\020D\005\365`\034\364\353\024B\003\365\022@`p\036\n%\352\002V\335\241\001\330\335\241\026@ \\\000\332\335\241@C\001\214!<\0241\020@\004`\022\340 \333\004\300\300\221\000B\204\322\b\330 \\\000\200\000\177\0213\200'@\300\201\021`R\001\304\026\300\000|b\300\300\221\000V\202\322.\310\000\\\030C\000\260\363\177\341\277\031S\000\260\032\343\000\260\000@\000\177\000@\000\177\000\300\000\177\000R\023\365\002T\025\365\004\320\021\365\375\177\377\017h\300\000Z\002`\000|\000@\330\221\006\300\331\221\366B\026\323\364T\006\323\004\300\332\221\200V\200\322\360\320\004\323\346\340\337\\%\036,>\027\036\036>8@\335\221\032\300\335\221\036\300\036\226\000@\322\221$\300\322\221\346T\000\323\340P\004\323\302L\222\221\260\300\335\221\001@fp\036\036%>V@\335\2218\300\335\221\245\177\377\017\030@\000X\032@\335\221\036\300\036\220\000\000\000\000\000\000\000\000\000\000\000\000\002@\300\221$\300\300\221\000D\202\322\000\310_S\341A\000x\004@\000|B\300\300\221\373\177\377\017(\300\000X\000\000\000\000\000\000\000\000\000\000\000\000\001@\002\205\000@\004\205\b@\000|9\300\235\240\006`\000|\004H\301E\"\303!\221\005@ ~\342@\002\260dH\201A8\320\335\241\004@\303E\000\304\335\241\005@\000~d@\203A7\322\335\241$C\002\214\005@\000x\n\n\022\307\016E\005\3656T\335\2415\326\335\241\000@Bu\003F\335\241\023\310\335\241#H\335\241\024\310\335\241$H\335\241\004\306\335\241\005F\335\241\025\310\335\241%H\335\241\006\306\335\241\026H\335\241&\310\335\241\007F\335\241\027\310\335\241'H\335\241\b\306\335\241\030H\335\241(\310\335\241\tF\335\241\031\310\335\241)H\335\241\n\306\335\241\032H\335\241*\310\335\241\013F\335\2413\304\335\241\033H\335\241+\310\335\241\fF\335\241\034\310\335\241,H\335\241\r\306\335\241\035H\335\241-\310\335\241\016F\335\241\036\310\335\241.H\335\241\017\306\335\241\037H\335\241/\310\335\241\020F\335\241 \310\335\2410H\335\241\021\306\335\241!H\335\2411\310\335\241\022F\335\241\"\310\335\241:` \\2H\335\241\002\310\335\241\345\177\342\2777\b\026\b\nf\005\023\345\300\002v\f\300\000x\352\340E\022&\301\000X\bB%\363\020H\006\260\tH\007\260\016\300\000|(C\b\214\f@\000x\034~\211\227M\376\220\227\363\177\350\277!@\210u\fA\f\260\b\376\220\227\030J\023`\b\\(\363\312~\220\227\234\376\211\227\bM\b\355\213~\220\227M\377\220\227\316Nh\323\b\\+\363\021\177\211\227\034\377\220\227\bJ\b\355\034Q<\363\212\177\211\227\221\377\220\227\316Nh\323\bM\034\355\313\177\220\227M\300\220\221\316Nh\323\bJ1\363\034@\211\221\n\300\220\221\bK\b\355\034\\*\363\321@\220\221\222\300\211\221\326Nh\323\bM\034\355\224@\220\221\016\301\211\221\312Vh\323\bR4\363\034A\220\221O\301\220\221\022Q\b\355\021N<\363\034P\t\260\315\301\220\221pA \\\tP\020\260\210A\211\221\216\301\220\221\017O\021\355\312Jr\323\016H.\363\021\301\234\221\352Jn\323\rM\016\355\210A\234\221\023\300\234\221\352Jl\323\fA\f\260\220@\234\221\017\377\234\227\222\177\234\227\016\376\234\227\025~\211\227M\376\211\227\025N5\363\034P\034\260\224~\234\227\227\376\211\227\rM\025\355\024T7\363\326~\211\227\027\377\211\227\352Jl\323\017O7\363\216A\211\221U\377\211\227\rV\024\355\224\177\211\227\327\377\211\227\352Jl\323\rU\017\355\017R4\363\026\300\211\221\352Jl\323\rW\017\355\017S6\363R\300\211\221\352Jl\323\224@\211\221\326\300\211\221\022R\017\355\020P4\363\023A\211\221O\301\211\221\312Jr\323\022V\020\355\tP\t\260\315\301\211\221\021\2213\363\000\300\000\177\312Jr\323\tO\021\355\b\310.\363\bM\b\355\356\312h\323\316\316h\323B@\005\022\b\316\017\365\207G\f\304MD\f\214!@\205u\345\377\345\277\r\356\006\333\017B\016\260\214\300\207\233*A \\\006@\216\221\315\377\216\227\016L-\363\374\177\345\277!@\205u\214\300\207\233\005F\016\355\016B\017\260\315\177\217\227\006\300\217\221\020@\034`\022\301 \\\350Hd\323\017L-\363\214@\207\233\315\377\216\227\005\206\017\355\016B\016\260\006\300\216\221\350\310d\323\005\314-\363\005\306\005\355\356\310d\323\002\316\335\241fF\335\221\345\300\203\221\bNF\345\001\305\002\362\t\317\006\357\t\307\016\357Ba \\\002\310\335\241>\320\222\022%\303#\221\345\300\005\260%C\005\2148\304R \b\300\000|\001H\206\3222\351\000\\\000\300!\\\bE\"`\b@\035\2603\b\005H\002C\b\260\007S\b\260\bc\b\260\001\301\201\221\034@\000X\006@\035\260\t@hp\000\300\000\177%@\005\260\tA\t\2600@\216\221\212\357\310;\021_\020\214\214\357\307;\000@\000\177\000\200\000\177\220\357\302;\026\301\000X\216C\005\304\214A\005\304\000@\005u\017\300\000xM@\216\221L\300\214\221\nD\r\355\f\304\f\355\013_\n\214$\300\000\\ H\000\\\000@\nu\r@\000x\017\300ep\000A\005`\017@hp\000@\000\177\000\300\000\177\020\300\317\221\200J\220\322\322\310\000\\-\200\r\260\017\301\017\260\017@ep\000@\000\177\000\300\000\177\r_\f\214\270x\377\\\000\317e\362\374\177ov\021E/\363\020\300ep\000G\221\205<H\000\\\034\334\005\363\360@\021v\021\177\351\277\362{\311\227\364\375\311\227\366\177\360\277 @\220u\340r\311\247\360\364\311\247\030A\026`\360\177\345\277\024I\t\365\362\377\311\227\034@ \\\000@\000\177\000\300\000\177\024@qp\021\177\361\277\360\177\360\277\000\322\325\241\025@tp\362}\324\227\366\373\324\227\362\177\324\227\360\362\324\247\000\200\000\177\340\366\324\247\000\322\324\241px\377\\\300\300\234uRC\020\214\034\320/\363\374\300\034\260\377\177\377\017\022|&\3331\303\034\214\000A\021`\000@\000\177\000@\000\177\000\300\000\177\360@\334\221\324\300\334\221\362D\334\221\007\324\334\241\366B\334\221(\322\334\241\322D\334\221\030\326\334\241\264@\334\221'\322\334\241\326B\334\221\006\324\334\241\262D\334\221\b\320\334\241\224@\334\221\027\326\334\241\266B\334\221&\322\334\241\222D\334\221\026\326\334\241p@\334\221%\322\334\241\226B\334\221\004\320\334\241rD\334\221\025\326\334\241P@\334\221$\322\334\241vB\334\221\003\320\334\241RD\334\221\024\326\334\2410@\334\221#\322\334\241VB\334\221\002\320\334\2412D\334\221\023\326\334\241\020@\334\221\"\322\334\2416B\334\221\005\324\334\241\022D\334\221\022\326\334\241\026B\334\221\001\320\334\241\034\270\374\277!R\334\241\021\326\334\241\366\376\377Y\017\300mp\r_\f\214\362X\377\\\000\317e\362:\377\377Y\214\177\377\017(@\000Z\001@\000x\002\364\000x\020G\335\221\362\306\335\221\324F\335\221\266\306\335\221\036\300\036\226bF\335\221d\302\335\221\000D\202\322\274\330 \\\006`\000|\b@\000|\000@\000\177d\304\335\221\000D\202\322\260\310 \\!\036,>$*6\336n@\335\221\005\324\335\241\031*\255\336\002DN\345\214B\335\221\024\322\335\241\003E\016\357=\036\267>\003O\004\357\257*\277\336\267*G\336\000L\202\322\252D\335\221\007\326\335\241\324D\335\221\006\322\335\2416A\335\221%\324\335\241\362D\335\221\b\326\335\241\024C\335\221&\322\335\241\276*W\336\022E\335\221\t\326\335\2414C\335\221'\322\335\241\306*_\3362E\335\221\n\326\335\241TC\335\221(\322\335\241\316*g\336RE\335\221\013\326\335\241tC\335\221)\322\335\241\326*\347\336\204D\335\221\033\326\335\241\264A\335\221$\312\335\241rE\335\221\f\324\335\241\222E\335\221*\322\335\241\266C\335\221+\322\335\241\347*v\336\262E\335\221\r\324\335\241\324C\335\221,\322\335\241\326E\335\221\035\324\335\241\362A\335\221-\326\335\241u*\375\336\365*\207\336\364E\335\221\017\326\335\241\026D\335\221.\324\335\241\022F\335\221\037\326\335\2414B\335\221/\322\335\241\206*\225\3364D\335\221\021\322\335\2416F\335\221 \324\335\241TD\335\2210\326\335\241VF\335\2213\302\335\241\023L\335\241!\324\335\241#D\335\2411\326\335\241\022F\335\241\"\310\335\241T`\337\\2\310\335\241\206\177\377\017\000@\000Z\001@\035\260\002\364\000x.\377\377Y\000\000\000\000\000\000\000\000\000\000\000\000\020@ap\004@\000| \034\364\353A@\000xB\300\301\221\022A\002\361\005*\013h\000D\222\322\030\330\000\\\024c\202\021S\376\337x\021@`p@@\220\221\026\300\002$\341\301\200\221\000Q\020\365\302\300\201\221\000\300\242P\020\300\000\020\000@sp\005\036\f>\036\300\036\226\263\375\337x\000@sp\005\036\f>\036\300\036\226\000Q\020\365B\300\320\221\"\301\302\2146A\000\000\030@\000Z\023@\000x\002\302\320\241\000@sp\005\036\f>\036\300\036\226\000\300\235\240\341\301\201\221\241\300\201\221\000\300\241P\036\300\036\226\000\000\000\000\000\000\000\000\000\000\000\000\020@`p\021@ap \034\364\353\302A\000\000\023HIj\000\322\335\241\235\177\377\0170@\000Z\002@\000\000\200\321\223\221\032\300\t\020@\300\221\221&@@\020\000\300\321\221\002\300\000|\001B\200\322 \311\000\\\000A\000\000\030@\000Z\000\300ppH`@\020\022\300`p<\300\000XLA\000\000\001GIj\000\300pp\007A\000\000p\300\000Z8`@\020\022\300`p,\300\000X\002\300\000|\001B\200\322\022\311 \\\016\300\000\\\001A\000\000h@\000Z\000\300pp$`@\020\022\300`p\030\300\000X\002`\001|@\300\321\221`@\000v\001\300\000x\000B\200\322\016\330 \\\003A\000\000h@\000Z\000\300pp\f`@\020\022\300`p\372\177\377\017\000@\000Z\000\320\021\365\022\300`p\232\177\377\017@@\000Z\002@\000\000\200\321\223\221\000@rp\005\036\f>\036\300\036\226\000\000\000\000\000@\001u\020A\000\365 \034\364\353\034@\000\\\005**p@\300\220\221&@@\020\000\300\320\221\002\300\000|\001B\200\322 \311\000\\\374@\000\000H@\000Z\000\300qp\224`@\020\023\300`p<\300\000XHA\000\000\001]Ij\000\300qp\004A\000\000 \300\000Z\204`@\020\023\300`p,\300\000X\002\300\000|\001B\200\322\022\311 \\\016\300\000\\\376@\000\000\030@\000Z\000\300qpp`@\020\023\300`p\030\300\000X\002`\001|@\300\320\221`@\000v\001\300\000x\000B\200\322\016\330 \\\000A\000\000\030@\000Z\000\300qpX`@\020\023\300`p\006\340J\020R@\220\221X\300\002$\002@\000|\000\300\320\221\000B\200\322\032\310\000\\@@\220\221\"\322\002 FA\000\000\001\\Ij\000\300qpy\177\377\017\020@\000Z\323\372\337x\000@sp\005\036\f>\036\300\036\226\002@\000\000\000@\000Z\000Q\020\365\002\300rp(`@\020\023\300`p\023@\000x@\300\320\221 \343\300\0213~\337x\001<!(\000A\000\361\001\300\000x\000B\200\322\026\330 \\\341\301\222\221\000Q\020\365\342\300\201\221\000\300\242P\n\340@\020\023@\000x@\300\320\221 \300\300\214\002\300\320\241\000@sp\005\036\f>\036\300\036\226\000@qp\005\036\f>\367@\000\0008@\000X\036\300\036\220\000@\001u\020B\001\365 \034\364\353\030@\000\\\005*\np@@\221\221\002\300\321\221\034\300@\020\004\300\000|\001D\202\322\030\311\000\\\366@\000\000H@\000Z\000\300rp0\300\000XDA\000\000\201JIj\000\300rp\376@\000\0000\300\000Z$\300\000X\004\300\000|\001D\202\322\016\311 \\\n\300\000\\\370@\000\0008@\000Z\000\300rp\024\300\000X\004`\001|B\300\321\221b@\002v\003\300\000x\000D\202\322\024\330 \\\372@\000\000H@\000Z\000\300rp\000@\000u0@\335G\022\300\335G\036\360\036\226@\300\221\221\024\300\000\020\022\310\000\024BA\000\000\001YIj\000\300rps\177\377\017`\300\000Z\300z\337x\005\036\f>\036\300\036\226\340\301\220\221\000\300\200\221\000\300\240P\340\301\220\221\000R\021\365B\300\200\221\000\300\242P\201\017\bP!\300\201\221\000\300\241P\000\300\020u\000@xz\005\036\f>\036\300\036\226\000\000\000\000\264A\000\000\003FIj \034\364\353\020\300`p\022B\001\365\000\322\335\241\002@\000\000\221\321\203\221\217\177\377\017\000@\000Z\000\300qp\365\177\377\017\b@\000Z\000P\023\365\002\300rp\216\177\377\017h@\000Z\2200\b0\000@pp\005\036\f>\036\300\036\226\000\000\000\000\000\000\000\000\000\000\000\000\000@\001u\020A\000\365\020\034\364\353\026\300\000\\@@\220\221\002\300\320\221\034\300@\020\004\300\000|\001D\202\322\030\311\000\\\360@\000\000p@\000Z\000\300qp0\300\000X?A\000\000\201\\Ij\000\300qp\370@\000\000X\300\000Z$\300\000X\004\300\000|\001D\202\322\016\311 \\\n\300\000\\\362@\000\000`@\000Z\000\300qp\024\300\000X\004`\001|B\300\320\221b@\002v\003\300\000x\000D\202\322\022\330 \\\364@\000\000p@\000Z\000\300qp\000@\000u\020@\335G\036\370\036\226@\300\220\221\020\300\000\020\341\301\200\221\000Q\020\365\202\300\201\221\000\300\242P\004>\000Y\000`wz\036\300\036\226\000@qp\000\037\004>\356@\000\000(\300\000X\000\000\000\000\000\000\000\000\000\000\000\000\000@\001u\020@\001\365 \034\364\353\030@\000\\\000\322\335\241R@\221\221\000\300\321\221\034\300J\020\002\300\000|\001B\200\322\030\311\000\\\355@\000\000(@\000Z\000\300pp0\300\000X<A\000\000\001TIj\000\300pp\365@\000\000\020\300\000Z$\300\000X\002\300\000|\001B\200\322\016\311 \\\n\300\000\\\357@\000\000\030@\000Z\000\300pp\024\300\000X\002`\001|@\300\321\221`@\000v\001\300\000x\000B\200\322\024\330 \\\361@\000\000(@\000Z\000\300pp\000@\000u0@\335G\022\300\335G\036\360\036\226R\300\221\2214\300\n\020\340\301\222\221\000\300\200\221\000\300\240P\340\301\222\221\000P\021\365b\300\200\221\000\300\242P\241\017\nP!\300\201\221\000\300\241P\002@\000|\000\300\321\221\000B\200\322\022\310\000\\:A\000\000\201GIj\000\300ppi\177\377\0178\300\000Zk\177\377\017h\300\000Z\000\300\022u\000@wz\005\036\f>\036\300\036\226\000@\000xB\300\321\221\"\301\302\2140@\335\221\002\302\321\241@\037\005>\000\000\000\000\373\177\377\017 \300\000X\000\000\000\000\000\000\000\000\000@\001u\020@\002\365 \034\364\353\030@\000\\\005*\032p@@\222\221\002\300\322\221\034\300@\020\004\300\000|\001D\202\322\030\311\000\\\350@\000\000(@\000Z\000\300pp0\300\000X9A\000\000\201LIj\000\300pp\360@\000\000\020\300\000Z$\300\000X\004\300\000|\001D\202\322\016\311 \\\n\300\000\\\352@\000\000\030@\000Z\000\300pp\024\300\000X\004`\001|B\300\322\221b@\002v\003\300\000x\000D\202\322\024\330 \\\354@\000\000(@\000Z\000\300pp\000@\000u0@\335G\022\300\335G\036\360\036\226@\300\222\221\024\300\000\020\022\311\000\0247A\000\000\201_Ij\000\300ppe\177\377\017@\300\000Z\300z\337x\005\036\f>\036\300\036\226\340\301\221\221\000\300\200\221\000\300\240P\340\301\221\221\000P\022\365\002\301\200\221\000\300\242P\221\017\tP!\300\201\221\000\300\241P\022\300\t\0207A\000\000\201[Ij\000\300ppd\177\377\017(\300\000Z\000~\337x\005\036\f>\036\300\036\226\000@\000x\005\036\f>\036\300\036\226\000\000\000\000\000@\001u\020A\000\365 \034\364\353\030@\000\\\000\322\335\241R@\220\221\000\300\320\221\034\300J\020\002\300\000|\001B\200\322\030\311\000\\\343@\000\000H@\000Z\000\300qp0\300\000X6A\000\000\201ZIj\000\300qp\353@\000\0000\300\000Z$\300\000X\002\300\000|\001B\200\322\016\311 \\\n\300\000\\\345@\000\0008@\000Z\000\300qp\024\300\000X\002`\001|@\300\320\221`@\000v\001\300\000x\000B\200\322\024\330 \\\347@\000\000H@\000Z\000\300qp\000@\000u0@\335G\022\300\335G\036\360\036\226R\300\220\2214\300\n\020\340\301\222\221\000\300\200\221\000\300\240P\340\301\222\221\000Q\020\365\"\301\200\221\000\300\242P\241\017\nP!\300\201\221\000\300\241P\002@\000|\000\300\320\221\000B\200\322\022\310\000\\4A\000\000\201RIj\000\300qp_\177\377\017X\300\000Zb\177\377\017\b\300\000Z\000\300\022u\000@wz\005\036\f>\036\300\036\226a@\220\221\f\300\002$v\177\377\017\b@\000Z\000\300qp\200\301P<\000@\000xB\300\320\221\"\301\302\2140@\335\221\002\302\320\241@\037\005>\000\000\000\000\000\000\000\000\000\000\000\000\000@\001u\020A\000\365 \034\364\353 @\000\\\005**p@\300\220\221*@@\020\000\300\320\221\002\300\000|\001B\200\322$\311\000\\\336@\000\000(@\000Z\000\300qpD@\000\020\023\300`p\000@sp\005\036\f>\036\300\036\2263A\000\000\201GIj\000\300qp\345@\000\000p\300\000Z\360`p\020\023\300`p,\300\000X\002\300\000|\001B\200\322\022\311 \\\016\300\000\\\337@\000\000h@\000Z\000\300qp\334`p\020\023\300`p\030\300\000X\002`\001|@\300\320\221`@\000v\001\300\000x\000B\200\322\016\330 \\\341@\000\000h@\000Z\000\300qp\304`p\020\023\300`p\345@\220\221\020\300\302$\342@\005v\201\bPS\016f\000\021\203\310\001\260\226@\004\026\000\300\000xT@\025\026 @\000x$\3030\221\000E\"\36360\004( \303\000\214\bB\000`\000\300\000x'~\206\227\022\340\302$4@\000X\000\300\000\177\004\201\004\260\006\320\006\260v\300\000X'~\206\227*\300\202$\247~\206\227\n\300\302$\210\376\206\227\350\377\350\277\000\307\b\357'\177\206\227,\300\202$\247\177\206\2272\300\202$'@\206\2218\300\202$\247@\206\221>\300\202$'A\206\221D\300\202$\247A\206\221\330\340\362$F@\000X\000\300\000\177\b\376\206\227\350\377\350\277\000G\b\357\247~\206\227\332\340\262$\332\177\377Y\000@\000\177\000\300\000\177\b\377\206\227\350\377\350\277\000G\b\357\247\177\206\227\330\340\362$\210\377\206\227\350\377\350\277\000G\b\357'@\206\221\322\340\362$\b\300\206\221\350\377\350\277\000G\b\357\247@\206\221\314\340\362$\210\300\206\221\350\377\350\277\000G\b\357'A\206\221\306\340\362$\b\301\206\221\350\377\350\277\000G\b\357\247A\206\221\224\340\362$\210\301\206\221\350\377\350\277\000G\b\357\212\377\377Y \300\002\022\bB\002`D\304\004\214\004\344\001\333\000@\000\177\006@\204\221\020\300\202$\004\202\004\260\000\300\000\177\016\300\000X\006@\204\221\372\340\362$\347\377\204\227\347\377\347\277\000\206\007\357\004\302\004\260\b@\000\\$\3030\221~@\006\026\005\300\000x\005E\"\363\006\300\000x%\303\005\214\030B\005`\005\300\000x'~\203\227\026\340\302&\030@\000X\000@\000\177\000@\000\177\000\300\000\177\006\201\006\260\003\320\003\260`\300\000X'~\203\227\n\300\202&\b\376\203\227\350\377\350\277\005\307\b\357\247~\203\227H\300\302&'\177\203\227\n\300\202&\b\377\203\227\350\377\350\277\005\307\b\357\247\177\203\227\n\300\202&\210\377\203\227\350\377\350\277\005\307\b\357'@\203\221\n\300\202&\b\300\203\221\350\377\350\277\005\307\b\357\247@\203\221\n\300\202&\210\300\203\221\350\377\350\277\005\307\b\357'A\203\221\n\300\202&\b\301\203\221\350\377\350\277\005\307\b\357\247A\203\221\272\300\262&\210\301\203\221\350\377\350\277\005G\b\357\262\177\377Y\000@\000\177\000\300\000\177\000\300\000\177\210\376\203\227\350\377\350\277\005G\b\357'\177\203\227\274\340\362&\274\377\377Y\036\301\000\\\000B\002`C\304\006\214\003\341\001\333\002@\201\221\016\340\302&\001\202\001\260\000\300\000\177\016\300\000X\002@\201\221\372\300\262&\343\377\201\227\343\377\343\277\005\202\003\357\001\302\001\260 \300\000\260\341@\004\260\002@%\363\000\300qp!\303\001\214\001A\002\355f\177\377\017P\300\000Z\034@\000\020\003\300\220\241\331\177\377\017\b@\000Z\000Q\020\365\002\300rp\030\300\000\020\000@qp\201\003\013Pf\177\377\017\020\300\000Z\000@sp\2030\f\336@\037\005>\363\377\337x\000@sp\005\036\f>\036\300\036\226\023\300\000x\000@sp\005\036\f>\036\300\036\226\000\000\000\000\000@\001u\020A\000\365 \034\364\353 @\000\\\000\322\335\241@\300\220\221*@@\020\000\300\320\221\002\300\000|\001B\200\322$\311\000\\\316@\000\000(@\000Z\000\300qpD@\000\020\022\300`p\000@rp\005\036\f>\036\300\036\226#A\000\000\201ZIj\000\300qp\325@\000\000p\300\000Z\360`p\020\022\300`p,\300\000X\002\300\000|\001B\200\322\022\311 \\\016\300\000\\\317@\000\000h@\000Z\000\300qp\334`p\020\022\300`p\030\300\000X\002`\001|@\300\320\221`@\000v\001\300\000x\000B\200\322\016\330 \\\321@\000\000h@\000Z\000\300qp\304`p\020\022\300`p\336\177\377\017\000@\000Z\000\321\020\365\022@`pa@\220\221\016\300\002$a\177\377\017p@\000Z\000\300qp\200\301P<\202\177\337x@\300\320\221\000\302\000\361\000@rp0@\335\221\002\300\320\241@\037\005>\000\000\000\000\000\000\000\000\000\000\000\000\000@\001u\020D\001\3650\034\364\353\022B\003\365\024@`p\006\n\r\352\032\300\000\\@@\221\221\002\300\321\221\"\300@\020\004\300\000|\001D\202\322\036\311\000\\\311@\000\000x@\000Z\000\300tp:\300\000\020\r\036\024>@\037\006> A\000\000\201DIj\000\300tp\321@\000\000P\300\000Z\362\340p\020(\300\000X\004\300\000|\001D\202\322\020\311 \\\f\300\000\\\313@\000\000P@\000Z\000\300tp\340\340p\020\026\300\000X\004`\001|B\300\321\221b@\002v\003\300\000x\000D\202\322\016\330 \\\315@\000\000X@\000Z\000\300tp\312\340p\020@\300\221\221\024\300\000\020\022\310\000\024\036A\000\000\201WIj\000\300tpG\177\377\017\b\300\000Z\300z\337x\r\036\024>@\037\006>\340\301\220\221\000\300\200\221\000\300\240P\002R\023\365\230\002\200\217\000T\021\365\304\301\200\221\000\300\244P\201\017\bP!\300\201\221\000\300\241P\000\300\020u\000@xz\r\036\024>@\037\006>\000\000\000\000\000@\001u\020@\001\365 \034\364\353\030@\000\\\000\322\335\241R@\221\221\000\300\321\221\034\300J\020\002\300\000|\001B\200\322\030\311\000\\\305@\000\000H@\000Z\000\300pp0\300\000X\035A\000\000\201IIj\000\300pp\315@\000\0000\300\000Z$\300\000X\002\300\000|\001B\200\322\016\311 \\\n\300\000\\\307@\000\0008@\000Z\000\300pp\024\300\000X\002`\001|@\300\321\221`@\000v\001\300\000x\000B\200\322\024\330 \\\311@\000\000H@\000Z\000\300pp\000@\000u0@\335G\022\300\335G\036\360\036\226R\300\221\2214\300\n\020\340\301\222\221\000\300\200\221\000\300\240P\340\301\222\221\000P\021\365\342\301\200\221\000\300\242P\241\017\nP!\300\201\221\000\300\241P\002@\000|\000\300\321\221\000B\200\322\022\310\000\\\033A\000\000\201AIj\000\300ppA\177\377\017X\300\000ZD\177\377\017\b\300\000Z\000\300\022u\000`oz\005\036\f>\036\300\036\226\000@\000x\005\036\f>\036\300\036\226\020@ap\000@\001u \034\364\353\030@\000\\\022B\003\365\000\322\335\241A@\220\221\002\300\320\221\030\300A\020\004\300\000|\001D\202\322\024\311\000\\\301@\000\000\000\300\000Z*\300\000X\032A\000\000\201VIj\311@\000\000\b\300\000Z \300\000X\004\300\000|\001D\202\322\f\311 \\\b\300\000\\\303@\000\000\000\300\000Z\022\300\000X\004`\001|B\300\320\221b@\002v\003\300\000x\000D\202\322\022\330 \\\305@\000\000\030\300\000Z\000@\000u0@\335G\022\300\335G\036\360\036\226A\300\220\221\340\301\201\221\000\300\200\221\000\300\240P\000@\000x0@\335\221\000\322\320\241@\037\005>\000\000\000\000\020@ap\000@\001u \034\364\353\032@\000\\\000\322\335\241A@\220\221\002\300\320\221 \300A\020\004\300\000|\001D\202\322\034\311\000\\\276@\000\000\b\300\000ZB`@\020\021\300`p6\300\000X\030A\000\000\201EIj\306@\000\000\000\300\000Z4`@\020\021\300`p(\300\000X\004\300\000|\001D\202\322\020\311 \\\f\300\000\\\277@\000\000h\300\000Z\"`@\020\021\300`p\026\300\000X\006`\001|D\300\320\221d@\004v\005\300\000x\000F\204\322\016\330 \\\301@\000\000p\300\000Z\f`@\020\021\300`p\002\300\320\221\005<\t(\000R\202\322\n\310 \\\000@qp\005\036\f>\036\300\036\226@\300\220\221\340\301\200\221 \300\200\221\000\300\240P\000@qp\000R\320\241\000\301P<\005\036\f>\036\300\036\226\000\000\000\000\000\000\000\000\326\177\377\017`\300\000X\000\000\000\000\000\000\000\000\000\300\237R\000\000\000\000\000\000\000\000\000\000\000\000 {\337x\000\300\237R\000\000\000\000\000\000\000\000\001@\002u\020C\001\365\376p\335\247<\300\235\240*A\000\\\022@\002\365:R\335\2419\324\335\241@@\220\221\032\300\002$\026\313\000\024\024A\000\000\201QIj\000\300rp8\177\377\017p\300\000Z\300z\337xpG\335\221R\307\335\2214G\335\221\036\300\036\226\002@\000|\000\300\320\221\000B\200\322L\310\000\\\002@\000|\000\300\321\221\000B\200\322\016H\000\\`\300\221\221.\300\000\020@\300\321\221\000@\000\205\f\300\000XJ@\000\020\001\300\023u\000@\340k@\300\321\221\001@@\211\003C\343k\002@\000|\007\326\275\241A\300\000x\000A\000\361\001\300\000x\000B\200\322\b\330 \\\000@`k8\300\000X@\300\221\221\000\300\000u\000@\300k0\300\000X\003Cck\000@\340k\001\300\023u\000@@\211\002@C\211\005\324\275\241$@\000X\007\302\235\241\003@A\211\000R\020\365\002\300sp\277\177\377\017\000@\000Z\024\300cp\0009\3010\001@A\205\336\300 \\\246\377\377Y\000@\340k\003\303ck\000@@\211\007\322\275\241\000@@\211\005\322\275\241\002@\301k`\300\220\221\000\300\000u\000@@\211\n@ \\\006\324\275\241\300B \\\300\373\337x\000@B\211\000@\023u\342@\235\221\003\326\275\241\003@@\211\002\322\275\241\002\300B\205\000B k \330\000\\\005@A\211\006@C\211\000R\021\365\343\301\223\221m0\\0\002S\020\365D\301\203\221\000\300\244P\001@up\300\372 u\003@A\205\001\300tp\001@A\205\214\300 \\1\034`<\000@@\205\002@A\205\300\372\337x\000@ck\206\330\000\\\240\300\235\221\000\300@\205\000@\"k(\330 \\:\301 \\\000R\021\365C\300\221\221\343\301\203\2214\n\211]\000\300\244PhX \\\300\372 u\256\177\377\0170@\000Z\000\322\021\365d\340@\020\367\177\377\017p@\000Z\000R\021\365\002\340\020sZ\340@\020T\300\000X\001@qp\"`\020s\200,\024(\215\177\377\017h\300\000Z\214\177\377\017x@\000Z\2410\200,Fi\b\024\000\300\000xJ\300\000Xr\034`<\000@@\205\001\300B\205\000A k\032\330 \\\254\177\377\017`@\000Z\000\322\021\3650\340@\020\000R\021\365\343\301\223\221\002S\020\365D\301\203\221\000\300\244P$\340@\020\036\300\000X\000R\021\365C\300\221\221\343\301\203\2214\n\211]\000\300\244P\026\340@\020\002@sp\000R\020\365D\300\320\221\004\300\304\214\262\177\377\017\030@\000Z\002\304\320\241\006\340@\020\fIH\024\000\300\000xpG\335\221R\307\335\2214G\335\221\036\300\036\226\201\177\337xB\300\320\221\001A\002\361B\300\235\221\000@B\205\b\310\000\\\002A\301\214\006\300\000X\002\300\301\214\002\302\320\241pG\335\221R\307\335\2214G\335\221\036\300\036\226\000\000\000\000\000\000\000\000\000\000\000\000\020A\002\365P\034\364\353nA\000\000\024ZIj\035\n\026\352;0\n0I\177\377\017p@\000Z\002@\000\000\200\321\224\221\000\300\021u\000@@\211\f@\000\\\001\324\275\241\340\301\221\221\000\300\200\221\000\300\240P@@\220\221\n\300\002$\340\301\200\221\000\300\200\221\000\300\240P\362\177\377\017\020@\000Z\000R\020\365\002\321\023\365\022<\nP\000@B\205\n\310\000\\\340\301\221\221 \300\200\221\000\300\240P@@\220\221\n\300\002$\340\301\200\221 \300\200\221\000\300\240PH\177\377\017\030@\000Z\002@\000\000\200\321\224\221\000@rp\035\036$>@\037\026>\006A\000\000\201_Ij\000\300\235\240*\177\377\017(\300\000Z\000{\337x\036\300\036\226\000\000\000\000\007A\000\000\201EIj\000\300\235\240)\177\377\017h\300\000Z\000{\337x\036\300\036\226\000\000\000\000\020@`p\021@bp \034\364\353kA\000\000\023@Ij\005*\032pF\177\377\017\020@\000Z\002@\000\000\200\321\223\221\000@\000|\002\300\322\221\000@\202\322\020\310\000\\\002\300\321\221\000@\202\322\f\310\000\\\006A\000\000\001IIj&\300\000X(\300\b\026\340\300\222\221\341@\221\221\030\340B @\300\222\221\340\301\200\221\000\300\200\221\000\300\240P\240\002\222P\340\301\200\221\000P\022\365c\301\200\221\000\300\243P\016\310\000\027\006A\000\000\001\301Ij'\177\377\017 @\000Z\000@pp\360\372\337xD\177\377\017 @\000Z\002@\000\000\200\321\223\221\000@pp\005\036\f>\036\300\036\226\000\000\000\000\020@`p\021@dp0\034\364\353hA\000\000\025@Ij\r\n\006\352\022C\002\365\024\300apC\177\377\017\000@\000Z\002@\000\000\200\321\225\221\000@\000|\002\300\324\221\000@\202\322\020\310\000\\\002\300\321\221\000@\202\322\f\310\000\\\003A\000\000\001EIj(\300\000X*\300\b\026\300\007\221\007!@\001\260\032\340B @\300\224\221\340\301\200\221\000\300\200\221\000\300\240P\002S\022\365\301\002\224P\341\301\201\221\000P\024\365\205\301\201\221\000\300\245P\016\310\000\027\003A\000\000\001\323Ij$\177\377\017\b@\000Z\000@pp\360\372\337xA\177\377\017\b@\000Z\002@\000\000\200\321\225\221\000@pp\r\036\024>@\037\006>\000\000\000\000\000\000\000\000\004@\000|\002\300\301\221\000D\202\322\306?@Z\377@\000\000\201OIj\000\300\235\240\"\177\377\017h\300\000Z\000{\337x\036\300\036\220\000\300\237R0\034\364\353\002\300\301\221\024@\000|\r\n\006\352\000T\202\3224\310\000\\cA\000\000\002ZIj\020\301\000\365\002@\000\000\222\321\202\221>\177\377\017h@\000Z\000\300rpS\300\220\221\340\301\223\221\000Q\020\365\242\301\200\221\000\300\242P\021@`p\341A\223\221\000\324\320\241!\300\201\221\000\300\241P>\177\377\017 @\000Z\2020\240p\000@qp\r\036\024>@\037\006>\000@\000x\r\036\024>@\037\006>\000\000\000\000\000\000\000\000\000\000\000\000CE \215\004J\000\215\001@`p\342\377\001x\000@\000\b\000P\001\336\001\302\200\307 A\000\\\000\300\003u\034\300 \\\240@\004\214\342C\000x\306\177\337x\307\377\337x\002\302`\361\000@8\003\004W\002\336\206B\206\303\340\302Bv\003\307\004\361\200\300C\306\000A\302\357\000\300\237RBM\004\214\024\300\000\\\f\177\003\020\000@\370\007\000\300\000x\000@\200\003\004\327\003\336\000\300cp\000A\302\357\000\300\237R\000\300\000x\000A\302\357\000\300\237R\375\177\377\017`@\000Z\000\300\235\240\000@\200\204\036\300\036\226\000\000\000\000\000\000\000\000\000\000\000\000\021@ap\001@\002xP\034\364\353\020\300bp\022@`p\026\n\035\3523\177\377\017P\300\000Z\0009\0130\000@@\211\034@\000\\\001\324\275\241\374@\000\000\002_Ij\364\1773\260\003\300\000xB\177\377\017`@\000Z\000S\024\365\377\343\023\243\022\300\t\020\026A\f\027\002\300qp\374@\000\000\002IIj\000<\f(B\177\377\017\020\300\000Z\362\340y\020\374@\000\000\202QIj\001\300tpA\177\377\017`\300\000Z\374@\000\000\002KIj\001\300tpA\177\377\0178@\000Z\021\337\020\214\002P\021\365\3010\024(D\177\377\017P\300\000Z!\300\235\221\000@A\205\030\310\000\\3B\200\333\000\322\023\365\316@\000\000X@\000Z\003\337\002\214\032\177\377\017 @\000Z\000\322\023\365\020@\000X\000\322\023\365\031A\000\000\201TIj\000\300rp\031\177\377\017`\300\000Z\000\3402s0\177\377\017(\300\000Z\000@pp\035\036$>@\037\026>\021@ap\001@\002xP\034\364\353\020\300bp\022@`p\026\n\035\352/\177\377\0170\300\000Z\0009\0130\000@@\211\034@\000\\\001\324\275\241\371@\000\000\202\\Ij\364\1773\260\003\300\000x>\177\377\017@@\000Z\000S\024\365\377\343\023\243\022\300\t\020\026A\f\027\002\300qp\371@\000\000\202FIj\000<\f(=\177\377\017p\300\000Z\362\340y\020\370@\000\000\202IIj\001\300tp=\177\377\017@\300\000Z\370@\000\000\002CIj\001\300tp=\177\377\017\030@\000Z\021\337\020\214\002P\021\365\3010\024(@\177\377\0170\300\000Z!\300\235\221\000@A\205\030\310\000\\3B\200\333\000\322\023\365\312@\000\0008@\000Z\003\337\002\214\026\177\377\017\000@\000Z\000\322\023\365\020@\000X\000\322\023\365\025A\000\000\201LIj\000\300rp\025\177\377\017@\300\000Z\000\3402s,\177\377\017\b\300\000Z\000@pp\035\036$>@\037\026>\020@`p\200\034\364\353\023@ap\001@\002x.\n5\352\026@dp\030@cp\004V\335\241\003\330\335\241*\177\377\017x@\000Z\024E\002\365\002\332\335\241\0009\t0\000@@\211\034@\000\\\001\324\275\241\365@\000\000\202VIj\362\1771\260\003\300\000x9\177\377\017x@\000Z\000Q\022\365\377\343\021\243\022\300\r\020\026A\n\027\002\300up\365@\000\000\202@Ij\000<\n(9\177\377\017(\300\000Z\362\340}\020\363@\000\000\202WIj\001\300rp8\177\377\017x\300\000Z\364@\000\000\202SIj\001@rpZ\302\235\2218\177\377\017H\300\000Z\006\300\013\020\nA\n\027\002\300sp\362@\000\000\202[Ij\001\300rp8\177\377\017\b\300\000Z\363@\000\000\002ZIj\001\300rp7\177\377\017`@\000Z\031\337\030\214\002X\031\365\2410\024(\363@\000\000\023NIj:\177\377\017x\300\000Z7\177\377\017\030@\000Z\2620\2410\027_\026\214\2410\024(:\177\377\0170@\000Z\002\326\027\365\362@\000\000\202XIj\001\300rp6\177\377\017@@\000Z\025\337\024\214\002T\025\365\2410\024(9\177\377\017X\300\000Z6\177\377\017\b@\000Z\2620\2410\033_\032\214\2410\024(9\177\377\017 @\000Z\002\332\033\365\fA\000\000\202[Ij\001\300rp5\177\377\0170\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365\302@\000\000x@\000Z\003\337\002\214\016\177\377\017@@\000Z\000\320\021\365\020@\000X\000\320\021\365\rA\000\000\201\\Ij\000\300pp\016\177\377\017\000\300\000Z\000\3400s$\177\377\017H\300\000Z\300\177\337x5\036<>'\036.>x@\335\221Z\300\335\221\036\300\036\226\000\000\000\000\020@`p`\034\364\353\200\301\035\260\023@ap\001B\035\260R\b%\352\202@\000x\004C\235\241\200\301]<\r\177\377\0178@\000Z\000\301]<\201B\035\260 ,B(\r\177\377\017\020\300\000Z\"\177\377\017`@\000Z\000@pp\001\300\002x\001@\000u\000@\000x\2609\t0\002@A\211\022@ t\017@\000\000\371\340\021D\f@\000\\\017@\000\000\362G\261t\001\302\235\241\nB\013\027\000\321\022\365\354@\000\000\202AIj\000\321\022\3651\177\377\017 \300\000Z\355@\000\000\202YIj\001\300rp0\177\377\017x\300\000ZU\177\377\017H@\000Z\24102,\355@\000\000\002OIj\001\300rp0\177\377\0178\300\000ZU\177\377\017\b@\000Z\2410\",!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365\275@\000\000h@\000Z\003\337\002\214\t\177\377\0170@\000Z\000\320\021\365\020@\000X\000\320\021\365\bA\000\000\201XIj\000\300pp\b\177\377\017p\300\000Z\000\3400s\037\177\377\0178\300\000Z\240\177\337x%\036,>\036\300\036\226\000\000\000\000\000\000\000\000\020@`p`\034\364\353\023@ap\001@\002x\036\n%\352\024@bp\027*>p\036\177\377\017(\300\000Z\001@\000u\000@\000x\2609\t0\002@A\211\022@ t\017@\000\000\371\340\021D\f@\000\\\017@\000\000\362G\261t\001\302\235\241\nB\013\027\000\321\022\365\347@\000\000\202WIj\000\321\022\365,\177\377\017x\300\000Z\352@\000\000\002HIj\001\300rp,\177\377\017P@\000Z\027\337\026\214\002V\027\365\2410\024(/\177\377\017h\300\000Z\352@\000\000\202CIj\001\300rp,\177\377\017\000@\000Z\025\337\024\214\002T\025\365\2410\024(/\177\377\017\030\300\000Z\352@\000\000\002EIj\001\300rp+\177\377\0170\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365\270@\000\000x@\000Z\003\337\002\214\004\177\377\017@@\000Z\000\320\021\365\020@\000X\000\320\021\365\003A\000\000\201\\Ij\000\300pp\004\177\377\017\000\300\000Z\000\3400s\032\177\377\017H\300\000Z\240z\337x%\036,>\027\036\036>\036\300\036\226\000\000\000\000\000\000\000\000\000\000\000\000\000CE\362\020@`p\200\034\364\353\022B\001\365.\n5\352\004V\335\241\003\330\335\241(@ \\\002\332\335\241\001@\002x\032@cp\\0\2000\031\177\377\017\000\300\000Z\001@\000u\000@\000x\2609\t0\002@A\211\026@ t\017@\000\000\371\340\021D4@\000\\\017@\000\000\366G\261t\001\302\235\2412B\013\027\000\321\026\365\030@dpVB\235\221\332\344\302!\027\177\377\017p@\000Z\000@pp\001\300\002x\001@\000u\000@\000x\2609\t0\002@A\211\024@ t\017@\000\000\371\340\021DL@\000\\\017@\000\000\364G\261t\001\302\235\241JB\013\027\000\321\024\365\341@\000\000\202EIj\000\321\026\365&\177\377\0170\300\000Z\345@\000\000\002AIj\001\300vp&\177\377\017\b@\000Z\033\337\032\214\002Z\033\365\3410\024()\177\377\017 \300\000Z\344@\000\000\202UIj\001\300vp%\177\377\0178@\000Z\025\337\024\214\002T\025\365\3410\024((\177\377\017P\300\000Z\344@\000\000\202OIj\001\300vp$\177\377\017h@\000Z\023\337\022\214B\301\016\027\337@\000\000\202EIj\000\321\024\365$\177\377\0170\300\000Z\343@\000\000\002AIj\001\300tp$\177\377\017\b@\000Z\031\337\030\214\002X\031\365\3010\024('\177\377\017 \300\000Z\343@\000\000\202KIj\001\300tp#\177\377\0178@\000Z\027\337\026\214\002V\027\365\3010\024(&\177\377\017P\300\000Z\342@\000\000\202OIj\001\300tp\"\177\377\017h@\000Z\023\337\022\214\001\300tp&\177\377\017\b@\000Z\002R\023\365$\300\000x!\300\235\221\000@A\205\026\310\000\\1B\200\333\000\320\021\365\260@\000\000\000@\000Z\003\337\002\214\373~\377\017H@\000Z\000\320\021\365\016\300\000X\373@\000\000\201@Ij\000\300pp\373~\377\017\020@\000Z\021\300\000x\021\177\377\017X@\000Z\000\320\021\365\200\177\337x5\036<>'\036.>x@\335\221Z\300\335\221\036\300\036\226\000\000\000\000\000\000\000\000\020@`p`\034\364\353\027@ap\001@\002x%\n\027\352\022D\005\365\024B\003\365\003\324\335\241\020\177\377\017 \300\000Z\0009\t0\000@@\211\034@\000\\\001\324\275\241\337@\000\000\202YIj\366\1771\260\003\300\000x\037\177\377\0170@\000Z\000Q\026\365\377\343\021\243\022\300\017\020\026A\016\027\002\300wp\337@\000\000\202CIj\000<\016(\036\177\377\017`\300\000Z\362\340\177\020\331@\000\000\202EIj\001\300vp\036\177\377\0170\300\000Z\336@\000\000\002\\Ij\001\300vp\036\177\377\017\b\300\000Z\002T\025\365\3410\024(\036\177\377\017H\300\000Z\336@\000\000\202LIj\001\300vp\035\177\377\017@\300\000Z\002R\023\365\3410\024(\036\177\377\017\000\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365\252@\000\000h@\000Z\003\337\002\214\366~\377\0170@\000Z\000\320\021\365\020@\000X\000\320\021\365\365@\000\000\201XIj\000\300pp\365~\377\017p\300\000Z\000\3400s\f\177\377\0178\300\000Z`\177\337x%\036,>\027\036\036>\036\300\036\226\000\000\000\000\020@`p`\034\364\353\023@ap\001@\002x\027\n%\352\026@bp\036*:p\013\177\377\017(\300\000Z\0009\t0\000@@\211\034@\000\\\001\324\275\241\333@\000\000\002_Ij\364\1771\260\003\300\000x\032\177\377\0178@\000Z\000Q\024\365\377\343\021\243\022\300\013\020\026A\f\027\002\300sp\333@\000\000\002IIj\000<\f(\031\177\377\017h\300\000Z\362\340{\020\324@\000\000\202GIj\001\300tp\031\177\377\0178\300\000Z\332@\000\000\002_Ij\001\300tp\031\177\377\017\020@\000Z\027\337\026\214\002V\027\365\3010\024(\034\177\377\017(\300\000Z\332@\000\000\002QIj\001\300tp\030\177\377\017@@\000Z\023\337\022\214\002R\023\365\3010\024(\033\177\377\017X\300\000Z\357@\000\000\202KIj\001\300tp\027\177\377\017p\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365\245@\000\0008@\000Z\003\337\002\214\361~\377\017\000@\000Z\000\320\021\365\020@\000X\000\320\021\365\360@\000\000\201LIj\000\300pp\360~\377\017@\300\000Z\000\3400s\007\177\377\017\b\300\000Z\200|\337x%\036,>\027\036\036>\036\300\036\226\000\000\000\000\000\000\000\000\000\000\000\000\020@`p`\034\364\353\027@ap\001@\002x%\n\027\352\022D\005\365\024B\003\365\003\324\335\241\005\177\377\017`\300\000Z\0009\t0\000@@\211\034@\000\\\001\324\275\241\327@\000\000\202FIj\366\1771\260\003\300\000x\024\177\377\017p@\000Z\000Q\026\365\377\343\021\243\022\300\017\020\026A\016\027\002\300wp\326@\000\000\202PIj\000<\016(\024\177\377\017 \300\000Z\362\340\177\020\316@\000\000\202UIj\001\300vp\023\177\377\017p\300\000Z\324@\000\000\002LIj\001\300vp\023\177\377\017H\300\000Z\002T\025\365\3410\024(\026\177\377\017h\300\000Z\323@\000\000\202\\Ij\001\300vp\023\177\377\017\000\300\000Z\002R\023\365\3410\024(\026\177\377\017 \300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365\240@\000\000(@\000Z\003\337\002\214\353~\377\017p@\000Z\000\320\021\365\020@\000X\000\320\021\365\353@\000\000\201HIj\000\300pp\353~\377\0170\300\000Z\000\3400s\001\177\377\017x\300\000Z@\177\337x%\036,>\027\036\036>\036\300\036\226\000\000\000\000\020@`p\220\034\364\353\023@ap\001@\002x/\n=\352\030@ep\024C\004\365\006T\335\241\004\330\335\241\026@bp\227B\235\221\003\332\335\241\000\177\377\017@\300\000Z\0009\t0\000@@\211\024@\000\\\003\324\275\241\322@\000\000\002NIj\362\1771\260\003\300\000x\f@\000X\000Q\022\365\377\343\021\243\322@\000\000\002@Ij\000<\n(\017\177\377\017 \300\000Z\365bt\333\367zx\333\000\300\023u\b@\000\\\000\302\335\241\nA\n\027\002\300sp\311@\000\000\202IIj\001\300rp\016\177\377\017@\300\000Z\321@\000\000\202LIj\001\300rp\016\177\377\017\030@\000Z\027\337\026\214\002V\027\365\2410\024(\321@\000\000\223WIj\021\177\377\0170\300\000Z\r\177\377\017P@\000Z\2620\2410\321@\000\000\002KIj\001\300rp\r\177\377\017 @\000Z\031\337\030\214\002X\031\365\2410\024(\310@\000\000\026^Ij\020\177\377\0178\300\000Z\f\177\377\017X@\000Z\3420\2410\033_\032\214\2410\024(\017\177\377\017p@\000Z\002\332\033\365\f\177\377\017\030@\000Z\2620\2410\320@\000\000\002EIj\001\300rp\013\177\377\017h@\000Z\025\337\024\214\002T\025\365\2410\024(\017\177\377\017\000\300\000Z\013\177\377\0170@\000Z\3420\2410$@\000x\001>\241P\016\177\377\017H@\000Z\003\337\002\214\317@\000\000\202JIj\001\300rp\n\177\377\017X\300\000Za\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365\230@\000\000 @\000Z\003\337\002\214\343~\377\017h@\000Z\000\320\021\365\020@\000X\000\320\021\365\343@\000\000\201FIj\000\300pp\343~\377\017(\300\000Z\000\3400s\371~\377\017p\300\000Z \177\337x=\036D>/\0366>\230@\335\221z\300\335\221\036\300\036\226\000\000\000\000\000\000\000\000\020@`p`\034\364\353\025@ap\001@\002x%\n\036\352\022D\003\365\027*.p\370~\377\017H\300\000Z\0009\t0\000@@\211\034@\000\\\001\324\275\241\314@\000\000\202MIj\364\1771\260\003\300\000x\007\177\377\017X@\000Z\000Q\024\365\377\343\021\243\022\300\r\020\026A\f\027\002\300up\313@\000\000\202WIj\000<\f(\007\177\377\017\b\300\000Z\362\340}\020\301@\000\000\202OIj\001\300tp\006\177\377\017X\300\000Z\313@\000\000\202LIj\001\300tp\006\177\377\0170@\000Z\027\337\026\214\002V\027\365\3010\024(\t\177\377\017H\300\000Z\312@\000\000\002ZIj\001\300tp\005\177\377\017`\300\000Z\006\300\013\020\nA\f\027\002\300sp\300@\000\000\202AIj\001\300tp\005\177\377\017 \300\000Z\311@\000\000\202^Ij\001\300tp\004\177\377\017x@\000Z\023\337\022\214\002R\023\365\3010\024(\b\177\377\017\020\300\000Z\333@\000\000\202YIj\001\300tp\004\177\377\017(\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365\221@\000\000p@\000Z\003\337\002\214\335~\377\0178@\000Z\000\320\021\365\020@\000X\000\320\021\365\334@\000\000\201ZIj\000\300pp\334~\377\017x\300\000Z\000\3400s\363~\377\017@\300\000Z\000\177\337x%\036,>\027\036\036>\036\300\036\226\000\000\000\000\000\000\000\000\020@`p`\034\364\353\027@ap\001@\002x%\n\027\352\022D\005\365\024B\003\365\003\324\335\241\362~\377\017 \300\000Z\0009\t0\000@@\211\034@\000\\\001\324\275\241\306@\000\000\002SIj\366\1771\260\003\300\000x\001\177\377\0170@\000Z\000Q\026\365\377\343\021\243\022\300\017\020\026A\016\027\002\300wp\305@\000\000\002]Ij\000<\016(\000\177\377\017`\300\000Z\362\340\177\020\273@\000\000\202EIj\001\300vp\000\177\377\0170\300\000Z\300@\000\000\002\\Ij\001\300vp\000\177\377\017\b\300\000Z\002T\025\365\3410\024(\003\177\377\017(\300\000Z\304@\000\000\202ZIj\001\300vp\377~\377\017@\300\000Z\002R\023\365\3410\024(\002\177\377\017`\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365\214@\000\000h@\000Z\003\337\002\214\330~\377\0170@\000Z\000\320\021\365\020@\000X\000\320\021\365\327@\000\000\201XIj\000\300pp\327~\377\017p\300\000Z\000\3400s\356~\377\0178\300\000Z\340~\337x%\036,>\027\036\036>\036\300\036\226\000\000\000\000\020@`p`\034\364\353\027@ap\001@\002x%\n\027\352\022D\005\365\024B\003\365\003\324\335\241\355~\377\017 \300\000Z\0009\t0\000@@\211\034@\000\\\001\324\275\241\301@\000\000\002SIj\366\1771\260\003\300\000x\374~\377\0170@\000Z\000Q\026\365\377\343\021\243\022\300\017\020\026A\016\027\002\300wp\300@\000\000\002]Ij\000<\016(\373~\377\017`\300\000Z\362\340\177\020\266@\000\000\202EIj\001\300vp\373~\377\0170\300\000Z\273@\000\000\002\\Ij\001\300vp\373~\377\017\b\300\000Z\002T\025\365\3410\024(\373~\377\017H\300\000Z\277@\000\000\202ZIj\001\300vp\372~\377\017@\300\000Z\002R\023\365\3410\024(\373~\377\017\000\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365\207@\000\000h@\000Z\003\337\002\214\323~\377\0170@\000Z\000\320\021\365\020@\000X\000\320\021\365\322@\000\000\201XIj\000\300pp\322~\377\017p\300\000Z\000\3400s\351~\377\0178\300\000Z\340~\337x%\036,>\027\036\036>\036\300\036\226\000\000\000\000\020@`p`\034\364\353\027@ap\001@\002x%\n\027\352\022D\005\365\024B\003\365\003\324\335\241\350~\377\017 \300\000Z\0009\t0\000@@\211\034@\000\\\001\324\275\241\274@\000\000\002SIj\366\1771\260\003\300\000x\367~\377\0170@\000Z\000Q\026\365\377\343\021\243\022\300\017\020\026A\016\027\002\300wp\273@\000\000\002]Ij\000<\016(\366~\377\017`\300\000Z\362\340\177\020\261@\000\000\202EIj\001\300vp\366~\377\0170\300\000Z\266@\000\000\002\\Ij\001\300vp\366~\377\017\b\300\000Z\002T\025\365\3410\024(\372~\377\017\b\300\000Z\272@\000\000\202ZIj\001\300vp\365~\377\017@\300\000Z\002R\023\365\3410\024(\371~\377\017@\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365\202@\000\000h@\000Z\003\337\002\214\316~\377\0170@\000Z\000\320\021\365\020@\000X\000\320\021\365\315@\000\000\201XIj\000\300pp\315~\377\017p\300\000Z\000\3400s\344~\377\0178\300\000Z\340~\337x%\036,>\027\036\036>\036\300\036\226\000\000\000\000\020@`p`\034\364\353\027@ap\001@\002x%\n\027\352\022D\005\365\024B\003\365\003\324\335\241\343~\377\017 \300\000Z\0009\t0\000@@\211\034@\000\\\001\324\275\241\267@\000\000\002SIj\366\1771\260\003\300\000x\362~\377\0170@\000Z\000Q\026\365\377\343\021\243\022\300\017\020\026A\016\027\002\300wp\266@\000\000\002]Ij\000<\016(\361~\377\017`\300\000Z\362\340\177\020\254@\000\000\202EIj\001\300vp\361~\377\0170\300\000Z\261@\000\000\002\\Ij\001\300vp\361~\377\017\b\300\000Z\002T\025\365\3410\024(\364~\377\017(\300\000Z\266@\000\000\002FIj\001\300vp\360~\377\017@\300\000Z\002R\023\365\3410\024(\363~\377\017`\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365}@\000\000h@\000Z\003\337\002\214\311~\377\0170@\000Z\000\320\021\365\020@\000X\000\320\021\365\310@\000\000\201XIj\000\300pp\310~\377\017p\300\000Z\000\3400s\337~\377\0178\300\000Z\300~\337x%\036,>\027\036\036>\036\300\036\226\000\000\000\000\020@`p`\034\364\353\027@ap\001@\002x%\n\027\352\022D\005\365\024B\003\365\003\324\335\241\336~\377\017 \300\000Z\0009\t0\000@@\211\034@\000\\\001\324\275\241\262@\000\000\002SIj\366\1771\260\003\300\000x\355~\377\0170@\000Z\000Q\026\365\377\343\021\243\022\300\017\020\026A\016\027\002\300wp\261@\000\000\002]Ij\000<\016(\354~\377\017`\300\000Z\362\340\177\020\247@\000\000\202EIj\001\300vp\354~\377\0170\300\000Z\254@\000\000\002\\Ij\001\300vp\354~\377\017\b\300\000Z\002T\025\365\3410\024(\354~\377\017H\300\000Z\261@\000\000\002FIj\001\300vp\353~\377\017@\300\000Z\002R\023\365\3410\024(\354~\377\017\000\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365x@\000\000h@\000Z\003\337\002\214\304~\377\0170@\000Z\000\320\021\365\020@\000X\000\320\021\365\303@\000\000\201XIj\000\300pp\303~\377\017p\300\000Z\000\3400s\332~\377\0178\300\000Z\300~\337x%\036,>\027\036\036>\036\300\036\226\000\000\000\000\020@`p`\034\364\353\027@ap\001@\002x%\n\027\352\022D\005\365\024B\003\365\003\324\335\241\331~\377\017 \300\000Z\0009\t0\000@@\211\034@\000\\\001\324\275\241\255@\000\000\002SIj\366\1771\260\003\300\000x\350~\377\0170@\000Z\000Q\026\365\377\343\021\243\022\300\017\020\026A\016\027\002\300wp\254@\000\000\002]Ij\000<\016(\347~\377\017`\300\000Z\362\340\177\020\242@\000\000\202EIj\001\300vp\347~\377\0170\300\000Z\247@\000\000\002\\Ij\001\300vp\347~\377\017\b\300\000Z\002T\025\365\3410\024(\353~\377\017\b\300\000Z\254@\000\000\002FIj\001\300vp\346~\377\017@\300\000Z\002R\023\365\3410\024(\352~\377\017@\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365s@\000\000h@\000Z\003\337\002\214\277~\377\0170@\000Z\000\320\021\365\020@\000X\000\320\021\365\276@\000\000\201XIj\000\300pp\276~\377\017p\300\000Z\000\3400s\325~\377\0178\300\000Z\300~\337x%\036,>\027\036\036>\036\300\036\226\000\000\000\000\252@\000\000\001KIj\000\300\235\240\276~\377\017\b\300\000Z\240~\337x\036\300\036\226\000\000\000\000\020@`p@\034\364\353\001@\002x\025*\033p\324~\377\017\000\300\000Z\0009\t0\000@@\211\034@\000\\\001\324\275\241\251@\000\000\002]Ij\362\1771\260\003\300\000x\343~\377\017\020@\000Z\000Q\022\365\377\343\021\243\022\300\013\020\026A\n\027\002\300sp\251@\000\000\002GIj\000<\n(\342~\377\017@\300\000Z\362\340{\020\234@\000\000\202]Ij\001\300rp\342~\377\017\020\300\000Z\250@\000\000\202YIj\001\300rp\341~\377\017h\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365o@\000\0000@\000Z\003\337\002\214\272~\377\017x@\000Z\000\320\021\365\020@\000X\000\320\021\365\272@\000\000\201JIj\000\300pp\272~\377\0178\300\000Z\000\3400s\321~\377\017\000\300\000Z\200~\337x\025\036\034>\036\300\036\226\000\000\000\000\000\000\000\000\000\000\000\000\020@`pP\034\364\353\025@ap\001@\002x\035\n\026\352\317~\377\017x@\000Z\022\303\002\365\0009\t0\000@@\211\034@\000\\\001\324\275\241\246@\000\000\002FIj\364\1771\260\003\300\000x\337~\377\017\000@\000Z\000Q\024\365\377\343\021\243\022\300\r\020\026A\f\027\002\300up\245@\000\000\002PIj\000<\f(\336~\377\0170\300\000Z\362\340}\020\230@\000\000\202YIj\001\300tp\336~\377\017\000\300\000Z\245@\000\000\202FIj\001\300tp\335~\377\017X\300\000Z\006\300\013\020\nA\f\027\002\300sp\227@\000\000\202_Ij\001\300tp\335~\377\017\030\300\000Z\244@\000\000\202QIj\001\300tp\334~\377\017p@\000Z\023\337\022\214\002R\023\365\3010\024(\340~\377\017\b\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365j@\000\000\020@\000Z\003\337\002\214\265~\377\017X@\000Z\000\320\021\365\020@\000X\000\320\021\365\265@\000\000\201BIj\000\300pp\265~\377\017\030\300\000Z\000\3400s\313~\377\017`\300\000Z`~\337x\035\036$>@\037\026>\000\000\000\000\000\000\000\000\000\000\000\000\020@`pP\034\364\353\024@ap\001@\002x\035\n\026\352\312~\377\017X@\000Z\022\300bp\0009\t0\000@@\211\034@\000\\\001\324\275\241\241@\000\000\002VIj\363\1771\260\003\300\000x\331~\377\017`@\000Z\000Q\023\365\377\343\021\243\022\300\f\020\026A\013\027\002\300tp\241@\000\000\002@Ij\000<\013(\331~\377\017\020\300\000Z\362\340|\020\223@\000\000\202QIj\001\300sp\330~\377\017`\300\000Z\241@\000\000\202CIj\001\300sp\330~\377\0178\300\000Z\"\300\n\020\330~\377\017 @\000Z\2420\2610!\300\235\221\000@A\205(\310\000\\1B\200\333\000\320\021\365e@\000\000`@\000Z\003\337\002\214\261~\377\017(@\000Z\000\320\021\365 @\000X\000\320\021\365\221@\000\000\202[Ij\001\300sp\327~\377\017\b\300\000Z!\300\235\221\000@A\205\340\370\377\\\260@\000\000\201FIj\000\300pp\260~\377\017(\300\000Z\000\3400s\306~\377\017p\300\000Z`|\337x\035\036$>@\037\026>\000\000\000\000\020@`pP\034\364\353\024@ap\001@\002x\035\n\026\352\305~\377\017x@\000Z\022\300bp\0009\t0\000@@\211\034@\000\\\001\324\275\241\235@\000\000\002YIj\363\1771\260\003\300\000x\325~\377\017\000@\000Z\000Q\023\365\377\343\021\243\022\300\f\020\026A\013\027\002\300tp\235@\000\000\002CIj\000<\013(\324~\377\0170\300\000Z\362\340|\020\216@\000\000\202YIj\001\300sp\324~\377\017\000\300\000Z\234@\000\000\202KIj\001\300sp\323~\377\017X\300\000Z\"\300\n\020\323~\377\017@@\000Z\2420\2610!\300\235\221\000@A\205(\310\000\\1B\200\333\000\320\021\365a@\000\000\000@\000Z\003\337\002\214\254~\377\017H@\000Z\000\320\021\365 @\000X\000\320\021\365\215@\000\000\202CIj\001\300sp\322~\377\017(\300\000Z!\300\235\221\000@A\205\340\370\377\\\253@\000\000\201NIj\000\300pp\253~\377\017H\300\000Z\000\3400s\302~\377\017\020\300\000Z@|\337x\035\036$>@\037\026>\000\000\000\000\020@`pP\034\364\353\023@ap\001@\002x\026\n\035\352\301~\377\017\030@\000Z\022\300bp\0009\t0\000@@\211\034@\000\\\001\324\275\241\231@\000\000\202[Ij\364\1771\260\003\300\000x\320~\377\017 @\000Z\000Q\024\365\377\343\021\243\022\300\013\020\026A\f\027\002\300sp\231@\000\000\202EIj\000<\f(\317~\377\017P\300\000Z\362\340{\020\212@\000\000\202AIj\001\300tp\317~\377\017 \300\000Z\230@\000\000\002ZIj\001\300tp\316~\377\017x@\000Z\023\337\022\214\002R\023\365\3010\024(\322~\377\017\020\300\000Z\230@\000\000\002QIj\001\300tp\316~\377\017(\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365[@\000\000p@\000Z\003\337\002\214\247~\377\0178@\000Z\000\320\021\365\020@\000X\000\320\021\365\246@\000\000\201ZIj\000\300pp\246~\377\017x\300\000Z\000\3400s\275~\377\017@\300\000Z\000}\337x\035\036$>@\037\026>\000\000\000\000\000\000\000\000\000\000\000\000\020@`p@\034\364\353\001@\002x\025*\033p\274~\377\017@\300\000Z\0009\t0\000@@\211\034@\000\\\001\324\275\241\225@\000\000\202GIj\362\1771\260\003\300\000x\313~\377\017P@\000Z\000Q\022\365\377\343\021\243\022\300\013\020\026A\n\027\002\300sp\224@\000\000\202QIj\000<\n(\313~\377\017\000\300\000Z\362\340{\020\205@\000\000\202MIj\001\300rp\312~\377\017P\300\000Z\224@\000\000\202YIj\001\300rp\312~\377\017(\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365W@\000\000p@\000Z\003\337\002\214\243~\377\0178@\000Z\000\320\021\365\020@\000X\000\320\021\365\242@\000\000\201ZIj\000\300pp\242~\377\017x\300\000Z\000\3400s\271~\377\017@\300\000Z\300{\337x\025\036\034>\036\300\036\226\000\000\000\000\000\000\000\000\000\000\000\000\020@`pP\034\364\353\024@ap\001@\002x\035\n\026\352\270~\377\0178@\000Z-0;0\0009\t0\000@@\211\034@\000\\\001\324\275\241\222@\000\000\002]Ij\362\1771\260\003\300\000x\307~\377\017@@\000Z\000Q\022\365\377\343\021\243\022\300\r\020\026A\n\027\002\300up\222@\000\000\002GIj\000<\n(\306~\377\017p\300\000Z\362\340}\020\201@\000\000\202IIj\001\300rp\306~\377\017@\300\000Z\222@\000\000\002@Ij\001\300rp\306~\377\017\030\300\000Z\006\300\f\020\nA\n\027\002\300tp\200@\000\000\202OIj\001\300rp\305~\377\017X\300\000Z\221@\000\000\202HIj\001\300rp\305~\377\0170\300\000Z\006\300\013\020\nA\n\027\002\300sp\177@\000\000\202UIj\001\300rp\304~\377\017p\300\000Z\211@\000\000\202FIj\001\300rp\304~\377\017H\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365R@\000\000\020@\000Z\003\337\002\214\235~\377\017X@\000Z\000\320\021\365\020@\000X\000\320\021\365\235@\000\000\201BIj\000\300pp\235~\377\017\030\300\000Z\000\3400s\263~\377\017`\300\000Z\340|\337x\035\036$>@\037\026>\000\000\000\000\000\000\000\000\000\000\000\000\000CE\362\020@`pp\034\364\353\024C\001\365&\n-\352\026E\004\365\030@bp\003V\335\241\002\330\335\241\n@\000\\\022\302\235\221\023\324\027\363\000V\022\363\310\363\302!\262~\377\017\020@\000Z\000@pp\001\300\002x\0009\t0\000@@\211\024@\000\\\001\324\275\241\215@\000\000\202TIj\363\1771\260\003\300\000x\f@\000X\000Q\023\365\377\343\021\243\215@\000\000\202FIj\000<\013(\300~\377\017`@\000Z\031\337\030\214\002X\031\365\2610\024(\303~\377\017x\300\000Z\213@\000\000\002^Ij\001\300sp\300~\377\017\020\300\000Z\006\300\r\020\nA\013\027\002\300upz@\000\000\202MIj\001\300sp\277~\377\017P\300\000Z\214@\000\000\002DIj\001\300sp\277~\377\017(@\000Z\025\337\024\214\002T\025\365\2610\024(\214@\000\000\025FIj\302~\377\017@\300\000Z\276~\377\017`@\000Z\3220\2610\364bw\333\2610\024(\301~\377\017x@\000Z\003\337\002\214\213@\000\000\202OIj\001\300sp\276~\377\017\b\300\000Z\213@\000\000\002GIj\001\300sp\275~\377\017`@\000Z\027\337\026\214\002V\027\365\2610\024(\300~\377\017x\300\000Z\275~\377\017(@\000Z\3220\2610\366br\333\2610\024(\300~\377\017@@\000Z\003\337\002\214\212@\000\000\202ZIj\001\300sp\274~\377\017P\300\000Z!\300\235\221\000@A\205\302\310\000\\1B\200\333\000\320\021\365J@\000\000\030@\000Z\003\337\002\214\225~\377\017`@\000Z\000\320\021\365\272\300\000X\254~\377\017\000@\000Z\000@pp\001\300\002x\0009\t0\000@@\211\024@\000\\\001\324\275\241\207@\000\000\202PIj\366\1771\260\003\300\000x\f@\000X\000Q\026\365\377\343\021\243\207@\000\000\202BIj\000<\016(\272~\377\017P@\000Z\031\337\030\214\002X\031\365\3410\024(\275~\377\017h\300\000Z\205@\000\000\002ZIj\001\300vp\272~\377\017\000\300\000Z\006\300\r\020\nA\016\027\002\300upt@\000\000\202IIj\001\300vp\271~\377\017@\300\000Z\206@\000\000\002@Ij\001\300vp\271~\377\017\030@\000Z\025\337\024\214\002T\025\365\3410\024(\274~\377\0170\300\000Z\205@\000\000\002^Ij\001\300vp\270~\377\017H\300\000Z\001@vp\2623\024(\273~\377\017h@\000Z\003\337\002\214\205@\000\000\202KIj\001\300vp\267~\377\017x\300\000Z\205@\000\000\002\\Ij\001\300vp\267~\377\017P\300\000Z\206@\000\000\202IIj\001\300vp\267~\377\017(@\000Z\023\337\022\214\002R\023\365\3410\024(\272~\377\017@\300\000Z{@\000\000\202JIj\001\300vp\266~\377\017X\300\000Z!\300\235\221\000@A\205F\370\377\\\217@\000\000\201ZIj\000\300pp\217~\377\017x@\000Z\021\300\000x\246~\377\017@@\000Z\000\320\021\365\240{\337x-\0364>\037\036&>X@\335\221\036\300\036\226\020@`pp\034\364\353\025@ap\001@\002x-\n&\352\022E\004\365\030@cp\003V\335\241\002\330\335\241\245~\377\017\030@\000Z\026\300bp\0009\t0\000@@\211\024@\000\\\001\324\275\241\203@\000\000\202XIj\364\1771\260\003\300\000x\f@\000X\000Q\024\365\377\343\021\243\203@\000\000\202JIj\000<\f(\263~\377\017p@\000Z\031\337\030\214\002X\031\365\3010\024(\267~\377\017\b\300\000Z\202@\000\000\202_Ij\001\300tp\263~\377\017 \300\000Z\006\300\016\020\nA\f\027\002\300vpm@\000\000\202QIj\001\300tp\262~\377\017`\300\000Z~@\000\000\002HIj\001\300tp\262~\377\0178\300\000Z\006\300\r\020\nA\f\027\002\300upl@\000\000\202WIj\001\300tp\261~\377\017x\300\000Z\201@\000\000\202SIj\001\300tp\261~\377\017P\300\000Z\006\300\013\020\nA\f\027\002\300spk@\000\000\202]Ij\001\300tp\261~\377\017\020\300\000Zu@\000\000\202ZIj\001\300tp\260~\377\017h@\000Z\023\337\022\214\002R\023\365\3010\024(\264~\377\017\000\300\000Z\201@\000\000\002DIj\001\300tp\260~\377\017\030\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365=@\000\000`@\000Z\003\337\002\214\211~\377\017(@\000Z\000\320\021\365\020@\000X\000\320\021\365\210@\000\000\201VIj\000\300pp\210~\377\017h\300\000Z\000\3400s\237~\377\0170\300\000Z\300|\337x-\0364>\037\036&>X@\335\221\036\300\036\226\000\000\000\000\000\000\000\000\000\000\000\000\020@`pP\034\364\353\024@ap\001@\002x\035\n\026\352\236~\377\017\030@\000Z\022\300bp\0009\t0\000@@\211\034@\000\\\001\324\275\241~@\000\000\202IIj\363\1771\260\003\300\000x\255~\377\017 @\000Z\000Q\023\365\377\343\021\243\022\300\f\020\026A\013\027\002\300tp}@\000\000\202SIj\000<\013(\254~\377\017P\300\000Z\362\340|\020g@\000\000\202AIj\001\300sp\254~\377\017 \300\000Z\203@\000\000\002BIj\001\300sp\253~\377\017x\300\000Z\"\300\n\020\253~\377\017`@\000Z\2420\2610!\300\235\221\000@A\205(\310\000\\1B\200\333\000\320\021\3659@\000\000 @\000Z\003\337\002\214\204~\377\017h@\000Z\000\320\021\365 @\000X\000\320\021\365e@\000\000\202KIj\001\300sp\252~\377\017H\300\000Z!\300\235\221\000@A\205\340\370\377\\\203@\000\000\201VIj\000\300pp\203~\377\017h\300\000Z\000\3400s\232~\377\0170\300\000Z\240|\337x\035\036$>@\037\026>\000\000\000\000\020@`p@\034\364\353\001@\002x\025*\032p\231~\377\017@\300\000Z\0009\t0\000@@\2118@\000\\\001\324\275\241z@\000\000\202@Ij\363\1771\260\003\300\000x\250~\377\017P@\000Z\000Q\023\365\377\343\021\243.\300\n\020\250~\377\017(@\000Z\2420\2610!\300\235\221\000@A\2054\310\000\\1B\200\333\000\320\021\3655@\000\000h@\000Z\003\337\002\214\201~\377\0170@\000Z\000\320\021\365,@\000X\000\320\021\365x@\000\000\202NIj\000<\013(\247~\377\017\020\300\000Z\326\340z\020a@\000\000\202QIj\001\300sp\246~\377\017`\300\000Z!\300\235\221\000@A\205\324\370\377\\\177@\000\000\201\\Ij\000\300pp\200~\377\017\000\300\000Z\000\3400s\226~\377\017H\300\000Z |\337x\025\036\034>\036\300\036\226\001@\002x\020@`p\020\034\364\353\225~\377\017h\300\000Z,\300\000\020w@\000\000\002NIj\341\177 \260\003\300\000x\245~\377\017\020@\000Z\021@`p\377\343\000\2431B\200\333\000\320\021\3652@\000\000`@\000Z\003\337\002\214~~\377\017(@\000Z\000\320\021\365\224~\377\017p@\000Z\000\320\021\365\240}\337x@\037\004>v@\000\000\002DIj\000\300\000|\243~\377\017p\300\000Z}@\000\000\201FIj\000\300pp}~\377\017(\300\000Z\223~\377\017x@\000Z\000\3400s\240}\337x@\037\004>\000\000\000\000\000\000\000\000\001@\002x\020@`p\020\034\364\353\223~\377\017\b\300\000Z,\300\000\020u@\000\000\202QIj\341\177 \260\003\300\000x\242~\377\0170@\000Z\021@`p\377\343\000\2431B\200\333\000\320\021\3650@\000\000\000@\000Z\003\337\002\214{~\377\017H@\000Z\000\320\021\365\222~\377\017\020@\000Z\000\320\021\365\200{\337x@\037\004>t@\000\000\202GIj\000\300\000|\241~\377\017\020\300\000Zz@\000\000\201NIj\000\300ppz~\377\017H\300\000Z\221~\377\017\030@\000Z\000\3400s\200{\337x@\037\004>\000\000\000\000\000\000\000\000\001@\002x\020@`p\020\034\364\353\220~\377\017(\300\000Z,\300\000\020s@\000\000\202UIj\341\177 \260\003\300\000x\237~\377\017P@\000Z\021@`p\377\343\000\2431B\200\333\000\320\021\365-@\000\000 @\000Z\003\337\002\214x~\377\017h@\000Z\000\320\021\365\217~\377\0170@\000Z\000\320\021\365`{\337x@\037\004>r@\000\000\202KIj\000\300\000|\236~\377\0170\300\000Zw@\000\000\201VIj\000\300ppw~\377\017h\300\000Z\216~\377\0178@\000Z\000\3400s`{\337x@\037\004>\000\000\000\000\000\000\000\000\020@`p@\034\364\353\001@\002x\025*\033p\215~\377\017@\300\000Z\0009\t0\000@@\211\034@\000\\\001\324\275\241q@\000\000\002NIj\362\1771\260\003\300\000x\234~\377\017P@\000Z\000Q\022\365\377\343\021\243\022\300\013\020\026A\n\027\002\300spp@\000\000\002XIj\000<\n(\234~\377\017\000\300\000Z\362\340{\020V@\000\000\202MIj\001\300rp\233~\377\017P\300\000Zp@\000\000\002OIj\001\300rp\233~\377\017(\300\000Z!\300\235\221\000@A\205\030\310\000\\1B\200\333\000\320\021\365(@\000\000p@\000Z\003\337\002\214t~\377\0178@\000Z\000\320\021\365\020@\000X\000\320\021\365s@\000\000\201ZIj\000\300pps~\377\017x\300\000Z\000\3400s\212~\377\017@\300\000Z@{\337x\025\036\034>\036\300\036\226\000\000\000\000\000\000\000\000\000\000\000\000\001@\002x\020@`p\020\034\364\353\211~\377\017H\300\000Z,\300\000\020n@\000\000\202HIj\341\177 \260\003\300\000x\230~\377\017p@\000Z\021@`p\377\343\000\2431B\200\333\000\320\021\365&@\000\000@@\000Z\003\337\002\214r~\377\017\b@\000Z\000\320\021\365\210~\377\017P@\000Z\000\320\021\365\200z\337x@\037\004>l@\000\000\202^Ij\000\300\000|\227~\377\017P\300\000Zp@\000\000\201^Ij\000\300ppq~\377\017\b\300\000Z\207~\377\017X@\000Z\000\3400s\200z\337x@\037\004>\000\000\000\000\000\000\000\000\204\303B<c@\201\221&\300\002$\203@\201\221,\300\002$\243@\201\2212\300\002$\303@\201\2218\300\002$\341A\201\221<\343\202$Ha\001\020 D\000\000\001\303B9@@\001u\000`\000~@D\000\000\001\303B9\000\300_S:\300\000X\003@\000x\007\322\242\241\341A\201\221\352\343\362$\036\300\000X#@\000x\007\322\242\241\341A\201\221\340\343\362$\024\300\000XC@\000x\007\322\242\241\341A\201\221\326\343\362$\n\300\000Xc@\000x\007\322\242\241\341A\201\221\314\343\362$\200@\001u\000`\000~\200D\000\000\001\303B9\000\300_S\b\310A\020\000E\000\000\001\303B<\300?\000Hi@\000\000\001\317Iji@\000\000\202KIj\270\177\377\017p\300\000X\000\000\000\000\000\000\000\000\020@bp\021@`pP\034\364\353B\300\202\221\022@ap\026\n\035\352\n\340B\020\006@\000|\000\300\320\221\000F\200\322\336\310\000\\ C#\221\341\301\220\221\340\300\000\260 C\000\214\034\341B 8\300\004\020`@\203\221\f@\000\0000\302\002 i@\000\000\202JIj\000Q\022\365\220\300\335\221\026\036\035>\266\177\377\017x@\000X\036\300\036\220\000@qp\001@\002x\024\303\003\260\201~\377\017H\300\000Z\0009\0130\000@@\211$@\000\\\001\324\275\241g@\000\000\202KIj\365\1773\260\003\300\000x\034@\000X\000S\025\365\377\343\023\243\000@\000|\004@\320\221\003\302\203\241\000@\204\322\226\310\000\\\226@\000X\000@\304\221B\300\204\221f@\000\000\202MIj\000<\r(\217~\377\017h\300\000Z$@\000x\202\017\321P\223~\377\017\b@\000Z\003\337\002\214f@\000\000\002JIj\001\300up\217~\377\017\030\300\000Zf@\000\000\202AIj\001\300up\216~\377\017p\300\000Z\263~\377\017@@\000Z\3020\3210e@\000\000\202[Ij\001\300up\216~\377\0170\300\000Z!\300\235\221\000@A\205.\310\000\\3T\200\333\000\321\023\365\025\337\024\214\033@\000\000p@\000Z\002\324\025\365\262\177\377\017x@\000Z\000Q\022\365\002\300sp\020@`p\000Q\023\365\002\324\025\365\033@\000\000 \300\000Z}~\377\017P@\000Z\000\321\023\365\000@pp\035\036$>@\037\026>f@\000\000\220FIj\000\321\022\365\261\177\377\017h@\000Z\002\300ppf~\377\017\020@\000Z\022@`p\000\321\020\365|~\377\017P@\000Z\000\3401s\000@rp\035\036$>@\037\026>\006@\000\026\200\301C<\000\300\000x\001(\002(\344@\203\221\000\300\303\241\002\302\203\241\242\300\304\020\341@\004v@3\002(zf@\021\000\301\203\221\002D!\363\205D\020\260\004\310\000\260&C\002\214\002\300\000x\030@\006`\000@\000\177\000\300\000\177\002A\002\260F@\205\221\360\362\244\247F\177\205\227\361\362\244\247\306\177\205\227\362\362\244\247f@\205\221\364\362\244\247f\177\205\227\365\362\244\247\346\177\205\227\366\362\244\247\206@\205\221\370\362\244\247\206\177\205\227\371\362\244\247\006@\205\221\372\362\244\247\246@\205\221\374\362\244\247\246\177\205\227\375\362\244\247&@\205\221\376\362\244\247\306@\205\221\000\322\244\241\306\177\205\227\001\322\244\241F@\205\221\002\322\244\241\346@\205\221\004\322\244\241\346\177\205\227\005\322\244\241f@\205\221\006\322\244\241\006A\205\221\b\322\244\241\006@\205\221\t\322\244\241\206@\205\221\n\322\244\241&A\205\221\f\322\244\241&@\205\221\r\322\244\241\005\204\005\260\004P\004\260\246@\205\221\016\322\244\241\"\300\001\020DD\002\214B\302\002\214\020A\001`\004\340\000\333\220a\"\333\000@\000\177\000@\000\177\000\300\000\177\202@\201\221\376\362\240\247\202\177\201\227\377\362\240\247\201\200\001\260\000B\000\260\002@\201\221\000\322\240\241 H\020\221\001\3100\221\002A\301\214\000\300\000u\000B\001\364\001\300\000x\002\300\303\241\000@\000x\035\036$>@\037\026>\000\000\000\000\000\000\000\000\020A\003\365 \034\364\353\022B\000\365\002I\000x\005*0}`~\377\017X\300\000Z\340@\222\221\022\344\302$]@\000\000\002IIj\000S\020\3650\300\335\221\256\177\377\017X@\000X\000\037\005>&@\300\020b@\222\221\002\322\261\241\200C\021\260\242\b\001H\002A\002\260\000@\000\177\000\300\000\177!@\001\260\303\177\202\227\004\322\240\241\343\177\202\227\374\362\240\247\200@\000\260\002B\002\260\003@\202\221\000\322\240\241\343@\222\221\356\341\262 \000S\020\365\002R\021\365$C2\221\022\300\335\221\344\300\004\260$C\004\2140@\335\221\017\324\261\241\000@\000\000(@\000X\036\300\036\220\000\000\000\000\000\000\000\000\006@\000|\020@cp\020\034\364\353\000B\"\221\004\300\302\221 A\000\215!@\000v@\302\243\241\000F\204\322\030H\000\\\000@\303\221A\300\003\241\000F\200\322$H\000\\\021\300bpA@\221\221\000\304\300\241\000@\000x\001\"\004\236\036\300\036\226\000F\200\322\000`\000~\020@\335C\036\330\036\226Z~\377\017 \300\000Z\000\300\000|\000@\000x\000\300\320\241@\037\004>Y~\377\017P@\000Z\000\302\000xA@\221\221\002\322\240\241\001@\000x\002\300\321\221\000@\000x\000B\300\241\000\300\320\241@\037\004>\000\000\000\000\000\000\000\000\000\000\000\000\020A\000\365\004@\000|\360\034\364\353\002@\035\260\000@qp\030\324\275\241\002H\035\260B\nm\352R\nJ\352:\nZ\352*\n2\352\032\n\"\352\n\n\022\352\350\177\377\017\030@\000Z\000D\335\241\200\314]<\032@@\0202\300\000xT@\000\000\001IIj\2020\2200\353\177\377\017\020@\000Z\003-\004(\n\300@\020\327~\377\017\020@\000Z\2200\001-\b\300\000\020\000@rpm\036t>\036\300\036\226S@\000\000\001MIj\2200\002-\373\177\377\017\000@\000Z\003\300pp\022\340`s\000@rpm\036t>\036\300\036\226\000\000\000\000\004@\000|\020A\000\365\360\034\364\353\003\300\035\260\022@bp\002H\035\260B\nm\352R\nJ\352:\nZ\352*\n2\352\032\n\"\352\n\n\022\352\203\t\002\352\345\177\377\0178@\000Z\200\314]<\034@@\0203\300\000xQ@\000\000\001SIj\2020\2200\350\177\377\0178@\000Z\003-\004(\f\300@\020\001H\035\260\2420\2200\342~\377\017H\300\000Z\b\300\000\020\000@spm\036t>\036\300\036\226P@\000\000\001UIj\2200\002-\370\177\377\017 @\000Z\003\300pp\023\340`s\000@spm\036t>\036\300\036\226\000\000\000\000\020A\000\365\004@\000|\360\034\364\353\002@\035\260\000@qp\030\324\275\241\002H\035\260B\nm\352R\nJ\352:\nZ\352*\n2\352\032\n\"\352\n\n\022\352\342\177\377\017X@\000Z\000D\335\241\200\314]<\032@@\0202\300\000xN@\000\000\001YIj\2020\2200\345\177\377\017P@\000Z\003-\004(\n\300@\020\341~\377\0170@\000Z\2200\001-\b\300\000\020\000@rpm\036t>\036\300\036\226M@\000\000\001]Ij\2200\002-\365\177\377\017@@\000Z\003\300pp\022\340`s\000@rpm\036t>\036\300\036\226\000\000\000\000\004@\000|\020A\000\365\360\034\364\353\003\300\035\260\022@bp\002H\035\260B\nm\352R\nJ\352:\nZ\352*\n2\352\032\n\"\352\n\n\022\352\203\t\002\352\337\177\377\017x@\000Z\200\314]<\034@@\0203\300\000xL@\000\000\001CIj\2020\2200\342\177\377\017x@\000Z\003-\004(\f\300@\020\001H\035\260\2420\2200\330~\377\017h\300\000Z\b\300\000\020\000@spm\036t>\036\300\036\226K@\000\000\001EIj\2200\002-\362\177\377\017`@\000Z\003\300pp\023\340`s\000@spm\036t>\036\300\036\226\000\000\000\000\020A\000\365\004@\000|\360\034\364\353\002@\035\260\000@qp\030\324\275\241\002H\035\260B\nm\352R\nJ\352:\nZ\352*\n2\352\032\n\"\352\n\n\022\352\335\177\377\017\030@\000Z\000D\335\241\200\314]<\032@@\0202\300\000xI@\000\000\001IIj\2020\2200\340\177\377\017\020@\000Z\003-\004(\n\300@\020\337~\377\0170@\000Z\2200\001-\b\300\000\020\000@rpm\036t>\036\300\036\226H@\000\000\001MIj\2200\002-\360\177\377\017\000@\000Z\003\300pp\022\340`s\000@rpm\036t>\036\300\036\226\000\000\000\000\300?\000H\000\000\000\000\000\000\000\000\000\000\000\000\300?\000H\000\000\000\000\000\000\000\000\000\000\000\000\000\300\237R\000\000\000\000\000\000\000\000\000\000\000\000\020` s\000H\001u\020\034\364\353\n@\000\\\000\300\000x&X \\\000P\001u \300\000xM~\377\017\000\300\000Z\000@\000u\000`\021t\020@\335C\036\330\036\226`~\377\017P@\000Z\000@pp\001\300\002x6\300\000\020J@\000\000\002BIj\021@`p\341\377 \260\024\300\000X`~\377\017\000@\000Z\000@pp\001\300\002x(\300\000\020H@\000\000\202KIj\021@`p\341\377 \260\000@qp\003@\000x\377\342\261\243o~\377\017\000\300\000Z1B\200\333\000\320\021\365\374\177\377\017`@\000Z\003\337\002\214\032@\000X\000\320\021\365H@\000\000\002NIj\n\300\000XG@\000\000\202\305Ijn~\377\017\020@\000Z\000<\t(G@\000\000\201LIj\000\300ppG~\377\017@\300\000Z^~\377\017\020@\000Z\000P\021\365\361\377\337x\000@qp@\037\004>\020@`p\020\034\364\353I~\377\017P\300\000Z\000@\000u\000`\000~\020@\335C\036\330\036\226]~\377\017\000@\000Z\000@pp\001\300\002x,\300\000\020F@\000\000\002YIj\341\177 \260\003\300\000xl~\377\017\030@\000Z\021@`p\377\343\000\2431B\200\333\000\320\021\365\371\177\377\017h@\000Z\003\337\002\214E~\377\0170@\000Z\000\320\021\365[~\377\017x@\000Z\000\320\021\365\340\177\337x@\037\004>E@\000\000\002OIj\000\300\000|j~\377\017x\300\000ZD@\000\000\201HIj\000\300ppD~\377\0170\300\000Z[~\377\017\000@\000Z\000\3400s\340\177\337x@\037\004>\000\000\000\000\000\000\000\000\000\000\000\000\374\177\377\017`\300\000X\000\000\000\000\000\000\000\000\021@`p\020@ap`\034\364\353\205@\000\000\023@Ij\004\322\335\241`~\377\017\020@\000Z\002@\000\000\000\322\223\221\002@\000\000\222R\023\260\002@\000\000\000\323\223\221\000@\000\221R\300\002$_~\377\017`@\000Z\002@\000\000\000\322\223\221\f\342\t\020C@\000\000\001EIj\000\300\000xB~\377\017\000\300\000Z\002@\000|\000@\320\221\004\300\222\221\004\300\304\221\000\300\344\323\000B\200\322\024\310\000\\\004\300\222\221D\300\304\221\004\300\344\323\000@\204\322\000@\000x\260@\335G\222\300\335G\036\360\036\226 @\320\221\004\300\222\221$\300\304\221\000\300\344\323\000B\200\3224\310\000\\\002\300\222\221b\300\302\221\002\300\342\323\000@\202\322\000\300\000x @\000~%\036,>\036\300\036\226\002@\000\000(@\000Z\000\300\035\260\002D\000x\240\000\001L@~\377\017@\300\000Z\002@\000\000\000\323\223\221\001\300\000<\\~\377\017X@\000Z\002@\000\000\000\322\223\221\240\342y\020\250\377\377Y @\000x%\036,>\036\300\036\226\000\000\000\000\000\000\000\000\200@\000\000\001\316Ij\002@\000\000\202\323\201\221 \000!\200\300?\020P\000\000\000\000\000\000\000\000\177@\000\000\002^Ij\000\300\235\240\002@\000\000\202\323\202\221\002\300\202\221\000\300\242P\036\300\036\226\002\300\000|\003B\300\241\002\302\300\241\000@\237R\001B\300\241\000\302\300\241\000\000\000\000\000\000\000\000custom allocators not supported on Hexagon.\n\000halide_default_do_parallel_tasks not implemented on this platform.\000halide_default_semaphore_init not implemented on this platform.\000halide_default_semaphore_try_acquire not implemented on this platform.\000halide_default_semaphore_release not implemented on this platform.\000halide_spawn_thread not implemented on this platform.\000halide_join_thread not implemented on this platform.\000halide_set_num_threads: only supports a value of 1 on this platform.\000HL_GPU_DEVICE\000-nan\000nan\000-inf\000inf\000-0.000000e+00\0000.000000e+00\000-0.000000\0000.000000\000-\000e+\000e-\0000123456789abcdef\000bad_type_code\000handle\000float\000uint\000int\000x\000NULL\000buffer(\000, {\000}\000halide_copy_to_host\000halide_copy_to_device\000halide_copy_to_device does not support switching interfaces\n\000halide_device_malloc\000halide_device_malloc doesn't support switching interfaces\n\000halide_device_sync\000halide_device_free\000/home/jason/code/Halide/src/runtime/device_interface.cpp:247 Assert failed: buf->device == 0\n\000halide_device_and_host_malloc\000halide_device_and_host_malloc doesn't support switching interfaces\n\000allocating host and device memory failed\n\000halide_device_and_host_free\000/home/jason/code/Halide/src/runtime/device_interface.cpp:312 Assert failed: buf->device == 0\n\000halide_default_device_and_host_malloc\000halide_default_device_and_host_free\000halide_device_wrap_native\000halide_device_wrap_native doesn't support switching interfaces\n\000halide_device_detach_native\000/home/jason/code/Halide/src/runtime/device_interface.cpp:399 Assert failed: buf->device == 0\n\000halide_default_device_wrap_native\000halide_default_device_detach_native\000halide_buffer_copy does not support switching device interfaces\000device_interface does not support cropping\n\000device_interface does not support slicing\n\000destination buffer already has a device allocation\n\000src and dst must have identical dimensionality\n\000dst must have exactly one fewer dimension than src\n\000Bounds inference call to external stage \000<NULL>\000 returned non-zero value: \000Call to external stage \000Bounds given for \000 in \000 (from \000 to \000) do not cover required region (from \000 has type \000 but type of the buffer passed in is \000 requires a buffer of exactly \000 dimensions, but the buffer passed in has \000 dimensions\000 is accessed at \000, which is before the min (\000) in dimension \000, which is beyond the max (\000Total allocation for buffer \000 is \000, which exceeds the maximum size of \000The extents for buffer \000 dimension \000 is negative (\000Product of extents for buffer \000Applying the constraints on \000 to the required region made it smaller in dimension \000. \000Required size: \000Constrained size: \000.\000Constraint violated: \000 (\000) == \000Parameter \000 but must be at least \000 but must be at most \000Out of memory (halide_malloc returned NULL)\000Buffer argument \000 is NULL\000Failed to dump function \000 to file \000 with error \000Failed to upgrade buffer_t to halide_buffer_t for \000: \000Failed to downgrade halide_buffer_t to buffer_t for \000The host pointer of \000 is not aligned to a \000 bytes boundary.\000 is null, but the pipeline will access it on the host.\000The folded storage dimension \000 of \000 was accessed out of order by loop \000Cannot fold dimension \000 because an extern stage accesses [\000, \000],\000 which is outside the range currently valid: [\000].\000 which wraps around the boundary of the fold, \000which occurs at multiples of \000The fold factor (\000) of dimension \000 is too small to store the required region accessed by loop \000).\000Requirement Failed: (\000A schedule specialized with specialize_fail() was chosen: \000Buffer has a non-zero device but no device interface.\n\000Buffer has a non-null devie_interface but device is 0.\n\000Buffer has both host and device dirty bits set.\n\000Buffer pointer passed to \000 is null.\n\000Integer division or modulo by zero.\n\000\000elem_size of buffer was not in [1, 2, 4, 8]\000buffer has incorrect elem_size (\000) \000for expected type (\000)\000Internal error: buffer host mismatch in halide_upgrade_buffer_t.\000buffer has more than four dimensions\000HVX lock size must be 64 or 128.\n\000Printer buffer allocation failed.\n\000qurt_hvx_lock failed\n\000qurt_hvx_unlock failed\n\000Internal error: wrong structure size passed to halide_can_use_target_features()\n\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000D\000\000\000\200q\000\000\000\000\000\000\003\000\003\000D\000\000\000,\221\000\000\000\000\000\000\003\000\007\000E\000\000\000\200q\000\000-\000\000\000\001\000\003\000L\000\000\000\255q\000\000C\000\000\000\001\000\003\000U\000\000\000\360q\000\000@\000\000\000\001\000\003\000`\000\000\000\016y\000\000\033\000\000\000\001\000\003\000l\000\000\000}s\000\000\004\000\000\000\001\000\003\000w\000\000\000\317\177\000\000,\000\000\000\001\000\003\000\203\000\000\000\272s\000\000\003\000\000\000\001\000\003\000\215\000\000\000\036t\000\000\026\000\000\000\001\000\003\000\232\000\000\000\226y\000\000&\000\000\000\001\000\003\000\247\000\000\000\233\200\000\000\"\000\000\000\001\000\003\000\262\000\000\000\016\201\000\000Q\000\000\000\001\000\003\000\275\000\000\000\275s\000\000\003\000\000\000\001\000\003\000\307\000\000\000\274y\000\000\037\000\000\000\001\000\003\000\324\000\000\000\300s\000\000\021\000\000\000\001\000\003\000\336\000\000\0004t\000\000=\000\000\000\001\000\003\000\353\000\000\000\333y\000\000+\000\000\000\001\000\003\000\370\000\000\000\006z\000\000\f\000\000\000\001\000\003\000\005\001\000\000\022z\000\000\021\000\000\000\001\000\003\000\022\001\000\000#z\000\000\034\000\000\000\001\000\003\000\037\001\000\000?z\000\000\020\000\000\000\001\000\003\000,\001\000\000\321s\000\000\016\000\000\000\001\000\003\0006\001\000\000\301t\000\000\023\000\000\000\001\000\003\000C\001\000\000Oz\000\000\034\000\000\000\001\000\003\000P\001\000\000\365s\000\000\002\000\000\000\001\000\003\000Z\001\000\000qt\000\000\025\000\000\000\001\000\003\000g\001\000\000kz\000\000\035\000\000\000\001\000\003\000t\001\000\000\367s\000\000\005\000\000\000\001\000\003\000~\001\000\000\210z\000\000\005\000\000\000\001\000\003\000\213\001\000\000wr\000\000C\000\000\000\001\000\003\000\224\001\000\000\201s\000\000\005\000\000\000\001\000\003\000\240\001\000\000)y\000\000\030\000\000\000\001\000\003\000\254\001\000\000\373\177\000\000!\000\000\000\001\000\003\000\270\001\000\000\374s\000\000\b\000\000\000\001\000\003\000\302\001\000\000\206t\000\000;\000\000\000\001\000\003\000\317\001\000\000\215z\000\000%\000\000\000\001\000\003\000\334\001\000\000\324t\000\000\023\000\000\000\001\000\003\000\351\001\000\000\262z\000\000\030\000\000\000\001\000\003\000\366\001\000\000\004t\000\000\004\000\000\000\001\000\003\000\000\002\000\000\347t\000\000^\000\000\000\001\000\003\000\r\002\000\000\312z\000\000\f\000\000\000\001\000\003\000\032\002\000\000\bt\000\000\002\000\000\000\001\000\003\000$\002\000\000Eu\000\000\036\000\000\000\001\000\003\0001\002\000\000\326z\000\000\017\000\000\000\001\000\003\000>\002\000\000\345z\000\000\037\000\000\000\001\000\003\000K\002\000\000cu\000\000D\000\000\000\001\000\003\000U\002\000\000\004{\000\000\035\000\000\000\001\000\003\000b\002\000\000\247u\000\000*\000\000\000\001\000\003\000l\002\000\000!{\000\0006\000\000\000\001\000\003\000y\002\000\000\321u\000\000\034\000\000\000\001\000\003\000\203\002\000\000W{\000\000\003\000\000\000\001\000\003\000\220\002\000\000\355u\000\000^\000\000\000\001\000\003\000\232\002\000\000Z{\000\000\020\000\000\000\001\000\003\000\247\002\000\000Kv\000\000&\000\000\000\001\000\003\000\261\002\000\000j{\000\000\023\000\000\000\001\000\003\000\276\002\000\0000r\000\000G\000\000\000\001\000\003\000\307\002\000\000\206s\000\000\004\000\000\000\001\000\003\000\323\002\000\000Ay\000\000\022\000\000\000\001\000\003\000\337\002\000\000\034\200\000\000\003\000\000\000\001\000\003\000\353\002\000\000qv\000\000$\000\000\000\001\000\003\000\365\002\000\000}{\000\000\002\000\000\000\001\000\003\000\002\003\000\000\225v\000\000\032\000\000\000\001\000\003\000\f\003\000\000\177{\000\000\026\000\000\000\001\000\003\000\031\003\000\000\257v\000\000@\000\000\000\001\000\003\000#\003\000\000\225{\000\000\003\000\000\000\001\000\003\0000\003\000\000\357v\000\000\034\000\000\000\001\000\003\000:\003\000\000\230{\000\000\006\000\000\000\001\000\003\000G\003\000\000\013w\000\000^\000\000\000\001\000\003\000Q\003\000\000\236{\000\000\013\000\000\000\001\000\003\000^\003\000\000iw\000\000\"\000\000\000\001\000\003\000h\003\000\000\251{\000\000\027\000\000\000\001\000\003\000u\003\000\000\213w\000\000$\000\000\000\001\000\003\000\177\003\000\000\300{\000\000\026\000\000\000\001\000\003\000\214\003\000\000\336x\000\000)\000\000\000\001\000\003\000\226\003\000\000\326{\000\000,\000\000\000\001\000\003\000\243\003\000\000\002|\000\000\021\000\000\000\001\000\003\000\255\003\000\000\023|\000\000\t\000\000\000\001\000\003\000\267\003\000\000\272r\000\0006\000\000\000\001\000\003\000\300\003\000\000\212s\000\000\016\000\000\000\001\000\003\000\314\003\000\000Sy\000\000\005\000\000\000\001\000\003\000\330\003\000\000\037\200\000\000\024\000\000\000\001\000\003\000\344\003\000\000\034|\000\000\031\000\000\000\001\000\003\000\356\003\000\0005|\000\000\n\000\000\000\001\000\003\000\370\003\000\000\257w\000\000@\000\000\000\001\000\003\000\002\004\000\000?|\000\000\r\000\000\000\001\000\003\000\017\004\000\000L|\000\0003\000\000\000\001\000\003\000\031\004\000\000\177|\000\000\003\000\000\000\001\000\003\000#\004\000\000\202|\000\0005\000\000\000\001\000\003\000-\004\000\000\267|\000\000\025\000\000\000\001\000\003\0007\004\000\000\314|\000\000\026\000\000\000\001\000\003\000A\004\000\000\342|\000\000\021\000\000\000\001\000\003\000K\004\000\000\363|\000\0007\000\000\000\001\000\003\000U\004\000\000\360r\000\0005\000\000\000\001\000\003\000^\004\000\000\340\200\000\000\026\000\000\000\001\000\003\000k\004\000\000\230s\000\000\r\000\000\000\001\000\003\000w\004\000\000Xy\000\000\b\000\000\000\001\000\003\000\203\004\000\0003\200\000\000\002\000\000\000\001\000\003\000\217\004\000\000*}\000\000\036\000\000\000\001\000\003\000\231\004\000\000H}\000\000\005\000\000\000\001\000\003\000\243\004\000\000M}\000\000$\000\000\000\001\000\003\000\255\004\000\000q}\000\000\027\000\000\000\001\000\003\000\267\004\000\000\210}\000\000$\000\000\000\001\000\003\000\301\004\000\000\254}\000\000\003\000\000\000\001\000\003\000\313\004\000\000\257}\000\000\003\000\000\000\001\000\003\000\325\004\000\000\262}\000\000/\000\000\000\001\000\003\000\337\004\000\000\357w\000\000,\000\000\000\001\000\003\000\351\004\000\000\341}\000\000\003\000\000\000\001\000\003\000\366\004\000\000\033x\000\000+\000\000\000\001\000\003\000\000\005\000\000\344}\000\000/\000\000\000\001\000\003\000\r\005\000\000%s\000\000E\000\000\000\001\000\003\000\026\005\000\000\245s\000\000\n\000\000\000\001\000\003\000\"\005\000\000`y\000\000\005\000\000\000\001\000\003\000.\005\000\0005\200\000\000A\000\000\000\001\000\003\000:\005\000\000Fx\000\0004\000\000\000\001\000\003\000D\005\000\000\023~\000\000\036\000\000\000\001\000\003\000Q\005\000\000zx\000\0000\000\000\000\001\000\003\000[\005\000\0001~\000\000\022\000\000\000\001\000\003\000h\005\000\000C~\000\000\020\000\000\000\001\000\003\000r\005\000\000S~\000\000=\000\000\000\001\000\003\000|\005\000\000\252x\000\0004\000\000\000\001\000\003\000\206\005\000\000\220~\000\000\003\000\000\000\001\000\003\000\223\005\000\000\223~\000\000\026\000\000\000\001\000\003\000\235\005\000\000\251~\000\000;\000\000\000\001\000\003\000\247\005\000\000\344~\000\0007\000\000\000\001\000\003\000\261\005\000\000\033\177\000\0008\000\000\000\001\000\003\000\273\005\000\000js\000\000\016\000\000\000\001\000\003\000\304\005\000\000\366\200\000\000\030\000\000\000\001\000\003\000\321\005\000\000\257s\000\000\t\000\000\000\001\000\003\000\335\005\000\000ey\000\000&\000\000\000\001\000\003\000\351\005\000\000v\200\000\000%\000\000\000\001\000\003\000\365\005\000\000S\177\000\0001\000\000\000\001\000\003\000\377\005\000\000\204\177\000\000\032\000\000\000\001\000\003\000\t\006\000\000\236\177\000\000\013\000\000\000\001\000\003\000\023\006\000\000\251\177\000\000%\000\000\000\001\000\003\000\035\006\000\000\007y\000\000\007\000\000\000\001\000\003\000'\006\000\000xs\000\000\005\000\000\000\001\000\003\0000\006\000\000\275\200\000\000#\000\000\000\001\000\003\000=\006\000\000\270s\000\000\002\000\000\000\001\000\003\000I\006\000\000\316\177\000\000\001\000\000\000\001\000\003\000S\006\000\000\nt\000\000\024\000\000\000\001\000\003\000_\006\000\000\213y\000\000\013\000\000\000\001\000\003\000k\006\000\000<\221\000\000\004\000\000\000\001\000\b\000t\006\000\000<\221\000\000\260\t\000\000\001\002\b\000\212\006\000\0000\001\000\000\020\000\000\000\002\000\001\000\237\006\000\000 \001\000\000\020\000\000\000\002\000\001\000\264\006\000\000P\001\000\000\020\000\000\000\002\000\001\000\356\006\000\000\020\001\000\000\020\000\000\000\002\000\001\000\003\007\000\000`\001\000\000\020\000\000\000\002\000\001\000\r\007\000\000\360\000\000\000\020\000\000\000\002\000\001\000\026\007\000\000\260\000\000\000\020\000\000\000\002\000\001\000\037\007\000\000\340\000\000\000\020\000\000\000\002\000\001\000*\007\000\000\320\000\000\000\020\000\000\000\002\000\001\000;\007\000\000\300\000\000\000\020\000\000\000\002\000\001\000L\007\000\000\240\000\000\000\020\000\000\000\002\000\001\000W\007\000\000\000\001\000\000\020\000\000\000\002\000\001\000b\007\000\000@\001\000\000\020\000\000\000\002\000\001\000m\007\000\000p\001\000\000\020\000\000\000\002\000\001\000\177\007\000\000\200\001\000\000\020\000\000\000\002\000\001\000\223\007\000\000\000\000\000\000\000\000\000\000\004\000\000\000\246\007\000\000\000\220\000\000(\000\000\000!\000\004\000\320\007\000\000\320\027\000\000$\000\000\000\"\000\002\000\020\b\000\000\004\221\000\000\004\000\000\000!\000\005\000:\b\000\000\320\001\000\000\020\000\000\000\"\000\002\000g\b\000\000\000\221\000\000\004\000\000\000!\000\005\000\223\b\000\000\220\001\000\000@\000\000\000\"\000\002\000\302\b\000\000\b\221\000\000\004\000\000\000!\000\005\000\357\b\000\000\000\030\000\000\344\007\000\000\"\000\002\0006\t\000\000\020\221\000\000\004\000\000\000!\000\005\000f\t\000\000d\220\000\000\004\000\000\000!\000\004\000\226\t\000\000P\220\000\000\004\000\000\000!\000\004\000\306\t\000\000\300\026\000\000\004\001\000\000\"\000\002\000\016\n\000\000\f\221\000\000\004\000\000\000!\000\005\000@\n\000\000\\\220\000\000\004\000\000\000!\000\004\000t\n\000\000\030\221\000\000\004\000\000\000!\000\005\000\250\n\000\000T\220\000\000\004\000\000\000!\000\004\000\335\n\000\000`\220\000\000\004\000\000\000!\000\004\000\023\013\000\000`q\000\000\030\000\000\000\"\000\002\000J\013\000\000\024\221\000\000\004\000\000\000!\000\005\000\201\013\000\000 \221\000\000\004\000\000\000!\000\005\000\270\013\000\000\340\001\000\000\220\000\000\000\"\000\002\000\360\013\000\000\360\037\000\000\220\000\000\000\"\000\002\000>\f\000\000p\220\000\000 \000\000\000!\000\004\000x\f\000\000\034\221\000\000\004\000\000\000!\000\005\000\263\f\000\000\260d\000\000\330\000\000\000\"\000\002\000\r\r\000\000X\220\000\000\001\000\000\000!\000\004\000I\r\000\000$\221\000\000\004\000\000\000!\000\005\000\206\r\000\000l\220\000\000\001\000\000\000!\000\004\000\304\r\000\000h\220\000\000\004\000\000\000!\000\004\000\007\016\000\000Y\220\000\000\001\000\000\000!\000\004\000J\016\000\000(\220\000\000(\000\000\000!\000\004\000o\016\000\000\000\000\000\000\000\000\000\000\020\000\000\000\200\016\000\000\000\000\000\000\000\000\000\000\020\000\000\000\221\016\000\000\000\000\000\000\000\000\000\000\020\000\000\000\307\016\000\000\000\000\000\000\000\000\000\000\020\000\000\000\330\016\000\000\000\000\000\000\000\000\000\000\020\000\000\000\336\016\000\000\000\000\000\000\000\000\000\000\020\000\000\000\343\016\000\000\240!\000\000\200\001\000\000\"\000\002\000\001\017\000\000\000\000\000\000\000\000\000\000\020\000\000\000\006\017\000\000\000\000\000\000\000\000\000\000\020\000\000\000\r\017\000\000\2005\000\000\260\000\000\000\"\000\002\000 \017\000\000`2\000\000\024\003\000\000\"\000\002\000B\017\000\0000\024\000\000\220\001\000\000\"\000\002\000Z\017\000\000P\026\000\000\024\000\000\000\"\000\002\000~\017\000\000@q\000\000 \000\000\000\"\000\002\000\235\017\000\0000$\000\000T\000\000\000\"\000\002\000\263\017\000\000 k\000\000\254\000\000\000\"\000\002\000\320\017\000\000\240 \000\000\374\000\000\000\"\000\002\000\344\017\000\000pj\000\000\254\000\000\000\"\000\002\000\377\017\000\000P2\000\000\b\000\000\000\"\000\002\000\032\020\000\000\360o\000\000(\001\000\000\"\000\002\000A\020\000\0000-\000\000\004\001\000\000\"\000\002\000e\020\000\0000)\000\000\374\003\000\000\"\000\002\000\213\020\000\00006\000\000\034\000\000\000\"\000\002\000\246\020\000\000@1\000\000\350\000\000\000\"\000\002\000\312\020\000\000\0008\000\0000\000\000\000\"\000\002\000\355\020\000\000P6\000\000\034\000\000\000\"\000\002\000\t\021\000\000\2000\000\000\274\000\000\000\"\000\002\000+\021\000\000\260\006\000\000\030\000\000\000\"\000\002\000G\021\000\000\320\006\000\000T\000\000\000\"\000\002\000a\021\000\000P\007\000\000\030\000\000\000\"\000\002\000\202\021\000\000\220\006\000\000\024\000\000\000\"\000\002\000\231\021\000\000\220\004\000\000`\001\000\000\"\000\002\000\255\021\000\000p\002\000\000 \002\000\000\"\000\002\000\303\021\000\000p\007\000\000\030\000\000\000\"\000\002\000\341\021\000\000\260\007\000\000\030\000\000\000\"\000\002\000\002\022\000\000\220\007\000\000\030\000\000\000\"\000\002\000'\022\000\000\340'\000\000D\001\000\000\"\000\002\000C\022\000\00002\000\000\b\000\000\000\"\000\002\000m\022\000\000\260&\000\000,\001\000\000\"\000\002\000\213\022\000\000p6\000\000\274\000\000\000\"\000\002\000\236\022\000\000`/\000\000 \001\000\000\"\000\002\000\272\022\000\000p%\000\000,\001\000\000\"\000\002\000\315\022\000\000\240&\000\000\b\000\000\000\"\000\002\000\356\022\000\0000m\000\000\254\000\000\000\"\000\002\000\b\023\000\000@2\000\000\004\000\000\000\"\000\002\000$\023\000\000 #\000\000\f\001\000\000\"\000\002\0009\023\000\000\200l\000\000\254\000\000\000\"\000\002\000U\023\000\000\200 \000\000\024\000\000\000\"\000\002\000k\023\000\00008\000\000\204\000\000\000\"\000\002\000\206\023\000\00007\000\000\310\000\000\000\"\000\002\000\232\023\000\000\220$\000\000\324\000\000\000\"\000\002\000\255\023\000\000\320k\000\000\254\000\000\000\"\000\002\000\307\023\000\000@.\000\000\034\001\000\000\"\000\002\000\341\023\000\000\320\b\000\000 \000\000\000\"\000\002\000\365\023\000\000\260\b\000\000 \000\000\000\"\000\002\000\007\024\000\000\360\b\000\000 \000\000\000\"\000\002\000 \024\000\0000\007\000\000 \000\000\000\"\000\002\000/\024\000\000p\013\000\000\234\007\000\000\"\000\002\000G\024\000\000\000i\000\000\270\000\000\000\"\000\002\000a\024\000\000\300i\000\000\244\000\000\000\"\000\002\000\211\024\000\000\000\000\000\000\000\000\000\000 \000\000\000\226\024\000\000\000@\000\0008\002\000\000\"\000\002\000\270\024\000\000\300>\000\0004\001\000\000\"\000\002\000\324\024\000\000\260Y\000\000P\003\000\000\"\000\002\000\361\024\000\000@X\000\000d\001\000\000\"\000\002\000\007\025\000\000\200=\000\0008\001\000\000\"\000\002\000\035\025\000\000p9\000\000\020\001\000\000\"\000\002\000G\025\000\000@B\000\000<\001\000\000\"\000\002\000p\025\000\000`Q\000\000\364\000\000\000\"\000\002\000\225\025\000\000\200C\000\000T\001\000\000\"\000\002\000\272\025\000\000\340D\000\000<\001\000\000\"\000\002\000\340\025\000\000\000c\000\000\364\000\000\000\"\000\002\000\374\025\000\0000H\000\000\210\001\000\000\"\000\002\000\035\026\000\000 F\000\000\b\002\000\000\"\000\002\000S\026\000\000`R\000\000D\001\000\000\"\000\002\000u\026\000\000\240a\000\000\250\000\000\000\"\000\002\000\235\026\000\000\220;\000\000\354\001\000\000\"\000\002\000\304\026\000\000\200:\000\000\020\001\000\000\"\000\002\000\345\026\000\000\340T\000\000,\001\000\000\"\000\002\000\017\027\000\000\260S\000\000,\001\000\000\"\000\002\0007\027\000\000\000]\000\000\304\001\000\000\"\000\002\000Z\027\000\000Pb\000\000\250\000\000\000\"\000\002\000}\027\000\000@W\000\000\364\000\000\000\"\000\002\000\227\027\000\000\000d\000\000\250\000\000\000\"\000\002\000\275\027\000\000\360`\000\000\250\000\000\000\"\000\002\000\336\027\000\000@Q\000\000\034\000\000\000\"\000\002\000\371\027\000\000\000P\000\000<\001\000\000\"\000\002\000\032\030\000\000\200M\000\000<\001\000\000\"\000\002\000;\030\000\000\300N\000\000<\001\000\000\"\000\002\000\\\030\000\000@L\000\000<\001\000\000\"\000\002\000}\030\000\000\300I\000\000<\001\000\000\"\000\002\000\236\030\000\000\000K\000\000<\001\000\000\"\000\002\000\277\030\000\000\320^\000\000,\001\000\000\"\000\002\000\337\030\000\000\000`\000\000\360\000\000\000\"\000\002\000\374\030\000\000\020V\000\000$\001\000\000\"\000\002\000\034\031\000\000P9\000\000\024\000\000\000\"\000\002\000:\031\000\000\3008\000\000\220\000\000\000\"\000\002\000W\031\000\000\200\006\000\000\b\000\000\000\"\000\002\000c\031\000\000\260\t\000\000\244\000\000\000\"\000\002\000y\031\000\000@\013\000\000,\000\000\000\"\000\002\000\220\031\000\000\360\007\000\000\024\000\000\000\"\000\002\000\243\031\000\000p\006\000\000\b\000\000\000\"\000\002\000\261\031\000\000\360m\000\000\004\000\000\000\"\000\002\000\334\031\000\000\000n\000\000\004\000\000\000\"\000\002\000\025\032\000\000\340m\000\000\004\000\000\000\"\000\002\000@\032\000\000\020\b\000\000\004\000\000\000\"\000\002\000R\032\000\000 \b\000\000\004\000\000\000\"\000\002\000f\032\000\000\020\023\000\000t\000\000\000\"\000\002\000\177\032\000\000\000\000\000\000\000\000\000\000 \000\000\000\214\032\000\000\020n\000\000\000\001\000\000\"\000\002\000\241\032\000\000\020o\000\000\304\000\000\000\"\000\002\000\270\032\000\000\340o\000\000\b\000\000\000\"\000\002\000\335\032\000\000p\026\000\000P\000\000\000\"\000\002\000\004\033\000\000\300\025\000\000\204\000\000\000\"\000\002\000$\033\000\000\020\t\000\000 \000\000\000\"\000\002\000:\033\000\0000\t\000\000 \000\000\000\"\000\002\000S\033\000\000P\t\000\000(\000\000\000\"\000\002\000p\033\000\000 q\000\000\030\000\000\000\"\000\002\000\232\033\000\000\220\b\000\000\030\000\000\000\"\000\002\000\267\033\000\000p\b\000\000\030\000\000\000\"\000\002\000\321\033\000\0000\006\000\0004\000\000\000\"\000\002\000\350\033\000\000\360\005\000\0004\000\000\000\"\000\002\000\001\034\000\000\200\t\000\000$\000\000\000\"\000\002\000\027\034\000\000@\b\000\000$\000\000\000\"\000\002\000.\034\000\0000\b\000\000\004\000\000\000\"\000\002\000J\034\000\000\320\007\000\000\030\000\000\000\"\000\002\000^\034\000\000`\n\000\000,\000\000\000\"\000\002\000v\034\000\000\220\023\000\000\230\000\000\000\"\000\002\000\214\034\000\000\220\n\000\000\260\000\000\000\"\000\002\000\244\034\000\000\220e\000\000h\003\000\000\"\000\002\000\274\034\000\000\000\000\000\000\000\000\000\000\020\000\000\000\303\034\000\000\000\000\000\000\000\000\000\000\020\000\000\000\312\034\000\000\000\000\000\000\000\000\000\000\020\000\000\000\321\034\000\000\000\000\000\000\000\000\000\000\020\000\000\000\337\034\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000D\000\000\000\200q\000\000\000\000\000\000\003\000\003\000D\000\000\000,\221\000\000\000\000\000\000\003\000\007\000E\000\000\000\200q\000\000-\000\000\000\001\000\003\000L\000\000\000\255q\000\000C\000\000\000\001\000\003\000U\000\000\000\360q\000\000@\000\000\000\001\000\003\000`\000\000\000\016y\000\000\033\000\000\000\001\000\003\000l\000\000\000}s\000\000\004\000\000\000\001\000\003\000w\000\000\000\317\177\000\000,\000\000\000\001\000\003\000\203\000\000\000\272s\000\000\003\000\000\000\001\000\003\000\215\000\000\000\036t\000\000\026\000\000\000\001\000\003\000\232\000\000\000\226y\000\000&\000\000\000\001\000\003\000\247\000\000\000\233\200\000\000\"\000\000\000\001\000\003\000\262\000\000\000\016\201\000\000Q\000\000\000\001\000\003\000\275\000\000\000\275s\000\000\003\000\000\000\001\000\003\000\307\000\000\000\274y\000\000\037\000\000\000\001\000\003\000\324\000\000\000\300s\000\000\021\000\000\000\001\000\003\000\336\000\000\0004t\000\000=\000\000\000\001\000\003\000\353\000\000\000\333y\000\000+\000\000\000\001\000\003\000\370\000\000\000\006z\000\000\f\000\000\000\001\000\003\000\005\001\000\000\022z\000\000\021\000\000\000\001\000\003\000\022\001\000\000#z\000\000\034\000\000\000\001\000\003\000\037\001\000\000?z\000\000\020\000\000\000\001\000\003\000,\001\000\000\321s\000\000\016\000\000\000\001\000\003\0006\001\000\000\301t\000\000\023\000\000\000\001\000\003\000C\001\000\000Oz\000\000\034\000\000\000\001\000\003\000P\001\000\000\365s\000\000\002\000\000\000\001\000\003\000Z\001\000\000qt\000\000\025\000\000\000\001\000\003\000g\001\000\000kz\000\000\035\000\000\000\001\000\003\000t\001\000\000\367s\000\000\005\000\000\000\001\000\003\000~\001\000\000\210z\000\000\005\000\000\000\001\000\003\000\213\001\000\000wr\000\000C\000\000\000\001\000\003\000\224\001\000\000\201s\000\000\005\000\000\000\001\000\003\000\240\001\000\000)y\000\000\030\000\000\000\001\000\003\000\254\001\000\000\373\177\000\000!\000\000\000\001\000\003\000\270\001\000\000\374s\000\000\b\000\000\000\001\000\003\000\302\001\000\000\206t\000\000;\000\000\000\001\000\003\000\317\001\000\000\215z\000\000%\000\000\000\001\000\003\000\334\001\000\000\324t\000\000\023\000\000\000\001\000\003\000\351\001\000\000\262z\000\000\030\000\000\000\001\000\003\000\366\001\000\000\004t\000\000\004\000\000\000\001\000\003\000\000\002\000\000\347t\000\000^\000\000\000\001\000\003\000\r\002\000\000\312z\000\000\f\000\000\000\001\000\003\000\032\002\000\000\bt\000\000\002\000\000\000\001\000\003\000$\002\000\000Eu\000\000\036\000\000\000\001\000\003\0001\002\000\000\326z\000\000\017\000\000\000\001\000\003\000>\002\000\000\345z\000\000\037\000\000\000\001\000\003\000K\002\000\000cu\000\000D\000\000\000\001\000\003\000U\002\000\000\004{\000\000\035\000\000\000\001\000\003\000b\002\000\000\247u\000\000*\000\000\000\001\000\003\000l\002\000\000!{\000\0006\000\000\000\001\000\003\000y\002\000\000\321u\000\000\034\000\000\000\001\000\003\000\203\002\000\000W{\000\000\003\000\000\000\001\000\003\000\220\002\000\000\355u\000\000^\000\000\000\001\000\003\000\232\002\000\000Z{\000\000\020\000\000\000\001\000\003\000\247\002\000\000Kv\000\000&\000\000\000\001\000\003\000\261\002\000\000j{\000\000\023\000\000\000\001\000\003\000\276\002\000\0000r\000\000G\000\000\000\001\000\003\000\307\002\000\000\206s\000\000\004\000\000\000\001\000\003\000\323\002\000\000Ay\000\000\022\000\000\000\001\000\003\000\337\002\000\000\034\200\000\000\003\000\000\000\001\000\003\000\353\002\000\000qv\000\000$\000\000\000\001\000\003\000\365\002\000\000}{\000\000\002\000\000\000\001\000\003\000\002\003\000\000\225v\000\000\032\000\000\000\001\000\003\000\f\003\000\000\177{\000\000\026\000\000\000\001\000\003\000\031\003\000\000\257v\000\000@\000\000\000\001\000\003\000#\003\000\000\225{\000\000\003\000\000\000\001\000\003\0000\003\000\000\357v\000\000\034\000\000\000\001\000\003\000:\003\000\000\230{\000\000\006\000\000\000\001\000\003\000G\003\000\000\013w\000\000^\000\000\000\001\000\003\000Q\003\000\000\236{\000\000\013\000\000\000\001\000\003\000^\003\000\000iw\000\000\"\000\000\000\001\000\003\000h\003\000\000\251{\000\000\027\000\000\000\001\000\003\000u\003\000\000\213w\000\000$\000\000\000\001\000\003\000\177\003\000\000\300{\000\000\026\000\000\000\001\000\003\000\214\003\000\000\336x\000\000)\000\000\000\001\000\003\000\226\003\000\000\326{\000\000,\000\000\000\001\000\003\000\243\003\000\000\002|\000\000\021\000\000\000\001\000\003\000\255\003\000\000\023|\000\000\t\000\000\000\001\000\003\000\267\003\000\000\272r\000\0006\000\000\000\001\000\003\000\300\003\000\000\212s\000\000\016\000\000\000\001\000\003\000\314\003\000\000Sy\000\000\005\000\000\000\001\000\003\000\330\003\000\000\037\200\000\000\024\000\000\000\001\000\003\000\344\003\000\000\034|\000\000\031\000\000\000\001\000\003\000\356\003\000\0005|\000\000\n\000\000\000\001\000\003\000\370\003\000\000\257w\000\000@\000\000\000\001\000\003\000\002\004\000\000?|\000\000\r\000\000\000\001\000\003\000\017\004\000\000L|\000\0003\000\000\000\001\000\003\000\031\004\000\000\177|\000\000\003\000\000\000\001\000\003\000#\004\000\000\202|\000\0005\000\000\000\001\000\003\000-\004\000\000\267|\000\000\025\000\000\000\001\000\003\0007\004\000\000\314|\000\000\026\000\000\000\001\000\003\000A\004\000\000\342|\000\000\021\000\000\000\001\000\003\000K\004\000\000\363|\000\0007\000\000\000\001\000\003\000U\004\000\000\360r\000\0005\000\000\000\001\000\003\000^\004\000\000\340\200\000\000\026\000\000\000\001\000\003\000k\004\000\000\230s\000\000\r\000\000\000\001\000\003\000w\004\000\000Xy\000\000\b\000\000\000\001\000\003\000\203\004\000\0003\200\000\000\002\000\000\000\001\000\003\000\217\004\000\000*}\000\000\036\000\000\000\001\000\003\000\231\004\000\000H}\000\000\005\000\000\000\001\000\003\000\243\004\000\000M}\000\000$\000\000\000\001\000\003\000\255\004\000\000q}\000\000\027\000\000\000\001\000\003\000\267\004\000\000\210}\000\000$\000\000\000\001\000\003\000\301\004\000\000\254}\000\000\003\000\000\000\001\000\003\000\313\004\000\000\257}\000\000\003\000\000\000\001\000\003\000\325\004\000\000\262}\000\000/\000\000\000\001\000\003\000\337\004\000\000\357w\000\000,\000\000\000\001\000\003\000\351\004\000\000\341}\000\000\003\000\000\000\001\000\003\000\366\004\000\000\033x\000\000+\000\000\000\001\000\003\000\000\005\000\000\344}\000\000/\000\000\000\001\000\003\000\r\005\000\000%s\000\000E\000\000\000\001\000\003\000\026\005\000\000\245s\000\000\n\000\000\000\001\000\003\000\"\005\000\000`y\000\000\005\000\000\000\001\000\003\000.\005\000\0005\200\000\000A\000\000\000\001\000\003\000:\005\000\000Fx\000\0004\000\000\000\001\000\003\000D\005\000\000\023~\000\000\036\000\000\000\001\000\003\000Q\005\000\000zx\000\0000\000\000\000\001\000\003\000[\005\000\0001~\000\000\022\000\000\000\001\000\003\000h\005\000\000C~\000\000\020\000\000\000\001\000\003\000r\005\000\000S~\000\000=\000\000\000\001\000\003\000|\005\000\000\252x\000\0004\000\000\000\001\000\003\000\206\005\000\000\220~\000\000\003\000\000\000\001\000\003\000\223\005\000\000\223~\000\000\026\000\000\000\001\000\003\000\235\005\000\000\251~\000\000;\000\000\000\001\000\003\000\247\005\000\000\344~\000\0007\000\000\000\001\000\003\000\261\005\000\000\033\177\000\0008\000\000\000\001\000\003\000\273\005\000\000js\000\000\016\000\000\000\001\000\003\000\304\005\000\000\366\200\000\000\030\000\000\000\001\000\003\000\321\005\000\000\257s\000\000\t\000\000\000\001\000\003\000\335\005\000\000ey\000\000&\000\000\000\001\000\003\000\351\005\000\000v\200\000\000%\000\000\000\001\000\003\000\365\005\000\000S\177\000\0001\000\000\000\001\000\003\000\377\005\000\000\204\177\000\000\032\000\000\000\001\000\003\000\t\006\000\000\236\177\000\000\013\000\000\000\001\000\003\000\023\006\000\000\251\177\000\000%\000\000\000\001\000\003\000\035\006\000\000\007y\000\000\007\000\000\000\001\000\003\000'\006\000\000xs\000\000\005\000\000\000\001\000\003\0000\006\000\000\275\200\000\000#\000\000\000\001\000\003\000=\006\000\000\270s\000\000\002\000\000\000\001\000\003\000I\006\000\000\316\177\000\000\001\000\000\000\001\000\003\000S\006\000\000\nt\000\000\024\000\000\000\001\000\003\000_\006\000\000\213y\000\000\013\000\000\000\001\000\003\000k\006\000\000<\221\000\000\004\000\000\000\001\000\b\000t\006\000\000<\221\000\000\260\t\000\000\001\002\b\000\212\006\000\0000\001\000\000\020\000\000\000\002\000\001\000\237\006\000\000 \001\000\000\020\000\000\000\002\000\001\000\264\006\000\000P\001\000\000\020\000\000\000\002\000\001\000\356\006\000\000\020\001\000\000\020\000\000\000\002\000\001\000\003\007\000\000`\001\000\000\020\000\000\000\002\000\001\000\r\007\000\000\360\000\000\000\020\000\000\000\002\000\001\000\026\007\000\000\260\000\000\000\020\000\000\000\002\000\001\000\037\007\000\000\340\000\000\000\020\000\000\000\002\000\001\000*\007\000\000\320\000\000\000\020\000\000\000\002\000\001\000;\007\000\000\300\000\000\000\020\000\000\000\002\000\001\000L\007\000\000\240\000\000\000\020\000\000\000\002\000\001\000W\007\000\000\000\001\000\000\020\000\000\000\002\000\001\000b\007\000\000@\001\000\000\020\000\000\000\002\000\001\000m\007\000\000p\001\000\000\020\000\000\000\002\000\001\000\177\007\000\000\200\001\000\000\020\000\000\000\002\000\001\000\223\007\000\000\000\000\000\000\000\000\000\000\004\000\000\000\246\007\000\000\000\220\000\000(\000\000\000!\000\004\000\320\007\000\000\320\027\000\000$\000\000\000\"\000\002\000\020\b\000\000\004\221\000\000\004\000\000\000!\000\005\000:\b\000\000\320\001\000\000\020\000\000\000\"\000\002\000g\b\000\000\000\221\000\000\004\000\000\000!\000\005\000\223\b\000\000\220\001\000\000@\000\000\000\"\000\002\000\302\b\000\000\b\221\000\000\004\000\000\000!\000\005\000\357\b\000\000\000\030\000\000\344\007\000\000\"\000\002\0006\t\000\000\020\221\000\000\004\000\000\000!\000\005\000f\t\000\000d\220\000\000\004\000\000\000!\000\004\000\226\t\000\000P\220\000\000\004\000\000\000!\000\004\000\306\t\000\000\300\026\000\000\004\001\000\000\"\000\002\000\016\n\000\000\f\221\000\000\004\000\000\000!\000\005\000@\n\000\000\\\220\000\000\004\000\000\000!\000\004\000t\n\000\000\030\221\000\000\004\000\000\000!\000\005\000\250\n\000\000T\220\000\000\004\000\000\000!\000\004\000\335\n\000\000`\220\000\000\004\000\000\000!\000\004\000\023\013\000\000`q\000\000\030\000\000\000\"\000\002\000J\013\000\000\024\221\000\000\004\000\000\000!\000\005\000\201\013\000\000 \221\000\000\004\000\000\000!\000\005\000\270\013\000\000\340\001\000\000\220\000\000\000\"\000\002\000\360\013\000\000\360\037\000\000\220\000\000\000\"\000\002\000>\f\000\000p\220\000\000 \000\000\000!\000\004\000x\f\000\000\034\221\000\000\004\000\000\000!\000\005\000\263\f\000\000\260d\000\000\330\000\000\000\"\000\002\000\r\r\000\000X\220\000\000\001\000\000\000!\000\004\000I\r\000\000$\221\000\000\004\000\000\000!\000\005\000\206\r\000\000l\220\000\000\001\000\000\000!\000\004\000\304\r\000\000h\220\000\000\004\000\000\000!\000\004\000\007\016\000\000Y\220\000\000\001\000\000\000!\000\004\000J\016\000\000(\220\000\000(\000\000\000!\000\004\000o\016\000\000\000\000\000\000\000\000\000\000\020\000\000\000\200\016\000\000\000\000\000\000\000\000\000\000\020\000\000\000\221\016\000\000\000\000\000\000\000\000\000\000\020\000\000\000\307\016\000\000\000\000\000\000\000\000\000\000\020\000\000\000\330\016\000\000\000\000\000\000\000\000\000\000\020\000\000\000\336\016\000\000\000\000\000\000\000\000\000\000\020\000\000\000\343\016\000\000\240!\000\000\200\001\000\000\"\000\002\000\001\017\000\000\000\000\000\000\000\000\000\000\020\000\000\000\006\017\000\000\000\000\000\000\000\000\000\000\020\000\000\000\r\017\000\000\2005\000\000\260\000\000\000\"\000\002\000 \017\000\000`2\000\000\024\003\000\000\"\000\002\000B\017\000\0000\024\000\000\220\001\000\000\"\000\002\000Z\017\000\000P\026\000\000\024\000\000\000\"\000\002\000~\017\000\000@q\000\000 \000\000\000\"\000\002\000\235\017\000\0000$\000\000T\000\000\000\"\000\002\000\263\017\000\000 k\000\000\254\000\000\000\"\000\002\000\320\017\000\000\240 \000\000\374\000\000\000\"\000\002\000\344\017\000\000pj\000\000\254\000\000\000\"\000\002\000\377\017\000\000P2\000\000\b\000\000\000\"\000\002\000\032\020\000\000\360o\000\000(\001\000\000\"\000\002\000A\020\000\0000-\000\000\004\001\000\000\"\000\002\000e\020\000\0000)\000\000\374\003\000\000\"\000\002\000\213\020\000\00006\000\000\034\000\000\000\"\000\002\000\246\020\000\000@1\000\000\350\000\000\000\"\000\002\000\312\020\000\000\0008\000\0000\000\000\000\"\000\002\000\355\020\000\000P6\000\000\034\000\000\000\"\000\002\000\t\021\000\000\2000\000\000\274\000\000\000\"\000\002\000+\021\000\000\260\006\000\000\030\000\000\000\"\000\002\000G\021\000\000\320\006\000\000T\000\000\000\"\000\002\000a\021\000\000P\007\000\000\030\000\000\000\"\000\002\000\202\021\000\000\220\006\000\000\024\000\000\000\"\000\002\000\231\021\000\000\220\004\000\000`\001\000\000\"\000\002\000\255\021\000\000p\002\000\000 \002\000\000\"\000\002\000\303\021\000\000p\007\000\000\030\000\000\000\"\000\002\000\341\021\000\000\260\007\000\000\030\000\000\000\"\000\002\000\002\022\000\000\220\007\000\000\030\000\000\000\"\000\002\000'\022\000\000\340'\000\000D\001\000\000\"\000\002\000C\022\000\00002\000\000\b\000\000\000\"\000\002\000m\022\000\000\260&\000\000,\001\000\000\"\000\002\000\213\022\000\000p6\000\000\274\000\000\000\"\000\002\000\236\022\000\000`/\000\000 \001\000\000\"\000\002\000\272\022\000\000p%\000\000,\001\000\000\"\000\002\000\315\022\000\000\240&\000\000\b\000\000\000\"\000\002\000\356\022\000\0000m\000\000\254\000\000\000\"\000\002\000\b\023\000\000@2\000\000\004\000\000\000\"\000\002\000$\023\000\000 #\000\000\f\001\000\000\"\000\002\0009\023\000\000\200l\000\000\254\000\000\000\"\000\002\000U\023\000\000\200 \000\000\024\000\000\000\"\000\002\000k\023\000\00008\000\000\204\000\000\000\"\000\002\000\206\023\000\00007\000\000\310\000\000\000\"\000\002\000\232\023\000\000\220$\000\000\324\000\000\000\"\000\002\000\255\023\000\000\320k\000\000\254\000\000\000\"\000\002\000\307\023\000\000@.\000\000\034\001\000\000\"\000\002\000\341\023\000\000\320\b\000\000 \000\000\000\"\000\002\000\365\023\000\000\260\b\000\000 \000\000\000\"\000\002\000\007\024\000\000\360\b\000\000 \000\000\000\"\000\002\000 \024\000\0000\007\000\000 \000\000\000\"\000\002\000/\024\000\000p\013\000\000\234\007\000\000\"\000\002\000G\024\000\000\000i\000\000\270\000\000\000\"\000\002\000a\024\000\000\300i\000\000\244\000\000\000\"\000\002\000\211\024\000\000\000\000\000\000\000\000\000\000 \000\000\000\226\024\000\000\000@\000\0008\002\000\000\"\000\002\000\270\024\000\000\300>\000\0004\001\000\000\"\000\002\000\324\024\000\000\260Y\000\000P\003\000\000\"\000\002\000\361\024\000\000@X\000\000d\001\000\000\"\000\002\000\007\025\000\000\200=\000\0008\001\000\000\"\000\002\000\035\025\000\000p9\000\000\020\001\000\000\"\000\002\000G\025\000\000@B\000\000<\001\000\000\"\000\002\000p\025\000\000`Q\000\000\364\000\000\000\"\000\002\000\225\025\000\000\200C\000\000T\001\000\000\"\000\002\000\272\025\000\000\340D\000\000<\001\000\000\"\000\002\000\340\025\000\000\000c\000\000\364\000\000\000\"\000\002\000\374\025\000\0000H\000\000\210\001\000\000\"\000\002\000\035\026\000\000 F\000\000\b\002\000\000\"\000\002\000S\026\000\000`R\000\000D\001\000\000\"\000\002\000u\026\000\000\240a\000\000\250\000\000\000\"\000\002\000\235\026\000\000\220;\000\000\354\001\000\000\"\000\002\000\304\026\000\000\200:\000\000\020\001\000\000\"\000\002\000\345\026\000\000\340T\000\000,\001\000\000\"\000\002\000\017\027\000\000\260S\000\000,\001\000\000\"\000\002\0007\027\000\000\000]\000\000\304\001\000\000\"\000\002\000Z\027\000\000Pb\000\000\250\000\000\000\"\000\002\000}\027\000\000@W\000\000\364\000\000\000\"\000\002\000\227\027\000\000\000d\000\000\250\000\000\000\"\000\002\000\275\027\000\000\360`\000\000\250\000\000\000\"\000\002\000\336\027\000\000@Q\000\000\034\000\000\000\"\000\002\000\371\027\000\000\000P\000\000<\001\000\000\"\000\002\000\032\030\000\000\200M\000\000<\001\000\000\"\000\002\000;\030\000\000\300N\000\000<\001\000\000\"\000\002\000\\\030\000\000@L\000\000<\001\000\000\"\000\002\000}\030\000\000\300I\000\000<\001\000\000\"\000\002\000\236\030\000\000\000K\000\000<\001\000\000\"\000\002\000\277\030\000\000\320^\000\000,\001\000\000\"\000\002\000\337\030\000\000\000`\000\000\360\000\000\000\"\000\002\000\374\030\000\000\020V\000\000$\001\000\000\"\000\002\000\034\031\000\000P9\000\000\024\000\000\000\"\000\002\000:\031\000\000\3008\000\000\220\000\000\000\"\000\002\000W\031\000\000\200\006\000\000\b\000\000\000\"\000\002\000c\031\000\000\260\t\000\000\244\000\000\000\"\000\002\000y\031\000\000@\013\000\000,\000\000\000\"\000\002\000\220\031\000\000\360\007\000\000\024\000\000\000\"\000\002\000\243\031\000\000p\006\000\000\b\000\000\000\"\000\002\000\261\031\000\000\360m\000\000\004\000\000\000\"\000\002\000\334\031\000\000\000n\000\000\004\000\000\000\"\000\002\000\025\032\000\000\340m\000\000\004\000\000\000\"\000\002\000@\032\000\000\020\b\000\000\004\000\000\000\"\000\002\000R\032\000\000 \b\000\000\004\000\000\000\"\000\002\000f\032\000\000\020\023\000\000t\000\000\000\"\000\002\000\177\032\000\000\000\000\000\000\000\000\000\000 \000\000\000\214\032\000\000\020n\000\000\000\001\000\000\"\000\002\000\241\032\000\000\020o\000\000\304\000\000\000\"\000\002\000\270\032\000\000\340o\000\000\b\000\000\000\"\000\002\000\335\032\000\000p\026\000\000P\000\000\000\"\000\002\000\004\033\000\000\300\025\000\000\204\000\000\000\"\000\002\000$\033\000\000\020\t\000\000 \000\000\000\"\000\002\000:\033\000\0000\t\000\000 \000\000\000\"\000\002\000S\033\000\000P\t\000\000(\000\000\000\"\000\002\000p\033\000\000 q\000\000\030\000\000\000\"\000\002\000\232\033\000\000\220\b\000\000\030\000\000\000\"\000\002\000\267\033\000\000p\b\000\000\030\000\000\000\"\000\002\000\321\033\000\0000\006\000\0004\000\000\000\"\000\002\000\350\033\000\000\360\005\000\0004\000\000\000\"\000\002\000\001\034\000\000\200\t\000\000$\000\000\000\"\000\002\000\027\034\000\000@\b\000\000$\000\000\000\"\000\002\000.\034\000\0000\b\000\000\004\000\000\000\"\000\002\000J\034\000\000\320\007\000\000\030\000\000\000\"\000\002\000^\034\000\000`\n\000\000,\000\000\000\"\000\002\000v\034\000\000\220\023\000\000\230\000\000\000\"\000\002\000\214\034\000\000\220\n\000\000\260\000\000\000\"\000\002\000\244\034\000\000\220e\000\000h\003\000\000\"\000\002\000\274\034\000\000\000\000\000\000\000\000\000\000\020\000\000\000\303\034\000\000\000\000\000\000\000\000\000\000\020\000\000\000\312\034\000\000\000\000\000\000\000\000\000\000\020\000\000\000\321\034\000\000\000\000\000\000\000\000\000\000\020\000\000\000\337\034\000\000\000\000\000\000\000\000\000\000\020\000\000\000\001\000\000\000G\001\000\000F\001\000\000\000\000\000\000\000\000\000\000\001\000\000\000\002\000\000\000\003\000\000\000\004\000\000\000\005\000\000\000\006\000\000\000\007\000\000\000\b\000\000\000\t\000\000\000\n\000\000\000\013\000\000\000\f\000\000\000\r\000\000\000\016\000\000\000\017\000\000\000\020\000\000\000\021\000\000\000\022\000\000\000\023\000\000\000\024\000\000\000\025\000\000\000\026\000\000\000\027\000\000\000\030\000\000\000\031\000\000\000\032\000\000\000\033\000\000\000\034\000\000\000\035\000\000\000\036\000\000\000\037\000\000\000 \000\000\000!\000\000\000\"\000\000\000#\000\000\000$\000\000\000%\000\000\000&\000\000\000'\000\000\000(\000\000\000)\000\000\000*\000\000\000+\000\000\000,\000\000\000-\000\000\000.\000\000\000/\000\000\0000\000\000\0001\000\000\0002\000\000\0003\000\000\0004\000\000\0005\000\000\0006\000\000\0007\000\000\0008\000\000\0009\000\000\000:\000\000\000;\000\000\000<\000\000\000=\000\000\000>\000\000\000?\000\000\000@\000\000\000A\000\000\000B\000\000\000C\000\000\000D\000\000\000E\000\000\000F\000\000\000G\000\000\000H\000\000\000I\000\000\000J\000\000\000K\000\000\000L\000\000\000M\000\000\000N\000\000\000O\000\000\000P\000\000\000Q\000\000\000R\000\000\000S\000\000\000T\000\000\000U\000\000\000V\000\000\000W\000\000\000X\000\000\000Y\000\000\000Z\000\000\000[\000\000\000\\\000\000\000]\000\000\000^\000\000\000_\000\000\000`\000\000\000a\000\000\000b\000\000\000c\000\000\000d\000\000\000e\000\000\000f\000\000\000g\000\000\000h\000\000\000i\000\000\000j\000\000\000k\000\000\000l\000\000\000m\000\000\000n\000\000\000o\000\000\000p\000\000\000q\000\000\000r\000\000\000s\000\000\000t\000\000\000u\000\000\000v\000\000\000w\000\000\000x\000\000\000y\000\000\000z\000\000\000{\000\000\000|\000\000\000}\000\000\000~\000\000\000\177\000\000\000\200\000\000\000\201\000\000\000\202\000\000\000\203\000\000\000\204\000\000\000\205\000\000\000\206\000\000\000\207\000\000\000\210\000\000\000\211\000\000\000\212\000\000\000\213\000\000\000\214\000\000\000\215\000\000\000\216\000\000\000\217\000\000\000\220\000\000\000\221\000\000\000\222\000\000\000\223\000\000\000\224\000\000\000\225\000\000\000\226\000\000\000\227\000\000\000\230\000\000\000\231\000\000\000\232\000\000\000\233\000\000\000\234\000\000\000\235\000\000\000\236\000\000\000\237\000\000\000\240\000\000\000\241\000\000\000\242\000\000\000\243\000\000\000\244\000\000\000\245\000\000\000\246\000\000\000\247\000\000\000\250\000\000\000\251\000\000\000\252\000\000\000\253\000\000\000\254\000\000\000\255\000\000\000\256\000\000\000\257\000\000\000\260\000\000\000\261\000\000\000\262\000\000\000\263\000\000\000\264\000\000\000\265\000\000\000\266\000\000\000\267\000\000\000\270\000\000\000\271\000\000\000\272\000\000\000\273\000\000\000\274\000\000\000\275\000\000\000\276\000\000\000\277\000\000\000\300\000\000\000\301\000\000\000\302\000\000\000\303\000\000\000\304\000\000\000\305\000\000\000\306\000\000\000\307\000\000\000\310\000\000\000\311\000\000\000\312\000\000\000\313\000\000\000\314\000\000\000\315\000\000\000\316\000\000\000\317\000\000\000\320\000\000\000\321\000\000\000\322\000\000\000\323\000\000\000\324\000\000\000\325\000\000\000\326\000\000\000\327\000\000\000\330\000\000\000\331\000\000\000\332\000\000\000\333\000\000\000\334\000\000\000\335\000\000\000\336\000\000\000\337\000\000\000\340\000\000\000\341\000\000\000\342\000\000\000\343\000\000\000\344\000\000\000\345\000\000\000\346\000\000\000\347\000\000\000\350\000\000\000\351\000\000\000\352\000\000\000\353\000\000\000\354\000\000\000\355\000\000\000\356\000\000\000\357\000\000\000\360\000\000\000\361\000\000\000\362\000\000\000\363\000\000\000\364\000\000\000\365\000\000\000\366\000\000\000\367\000\000\000\370\000\000\000\371\000\000\000\372\000\000\000\373\000\000\000\374\000\000\000\375\000\000\000\376\000\000\000\377\000\000\000\000\001\000\000\001\001\000\000\002\001\000\000\003\001\000\000\004\001\000\000\005\001\000\000\006\001\000\000\007\001\000\000\b\001\000\000\t\001\000\000\n\001\000\000\013\001\000\000\f\001\000\000\r\001\000\000\016\001\000\000\017\001\000\000\020\001\000\000\021\001\000\000\022\001\000\000\023\001\000\000\024\001\000\000\025\001\000\000\026\001\000\000\027\001\000\000\030\001\000\000\031\001\000\000\032\001\000\000\033\001\000\000\034\001\000\000\035\001\000\000\036\001\000\000\037\001\000\000 \001\000\000!\001\000\000\"\001\000\000#\001\000\000$\001\000\000%\001\000\000&\001\000\000'\001\000\000(\001\000\000)\001\000\000*\001\000\000+\001\000\000,\001\000\000-\001\000\000.\001\000\000/\001\000\0000\001\000\0001\001\000\0002\001\000\0003\001\000\0004\001\000\0005\001\000\0006\001\000\0007\001\000\0008\001\000\0009\001\000\000:\001\000\000;\001\000\000<\001\000\000=\001\000\000>\001\000\000?\001\000\000@\001\000\000A\001\000\000B\001\000\000C\001\000\000D\001\000\000E\001\000\000\000\000\000\000H\221\000\000\"B\001\000\000\000\000\000L\221\000\000\"\307\000\000\000\000\000\000P\221\000\000\",\001\000\000\000\000\000T\221\000\000\"\374\000\000\000\000\000\000X\221\000\000\"\310\000\000\000\000\000\000\\\221\000\000\"\305\000\000\000\000\000\000`\221\000\000\"C\001\000\000\000\000\000d\221\000\000\"\303\000\000\000\000\000\000h\221\000\000\"\301\000\000\000\000\000\000l\221\000\000\"\300\000\000\000\000\000\000p\221\000\000\"D\001\000\000\000\000\000t\221\000\000\"\302\000\000\000\000\000\000x\221\000\000\"\304\000\000\000\000\000\000|\221\000\000\"E\001\000\000\000\000\000\200\221\000\000\"F\001\000\000\000\000\000\204\221\000\000!\277\000\000\000\000\000\000\210\221\000\000!\241\000\000\000\000\000\000\214\221\000\000!\245\000\000\000\000\000\000\220\221\000\000!\243\000\000\000\000\000\000\224\221\000\000!\247\000\000\000\000\000\000\230\221\000\000!\251\000\000\000\000\000\000\234\221\000\000!\255\000\000\000\000\000\000\240\221\000\000!\263\000\000\000\000\000\000\244\221\000\000!\257\000\000\000\000\000\000\250\221\000\000!\264\000\000\000\000\000\000\254\221\000\000!\270\000\000\000\000\000\000\260\221\000\000!\253\000\000\000\000\000\000\264\221\000\000!\272\000\000\000\000\000\000\270\221\000\000!\260\000\000\000\000\000\000\274\221\000\000!\276\000\000\000\000\000\000\300\221\000\000!\256\000\000\000\000\000\000\304\221\000\000!\261\000\000\000\000\000\000\310\221\000\000!\252\000\000\000\000\000\000\314\221\000\000!\275\000\000\000\000\000\000\320\221\000\000!\267\000\000\000\000\000\000\324\221\000\000!\274\000\000\000\000\000\000\330\221\000\000!\273\000\000\000\000\000\000\000\221\000\000#\000\000\000p\002\000\000\004\221\000\000#\000\000\000\220\004\000\000\b\221\000\000#\000\000\000\220\006\000\000\f\221\000\000#\000\000\000\260\006\000\000\020\221\000\000#\000\000\000\320\006\000\000\024\221\000\000#\000\000\000P\007\000\000\030\221\000\000#\000\000\000p\007\000\000\034\221\000\000#\000\000\000\220\007\000\000 \221\000\000#\000\000\000\260\007\000\000$\221\000\000#\000\000\000\360o\000\000(\221\000\000#\000\000\000\340\001\000\000,\221\000\000#\000\000\000\361s\000\0000\221\000\000#\000\000\000\354s\000\0004\221\000\000#\000\000\000\346s\000\0008\221\000\000#\000\000\000\337s\000\000\000.plt\000.text\000.rodata.str1.1\000.bss\000.data\000.fini_array\000.data.rel.ro\000.got\000\000.L.str\000.L.str.1\000.L.str.1.2\000.L.str.1.38\000.L.str.1.9\000.L.str.1.90\000.L.str.10\000.L.str.10.18\000.L.str.10.47\000.L.str.102\000.L.str.106\000.L.str.11\000.L.str.11.48\000.L.str.12\000.L.str.12.19\000.L.str.12.49\000.L.str.13.50\000.L.str.14.51\000.L.str.15.52\000.L.str.16.53\000.L.str.17\000.L.str.17.22\000.L.str.17.54\000.L.str.18\000.L.str.18.20\000.L.str.18.55\000.L.str.19\000.L.str.19.56\000.L.str.2\000.L.str.2.10\000.L.str.2.39\000.L.str.2.91\000.L.str.20\000.L.str.20.21\000.L.str.20.57\000.L.str.21.23\000.L.str.21.58\000.L.str.22\000.L.str.22.24\000.L.str.22.59\000.L.str.23\000.L.str.23.25\000.L.str.23.60\000.L.str.24.61\000.L.str.25\000.L.str.25.62\000.L.str.26\000.L.str.26.63\000.L.str.27\000.L.str.27.64\000.L.str.28\000.L.str.28.65\000.L.str.29\000.L.str.29.66\000.L.str.3\000.L.str.3.11\000.L.str.3.40\000.L.str.3.92\000.L.str.30\000.L.str.30.67\000.L.str.31\000.L.str.31.68\000.L.str.32\000.L.str.32.69\000.L.str.33\000.L.str.33.70\000.L.str.34\000.L.str.34.71\000.L.str.35\000.L.str.35.72\000.L.str.36\000.L.str.36.73\000.L.str.37\000.L.str.37.74\000.L.str.38\000.L.str.39\000.L.str.4\000.L.str.4.12\000.L.str.4.41\000.L.str.4.93\000.L.str.40\000.L.str.41\000.L.str.42\000.L.str.42.75\000.L.str.43\000.L.str.44\000.L.str.45\000.L.str.46\000.L.str.47\000.L.str.48\000.L.str.49\000.L.str.5\000.L.str.5.104\000.L.str.5.13\000.L.str.5.42\000.L.str.5.94\000.L.str.50\000.L.str.51\000.L.str.52\000.L.str.53\000.L.str.54\000.L.str.55\000.L.str.56\000.L.str.57\000.L.str.58\000.L.str.58.76\000.L.str.59\000.L.str.59.77\000.L.str.6\000.L.str.6.14\000.L.str.6.43\000.L.str.6.96\000.L.str.60\000.L.str.60.78\000.L.str.61\000.L.str.61.79\000.L.str.62\000.L.str.63\000.L.str.64\000.L.str.64.80\000.L.str.65\000.L.str.67\000.L.str.68\000.L.str.69\000.L.str.7\000.L.str.7.105\000.L.str.7.15\000.L.str.7.44\000.L.str.7.97\000.L.str.70\000.L.str.71\000.L.str.72\000.L.str.73\000.L.str.75\000.L.str.8\000.L.str.8.103\000.L.str.8.16\000.L.str.89\000.L.str.9.17\000.L.str.9.46\000_DYNAMIC\000_GLOBAL_OFFSET_TABLE_\000plt___hexagon_adddf3\000plt___hexagon_divdf3\000plt___hexagon_memcpy_likely_aligned_min32bytes_mult8bytes\000plt___hexagon_muldf3\000plt_abort\000plt_atoi\000plt_free\000plt_getenv\000plt_halide_error\000plt_halide_print\000plt_malloc\000plt_memcpy\000plt_memset\000plt_qurt_hvx_lock\000plt_qurt_hvx_unlock\000qurt_allocator.cpp\000_ZN6Halide7Runtime8Internal11buf_is_usedE\000_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv\000_ZN6Halide7Runtime8Internal11custom_freeE\000_ZN6Halide7Runtime8Internal12aligned_freeEPv\000_ZN6Halide7Runtime8Internal13custom_mallocE\000_ZN6Halide7Runtime8Internal14aligned_mallocEjj\000_ZN6Halide7Runtime8Internal14custom_do_taskE\000_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b\000_ZN6Halide7Runtime8Internal17custom_do_par_forE\000_ZN6Halide7Runtime8Internal17device_copy_mutexE\000_ZN6Halide7Runtime8Internal17halide_gpu_deviceE\000_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx\000_ZN6Halide7Runtime8Internal19custom_do_loop_taskE\000_ZN6Halide7Runtime8Internal21allocation_pools_lockE\000_ZN6Halide7Runtime8Internal21custom_semaphore_initE\000_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE\000_ZN6Halide7Runtime8Internal23device_allocation_poolsE\000_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv\000_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE\000_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE\000_ZN6Halide7Runtime8Internal24halide_allocator_cleanupEv\000_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t\000_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE\000_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE\000_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t\000_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE\000_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE\000_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE\000_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE\000_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE\000_ZN6Halide7Runtime8Internal7mem_bufE\000__hexagon_adddf3\000__hexagon_divdf3\000__hexagon_memcpy_likely_aligned_min32bytes_mult8bytes\000__hexagon_muldf3\000abort\000atoi\000copy_to_device_already_locked\000free\000getenv\000halide_buffer_copy\000halide_buffer_copy_already_locked\000halide_buffer_to_string\000halide_can_reuse_device_allocations\000halide_can_use_target_features\000halide_copy_to_device\000halide_copy_to_device_legacy\000halide_copy_to_host\000halide_copy_to_host_legacy\000halide_default_buffer_copy\000halide_default_can_use_target_features\000halide_default_device_and_host_free\000halide_default_device_and_host_malloc\000halide_default_device_crop\000halide_default_device_detach_native\000halide_default_device_release_crop\000halide_default_device_slice\000halide_default_device_wrap_native\000halide_default_do_loop_task\000halide_default_do_par_for\000halide_default_do_parallel_tasks\000halide_default_do_task\000halide_default_free\000halide_default_malloc\000halide_default_semaphore_init\000halide_default_semaphore_release\000halide_default_semaphore_try_acquire\000halide_device_and_host_free\000halide_device_and_host_free_as_destructor\000halide_device_and_host_malloc\000halide_device_crop\000halide_device_detach_native\000halide_device_free\000halide_device_free_as_destructor\000halide_device_free_legacy\000halide_device_host_nop_free\000halide_device_malloc\000halide_device_malloc_legacy\000halide_device_release\000halide_device_release_crop\000halide_device_slice\000halide_device_sync\000halide_device_sync_legacy\000halide_device_wrap_native\000halide_do_loop_task\000halide_do_par_for\000halide_do_parallel_tasks\000halide_do_task\000halide_double_to_string\000halide_downgrade_buffer_t\000halide_downgrade_buffer_t_device_fields\000halide_error\000halide_error_access_out_of_bounds\000halide_error_bad_dimensions\000halide_error_bad_extern_fold\000halide_error_bad_fold\000halide_error_bad_type\000halide_error_bounds_inference_call_failed\000halide_error_buffer_allocation_too_large\000halide_error_buffer_argument_is_null\000halide_error_buffer_extents_negative\000halide_error_buffer_extents_too_large\000halide_error_buffer_is_null\000halide_error_constraint_violated\000halide_error_constraints_make_required_region_smaller\000halide_error_debug_to_file_failed\000halide_error_device_interface_no_device\000halide_error_explicit_bounds_too_small\000halide_error_extern_stage_failed\000halide_error_failed_to_downgrade_buffer_t\000halide_error_failed_to_upgrade_buffer_t\000halide_error_fold_factor_too_small\000halide_error_host_and_device_dirty\000halide_error_host_is_null\000halide_error_integer_division_by_zero\000halide_error_no_device_interface\000halide_error_out_of_memory\000halide_error_param_too_large_f64\000halide_error_param_too_large_i64\000halide_error_param_too_large_u64\000halide_error_param_too_small_f64\000halide_error_param_too_small_i64\000halide_error_param_too_small_u64\000halide_error_requirement_failed\000halide_error_specialize_fail\000halide_error_unaligned_host_ptr\000halide_float16_bits_to_double\000halide_float16_bits_to_float\000halide_free\000halide_get_gpu_device\000halide_int64_to_string\000halide_join_thread\000halide_malloc\000halide_msan_annotate_buffer_is_initialized\000halide_msan_annotate_buffer_is_initialized_as_destructor\000halide_msan_annotate_memory_is_initialized\000halide_mutex_lock\000halide_mutex_unlock\000halide_pointer_to_string\000halide_print\000halide_qurt_hvx_lock\000halide_qurt_hvx_unlock\000halide_qurt_hvx_unlock_as_destructor\000halide_register_device_allocation_pool\000halide_reuse_device_allocations\000halide_semaphore_init\000halide_semaphore_release\000halide_semaphore_try_acquire\000halide_set_custom_can_use_target_features\000halide_set_custom_do_par_for\000halide_set_custom_do_task\000halide_set_custom_free\000halide_set_custom_malloc\000halide_set_gpu_device\000halide_set_num_threads\000halide_shutdown_thread_pool\000halide_spawn_thread\000halide_string_to_string\000halide_type_to_string\000halide_uint64_to_string\000halide_upgrade_buffer_t\000malloc\000memcpy\000memset\000qurt_hvx_lock\000qurt_hvx_unlock\000.symtab\000.dynsym\000.hash\000.rela.got\000libhalide_shared_runtime.so\000libhalide_hexagon_remote_skel.so\000.dynamic\000.strtab\000\000\000\000\001\000\000\000+\035\000\000\016\000\000\000\017\035\000\000\020\000\000\000\000\000\000\000\004\000\000\000\314\303\000\000\006\000\000\000\\\257\000\000\013\000\000\000\020\000\000\000\005\000\000\000h\313\000\000\n\000\000\000]\035\000\000\003\000\000\000<\221\000\000\027\000\000\000\370\310\000\000\024\000\000\000\007\000\000\000\002\000\000\000\264\000\000\000\007\000\000\000\254\311\000\000\b\000\000\000\274\001\000\000\t\000\000\000\f\000\000\000\001\000\000p\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\001\000\000\000\006\000\000\000\240\000\000\000\240\000\000\000\360\000\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\006\000\000\000\001\000\000\000\006\000\000\000\220\001\000\000\220\001\000\000\350o\000\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\000\000\f\000\000\000\001\000\000\0002\000\000\000\200q\000\000\200q\000\000\337\017\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\033\000\000\000\001\000\000\000\003\000\000\000\000\220\000\000\000\220\000\000\220\000\000\000\000\000\000\000\000\000\000\000\200\000\000\000\000\000\000\000 \000\000\000\001\000\000\000\003\000\000\000\000\221\000\000\000\221\000\000(\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000&\000\000\000\017\000\000\000\003\000\000\000(\221\000\000(\221\000\000\004\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\0002\000\000\000\001\000\000\000\003\000\000\000,\221\000\000,\221\000\000\020\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000?\000\000\000\001\000\000\000\002\000\000\000<\221\000\000<\221\000\000\260\t\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\357\034\000\000\002\000\000\000\002\000\000\000\354\232\000\000\354\232\000\000p\024\000\000\r\000\000\000\241\000\000\000\004\000\000\000\020\000\000\000\367\034\000\000\013\000\000\000\002\000\000\000\\\257\000\000\\\257\000\000p\024\000\000\r\000\000\000\241\000\000\000\004\000\000\000\020\000\000\000\377\034\000\000\005\000\000\000\002\000\000\000\314\303\000\000\314\303\000\000(\005\000\000\n\000\000\000\000\000\000\000\004\000\000\000\004\000\000\000\005\035\000\000\004\000\000\000\002\000\000\000\370\310\000\000\370\310\000\000p\002\000\000\t\000\000\000\b\000\000\000\b\000\000\000\f\000\000\000U\035\000\000\003\000\000\000\002\000\000\000h\313\000\000h\313\000\000]\035\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000L\035\000\000\006\000\000\000\002\000\000\000\310\350\000\000\310\350\000\000\210\000\000\000\r\000\000\000\000\000\000\000\004\000\000\000\b\000\000"
	.size	.Lhalide_shared_runtime.data, 62040

	.type	.Lstr,@object           # @str
	.p2align	5
.Lstr:
	.asciz	"input"
	.size	.Lstr, 6

	.type	.Lstr.250,@object       # @str.250
	.p2align	5
.Lstr.250:
	.asciz	"blur_y"
	.size	.Lstr.250, 7

	.type	.Lstr.251,@object       # @str.251
	.p2align	5
.Lstr.251:
	.asciz	"Output buffer blur_y"
	.size	.Lstr.251, 21

	.type	.Lstr.252,@object       # @str.252
	.p2align	5
.Lstr.252:
	.asciz	"Input buffer input"
	.size	.Lstr.252, 19

	.type	.Lstr.253,@object       # @str.253
	.p2align	5
.Lstr.253:
	.asciz	"blur_y.stride.0"
	.size	.Lstr.253, 16

	.type	.Lstr.254,@object       # @str.254
	.p2align	5
.Lstr.254:
	.asciz	"1"
	.size	.Lstr.254, 2

	.type	.Lstr.255,@object       # @str.255
	.p2align	5
.Lstr.255:
	.asciz	"input.stride.0"
	.size	.Lstr.255, 15

	.type	.Lstr.256,@object       # @str.256
	.p2align	5
.Lstr.256:
	.asciz	"offload_rpc.blur_y.s0.__outermost_argv"
	.size	.Lstr.256, 39

	.type	.L__unnamed_1,@object   # @0
	.p2align	4
.L__unnamed_1:
	.zero	32
	.size	.L__unnamed_1, 32

	.type	.L__unnamed_2,@object   # @1
	.p2align	4
.L__unnamed_2:
	.zero	32
	.size	.L__unnamed_2, 32

	.type	.L__unnamed_3,@object   # @2
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4
.L__unnamed_3:
	.quad	.Lstr
	.long	1                       # 0x1
	.long	2                       # 0x2
	.byte	1                       # 0x1
	.byte	16                      # 0x10
	.short	1                       # 0x1
	.zero	4
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	.L__unnamed_1
	.quad	.Lstr.250
	.long	2                       # 0x2
	.long	2                       # 0x2
	.byte	1                       # 0x1
	.byte	16                      # 0x10
	.short	1                       # 0x1
	.zero	4
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	.L__unnamed_2
	.size	.L__unnamed_3, 128

	.type	.Lstr.257,@object       # @str.257
	.section	.rodata,"a",@progbits
	.p2align	5
.Lstr.257:
	.asciz	"x86-64-linux-avx-avx2-f16c-fma-hvx_128-sse41"
	.size	.Lstr.257, 45

	.type	.Lstr.258,@object       # @str.258
	.p2align	5
.Lstr.258:
	.asciz	"halide_blur"
	.size	.Lstr.258, 12

	.type	.Lhalide_blur_metadata_storage,@object # @halide_blur_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4
.Lhalide_blur_metadata_storage:
	.long	1                       # 0x1
	.long	2                       # 0x2
	.quad	.L__unnamed_3
	.quad	.Lstr.257
	.quad	.Lstr.258
	.size	.Lhalide_blur_metadata_storage, 32

	.type	.Lswitch.table.halide_type_to_string,@object # @switch.table.halide_type_to_string
	.p2align	3
.Lswitch.table.halide_type_to_string:
	.quad	.L.str.13.77
	.quad	.L.str.14.76
	.quad	.L.str.15.75
	.quad	.L.str.16.74
	.size	.Lswitch.table.halide_type_to_string, 32


	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.section	".note.GNU-stack","",@progbits

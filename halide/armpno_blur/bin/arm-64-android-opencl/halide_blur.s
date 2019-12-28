	.text
	.file	"posix_allocator.cpp"
	.section	.text.halide_default_malloc,"ax",@progbits
	.weak	halide_default_malloc   // -- Begin function halide_default_malloc
	.p2align	2
	.type	halide_default_malloc,@function
halide_default_malloc:                  // @halide_default_malloc
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	add	x0, x1, #32             // =32
	mov	x29, sp
	bl	malloc
	cbz	x0, .LBB0_2
// %bb.1:                               // %if.end
	add	x9, x0, #39             // =39
	mov	x8, x0
	and	x0, x9, #0xffffffffffffffe0
	stur	x8, [x0, #-8]
.LBB0_2:                                // %cleanup
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end0:
	.size	halide_default_malloc, .Lfunc_end0-halide_default_malloc
                                        // -- End function
	.section	.text.halide_default_free,"ax",@progbits
	.weak	halide_default_free     // -- Begin function halide_default_free
	.p2align	2
	.type	halide_default_free,@function
halide_default_free:                    // @halide_default_free
// %bb.0:                               // %entry
	ldur	x0, [x1, #-8]
	b	free
.Lfunc_end1:
	.size	halide_default_free, .Lfunc_end1-halide_default_free
                                        // -- End function
	.section	.text.halide_set_custom_malloc,"ax",@progbits
	.weak	halide_set_custom_malloc // -- Begin function halide_set_custom_malloc
	.p2align	2
	.type	halide_set_custom_malloc,@function
halide_set_custom_malloc:               // @halide_set_custom_malloc
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal13custom_mallocE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal13custom_mallocE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end2:
	.size	halide_set_custom_malloc, .Lfunc_end2-halide_set_custom_malloc
                                        // -- End function
	.section	.text.halide_set_custom_free,"ax",@progbits
	.weak	halide_set_custom_free  // -- Begin function halide_set_custom_free
	.p2align	2
	.type	halide_set_custom_free,@function
halide_set_custom_free:                 // @halide_set_custom_free
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal11custom_freeE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal11custom_freeE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end3:
	.size	halide_set_custom_free, .Lfunc_end3-halide_set_custom_free
                                        // -- End function
	.section	.text.halide_malloc,"ax",@progbits
	.weak	halide_malloc           // -- Begin function halide_malloc
	.p2align	2
	.type	halide_malloc,@function
halide_malloc:                          // @halide_malloc
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal13custom_mallocE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal13custom_mallocE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end4:
	.size	halide_malloc, .Lfunc_end4-halide_malloc
                                        // -- End function
	.section	.text.halide_free,"ax",@progbits
	.weak	halide_free             // -- Begin function halide_free
	.p2align	2
	.type	halide_free,@function
halide_free:                            // @halide_free
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal11custom_freeE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal11custom_freeE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end5:
	.size	halide_free, .Lfunc_end5-halide_free
                                        // -- End function
	.section	.text.halide_default_error,"ax",@progbits
	.weak	halide_default_error    // -- Begin function halide_default_error
	.p2align	2
	.type	halide_default_error,@function
halide_default_error:                   // @halide_default_error
// %bb.0:                               // %entry
	stp	x28, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	sub	sp, sp, #1, lsl #12     // =4096
	mov	x21, sp
	adrp	x2, .L.str
	mov	x20, x1
	mov	x19, x0
	add	x1, x21, #4094          // =4094
	add	x2, x2, :lo12:.L.str
	mov	x0, sp
	bl	halide_string_to_string
	add	x1, x0, #4094           // =4094
	mov	x2, x20
	bl	halide_string_to_string
	ldurb	w8, [x0, #-1]
	cmp	w8, #10                 // =10
	b.eq	.LBB6_2
// %bb.1:                               // %if.then
	mov	w8, #10
	strh	w8, [x0], #1
.LBB6_2:                                // %if.end
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x1, sp
	mov	x0, x19
	bl	halide_msan_annotate_memory_is_initialized
	mov	x1, sp
	mov	x0, x19
	bl	halide_print
	bl	abort
	add	sp, sp, #1, lsl #12     // =4096
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end6:
	.size	halide_default_error, .Lfunc_end6-halide_default_error
                                        // -- End function
	.section	.text.halide_error,"ax",@progbits
	.weak	halide_error            // -- Begin function halide_error
	.p2align	2
	.type	halide_error,@function
halide_error:                           // @halide_error
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal13error_handlerE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal13error_handlerE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end7:
	.size	halide_error, .Lfunc_end7-halide_error
                                        // -- End function
	.section	.text.halide_set_error_handler,"ax",@progbits
	.weak	halide_set_error_handler // -- Begin function halide_set_error_handler
	.p2align	2
	.type	halide_set_error_handler,@function
halide_set_error_handler:               // @halide_set_error_handler
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal13error_handlerE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal13error_handlerE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end8:
	.size	halide_set_error_handler, .Lfunc_end8-halide_set_error_handler
                                        // -- End function
	.section	.text.halide_print,"ax",@progbits
	.weak	halide_print            // -- Begin function halide_print
	.p2align	2
	.type	halide_print,@function
halide_print:                           // @halide_print
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal12custom_printE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal12custom_printE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end9:
	.size	halide_print, .Lfunc_end9-halide_print
                                        // -- End function
	.section	.text.halide_set_custom_print,"ax",@progbits
	.weak	halide_set_custom_print // -- Begin function halide_set_custom_print
	.p2align	2
	.type	halide_set_custom_print,@function
halide_set_custom_print:                // @halide_set_custom_print
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal12custom_printE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal12custom_printE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end10:
	.size	halide_set_custom_print, .Lfunc_end10-halide_set_custom_print
                                        // -- End function
	.section	.text.halide_start_clock,"ax",@progbits
	.weak	halide_start_clock      // -- Begin function halide_start_clock
	.p2align	2
	.type	halide_start_clock,@function
halide_start_clock:                     // @halide_start_clock
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x19, :got:halide_reference_clock_inited
	ldr	x19, [x19, :got_lo12:halide_reference_clock_inited]
	add	x29, sp, #16            // =16
	ldrb	w8, [x19]
	cbz	w8, .LBB11_2
// %bb.1:                               // %if.end
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.LBB11_2:                               // %if.then
	adrp	x2, :got:halide_reference_clock
	ldr	x2, [x2, :got_lo12:halide_reference_clock]
	mov	w0, #113
	mov	w1, wzr
	bl	syscall
	mov	w8, #1
	strb	w8, [x19]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end11:
	.size	halide_start_clock, .Lfunc_end11-halide_start_clock
                                        // -- End function
	.section	.text.halide_current_time_ns,"ax",@progbits
	.weak	halide_current_time_ns  // -- Begin function halide_current_time_ns
	.p2align	2
	.type	halide_current_time_ns,@function
halide_current_time_ns:                 // @halide_current_time_ns
// %bb.0:                               // %entry
	sub	sp, sp, #32             // =32
	mov	x2, sp
	mov	w0, #113
	mov	w1, wzr
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	bl	syscall
	adrp	x8, :got:halide_reference_clock
	ldr	q0, [sp]
	ldr	x8, [x8, :got_lo12:halide_reference_clock]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w10, #51712
	movk	w10, #15258, lsl #16
	ldr	q1, [x8]
	sub	v0.2d, v0.2d, v1.2d
	mov	x8, v0.d[1]
	fmov	x9, d0
	madd	x0, x9, x10, x8
	add	sp, sp, #32             // =32
	ret
.Lfunc_end12:
	.size	halide_current_time_ns, .Lfunc_end12-halide_current_time_ns
                                        // -- End function
	.section	.text.halide_sleep_ms,"ax",@progbits
	.weak	halide_sleep_ms         // -- Begin function halide_sleep_ms
	.p2align	2
	.type	halide_sleep_ms,@function
halide_sleep_ms:                        // @halide_sleep_ms
// %bb.0:                               // %entry
	mov	w8, #1000
	mul	w0, w1, w8
	b	usleep
.Lfunc_end13:
	.size	halide_sleep_ms, .Lfunc_end13-halide_sleep_ms
                                        // -- End function
	.section	.text.halide_default_print,"ax",@progbits
	.weak	halide_default_print    // -- Begin function halide_default_print
	.p2align	2
	.type	halide_default_print,@function
halide_default_print:                   // @halide_default_print
// %bb.0:                               // %entry
	adrp	x8, .L.str.5
	add	x8, x8, :lo12:.L.str.5
	adrp	x2, .L.str.1
	add	x2, x2, :lo12:.L.str.1
	mov	w0, #4
	mov	x3, x1
	mov	x1, x8
	b	__android_log_print
.Lfunc_end14:
	.size	halide_default_print, .Lfunc_end14-halide_default_print
                                        // -- End function
	.section	.text.halide_host_cpu_count,"ax",@progbits
	.weak	halide_host_cpu_count   // -- Begin function halide_host_cpu_count
	.p2align	2
	.type	halide_host_cpu_count,@function
halide_host_cpu_count:                  // @halide_host_cpu_count
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	w0, #97
	mov	x29, sp
	bl	sysconf
                                        // kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end15:
	.size	halide_host_cpu_count, .Lfunc_end15-halide_host_cpu_count
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal19halide_thread_yieldEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv // -- Begin function _ZN6Halide7Runtime8Internal19halide_thread_yieldEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv,@function
_ZN6Halide7Runtime8Internal19halide_thread_yieldEv: // @_ZN6Halide7Runtime8Internal19halide_thread_yieldEv
// %bb.0:                               // %entry
	b	sched_yield
.Lfunc_end16:
	.size	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv, .Lfunc_end16-_ZN6Halide7Runtime8Internal19halide_thread_yieldEv
                                        // -- End function
	.section	.text.halide_default_do_task,"ax",@progbits
	.weak	halide_default_do_task  // -- Begin function halide_default_do_task
	.p2align	2
	.type	halide_default_do_task,@function
halide_default_do_task:                 // @halide_default_do_task
// %bb.0:                               // %entry
	mov	x4, x1
	mov	w1, w2
	mov	x2, x3
	br	x4
.Lfunc_end17:
	.size	halide_default_do_task, .Lfunc_end17-halide_default_do_task
                                        // -- End function
	.section	.text.halide_default_do_loop_task,"ax",@progbits
	.weak	halide_default_do_loop_task // -- Begin function halide_default_do_loop_task
	.p2align	2
	.type	halide_default_do_loop_task,@function
halide_default_do_loop_task:            // @halide_default_do_loop_task
// %bb.0:                               // %entry
	mov	x6, x1
	mov	w1, w2
	mov	w2, w3
	mov	x3, x4
	mov	x4, x5
	br	x6
.Lfunc_end18:
	.size	halide_default_do_loop_task, .Lfunc_end18-halide_default_do_loop_task
                                        // -- End function
	.section	.text.halide_default_do_par_for,"ax",@progbits
	.weak	halide_default_do_par_for // -- Begin function halide_default_do_par_for
	.p2align	2
	.type	halide_default_do_par_for,@function
halide_default_do_par_for:              // @halide_default_do_par_for
// %bb.0:                               // %entry
	cmp	w3, #1                  // =1
	b.lt	.LBB19_2
// %bb.1:                               // %if.end
	sub	sp, sp, #160            // =160
	mov	x8, sp
	str	x19, [sp, #128]         // 8-byte Folded Spill
	stp	x29, x30, [sp, #144]    // 16-byte Folded Spill
	stp	xzr, x4, [sp]
	stp	w3, wzr, [sp, #40]
	strb	wzr, [sp, #48]
	stp	wzr, w2, [sp, #32]
	stp	xzr, xzr, [sp, #16]
	stp	x0, xzr, [sp, #104]
	stur	xzr, [sp, #117]
	str	wzr, [sp, #80]
	str	x8, [sp, #72]
	str	x1, [sp, #56]
	str	xzr, [sp, #88]
	adrp	x19, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	add	x29, sp, #144           // =144
	mov	x0, x19
	bl	halide_mutex_lock
	mov	x1, sp
	mov	w0, #1
	mov	x2, xzr
	bl	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
	mov	x0, sp
	bl	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	mov	x0, x19
	bl	halide_mutex_unlock
	ldr	w0, [sp, #116]
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldr	x19, [sp, #128]         // 8-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB19_2:
	mov	w0, wzr
	ret
.Lfunc_end19:
	.size	halide_default_do_par_for, .Lfunc_end19-halide_default_do_par_for
                                        // -- End function
	.section	.text.halide_mutex_lock,"ax",@progbits
	.weak	halide_mutex_lock       // -- Begin function halide_mutex_lock
	.p2align	2
	.type	halide_mutex_lock,@function
halide_mutex_lock:                      // @halide_mutex_lock
// %bb.0:                               // %entry
	sub	sp, sp, #112            // =112
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	ldaxr	x8, [x0]
	mov	x19, x0
	add	x29, sp, #96            // =96
	cbz	x8, .LBB20_2
// %bb.1:                               // %cmpxchg.nostore
	clrex
	b	.LBB20_3
.LBB20_2:                               // %cmpxchg.trystore
	mov	w8, #1
	stxr	w9, x8, [x19]
	cbz	w9, .LBB20_20
.LBB20_3:                               // %if.then.i.critedge
	adrp	x20, :got:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	adrp	x21, :got:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	adrp	x22, :got:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
	adrp	x23, :got:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
	ldr	x9, [x19]
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv]
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb]
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE]
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib]
	mov	w8, #40
.LBB20_4:                               // %while.cond.outer.i.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB20_8 Depth 2
	tbz	w9, #0, .LBB20_8
.LBB20_5:                               //   in Loop: Header=BB20_4 Depth=1
	mov	x10, x9
	b	.LBB20_10
.LBB20_6:                               // %cmpxchg.nostore3
                                        //   in Loop: Header=BB20_8 Depth=2
	clrex
.LBB20_7:                               // %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i.critedge
                                        //   in Loop: Header=BB20_8 Depth=2
	mov	x9, x10
	tbnz	w10, #0, .LBB20_10
.LBB20_8:                               // %if.then.i.i
                                        //   Parent Loop BB20_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	x10, [x19]
	cmp	x10, x9
	b.ne	.LBB20_6
// %bb.9:                               // %cmpxchg.trystore6
                                        //   in Loop: Header=BB20_8 Depth=2
	orr	x9, x9, #0x1
	stxr	w11, x9, [x19]
	cbnz	w11, .LBB20_7
	b	.LBB20_20
.LBB20_10:                              // %if.end4.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	tbnz	w10, #1, .LBB20_14
// %bb.11:                              // %land.lhs.true.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	subs	w24, w8, #1             // =1
	b.ge	.LBB20_16
// %bb.12:                              // %if.then12.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	ldxr	x9, [x19]
	cmp	x9, x10
	b.ne	.LBB20_19
.LBB20_13:                              // %cmpxchg.trystore16
                                        //   in Loop: Header=BB20_4 Depth=1
	orr	x10, x10, #0x2
	stxr	w11, x10, [x19]
	cbnz	w11, .LBB20_4
.LBB20_14:                              // %if.end21.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	add	x1, sp, #8              // =8
	mov	x0, x19
	stp	x20, x23, [sp, #16]
	stp	x21, x19, [sp, #32]
	str	x22, [sp, #8]
	bl	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
	cmp	x0, x19
	b.eq	.LBB20_20
// %bb.15:                              // %if.end26.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	ldr	x9, [x19]
	mov	w8, #40
	tbz	w9, #0, .LBB20_8
	b	.LBB20_5
.LBB20_16:                              // %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	cmp	w24, #1                 // =1
	b.lt	.LBB20_18
// %bb.17:                              // %if.then7.i.i
                                        //   in Loop: Header=BB20_4 Depth=1
	bl	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv
	ldr	x9, [x19]
	mov	w8, w24
	tbz	w9, #0, .LBB20_8
	b	.LBB20_5
.LBB20_18:                              //   in Loop: Header=BB20_4 Depth=1
	mov	w8, wzr
	ldxr	x9, [x19]
	cmp	x9, x10
	b.eq	.LBB20_13
.LBB20_19:                              // %cmpxchg.nostore13
                                        //   in Loop: Header=BB20_4 Depth=1
	clrex
	tbz	w9, #0, .LBB20_8
	b	.LBB20_5
.LBB20_20:                              // %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex4lockEv.exit
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.Lfunc_end20:
	.size	halide_mutex_lock, .Lfunc_end20-halide_mutex_lock
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_ // -- Begin function _ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_,@function
_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_: // @_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
// %bb.0:                               // %entry
	sub	sp, sp, #112            // =112
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	adrp	x23, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	mov	x19, x2
	mov	x20, x1
	mov	w21, w0
	ldrb	w8, [x23, #2121]
	add	x29, sp, #96            // =96
	cbz	w8, .LBB21_11
// %bb.1:                               // %if.end4
	cmp	w21, #1                 // =1
	b.lt	.LBB21_19
.LBB21_2:                               // %for.body.preheader
	mov	w8, wzr
	mov	w25, wzr
	mov	w24, wzr
	mov	w9, wzr
	mov	w10, w21
	add	x11, x20, #48           // =48
	mov	w26, #-1
	b	.LBB21_4
.LBB21_3:                               // %if.then23
                                        //   in Loop: Header=BB21_4 Depth=1
	add	w26, w26, #1            // =1
	subs	x10, x10, #1            // =1
	add	x11, x11, #128          // =128
	b.eq	.LBB21_6
.LBB21_4:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldur	w12, [x11, #-4]
	ldur	w13, [x11, #-16]
	ldrb	w14, [x11]
	cmp	w12, #0                 // =0
	csinc	w9, w9, wzr, ne
	csinc	w25, w25, wzr, eq
	cmp	w13, #0                 // =0
	add	w8, w12, w8
	csinc	w24, w24, wzr, eq
	cbnz	w14, .LBB21_3
// %bb.5:                               // %if.else24
                                        //   in Loop: Header=BB21_4 Depth=1
	ldur	w12, [x11, #-8]
	add	w26, w12, w26
	subs	x10, x10, #1            // =1
	add	x11, x11, #128          // =128
	b.ne	.LBB21_4
.LBB21_6:                               // %for.cond.cleanup.loopexit
	and	w22, w9, #0x1
	cbz	x19, .LBB21_20
.LBB21_7:                               // %if.else54
	ldr	w10, [x19, #96]
	ldr	w9, [x19, #44]
	ldr	w11, [x19, #112]
	neg	w10, w10
	madd	w9, w11, w9, w10
	cmp	w8, w9
	b.le	.LBB21_9
// %bb.8:                               // %if.then59
	adrp	x1, .L.str.3
	add	x1, x1, :lo12:.L.str.3
	mov	x0, xzr
	bl	halide_print
	bl	abort
.LBB21_9:                               // %if.end60
	orr	w8, w25, w24
	tbz	w8, #0, .LBB21_27
// %bb.10:                              // %if.then64
	ldr	w8, [x19, #96]
	add	w8, w8, #1              // =1
	str	w8, [x19, #96]
	cmp	w21, #1                 // =1
	b.ge	.LBB21_28
	b	.LBB21_31
.LBB21_11:                              // %land.rhs.i.preheader
	add	x8, x23, #12            // =12
.LBB21_12:                              // %land.rhs.i
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w9, [x8]
	cbnz	w9, .LBB21_14
// %bb.13:                              // %while.body.i
                                        //   in Loop: Header=BB21_12 Depth=1
	add	x8, x8, #1              // =1
	add	x9, x23, #2128          // =2128
	cmp	x8, x9
	b.lo	.LBB21_12
.LBB21_14:                              // %while.end.i
	add	x9, x23, #2128          // =2128
	cmp	x8, x9
	b.eq	.LBB21_16
// %bb.15:                              // %if.then.i
	adrp	x1, .L.str.7
	add	x1, x1, :lo12:.L.str.7
	mov	x0, xzr
	bl	halide_print
	bl	abort
.LBB21_16:                              // %_ZNK6Halide7Runtime8Internal12work_queue_t13assert_zeroedEv.exit
	ldr	w0, [x23, #8]
	cbnz	w0, .LBB21_18
// %bb.17:                              // %if.then2
	bl	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	str	w0, [x23, #8]
.LBB21_18:                              // %if.end
	bl	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
	mov	w8, #1
	str	w0, [x23, #8]
	strb	w8, [x23, #2121]
	cmp	w21, #1                 // =1
	b.ge	.LBB21_2
.LBB21_19:
	mov	w22, wzr
	mov	w24, wzr
	mov	w25, wzr
	mov	w8, wzr
	mov	w26, #-1
	cbnz	x19, .LBB21_7
.LBB21_20:                              // %if.then32
	ldr	w9, [x23, #24]
	orr	w28, w25, w24
	str	w22, [sp, #12]          // 4-byte Folded Spill
	cmp	w9, #255                // =255
	b.gt	.LBB21_25
// %bb.21:                              // %land.rhs.preheader
	adrp	x22, :got:_ZN6Halide7Runtime8Internal13worker_threadEPv
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal13worker_threadEPv]
	and	w10, w28, #0x1
	add	w27, w8, w10
	ldr	w8, [x23, #8]
	sub	w8, w8, #1              // =1
	cmp	w9, w8
	b.ge	.LBB21_24
.LBB21_22:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	w8, [x23, #28]
	mov	x0, x22
	mov	x1, xzr
	add	w8, w8, #1              // =1
	str	w8, [x23, #28]
	bl	halide_spawn_thread
	ldrsw	x8, [x23, #24]
	add	w9, w8, #1              // =1
	add	x8, x23, x8, lsl #3
	cmp	w9, #256                // =256
	str	w9, [x23, #24]
	str	x0, [x8, #72]
	b.ge	.LBB21_25
// %bb.23:                              // %land.rhs
                                        //   in Loop: Header=BB21_22 Depth=1
	ldr	w8, [x23, #8]
	sub	w8, w8, #1              // =1
	cmp	w9, w8
	b.lt	.LBB21_22
.LBB21_24:                              // %lor.rhs
	ldr	w8, [x23, #2124]
	sub	w8, w9, w8
	add	w8, w8, #1              // =1
	cmp	w8, w27
	b.lt	.LBB21_22
.LBB21_25:                              // %while.end
	ldr	w22, [sp, #12]          // 4-byte Folded Reload
	tbz	w28, #0, .LBB21_27
// %bb.26:                              // %if.then51
	ldr	w8, [x23, #2124]
	add	w8, w8, #1              // =1
	str	w8, [x23, #2124]
.LBB21_27:                              // %if.end68
	cmp	w21, #1                 // =1
	b.lt	.LBB21_31
.LBB21_28:                              // %for.body74.preheader
	ldr	x10, [x23, #16]
	sxtw	x8, w21
	sbfiz	x9, x21, #7, #32
.LBB21_29:                              // %for.body74
                                        // =>This Inner Loop Header: Depth=1
	sub	x8, x8, #1              // =1
	add	x11, x20, x9
	stp	x10, x20, [x11, #-64]
	sub	x10, x11, #128          // =128
	cmp	x8, #0                  // =0
	sub	x9, x9, #128            // =128
	stur	w21, [x11, #-48]
	stur	wzr, [x11, #-32]
	b.gt	.LBB21_29
// %bb.30:                              // %for.cond.cleanup73.loopexit
	str	x20, [x23, #16]
.LBB21_31:                              // %for.cond.cleanup73
	ldr	w8, [x23, #68]
	cbz	w8, .LBB21_40
// %bb.32:                              // %for.cond.cleanup73.if.then94_crit_edge
	ldr	w8, [x23, #24]
.LBB21_33:                              // %if.then94
	mov	w26, w8
.LBB21_34:                              // %if.end96
	add	x0, x23, #40            // =40
	str	w26, [x23, #32]
	bl	halide_cond_broadcast
	ldp	w8, w9, [x23, #28]
	cmp	w9, w8
	b.le	.LBB21_37
// %bb.35:                              // %if.then98
	add	x0, x23, #48            // =48
	bl	halide_cond_broadcast
	cbz	w22, .LBB21_37
// %bb.36:                              // %if.then100
	add	x0, x23, #56            // =56
	bl	halide_cond_broadcast
.LBB21_37:                              // %if.end102
	orr	w8, w25, w24
	tbz	w8, #0, .LBB21_43
// %bb.38:                              // %if.then106
	cbz	x19, .LBB21_42
// %bb.39:                              // %if.then108
	ldr	w8, [x19, #96]
	sub	w8, w8, #1              // =1
	str	w8, [x19, #96]
	b	.LBB21_43
.LBB21_40:                              // %lor.rhs88
	ldr	w9, [x23, #64]
	ldr	w8, [x23, #24]
	cmp	w26, w9
	b.gt	.LBB21_33
// %bb.41:                              // %lor.rhs88
	cmp	w9, w8
	b.ge	.LBB21_34
	b	.LBB21_33
.LBB21_42:                              // %if.else111
	ldr	w8, [x23, #2124]
	sub	w8, w8, #1              // =1
	str	w8, [x23, #2124]
.LBB21_43:                              // %if.end114
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.Lfunc_end21:
	.size	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_, .Lfunc_end21-_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE // -- Begin function _ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE,@function
_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE: // @_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	adrp	x20, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	mov	x19, x0
	mov	w27, #1
	add	x29, sp, #80            // =80
	cbnz	x19, .LBB22_4
	b	.LBB22_14
.LBB22_1:                               // %if.then15
	str	w8, [x19, #116]
.LBB22_2:                               // %if.then257
	add	x0, x20, #56            // =56
	bl	halide_cond_broadcast
.LBB22_3:                               // %while.cond
	cbz	x19, .LBB22_14
.LBB22_4:                               // %cond.true
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB22_9 Depth 2
	ldr	w8, [x19, #40]
	cbnz	w8, .LBB22_6
// %bb.5:                               // %cond.end
                                        //   in Loop: Header=BB22_4 Depth=1
	ldr	w8, [x19, #112]
	cbz	w8, .LBB22_91
.LBB22_6:                               // %if.then
                                        //   in Loop: Header=BB22_4 Depth=1
	ldr	w8, [x19, #116]
	ldr	x21, [x20, #16]
	cbz	w8, .LBB22_11
// %bb.7:                               // %if.then3
                                        //   in Loop: Header=BB22_4 Depth=1
	ldr	w8, [x19, #112]
	cbnz	w8, .LBB22_16
// %bb.8:                               // %while.cond6.preheader
                                        //   in Loop: Header=BB22_4 Depth=1
	cmp	x21, x19
	add	x8, x21, #64            // =64
	b.eq	.LBB22_13
.LBB22_9:                               // %while.body8
                                        //   Parent Loop BB22_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x9, x8
	ldr	x8, [x8]
	cmp	x8, x19
	add	x8, x8, #64             // =64
	b.ne	.LBB22_9
// %bb.10:                              // %while.end
                                        //   in Loop: Header=BB22_4 Depth=1
	ldr	x8, [x8]
	str	x8, [x9]
	str	wzr, [x19, #40]
	cbnz	x19, .LBB22_4
	b	.LBB22_14
.LBB22_11:                              // %if.else
	ldr	x8, [x19, #88]
	cbz	x8, .LBB22_16
// %bb.12:                              // %land.lhs.true
	ldr	w8, [x8, #116]
	cbnz	w8, .LBB22_1
	b	.LBB22_16
.LBB22_13:                              //   in Loop: Header=BB22_4 Depth=1
	add	x9, x20, #16            // =16
	ldr	x8, [x8]
	str	x8, [x9]
	str	wzr, [x19, #40]
	cbnz	x19, .LBB22_4
.LBB22_14:                              // %cond.false
	ldrb	w8, [x20, #2120]
	cbnz	w8, .LBB22_91
// %bb.15:                              // %while.body
	ldr	x21, [x20, #16]
.LBB22_16:                              // %if.end21
	cbz	x21, .LBB22_58
// %bb.17:                              // %while.body24.lr.ph
	add	x28, x20, #16           // =16
	cbnz	x19, .LBB22_19
	b	.LBB22_34
.LBB22_18:                              // %cleanup.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	x8, [x21, #64]!
	mov	x28, x21
	mov	x21, x8
	cbz	x8, .LBB22_58
.LBB22_19:                              // %while.body24.us
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB22_31 Depth 2
	ldr	x8, [x21, #88]
	cbz	x8, .LBB22_22
// %bb.20:                              // %if.else29.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w10, [x8, #112]
	ldr	w9, [x8, #44]
	cbz	w10, .LBB22_23
// %bb.21:                              // %if.else35.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w8, [x8, #96]
	neg	w8, w8
	madd	w8, w9, w10, w8
	b	.LBB22_24
.LBB22_22:                              // %if.then28.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w8, [x20, #24]
	ldr	w9, [x20, #2124]
	sub	w8, w8, w9
	add	w8, w8, #1              // =1
	b	.LBB22_24
.LBB22_23:                              // %if.then32.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w8, [x8, #96]
	sub	w8, w9, w8
.LBB22_24:                              // %if.end42.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w9, [x21, #44]
	ldr	x11, [x21, #72]
	ldrb	w10, [x21, #48]
	ldr	x12, [x19, #72]
	cbz	w10, .LBB22_26
// %bb.25:                              // %lor.rhs61.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w10, [x21, #112]
	cmp	w10, #0                 // =0
	cset	w10, eq
	b	.LBB22_27
.LBB22_26:                              //   in Loop: Header=BB22_19 Depth=1
	mov	w10, #1
.LBB22_27:                              // %lor.end64.us
                                        //   in Loop: Header=BB22_19 Depth=1
	cmp	w9, #0                  // =0
	cset	w13, ne
	cmp	x11, x12
	cset	w11, ne
	cmp	w8, w9
	b.lt	.LBB22_18
// %bb.28:                              // %lor.end64.us
                                        //   in Loop: Header=BB22_19 Depth=1
	and	w8, w13, w11
	tbnz	w8, #0, .LBB22_18
// %bb.29:                              // %lor.end64.us
                                        //   in Loop: Header=BB22_19 Depth=1
	cbz	w10, .LBB22_18
// %bb.30:                              // %if.then74.us
                                        //   in Loop: Header=BB22_19 Depth=1
	ldr	w8, [x21, #120]
	ldr	w9, [x21, #32]
	cmp	w8, w9
	b.ge	.LBB22_45
.LBB22_31:                              // %for.body.i.us
                                        //   Parent Loop BB22_19 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x9, [x21, #24]
	add	x8, x9, w8, sxtw #4
	ldr	x0, [x8]
	ldr	w1, [x8, #8]
	bl	halide_default_semaphore_try_acquire
	cbz	w0, .LBB22_18
// %bb.32:                              // %for.inc.i.us
                                        //   in Loop: Header=BB22_31 Depth=2
	ldr	w8, [x21, #120]
	ldr	w9, [x21, #32]
	add	w8, w8, #1              // =1
	cmp	w8, w9
	str	w8, [x21, #120]
	b.lt	.LBB22_31
	b	.LBB22_45
.LBB22_33:                              // %cleanup
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	x8, [x21, #64]!
	mov	x28, x21
	mov	x21, x8
	cbz	x8, .LBB22_58
.LBB22_34:                              // %while.body24
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB22_40 Depth 2
	ldr	x8, [x21, #88]
	cbz	x8, .LBB22_42
// %bb.35:                              // %if.else29
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	w10, [x8, #112]
	ldr	w9, [x8, #44]
	cbz	w10, .LBB22_44
// %bb.36:                              // %if.else35
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	w8, [x8, #96]
	neg	w8, w8
	madd	w8, w9, w10, w8
	ldrb	w10, [x21, #48]
	ldr	w9, [x21, #44]
	cbz	w10, .LBB22_43
.LBB22_37:                              // %lor.rhs61
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	w10, [x21, #112]
	cmp	w10, #0                 // =0
	cset	w10, eq
	cmp	w8, w9
	b.lt	.LBB22_33
.LBB22_38:                              // %lor.end64
                                        //   in Loop: Header=BB22_34 Depth=1
	cbz	w10, .LBB22_33
// %bb.39:                              // %if.then74
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	w8, [x21, #120]
	ldr	w9, [x21, #32]
	cmp	w8, w9
	b.ge	.LBB22_45
.LBB22_40:                              // %for.body.i
                                        //   Parent Loop BB22_34 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x9, [x21, #24]
	add	x8, x9, w8, sxtw #4
	ldr	x0, [x8]
	ldr	w1, [x8, #8]
	bl	halide_default_semaphore_try_acquire
	cbz	w0, .LBB22_33
// %bb.41:                              // %for.inc.i
                                        //   in Loop: Header=BB22_40 Depth=2
	ldr	w8, [x21, #120]
	ldr	w9, [x21, #32]
	add	w8, w8, #1              // =1
	cmp	w8, w9
	str	w8, [x21, #120]
	b.lt	.LBB22_40
	b	.LBB22_45
.LBB22_42:                              // %if.then28
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	w8, [x20, #24]
	ldr	w9, [x20, #2124]
	sub	w8, w8, w9
	add	w8, w8, #1              // =1
	ldrb	w10, [x21, #48]
	ldr	w9, [x21, #44]
	cbnz	w10, .LBB22_37
.LBB22_43:                              //   in Loop: Header=BB22_34 Depth=1
	mov	w10, #1
	cmp	w8, w9
	b.ge	.LBB22_38
	b	.LBB22_33
.LBB22_44:                              // %if.then32
                                        //   in Loop: Header=BB22_34 Depth=1
	ldr	w8, [x8, #96]
	sub	w8, w9, w8
	ldrb	w10, [x21, #48]
	ldr	w9, [x21, #44]
	cbnz	w10, .LBB22_37
	b	.LBB22_43
.LBB22_45:                              // %if.end102
	ldr	w10, [x21, #112]
	ldr	x9, [x21, #88]
	ldr	w8, [x21, #44]
	str	wzr, [x21, #120]
	add	w10, w10, #1            // =1
	str	w10, [x21, #112]
	cbz	x9, .LBB22_64
// %bb.46:                              // %if.else111
	ldr	w10, [x9, #96]
	add	w8, w10, w8
	str	w8, [x9, #96]
	ldrb	w8, [x21, #48]
	cbz	w8, .LBB22_65
.LBB22_47:                              // %if.then121
	ldr	x8, [x21, #64]
	mov	x0, x20
	str	x8, [x28]
	bl	halide_mutex_unlock
	mov	w24, wzr
	mov	w23, #1
.LBB22_48:                              // %while.cond126.preheader
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB22_52 Depth 2
                                        //     Child Loop BB22_50 Depth 2
	ldr	w8, [x21, #40]
	sub	w9, w8, w24
	cmp	w9, w23
	b.le	.LBB22_55
// %bb.49:                              // %land.rhs.preheader
                                        //   in Loop: Header=BB22_48 Depth=1
	ldr	w9, [x21, #120]
	ldr	w10, [x21, #32]
	cmp	w9, w10
	b.lt	.LBB22_52
.LBB22_50:                              // %while.body132
                                        //   Parent Loop BB22_48 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	add	w23, w23, #1            // =1
	sub	w11, w8, w24
	mov	w9, wzr
	cmp	w11, w23
	str	wzr, [x21, #120]
	b.le	.LBB22_56
// %bb.51:                              // %land.rhs
                                        //   in Loop: Header=BB22_50 Depth=2
	cmp	w9, w10
	b.ge	.LBB22_50
.LBB22_52:                              // %for.body.i417
                                        //   Parent Loop BB22_48 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x8, [x21, #24]
	add	x8, x8, w9, sxtw #4
	ldr	x0, [x8]
	ldr	w1, [x8, #8]
	bl	halide_default_semaphore_try_acquire
	cbz	w0, .LBB22_55
// %bb.53:                              // %for.inc.i420
                                        //   in Loop: Header=BB22_52 Depth=2
	ldr	w8, [x21, #120]
	ldr	w10, [x21, #32]
	add	w9, w8, #1              // =1
	cmp	w9, w10
	str	w9, [x21, #120]
	b.lt	.LBB22_52
// %bb.54:                              // %while.body132.loopexit
                                        //   in Loop: Header=BB22_48 Depth=1
	ldr	w8, [x21, #40]
	b	.LBB22_50
.LBB22_55:                              // %while.end134
                                        //   in Loop: Header=BB22_48 Depth=1
	cbz	w23, .LBB22_60
.LBB22_56:                              // %if.end137
                                        //   in Loop: Header=BB22_48 Depth=1
	ldr	w8, [x21, #36]
	ldr	x0, [x21, #104]
	ldp	x1, x4, [x21]
	mov	w3, w23
	add	w2, w8, w24
	mov	x5, x21
	bl	halide_do_loop_task
	add	w24, w23, w24
	mov	w23, wzr
	cbz	w0, .LBB22_48
// %bb.57:
	mov	w22, w0
	mov	w23, wzr
	b	.LBB22_61
.LBB22_58:                              // %if.then88
	cbz	x19, .LBB22_69
// %bb.59:                              // %if.then90
	ldr	w8, [x20, #68]
	add	x0, x20, #56            // =56
	mov	x1, x20
	add	w8, w8, #1              // =1
	str	w8, [x20, #68]
	strb	w27, [x19, #124]
	bl	halide_cond_wait
	strb	wzr, [x19, #124]
	ldr	w8, [x20, #68]
	sub	w8, w8, #1              // =1
	str	w8, [x20, #68]
	cbnz	x19, .LBB22_4
	b	.LBB22_14
.LBB22_60:
	mov	w22, wzr
	mov	w23, #1
.LBB22_61:                              // %while.end144
	mov	x0, x20
	bl	halide_mutex_lock
	ldp	w8, w9, [x21, #36]
	add	w10, w8, w24
	sub	w8, w9, w24
	stp	w10, w8, [x21, #36]
	tbz	w23, #0, .LBB22_68
// %bb.62:                              // %if.else155
	cmp	w8, #1                  // =1
	b.lt	.LBB22_89
// %bb.63:                              // %if.then159
	ldr	x9, [x20, #16]
	mov	w8, wzr
	str	x9, [x21, #64]
	str	x21, [x20, #16]
	ldr	x10, [x21, #88]
	ldr	w9, [x21, #44]
	cbnz	x10, .LBB22_84
	b	.LBB22_90
.LBB22_64:                              // %if.then107
	ldr	w9, [x20, #2124]
	add	w8, w9, w8
	str	w8, [x20, #2124]
	ldrb	w8, [x21, #48]
	cbnz	w8, .LBB22_47
.LBB22_65:                              // %if.else163
	ldp	w23, w8, [x21, #36]
	ldp	x24, x22, [x21]
	ldr	x26, [x21, #56]
	ldr	x25, [x21, #104]
	add	w9, w23, #1             // =1
	subs	w8, w8, #1              // =1
	stp	w9, w8, [x21, #36]
	b.eq	.LBB22_71
// %bb.66:                              // %if.end175
	mov	x0, x20
	bl	halide_mutex_unlock
	cbz	x26, .LBB22_72
.LBB22_67:                              // %if.then177
	mov	x0, x25
	mov	x1, x26
	mov	w2, w23
	mov	x3, x22
	bl	halide_do_task
	mov	w22, w0
	mov	x0, x20
	bl	halide_mutex_lock
	cbnz	w22, .LBB22_73
	b	.LBB22_82
.LBB22_68:                              // %if.end195.thread439
	str	wzr, [x21, #40]
	b	.LBB22_73
.LBB22_69:                              // %if.else92
	ldr	w9, [x20, #64]
	ldp	w8, w10, [x20, #28]
	add	w9, w9, #1              // =1
	cmp	w8, w10
	str	w9, [x20, #64]
	b.le	.LBB22_81
// %bb.70:                              // %if.then95
	sub	w8, w8, #1              // =1
	add	x0, x20, #48            // =48
	mov	x1, x20
	str	w8, [x20, #28]
	bl	halide_cond_wait
	ldr	w8, [x20, #28]
	add	w8, w8, #1              // =1
	str	w8, [x20, #28]
	ldr	w8, [x20, #64]
	sub	w8, w8, #1              // =1
	str	w8, [x20, #64]
	cbnz	x19, .LBB22_4
	b	.LBB22_14
.LBB22_71:                              // %if.then173
	ldr	x8, [x21, #64]
	str	x8, [x28]
	mov	x0, x20
	bl	halide_mutex_unlock
	cbnz	x26, .LBB22_67
.LBB22_72:                              // %if.else185
	mov	w3, #1
	mov	x0, x25
	mov	x1, x24
	mov	w2, w23
	mov	x4, x22
	mov	x5, x21
	bl	halide_do_loop_task
	mov	w22, w0
	mov	x0, x20
	bl	halide_mutex_lock
	cbz	w22, .LBB22_82
.LBB22_73:                              // %if.then200
	ldrsw	x9, [x21, #80]
	mov	w8, wzr
	str	w22, [x21, #116]
	cmp	w9, #1                  // =1
	b.lt	.LBB22_83
// %bb.74:                              // %for.body.lr.ph
	ldr	x10, [x21, #72]
	ldr	w11, [x10, #116]!
	cbnz	w11, .LBB22_77
	b	.LBB22_79
.LBB22_75:                              // %land.rhs213
	ldrb	w11, [x10, #8]
.LBB22_76:                              // %land.end219
	and	w8, w8, #0x1
	orr	w8, w11, w8
.LBB22_77:                              // %for.inc
                                        // =>This Inner Loop Header: Depth=1
	subs	x9, x9, #1              // =1
	add	x10, x10, #128          // =128
	b.eq	.LBB22_83
// %bb.78:                              // %for.body
                                        //   in Loop: Header=BB22_77 Depth=1
	ldr	w11, [x10]
	cbnz	w11, .LBB22_77
.LBB22_79:                              // %if.then206
	str	w22, [x10]
	ldr	w11, [x21, #112]
	cbz	w11, .LBB22_75
// %bb.80:
	mov	w11, wzr
	b	.LBB22_76
.LBB22_81:                              // %if.else98
	add	x0, x20, #40            // =40
	mov	x1, x20
	bl	halide_cond_wait
	ldr	w8, [x20, #64]
	sub	w8, w8, #1              // =1
	str	w8, [x20, #64]
	cbnz	x19, .LBB22_4
	b	.LBB22_14
.LBB22_82:
	mov	w8, wzr
.LBB22_83:                              // %if.end227
	ldr	x10, [x21, #88]
	ldr	w9, [x21, #44]
	cbz	x10, .LBB22_90
.LBB22_84:                              // %if.else234
	ldr	w11, [x10, #96]
	sub	w9, w11, w9
	str	w9, [x10, #96]
	ldr	w9, [x21, #112]
	sub	w9, w9, #1              // =1
	str	w9, [x21, #112]
	tbnz	w8, #0, .LBB22_2
.LBB22_85:                              // %lor.lhs.false244
	cbnz	w9, .LBB22_3
// %bb.86:                              // %land.lhs.true247
	ldr	w8, [x21, #40]
	cbz	w8, .LBB22_88
// %bb.87:                              // %lor.lhs.false251
	ldr	w8, [x21, #116]
	cbz	w8, .LBB22_3
.LBB22_88:                              // %land.lhs.true254
	ldrb	w8, [x21, #124]
	cbz	w8, .LBB22_3
	b	.LBB22_2
.LBB22_89:
	mov	w8, wzr
	ldr	x10, [x21, #88]
	ldr	w9, [x21, #44]
	cbnz	x10, .LBB22_84
.LBB22_90:                              // %if.then230
	ldr	w10, [x20, #2124]
	sub	w9, w10, w9
	str	w9, [x20, #2124]
	ldr	w9, [x21, #112]
	sub	w9, w9, #1              // =1
	str	w9, [x21, #112]
	tbnz	w8, #0, .LBB22_2
	b	.LBB22_85
.LBB22_91:                              // %while.end263
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end22:
	.size	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE, .Lfunc_end22-_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
                                        // -- End function
	.section	.text.halide_mutex_unlock,"ax",@progbits
	.weak	halide_mutex_unlock     // -- Begin function halide_mutex_unlock
	.p2align	2
	.type	halide_mutex_unlock,@function
halide_mutex_unlock:                    // @halide_mutex_unlock
// %bb.0:                               // %entry
	sub	sp, sp, #64             // =64
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	ldxr	x8, [x0]
	add	x29, sp, #48            // =48
	cmp	x8, #1                  // =1
	b.eq	.LBB23_2
// %bb.1:                               // %cmpxchg.nostore
	clrex
	ldxr	x8, [x0]
	cmp	x8, #1                  // =1
	b.ne	.LBB23_4
.LBB23_2:                               // %cmpxchg.trystore
                                        // =>This Inner Loop Header: Depth=1
	stlxr	w8, xzr, [x0]
	cbz	w8, .LBB23_5
// %bb.3:                               // %cmpxchg.start8
                                        //   in Loop: Header=BB23_2 Depth=1
	ldxr	x8, [x0]
	cmp	x8, #1                  // =1
	b.eq	.LBB23_2
.LBB23_4:                               // %cmpxchg.nostore3
	clrex
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	adrp	x9, :got:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib]
	add	x1, sp, #8              // =8
	stp	x9, x0, [sp, #32]
	stp	x8, x10, [sp, #16]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE]
	str	x8, [sp, #8]
	bl	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
.LBB23_5:                               // %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end23:
	.size	halide_mutex_unlock, .Lfunc_end23-halide_mutex_unlock
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv,@function
_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv: // @_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
// %bb.0:                               // %entry
	ret
.Lfunc_end24:
	.size	_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv, .Lfunc_end24-_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,@function
_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb: // @_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
// %bb.0:                               // %entry
	ret
.Lfunc_end25:
	.size	_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, .Lfunc_end25-_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
// %bb.0:                               // %entry
	ldr	x8, [x0, #32]
	ldr	x8, [x8]
	cmp	x8, #3                  // =3
	cset	w0, eq
	ret
.Lfunc_end26:
	.size	_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end26-_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib: // @_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
// %bb.0:                               // %entry
	ldr	x8, [x0, #32]
	cmp	w2, #0                  // =0
	mov	w9, #2
	csel	x9, x9, xzr, ne
	mov	x0, xzr
	stlr	x9, [x8]
	ret
.Lfunc_end27:
	.size	_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib, .Lfunc_end27-_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE,@function
_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE: // @_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x21, x1
	mov	x22, x0
	bl	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
	mov	x10, x0
	ldr	x8, [x10, #8]!
	mov	x19, x0
	mov	x12, xzr
.LBB28_1:                               // %while.cond
                                        // =>This Inner Loop Header: Depth=1
	cbz	x8, .LBB28_8
// %bb.2:                               // %while.body
                                        //   in Loop: Header=BB28_1 Depth=1
	mov	x9, x12
	mov	x11, x10
	ldr	x12, [x8, #136]
	mov	x10, x8
	mov	x20, x8
	ldr	x8, [x10, #144]!
	cmp	x12, x22
	mov	x12, x20
	b.ne	.LBB28_1
// %bb.3:                               // %if.then
	str	x8, [x11]
	ldr	x10, [x19, #16]
	cmp	x10, x20
	b.eq	.LBB28_13
// %bb.4:                               // %while.cond6.preheader
	cbz	x8, .LBB28_14
.LBB28_5:                               // %while.body8
                                        // =>This Inner Loop Header: Depth=1
	ldr	x9, [x8, #136]
	ldr	x8, [x8, #144]
	cbz	x8, .LBB28_7
// %bb.6:                               // %while.body8
                                        //   in Loop: Header=BB28_5 Depth=1
	cmp	x9, x22
	b.ne	.LBB28_5
.LBB28_7:                               // %if.end.loopexit
	cmp	x9, x22
	cset	w22, eq
	b	.LBB28_15
.LBB28_8:                               // %while.end21
	ldr	x8, [x21, #16]
	mov	x0, x21
	mov	w1, wzr
	mov	w2, wzr
	blr	x8
.LBB28_9:                               // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x19]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x19]
	cbnz	w10, .LBB28_9
// %bb.10:                              // %atomicrmw.end1
	cmp	x8, #4                  // =4
	mov	x22, xzr
	b.lo	.LBB28_21
// %bb.11:                              // %atomicrmw.end1
	tbnz	w8, #1, .LBB28_21
// %bb.12:                              // %if.then.i
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
	mov	x22, xzr
	b	.LBB28_21
.LBB28_13:                              // %if.then4
	mov	w22, wzr
	str	x9, [x19, #16]
	b	.LBB28_15
.LBB28_14:
	mov	w22, wzr
.LBB28_15:                              // %if.end
	ldr	x8, [x21, #16]
	mov	w1, #1
	mov	x0, x21
	mov	w2, w22
	blr	x8
	str	x0, [x20, #152]
	mov	x0, x20
	bl	pthread_mutex_lock
.LBB28_16:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x19]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x19]
	cbnz	w10, .LBB28_16
// %bb.17:                              // %atomicrmw.end
	cmp	x8, #4                  // =4
	b.lo	.LBB28_20
// %bb.18:                              // %atomicrmw.end
	tbnz	w8, #1, .LBB28_20
// %bb.19:                              // %if.then.i66
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
.LBB28_20:                              // %cleanup.thread
	add	x0, x20, #64            // =64
	strb	wzr, [x20, #128]
	bl	pthread_cond_signal
	mov	x0, x20
	bl	pthread_mutex_unlock
.LBB28_21:                              // %cleanup25
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x22
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end28:
	.size	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE, .Lfunc_end28-_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy,@function
_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy: // @_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	mov	x8, #31765
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	movk	x8, #32586, lsl #16
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
	movk	x8, #31161, lsl #32
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization13table_storageE]
	movk	x8, #40503, lsl #48
	mul	x8, x0, x8
	mov	w9, #24
	lsr	x8, x8, #54
	madd	x19, x8, x9, x10
	ldaxr	x8, [x19]
	add	x29, sp, #16            // =16
	cbz	x8, .LBB29_2
// %bb.1:                               // %cmpxchg.nostore
	clrex
	b	.LBB29_3
.LBB29_2:                               // %cmpxchg.trystore
	mov	w8, #1
	stxr	w9, x8, [x19]
	cbz	w9, .LBB29_4
.LBB29_3:                               // %if.then.i.critedge
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
.LBB29_4:                               // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x19
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end29:
	.size	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy, .Lfunc_end29-_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv,@function
_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv: // @_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
// %bb.0:                               // %entry
	str	x25, [sp, #-80]!        // 8-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	ldr	x8, [x0]
	mov	x19, x0
	add	x29, sp, #64            // =64
	cmp	x8, #4                  // =4
	b.hs	.LBB30_3
	b	.LBB30_21
.LBB30_1:                               // %cmpxchg.nostore
                                        //   in Loop: Header=BB30_3 Depth=1
	clrex
	mov	x8, x22
.LBB30_2:                               // %while.cond
                                        //   in Loop: Header=BB30_3 Depth=1
	cmp	x8, #4                  // =4
	b.lo	.LBB30_21
.LBB30_3:                               // %while.cond
                                        // =>This Inner Loop Header: Depth=1
	tbnz	w8, #1, .LBB30_21
// %bb.4:                               // %if.end
                                        //   in Loop: Header=BB30_3 Depth=1
	ldaxr	x22, [x19]
	cmp	x22, x8
	b.ne	.LBB30_1
// %bb.5:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB30_3 Depth=1
	orr	x8, x8, #0x2
	stxr	w9, x8, [x19]
	mov	x8, x22
	cbnz	w9, .LBB30_2
// %bb.6:
	adrp	x20, .L.str.6
	add	x20, x20, :lo12:.L.str.6
	and	x23, x22, #0xfffffffffffffffc
	ldr	x21, [x23, #152]
	cbnz	x21, .LBB30_13
	b	.LBB30_9
.LBB30_7:                               // %cmpxchg.nostore3
                                        //   in Loop: Header=BB30_13 Depth=1
	clrex
.LBB30_8:                               // %cleanup70
                                        //   in Loop: Header=BB30_13 Depth=1
	dmb	ishld
	mov	x22, x8
	and	x23, x22, #0xfffffffffffffffc
	ldr	x21, [x23, #152]
	cbnz	x21, .LBB30_13
.LBB30_9:                               // %while.body17.preheader
	mov	x24, x23
	ldr	x25, [x24, #136]
	cbz	x25, .LBB30_12
.LBB30_10:                              // %if.end21
	ldr	x21, [x25, #152]
	str	x24, [x25, #144]
	mov	x24, x25
	cbnz	x21, .LBB30_13
.LBB30_11:                              // %while.body17
	ldr	x25, [x24, #136]
	cbnz	x25, .LBB30_10
.LBB30_12:                              // %if.then20
	mov	x0, xzr
	mov	x1, x20
	bl	halide_print
	bl	abort
	ldr	x21, [x25, #152]
	str	x24, [x25, #144]
	mov	x24, x25
	cbz	x21, .LBB30_11
.LBB30_13:                              // %while.end23
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB30_17 Depth 2
	str	x21, [x23, #152]
	tbnz	w22, #0, .LBB30_19
// %bb.14:                              // %if.end35
                                        //   in Loop: Header=BB30_13 Depth=1
	ldr	x8, [x21, #144]
	cbz	x8, .LBB30_17
	b	.LBB30_22
.LBB30_15:                              // %cmpxchg.nostore13
                                        //   in Loop: Header=BB30_17 Depth=2
	clrex
.LBB30_16:                              // %if.end47.critedge
                                        //   in Loop: Header=BB30_17 Depth=2
	cmp	x8, #4                  // =4
	mov	x22, x8
	b.hs	.LBB30_8
.LBB30_17:                              // %while.body41
                                        //   Parent Loop BB30_13 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	x8, [x19]
	cmp	x8, x22
	b.ne	.LBB30_15
// %bb.18:                              // %cmpxchg.trystore16
                                        //   in Loop: Header=BB30_17 Depth=2
	and	x9, x22, #0x1
	stlxr	w10, x9, [x19]
	cbnz	w10, .LBB30_16
	b	.LBB30_24
.LBB30_19:                              // %if.then27
                                        //   in Loop: Header=BB30_13 Depth=1
	ldaxr	x8, [x19]
	cmp	x8, x22
	b.ne	.LBB30_7
// %bb.20:                              // %cmpxchg.trystore6
                                        //   in Loop: Header=BB30_13 Depth=1
	and	x9, x22, #0xfffffffffffffffd
	stlxr	w10, x9, [x19]
	cbnz	w10, .LBB30_8
.LBB30_21:                              // %cleanup76
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldr	x25, [sp], #80          // 8-byte Folded Reload
	ret
.LBB30_22:                              // %if.else62
	str	x8, [x23, #152]
.LBB30_23:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x19]
	and	x8, x8, #0xfffffffffffffffd
	stlxr	w9, x8, [x19]
	cbnz	w9, .LBB30_23
.LBB30_24:                              // %if.end66
	mov	x0, x21
	bl	pthread_mutex_lock
	add	x0, x21, #64            // =64
	strb	wzr, [x21, #128]
	bl	pthread_cond_signal
	mov	x0, x21
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldr	x25, [sp], #80          // 8-byte Folded Reload
	b	pthread_mutex_unlock
.Lfunc_end30:
	.size	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv, .Lfunc_end30-_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv,@function
_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv: // @_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
// %bb.0:                               // %entry
	sub	sp, sp, #256            // =256
	str	x27, [sp, #160]         // 8-byte Folded Spill
	stp	x26, x25, [sp, #176]    // 16-byte Folded Spill
	stp	x24, x23, [sp, #192]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #208]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #224]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #240]    // 16-byte Folded Spill
	ldr	x26, [x0]
	mov	x21, sp
	mov	x19, x0
	add	x20, x21, #64           // =64
	add	x22, x21, #136          // =136
	mov	w24, #40
	mov	w23, #1
	add	x29, sp, #240           // =240
	tbz	w26, #0, .LBB31_6
	b	.LBB31_3
.LBB31_1:                               // %cmpxchg.nostore3
	clrex
.LBB31_2:                               // %if.end22
	mov	x0, x20
	bl	pthread_cond_destroy
	mov	x0, sp
	bl	pthread_mutex_destroy
	tbz	w26, #0, .LBB31_6
.LBB31_3:
	mov	x25, x26
	b	.LBB31_8
.LBB31_4:                               // %cmpxchg.nostore
                                        //   in Loop: Header=BB31_6 Depth=1
	clrex
.LBB31_5:                               // %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.critedge
                                        //   in Loop: Header=BB31_6 Depth=1
	mov	x26, x25
	tbnz	w25, #0, .LBB31_8
.LBB31_6:                               // %if.then
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x25, [x19]
	orr	x8, x26, #0x1
	cmp	x25, x26
	b.ne	.LBB31_4
// %bb.7:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB31_6 Depth=1
	stxr	w9, x8, [x19]
	cbnz	w9, .LBB31_5
	b	.LBB31_20
.LBB31_8:                               // %if.end4
	subs	w27, w24, #1            // =1
	b.lt	.LBB31_13
// %bb.9:                               // %if.end4
	cmp	x25, #4                 // =4
	b.lo	.LBB31_13
// %bb.10:                              // %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit
	cmp	w27, #1                 // =1
	b.lt	.LBB31_12
// %bb.11:                              // %if.then7
	bl	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv
	ldr	x26, [x19]
	mov	w24, w27
	tbz	w26, #0, .LBB31_6
	b	.LBB31_3
.LBB31_12:
	mov	w24, wzr
.LBB31_13:                              // %if.end9
	mov	x0, sp
	mov	x1, xzr
	strb	wzr, [sp, #128]
	bl	pthread_mutex_init
	mov	x0, x20
	mov	x1, xzr
	bl	pthread_cond_init
	ands	x8, x25, #0xfffffffffffffffc
	stp	xzr, xzr, [x22, #8]
	str	xzr, [x22]
	strb	w23, [sp, #128]
	b.eq	.LBB31_19
// %bb.14:                              // %if.else
	str	x8, [sp, #136]
	ldxr	x26, [x19]
	cmp	x26, x25
	b.ne	.LBB31_1
.LBB31_15:                              // %cmpxchg.trystore6
	mov	x8, sp
	bfxil	x8, x25, #0, #2
	stlxr	w9, x8, [x19]
	cbnz	w9, .LBB31_2
// %bb.16:                              // %if.then19
	mov	x0, sp
	bl	pthread_mutex_lock
	ldrb	w8, [sp, #128]
	cbz	w8, .LBB31_18
.LBB31_17:                              // %while.body.i
                                        // =>This Inner Loop Header: Depth=1
	mov	x1, sp
	mov	x0, x20
	bl	pthread_cond_wait
	ldrb	w8, [sp, #128]
	cbnz	w8, .LBB31_17
.LBB31_18:                              // %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
	mov	x0, sp
	bl	pthread_mutex_unlock
	ldr	x26, [x19]
	mov	w24, #40
	b	.LBB31_2
.LBB31_19:                              // %if.then12
	str	x21, [sp, #152]
	ldxr	x26, [x19]
	cmp	x26, x25
	b.ne	.LBB31_1
	b	.LBB31_15
.LBB31_20:                              // %cleanup23
	ldp	x29, x30, [sp, #240]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #224]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #208]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #192]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #176]    // 16-byte Folded Reload
	ldr	x27, [sp, #160]         // 8-byte Folded Reload
	add	sp, sp, #256            // =256
	ret
.Lfunc_end31:
	.size	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv, .Lfunc_end31-_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
                                        // -- End function
	.section	.text.halide_cond_broadcast,"ax",@progbits
	.weak	halide_cond_broadcast   // -- Begin function halide_cond_broadcast
	.p2align	2
	.type	halide_cond_broadcast,@function
halide_cond_broadcast:                  // @halide_cond_broadcast
// %bb.0:                               // %entry
	sub	sp, sp, #64             // =64
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	ldr	x1, [x0]
	add	x29, sp, #48            // =48
	cbz	x1, .LBB32_2
// %bb.1:                               // %if.end.i
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	adrp	x9, :got:_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib]
	stp	x0, x1, [sp, #32]
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
	adrp	x11, :got:_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE]
	ldr	x11, [x11, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb]
	mov	x2, sp
	mov	x3, xzr
	stp	x10, x8, [sp]
	stp	x9, x11, [sp, #16]
	bl	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy
.LBB32_2:                               // %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond9broadcastEv.exit
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end32:
	.size	halide_cond_broadcast, .Lfunc_end32-halide_cond_broadcast
                                        // -- End function
	.section	.text.halide_default_semaphore_try_acquire,"ax",@progbits
	.weak	halide_default_semaphore_try_acquire // -- Begin function halide_default_semaphore_try_acquire
	.p2align	2
	.type	halide_default_semaphore_try_acquire,@function
halide_default_semaphore_try_acquire:   // @halide_default_semaphore_try_acquire
// %bb.0:                               // %entry
	cbz	w1, .LBB33_6
// %bb.1:                               // %if.end
	ldar	w8, [x0]
	subs	w9, w8, w1
	b.pl	.LBB33_4
	b	.LBB33_7
.LBB33_2:                               // %cmpxchg.nostore
                                        //   in Loop: Header=BB33_4 Depth=1
	clrex
.LBB33_3:                               // %if.end
                                        //   in Loop: Header=BB33_4 Depth=1
	subs	w9, w8, w1
	b.mi	.LBB33_7
.LBB33_4:                               // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	mov	w10, w8
	ldaxr	w8, [x0]
	cmp	w8, w10
	b.ne	.LBB33_2
// %bb.5:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB33_4 Depth=1
	stlxr	w10, w9, [x0]
	cbnz	w10, .LBB33_3
.LBB33_6:
	mov	w0, #1
	ret
.LBB33_7:
	mov	w0, wzr
	ret
.Lfunc_end33:
	.size	halide_default_semaphore_try_acquire, .Lfunc_end33-halide_default_semaphore_try_acquire
                                        // -- End function
	.section	.text.halide_cond_wait,"ax",@progbits
	.weak	halide_cond_wait        // -- Begin function halide_cond_wait
	.p2align	2
	.type	halide_cond_wait,@function
halide_cond_wait:                       // @halide_cond_wait
// %bb.0:                               // %entry
	sub	sp, sp, #160            // =160
	stp	x24, x23, [sp, #96]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #112]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #144]    // 16-byte Folded Spill
	adrp	x20, :got:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb]
	stp	x0, x1, [sp, #40]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
	adrp	x9, :got:_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib]
	mov	x19, x1
	add	x1, sp, #8              // =8
	add	x29, sp, #144           // =144
	stp	x8, x9, [sp, #8]
	stp	x10, x20, [sp, #24]
	bl	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
	cmp	x0, x19
	b.ne	.LBB34_3
// %bb.1:                               // %if.else.i
	ldr	x8, [x19]
	tbnz	w8, #0, .LBB34_23
// %bb.2:                               // %if.then2.i
	adrp	x1, .L.str.6.7
	add	x1, x1, :lo12:.L.str.6.7
	mov	x0, xzr
	bl	halide_print
	bl	abort
	b	.LBB34_23
.LBB34_3:                               // %cmpxchg.start
	ldaxr	x8, [x19]
	cbz	x8, .LBB34_5
// %bb.4:                               // %cmpxchg.nostore
	clrex
	b	.LBB34_6
.LBB34_5:                               // %cmpxchg.trystore
	mov	w8, #1
	stxr	w9, x8, [x19]
	cbz	w9, .LBB34_23
.LBB34_6:                               // %if.then.i.i.critedge
	adrp	x21, :got:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	adrp	x22, :got:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
	adrp	x23, :got:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
	ldr	x9, [x19]
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv]
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE]
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib]
	mov	w8, #40
.LBB34_7:                               // %while.cond.outer.i.i.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB34_11 Depth 2
	tbz	w9, #0, .LBB34_11
.LBB34_8:                               //   in Loop: Header=BB34_7 Depth=1
	mov	x10, x9
	b	.LBB34_13
.LBB34_9:                               // %cmpxchg.nostore3
                                        //   in Loop: Header=BB34_11 Depth=2
	clrex
.LBB34_10:                              // %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_acquire_relaxedEPyS4_S4_.exit.i.i.i.critedge
                                        //   in Loop: Header=BB34_11 Depth=2
	mov	x9, x10
	tbnz	w10, #0, .LBB34_13
.LBB34_11:                              // %if.then.i.i.i
                                        //   Parent Loop BB34_7 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	x10, [x19]
	cmp	x10, x9
	b.ne	.LBB34_9
// %bb.12:                              // %cmpxchg.trystore6
                                        //   in Loop: Header=BB34_11 Depth=2
	orr	x9, x9, #0x1
	stxr	w11, x9, [x19]
	cbnz	w11, .LBB34_10
	b	.LBB34_23
.LBB34_13:                              // %if.end4.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	tbnz	w10, #1, .LBB34_17
// %bb.14:                              // %land.lhs.true.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	subs	w24, w8, #1             // =1
	b.ge	.LBB34_19
// %bb.15:                              // %if.then12.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	ldxr	x9, [x19]
	cmp	x9, x10
	b.ne	.LBB34_22
.LBB34_16:                              // %cmpxchg.trystore16
                                        //   in Loop: Header=BB34_7 Depth=1
	orr	x10, x10, #0x2
	stxr	w11, x10, [x19]
	cbnz	w11, .LBB34_7
.LBB34_17:                              // %if.end21.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	add	x1, sp, #56             // =56
	mov	x0, x19
	stp	x21, x23, [sp, #64]
	stp	x20, x19, [sp, #80]
	str	x22, [sp, #56]
	bl	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
	cmp	x0, x19
	b.eq	.LBB34_23
// %bb.18:                              // %if.end26.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	ldr	x9, [x19]
	mov	w8, #40
	tbz	w9, #0, .LBB34_11
	b	.LBB34_8
.LBB34_19:                              // %_ZN6Halide7Runtime8Internal15Synchronization12spin_control11should_spinEv.exit.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	cmp	w24, #1                 // =1
	b.lt	.LBB34_21
// %bb.20:                              // %if.then7.i.i.i
                                        //   in Loop: Header=BB34_7 Depth=1
	bl	_ZN6Halide7Runtime8Internal19halide_thread_yieldEv
	ldr	x9, [x19]
	mov	w8, w24
	tbz	w9, #0, .LBB34_11
	b	.LBB34_8
.LBB34_21:                              //   in Loop: Header=BB34_7 Depth=1
	mov	w8, wzr
	ldxr	x9, [x19]
	cmp	x9, x10
	b.eq	.LBB34_16
.LBB34_22:                              // %cmpxchg.nostore13
                                        //   in Loop: Header=BB34_7 Depth=1
	clrex
	tbz	w9, #0, .LBB34_11
	b	.LBB34_8
.LBB34_23:                              // %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond4waitEPNS2_10fast_mutexE.exit
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #112]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #96]     // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.Lfunc_end34:
	.size	halide_cond_wait, .Lfunc_end34-halide_cond_wait
                                        // -- End function
	.section	.text.halide_do_loop_task,"ax",@progbits
	.weak	halide_do_loop_task     // -- Begin function halide_do_loop_task
	.p2align	2
	.type	halide_do_loop_task,@function
halide_do_loop_task:                    // @halide_do_loop_task
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal19custom_do_loop_taskE]
	ldr	x6, [x8]
	br	x6
.Lfunc_end35:
	.size	halide_do_loop_task, .Lfunc_end35-halide_do_loop_task
                                        // -- End function
	.section	.text.halide_do_task,"ax",@progbits
	.weak	halide_do_task          // -- Begin function halide_do_task
	.p2align	2
	.type	halide_do_task,@function
halide_do_task:                         // @halide_do_task
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal14custom_do_taskE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal14custom_do_taskE]
	ldr	x4, [x8]
	br	x4
.Lfunc_end36:
	.size	halide_do_task, .Lfunc_end36-halide_do_task
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
// %bb.0:                               // %entry
	ldp	x9, x8, [x0, #32]
	ldr	x10, [x9]
	cbz	x10, .LBB37_3
// %bb.1:                               // %if.else
	cmp	x10, x8
	b.ne	.LBB37_4
// %bb.2:
	mov	w0, #1
	ret
.LBB37_3:                               // %if.then
	mov	w0, #1
	str	x8, [x9]
	ret
.LBB37_4:                               // %if.then4
	mov	w0, wzr
	str	x8, [x1, #8]
	ret
.Lfunc_end37:
	.size	_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end37-_ZN6Halide7Runtime8Internal15Synchronization29wait_parking_control_validateEPvRNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv,@function
_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv: // @_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
// %bb.0:                               // %entry
	sub	sp, sp, #64             // =64
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	ldr	x0, [x0, #40]
	add	x29, sp, #48            // =48
	ldxr	x8, [x0]
	cmp	x8, #1                  // =1
	b.eq	.LBB38_2
// %bb.1:                               // %cmpxchg.nostore
	clrex
	ldxr	x8, [x0]
	cmp	x8, #1                  // =1
	b.ne	.LBB38_4
.LBB38_2:                               // %cmpxchg.trystore
                                        // =>This Inner Loop Header: Depth=1
	stlxr	w8, xzr, [x0]
	cbz	w8, .LBB38_5
// %bb.3:                               // %cmpxchg.start8
                                        //   in Loop: Header=BB38_2 Depth=1
	ldxr	x8, [x0]
	cmp	x8, #1                  // =1
	b.eq	.LBB38_2
.LBB38_4:                               // %cmpxchg.nostore3
	clrex
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	adrp	x9, :got:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28mutex_parking_control_unparkEPvib]
	add	x1, sp, #8              // =8
	stp	x9, x0, [sp, #32]
	stp	x8, x10, [sp, #16]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization30mutex_parking_control_validateEPvRNS2_15validate_actionE]
	str	x8, [sp, #8]
	bl	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
.LBB38_5:                               // %_ZN6Halide7Runtime8Internal15Synchronization10fast_mutex6unlockEv.exit
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end38:
	.size	_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv, .Lfunc_end38-_ZN6Halide7Runtime8Internal15Synchronization33wait_parking_control_before_sleepEPv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib: // @_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
// %bb.0:                               // %entry
	tbnz	w2, #0, .LBB39_2
// %bb.1:                               // %if.then
	ldr	x8, [x0, #32]
	str	xzr, [x8]
.LBB39_2:                               // %if.end
	mov	x0, xzr
	ret
.Lfunc_end39:
	.size	_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib, .Lfunc_end39-_ZN6Halide7Runtime8Internal15Synchronization27wait_parking_control_unparkEPvib
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE,@function
_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE: // @_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
// %bb.0:                               // %entry
	sub	sp, sp, #240            // =240
	stp	x22, x21, [sp, #192]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #208]    // 16-byte Folded Spill
	mov	x20, x1
	mov	x22, x0
	add	x0, sp, #16             // =16
	mov	x1, xzr
	stp	x24, x23, [sp, #176]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #224]    // 16-byte Folded Spill
	add	x29, sp, #224           // =224
	strb	wzr, [sp, #144]
	add	x23, sp, #16            // =16
	bl	pthread_mutex_init
	add	x19, x23, #64           // =64
	mov	x0, x19
	mov	x1, xzr
	bl	pthread_cond_init
	mov	x0, x22
	strb	wzr, [sp, #144]
	stp	xzr, xzr, [sp, #152]
	str	xzr, [sp, #168]
	bl	_ZN6Halide7Runtime8Internal15Synchronization11lock_bucketEy
	strb	wzr, [sp]
	str	xzr, [sp, #8]
	ldr	x8, [x20]
	mov	x21, x0
	mov	x1, sp
	mov	x0, x20
	mov	x24, sp
	blr	x8
	tbz	w0, #0, .LBB40_9
// %bb.1:                               // %if.end
	mov	w8, #1
	stp	x22, xzr, [sp, #152]
	mov	x9, x21
	strb	w8, [sp, #144]
	ldr	x8, [x9, #8]!
	add	x22, x23, #152          // =152
	ldr	x10, [x9, #8]
	cmp	x8, #0                  // =0
	add	x8, x10, #144           // =144
	csel	x8, x9, x8, eq
	str	x23, [x8]
	str	x23, [x9, #8]
.LBB40_2:                               // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x21]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x21]
	cbnz	w10, .LBB40_2
// %bb.3:                               // %atomicrmw.end1
	cmp	x8, #4                  // =4
	b.lo	.LBB40_6
// %bb.4:                               // %atomicrmw.end1
	tbnz	w8, #1, .LBB40_6
// %bb.5:                               // %if.then.i27
	mov	x0, x21
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
.LBB40_6:                               // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit28
	ldr	x8, [x20, #8]
	mov	x0, x20
	blr	x8
	add	x0, sp, #16             // =16
	bl	pthread_mutex_lock
	ldrb	w8, [sp, #144]
	cbz	w8, .LBB40_8
.LBB40_7:                               // %while.body.i
                                        // =>This Inner Loop Header: Depth=1
	add	x1, sp, #16             // =16
	mov	x0, x19
	bl	pthread_cond_wait
	ldrb	w8, [sp, #144]
	cbnz	w8, .LBB40_7
.LBB40_8:                               // %_ZN6Halide7Runtime8Internal15Synchronization13thread_parker4parkEv.exit
	add	x0, sp, #16             // =16
	bl	pthread_mutex_unlock
	b	.LBB40_14
.LBB40_9:                               // %if.then
	add	x22, x24, #8            // =8
.LBB40_10:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x21]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x21]
	cbnz	w10, .LBB40_10
// %bb.11:                              // %atomicrmw.end
	cmp	x8, #4                  // =4
	b.lo	.LBB40_14
// %bb.12:                              // %atomicrmw.end
	tbnz	w8, #1, .LBB40_14
// %bb.13:                              // %if.then.i
	mov	x0, x21
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
.LBB40_14:                              // %cleanup
	ldr	x20, [x22]
	mov	x0, x19
	bl	pthread_cond_destroy
	add	x0, sp, #16             // =16
	bl	pthread_mutex_destroy
	mov	x0, x20
	ldp	x29, x30, [sp, #224]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #208]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #192]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #176]    // 16-byte Folded Reload
	add	sp, sp, #240            // =240
	ret
.Lfunc_end40:
	.size	_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE, .Lfunc_end40-_ZN6Halide7Runtime8Internal15Synchronization4parkEyRNS2_15parking_controlE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib: // @_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
// %bb.0:                               // %entry
	mov	x0, xzr
	ret
.Lfunc_end41:
	.size	_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib, .Lfunc_end41-_ZN6Halide7Runtime8Internal15Synchronization22parking_control_unparkEPvib
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
// %bb.0:                               // %entry
	ldp	x8, x10, [x0, #32]
	ldr	x9, [x8]
	cmp	x9, x10
	b.ne	.LBB42_7
// %bb.1:                               // %if.end
	str	xzr, [x8]
	ldr	x8, [x0, #40]
	ldr	x9, [x8]
	tbnz	w9, #0, .LBB42_4
	b	.LBB42_8
.LBB42_2:                               // %cmpxchg.nostore
                                        //   in Loop: Header=BB42_4 Depth=1
	clrex
.LBB42_3:                               // %_ZN6Halide7Runtime8Internal15Synchronization12_GLOBAL__N_131atomic_cas_weak_relaxed_relaxedEPyS4_S4_.exit.i.critedge
                                        //   in Loop: Header=BB42_4 Depth=1
	mov	x9, x10
	tbz	w10, #0, .LBB42_8
.LBB42_4:                               // %if.end.i
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x10, [x8]
	cmp	x10, x9
	b.ne	.LBB42_2
// %bb.5:                               // %cmpxchg.trystore
                                        //   in Loop: Header=BB42_4 Depth=1
	orr	x9, x9, #0x2
	stxr	w11, x9, [x8]
	cbnz	w11, .LBB42_3
// %bb.6:
	mov	w8, wzr
	mov	w0, #1
	strb	w8, [x1]
	ret
.LBB42_7:
	mov	w0, wzr
	ret
.LBB42_8:
	mov	w8, #1
	mov	w0, #1
	strb	w8, [x1]
	ret
.Lfunc_end42:
	.size	_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end42-_ZN6Halide7Runtime8Internal15Synchronization34broadcast_parking_control_validateEPvRNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb,@function
_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb: // @_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
// %bb.0:                               // %entry
	ldrb	w8, [x1]
	cbz	w8, .LBB43_4
// %bb.1:                               // %entry
	cbz	w3, .LBB43_4
// %bb.2:                               // %if.then
	ldr	x8, [x0, #40]
.LBB43_3:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x9, [x8]
	orr	x9, x9, #0x2
	stxr	w10, x9, [x8]
	cbnz	w10, .LBB43_3
.LBB43_4:                               // %if.end
	ret
.Lfunc_end43:
	.size	_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb, .Lfunc_end43-_ZN6Halide7Runtime8Internal15Synchronization42broadcast_parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy,@function
_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy: // @_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy
// %bb.0:                               // %entry
	sub	sp, sp, #96             // =96
	add	x8, sp, #16             // =16
	str	x23, [sp, #32]          // 8-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	mov	x19, x3
	mov	x20, x2
	mov	x21, x1
	mov	x22, x0
	bl	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
	strb	wzr, [sp]
	str	xzr, [sp, #8]
	ldr	x8, [x20]
	mov	x1, sp
	mov	x0, x20
	blr	x8
	tbz	w0, #0, .LBB44_13
// %bb.1:                               // %if.end
	ldr	x8, [sp, #16]
	mov	x11, x8
	ldr	x12, [x11, #8]!
	cbz	x12, .LBB44_14
// %bb.2:                               // %while.body.lr.ph
	ldrb	w9, [sp]
	cbz	w9, .LBB44_15
// %bb.3:                               // %while.body.us.preheader
	mov	x23, xzr
	mov	x10, xzr
	mov	x9, xzr
	mov	x13, xzr
	b	.LBB44_5
.LBB44_4:                               //   in Loop: Header=BB44_5 Depth=1
	mov	x11, x15
	mov	x13, x14
	cbz	x12, .LBB44_24
.LBB44_5:                               // %while.body.us
                                        // =>This Inner Loop Header: Depth=1
	ldr	x16, [x12, #136]
	mov	x15, x12
	mov	x14, x12
	ldr	x12, [x15, #144]!
	cmp	x16, x22
	b.ne	.LBB44_4
// %bb.6:                               // %if.then3.us
                                        //   in Loop: Header=BB44_5 Depth=1
	str	x12, [x11]
	ldr	x15, [x8, #16]
	cmp	x15, x14
	b.eq	.LBB44_11
// %bb.7:                               // %if.end9.us
                                        //   in Loop: Header=BB44_5 Depth=1
	cbz	x23, .LBB44_12
.LBB44_8:                               // %if.else.us
                                        //   in Loop: Header=BB44_5 Depth=1
	mov	x0, x14
	cbz	x9, .LBB44_10
// %bb.9:                               // %if.else14.us
                                        //   in Loop: Header=BB44_5 Depth=1
	mov	x0, x9
	str	x14, [x10, #144]
.LBB44_10:                              // %if.end16.us
                                        //   in Loop: Header=BB44_5 Depth=1
	mov	x9, x0
	mov	x10, x14
	str	x21, [x14, #136]
	cbnz	x12, .LBB44_5
	b	.LBB44_24
.LBB44_11:                              // %if.then6.us
                                        //   in Loop: Header=BB44_5 Depth=1
	str	x13, [x8, #16]
	cbnz	x23, .LBB44_8
.LBB44_12:                              //   in Loop: Header=BB44_5 Depth=1
	mov	x23, x14
	cbnz	x12, .LBB44_5
	b	.LBB44_24
.LBB44_13:                              // %if.then
	add	x0, sp, #16             // =16
	bl	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
	mov	w0, wzr
	b	.LBB44_33
.LBB44_14:
	mov	w3, wzr
	mov	x23, xzr
	b	.LBB44_29
.LBB44_15:                              // %while.body.preheader
	mov	x10, xzr
	mov	x9, xzr
	mov	x13, xzr
	b	.LBB44_17
.LBB44_16:                              //   in Loop: Header=BB44_17 Depth=1
	mov	x11, x15
	mov	x13, x12
	mov	x12, x14
	cbz	x14, .LBB44_23
.LBB44_17:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x16, [x12, #136]
	mov	x15, x12
	ldr	x14, [x15, #144]!
	cmp	x16, x22
	b.ne	.LBB44_16
// %bb.18:                              // %if.then3
                                        //   in Loop: Header=BB44_17 Depth=1
	str	x14, [x11]
	ldr	x15, [x8, #16]
	cmp	x15, x12
	b.eq	.LBB44_22
// %bb.19:                              // %if.else
                                        //   in Loop: Header=BB44_17 Depth=1
	mov	x0, x12
	cbz	x9, .LBB44_21
.LBB44_20:                              // %if.else14
                                        //   in Loop: Header=BB44_17 Depth=1
	mov	x0, x9
	str	x12, [x10, #144]
.LBB44_21:                              // %if.end16
                                        //   in Loop: Header=BB44_17 Depth=1
	mov	x9, x0
	mov	x10, x12
	str	x21, [x12, #136]
	mov	x12, x14
	cbnz	x14, .LBB44_17
	b	.LBB44_23
.LBB44_22:                              // %if.then6
                                        //   in Loop: Header=BB44_17 Depth=1
	str	x13, [x8, #16]
	mov	x0, x12
	cbnz	x9, .LBB44_20
	b	.LBB44_21
.LBB44_23:
	mov	x23, xzr
.LBB44_24:                              // %while.end
	cbz	x9, .LBB44_28
// %bb.25:                              // %if.then23
	str	xzr, [x10, #144]
	ldr	x8, [sp, #24]
	mov	x11, x8
	ldr	x12, [x11, #8]!
	cbz	x12, .LBB44_27
// %bb.26:                              // %if.else30
	ldr	x11, [x8, #16]
	add	x11, x11, #144          // =144
.LBB44_27:                              // %if.end34
	mov	w3, #1
	str	x9, [x11]
	str	x10, [x8, #16]
	b	.LBB44_29
.LBB44_28:
	mov	w3, wzr
.LBB44_29:                              // %if.end37
	ldr	x8, [x20, #24]
	cmp	x23, #0                 // =0
	cset	w2, ne
	mov	x1, sp
	mov	x0, x20
	blr	x8
	cbz	x23, .LBB44_31
// %bb.30:                              // %if.then41
	mov	x0, x23
	str	x19, [x23, #152]
	bl	pthread_mutex_lock
	add	x0, sp, #16             // =16
	bl	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
	add	x0, x23, #64            // =64
	strb	wzr, [x23, #128]
	bl	pthread_cond_signal
	mov	x0, x23
	bl	pthread_mutex_unlock
	b	.LBB44_32
.LBB44_31:                              // %if.else45
	add	x0, sp, #16             // =16
	bl	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
.LBB44_32:                              // %if.end46
	ldrb	w8, [sp]
	cmp	x23, #0                 // =0
	cset	w9, ne
	and	w0, w8, w9
.LBB44_33:                              // %cleanup
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #32]          // 8-byte Folded Reload
	add	sp, sp, #96             // =96
	ret
.Lfunc_end44:
	.size	_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy, .Lfunc_end44-_ZN6Halide7Runtime8Internal15Synchronization14unpark_requeueEyyRNS2_15parking_controlEy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy,@function
_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy: // @_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	mov	x9, #31765
	movk	x9, #32586, lsl #16
	movk	x9, #31161, lsl #32
	movk	x9, #40503, lsl #48
	mul	x10, x0, x9
	mul	x11, x1, x9
	lsr	x9, x10, #54
	lsr	x10, x11, #54
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	cmp	x9, x10
	mov	x19, x8
	mov	w8, #24
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	b.ne	.LBB45_3
// %bb.1:                               // %if.then
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization13table_storageE]
	madd	x20, x9, x8, x10
	ldaxr	x8, [x20]
	cbz	x8, .LBB45_8
// %bb.2:                               // %cmpxchg.nostore
	clrex
	b	.LBB45_9
.LBB45_3:                               // %if.else
	adrp	x11, :got:_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
	ldr	x11, [x11, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization13table_storageE]
	b.hs	.LBB45_6
// %bb.4:                               // %if.then3
	madd	x20, x9, x8, x11
	ldaxr	x9, [x20]
	madd	x21, x10, x8, x11
	cbz	x9, .LBB45_10
// %bb.5:                               // %cmpxchg.nostore3
	clrex
	b	.LBB45_11
.LBB45_6:                               // %if.else9
	madd	x21, x10, x8, x11
	ldaxr	x10, [x21]
	madd	x20, x9, x8, x11
	cbz	x10, .LBB45_14
// %bb.7:                               // %cmpxchg.nostore23
	clrex
	b	.LBB45_15
.LBB45_8:                               // %cmpxchg.trystore
	mov	w8, #1
	stxr	w9, x8, [x20]
	cbz	w9, .LBB45_24
.LBB45_9:                               // %if.then.i53.critedge
	mov	x0, x20
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
	mov	x21, x20
	b	.LBB45_23
.LBB45_10:                              // %cmpxchg.trystore6
	mov	w8, #1
	stxr	w9, x8, [x20]
	cbz	w9, .LBB45_12
.LBB45_11:                              // %if.then.i50.critedge
	mov	x0, x20
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
.LBB45_12:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit51
	ldaxr	x8, [x21]
	cbz	x8, .LBB45_18
// %bb.13:                              // %cmpxchg.nostore13
	clrex
	b	.LBB45_19
.LBB45_14:                              // %cmpxchg.trystore26
	mov	w8, #1
	stxr	w9, x8, [x21]
	cbz	w9, .LBB45_16
.LBB45_15:                              // %if.then.i42.critedge
	mov	x0, x21
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
.LBB45_16:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock4lockEv.exit43
	ldaxr	x8, [x20]
	cbz	x8, .LBB45_20
// %bb.17:                              // %cmpxchg.nostore33
	clrex
	b	.LBB45_21
.LBB45_18:                              // %cmpxchg.trystore16
	mov	w8, #1
	stxr	w9, x8, [x21]
	cbz	w9, .LBB45_23
.LBB45_19:                              // %if.then.i47.critedge
	mov	x0, x21
	b	.LBB45_22
.LBB45_20:                              // %cmpxchg.trystore36
	mov	w8, #1
	stxr	w9, x8, [x20]
	cbz	w9, .LBB45_23
.LBB45_21:                              // %if.then.i.critedge
	mov	x0, x20
.LBB45_22:                              // %cleanup
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock9lock_fullEv
.LBB45_23:                              // %cleanup
	stp	x20, x21, [x19]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB45_24:
	mov	x21, x20
	b	.LBB45_23
.Lfunc_end45:
	.size	_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy, .Lfunc_end45-_ZN6Halide7Runtime8Internal15Synchronization16lock_bucket_pairEyy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE,@function
_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE: // @_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x0
	ldr	x0, [x0]
	ldr	x8, [x19, #8]
	add	x29, sp, #16            // =16
	cmp	x0, x8
	b.eq	.LBB46_8
// %bb.1:                               // %if.else
	b.ls	.LBB46_9
.LBB46_2:                               // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x0]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x0]
	cbnz	w10, .LBB46_2
// %bb.3:                               // %atomicrmw.end1
	cmp	x8, #4                  // =4
	b.lo	.LBB46_6
// %bb.4:                               // %atomicrmw.end1
	tbnz	w8, #1, .LBB46_6
// %bb.5:                               // %if.then.i28
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
.LBB46_6:                               // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit29
	ldr	x0, [x19, #8]
.LBB46_7:                               // %atomicrmw.start6
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x0]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x0]
	cbnz	w10, .LBB46_7
	b	.LBB46_15
.LBB46_8:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x0]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x0]
	cbnz	w10, .LBB46_8
	b	.LBB46_15
.LBB46_9:                               // %atomicrmw.start10
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x9, [x8]
	and	x10, x9, #0xfffffffffffffffe
	stlxr	w11, x10, [x8]
	cbnz	w11, .LBB46_9
// %bb.10:                              // %atomicrmw.end9
	cmp	x9, #4                  // =4
	b.lo	.LBB46_13
// %bb.11:                              // %atomicrmw.end9
	tbnz	w9, #1, .LBB46_13
// %bb.12:                              // %if.then.i42
	mov	x0, x8
	bl	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
.LBB46_13:                              // %_ZN6Halide7Runtime8Internal15Synchronization9word_lock6unlockEv.exit43
	ldr	x0, [x19]
.LBB46_14:                              // %atomicrmw.start14
                                        // =>This Inner Loop Header: Depth=1
	ldxr	x8, [x0]
	and	x9, x8, #0xfffffffffffffffe
	stlxr	w10, x9, [x0]
	cbnz	w10, .LBB46_14
.LBB46_15:                              // %atomicrmw.end5
	cmp	x8, #4                  // =4
	b.lo	.LBB46_18
// %bb.16:                              // %atomicrmw.end5
	tbnz	w8, #1, .LBB46_18
// %bb.17:                              // %if.then.i
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	b	_ZN6Halide7Runtime8Internal15Synchronization9word_lock11unlock_fullEv
.LBB46_18:                              // %if.end15
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end46:
	.size	_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE, .Lfunc_end46-_ZN6Halide7Runtime8Internal15Synchronization18unlock_bucket_pairERNS2_11bucket_pairE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal27default_desired_num_threadsEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv // -- Begin function _ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv,@function
_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv: // @_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x0, .L.str.1.8
	add	x0, x0, :lo12:.L.str.1.8
	mov	x29, sp
	bl	getenv
	cbnz	x0, .LBB47_2
// %bb.1:                               // %if.end
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	getenv
	cbz	x0, .LBB47_3
.LBB47_2:                               // %if.then3
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	b	atoi
.LBB47_3:                               // %if.else
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	b	halide_host_cpu_count
.Lfunc_end47:
	.size	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv, .Lfunc_end47-_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal17clamp_num_threadsEi,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi // -- Begin function _ZN6Halide7Runtime8Internal17clamp_num_threadsEi
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi,@function
_ZN6Halide7Runtime8Internal17clamp_num_threadsEi: // @_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
// %bb.0:                               // %entry
	cmp	w0, #256                // =256
	b.le	.LBB48_2
// %bb.1:                               // %if.end3
	mov	w0, #256
	ret
.LBB48_2:                               // %if.else
	cmp	w0, #1                  // =1
	csinc	w0, w0, wzr, gt
	ret
.Lfunc_end48:
	.size	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi, .Lfunc_end48-_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal13worker_threadEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal13worker_threadEPv // -- Begin function _ZN6Halide7Runtime8Internal13worker_threadEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal13worker_threadEPv,@function
_ZN6Halide7Runtime8Internal13worker_threadEPv: // @_ZN6Halide7Runtime8Internal13worker_threadEPv
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x20, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	mov	x19, x0
	add	x29, sp, #16            // =16
	mov	x0, x20
	bl	halide_mutex_lock
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x20
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_mutex_unlock
.Lfunc_end49:
	.size	_ZN6Halide7Runtime8Internal13worker_threadEPv, .Lfunc_end49-_ZN6Halide7Runtime8Internal13worker_threadEPv
                                        // -- End function
	.section	.text.halide_spawn_thread,"ax",@progbits
	.weak	halide_spawn_thread     // -- Begin function halide_spawn_thread
	.p2align	2
	.type	halide_spawn_thread,@function
halide_spawn_thread:                    // @halide_spawn_thread
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x20, x0
	mov	w0, #24
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x1
	bl	malloc
	mov	x21, x0
	stp	x20, x19, [x0]
	str	xzr, [x0, #16]!
	adrp	x2, :got:_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
	ldr	x2, [x2, :got_lo12:_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv]
	mov	x1, xzr
	mov	x3, x21
	bl	pthread_create
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x21
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end50:
	.size	halide_spawn_thread, .Lfunc_end50-halide_spawn_thread
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal19spawn_thread_helperEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv // -- Begin function _ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv,@function
_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv: // @_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	ldp	x8, x0, [x0]
	mov	x29, sp
	blr	x8
	mov	x0, xzr
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end51:
	.size	_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv, .Lfunc_end51-_ZN6Halide7Runtime8Internal19spawn_thread_helperEPv
                                        // -- End function
	.section	.text.halide_default_do_parallel_tasks,"ax",@progbits
	.weak	halide_default_do_parallel_tasks // -- Begin function halide_default_do_parallel_tasks
	.p2align	2
	.type	halide_default_do_parallel_tasks,@function
halide_default_do_parallel_tasks:       // @halide_default_do_parallel_tasks
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	w20, w1
	sxtw	x8, w20
	mov	x9, sp
	mov	x21, x3
	sub	x19, x9, x8, lsl #7
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	sp, x19
	cmp	w1, #1                  // =1
	b.lt	.LBB52_6
// %bb.1:                               // %for.body.preheader
	mov	x8, xzr
	add	x9, x19, #112           // =112
	ldr	w10, [x2, #40]
	cmp	w10, #0                 // =0
	b.le	.LBB52_5
.LBB52_2:                               // %if.end
	ldp	q0, q1, [x2]
	ldr	q2, [x2, #32]
	ldr	x10, [x2, #48]
	add	x2, x2, #56             // =56
	stp	x0, xzr, [x9, #-8]
	stur	xzr, [x9, #5]
	stp	q1, q2, [x9, #-96]
	stur	q0, [x9, #-112]
	stp	x10, xzr, [x9, #-64]
	stur	x21, [x9, #-24]
.LBB52_3:                               // %for.inc
	add	x8, x8, #1              // =1
	cmp	x8, w20, sxtw
	add	x9, x9, #128            // =128
	b.ge	.LBB52_6
// %bb.4:                               // %for.body
	ldr	w10, [x2, #40]
	cmp	w10, #0                 // =0
	b.gt	.LBB52_2
.LBB52_5:                               // %if.then
	sub	w20, w20, #1            // =1
	b	.LBB52_3
.LBB52_6:                               // %for.cond.cleanup
	cbz	w20, .LBB52_10
// %bb.7:                               // %if.end19
	adrp	x0, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	bl	halide_mutex_lock
	mov	w0, w20
	mov	x1, x19
	mov	x2, x21
	bl	_ZN6Halide7Runtime8Internal27enqueue_work_already_lockedEiPNS1_4workES3_
	cmp	w20, #1                 // =1
	b.lt	.LBB52_11
// %bb.8:                               // %for.body25.preheader
	mov	w21, wzr
	mov	w20, w20
.LBB52_9:                               // %for.body25
                                        // =>This Inner Loop Header: Depth=1
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal28worker_thread_already_lockedEPNS1_4workE
	ldr	w8, [x19, #116]
	add	x19, x19, #128          // =128
	cmp	w8, #0                  // =0
	csel	w21, w21, w8, eq
	subs	x20, x20, #1            // =1
	b.ne	.LBB52_9
	b	.LBB52_12
.LBB52_10:
	mov	w21, wzr
	b	.LBB52_13
.LBB52_11:
	mov	w21, wzr
.LBB52_12:                              // %for.cond.cleanup24
	adrp	x0, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	bl	halide_mutex_unlock
.LBB52_13:                              // %cleanup
	mov	w0, w21
	sub	sp, x29, #32            // =32
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end52:
	.size	halide_default_do_parallel_tasks, .Lfunc_end52-halide_default_do_parallel_tasks
                                        // -- End function
	.section	.text.halide_default_semaphore_init,"ax",@progbits
	.weak	halide_default_semaphore_init // -- Begin function halide_default_semaphore_init
	.p2align	2
	.type	halide_default_semaphore_init,@function
halide_default_semaphore_init:          // @halide_default_semaphore_init
// %bb.0:                               // %entry
	stlr	w1, [x0]
	mov	w0, w1
	ret
.Lfunc_end53:
	.size	halide_default_semaphore_init, .Lfunc_end53-halide_default_semaphore_init
                                        // -- End function
	.section	.text.halide_default_semaphore_release,"ax",@progbits
	.weak	halide_default_semaphore_release // -- Begin function halide_default_semaphore_release
	.p2align	2
	.type	halide_default_semaphore_release,@function
halide_default_semaphore_release:       // @halide_default_semaphore_release
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	w19, w1
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
.LBB54_1:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w21, [x0]
	add	w8, w21, w19
	stlxr	w9, w8, [x0]
	cbnz	w9, .LBB54_1
// %bb.2:                               // %atomicrmw.end
	cbz	w19, .LBB54_5
// %bb.3:                               // %atomicrmw.end
	cbnz	w21, .LBB54_5
// %bb.4:                               // %if.then
	adrp	x20, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	mov	x0, x20
	bl	halide_mutex_lock
	add	x0, x20, #40            // =40
	bl	halide_cond_broadcast
	add	x0, x20, #56            // =56
	bl	halide_cond_broadcast
	mov	x0, x20
	bl	halide_mutex_unlock
.LBB54_5:                               // %if.end
	add	w0, w21, w19
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end54:
	.size	halide_default_semaphore_release, .Lfunc_end54-halide_default_semaphore_release
                                        // -- End function
	.section	.text.halide_thread_pool_cleanup,"ax",@progbits
	.weak	halide_thread_pool_cleanup // -- Begin function halide_thread_pool_cleanup
	.p2align	2
	.type	halide_thread_pool_cleanup,@function
halide_thread_pool_cleanup:             // @halide_thread_pool_cleanup
// %bb.0:                               // %entry
	b	halide_shutdown_thread_pool
.Lfunc_end55:
	.size	halide_thread_pool_cleanup, .Lfunc_end55-halide_thread_pool_cleanup
                                        // -- End function
	.section	.text.halide_shutdown_thread_pool,"ax",@progbits
	.weak	halide_shutdown_thread_pool // -- Begin function halide_shutdown_thread_pool
	.p2align	2
	.type	halide_shutdown_thread_pool,@function
halide_shutdown_thread_pool:            // @halide_shutdown_thread_pool
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x19, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	add	x29, sp, #16            // =16
	ldrb	w8, [x19, #2121]
	cbz	w8, .LBB56_5
// %bb.1:                               // %if.then
	mov	x0, x19
	bl	halide_mutex_lock
	mov	w8, #1
	add	x0, x19, #56            // =56
	strb	w8, [x19, #2120]
	bl	halide_cond_broadcast
	add	x0, x19, #40            // =40
	bl	halide_cond_broadcast
	add	x0, x19, #48            // =48
	bl	halide_cond_broadcast
	mov	x0, x19
	bl	halide_mutex_unlock
	ldr	w8, [x19, #24]
	cmp	w8, #1                  // =1
	b.lt	.LBB56_4
// %bb.2:                               // %for.body.preheader
	mov	x20, xzr
.LBB56_3:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	add	x8, x19, x20, lsl #3
	ldr	x0, [x8, #72]
	bl	halide_join_thread
	ldrsw	x8, [x19, #24]
	add	x20, x20, #1            // =1
	cmp	x20, x8
	b.lt	.LBB56_3
.LBB56_4:                               // %for.cond.cleanup
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	add	x0, x19, #12            // =12
	mov	w2, #2116
	mov	w1, wzr
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	memset
.LBB56_5:                               // %if.end
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end56:
	.size	halide_shutdown_thread_pool, .Lfunc_end56-halide_shutdown_thread_pool
                                        // -- End function
	.section	.text.halide_join_thread,"ax",@progbits
	.weak	halide_join_thread      // -- Begin function halide_join_thread
	.p2align	2
	.type	halide_join_thread,@function
halide_join_thread:                     // @halide_join_thread
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	str	xzr, [sp, #8]
	mov	x19, x0
	ldr	x0, [x0, #16]
	add	x1, sp, #8              // =8
	add	x29, sp, #16            // =16
	bl	pthread_join
	mov	x0, x19
	bl	free
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end57:
	.size	halide_join_thread, .Lfunc_end57-halide_join_thread
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE,@function
_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE: // @_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
// %bb.0:                               // %entry
	mov	w0, #1
	ret
.Lfunc_end58:
	.size	_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE, .Lfunc_end58-_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib // -- Begin function _ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib,@function
_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib: // @_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
// %bb.0:                               // %entry
	tbnz	w2, #0, .LBB59_2
// %bb.1:                               // %if.then
	ldr	x8, [x0, #32]
	str	xzr, [x8]
.LBB59_2:                               // %if.end
	mov	x0, xzr
	ret
.Lfunc_end59:
	.size	_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib, .Lfunc_end59-_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
                                        // -- End function
	.section	.text.halide_cond_signal,"ax",@progbits
	.weak	halide_cond_signal      // -- Begin function halide_cond_signal
	.p2align	2
	.type	halide_cond_signal,@function
halide_cond_signal:                     // @halide_cond_signal
// %bb.0:                               // %entry
	sub	sp, sp, #64             // =64
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	ldr	x8, [x0]
	add	x29, sp, #48            // =48
	cbz	x8, .LBB60_2
// %bb.1:                               // %if.end.i
	adrp	x9, :got:_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE
	adrp	x10, :got:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv
	adrp	x11, :got:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization24parking_control_validateEPvRNS2_15validate_actionE]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization28parking_control_before_sleepEPv]
	ldr	x11, [x11, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization32parking_control_requeue_callbackEPvRKNS2_15validate_actionEbb]
	stp	x0, x8, [sp, #32]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal15Synchronization29signal_parking_control_unparkEPvib]
	mov	x1, sp
	stp	x9, x10, [sp]
	stp	x8, x11, [sp, #16]
	bl	_ZN6Halide7Runtime8Internal15Synchronization10unpark_oneEyRNS2_15parking_controlE
.LBB60_2:                               // %_ZN6Halide7Runtime8Internal15Synchronization9fast_cond6signalEv.exit
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end60:
	.size	halide_cond_signal, .Lfunc_end60-halide_cond_signal
                                        // -- End function
	.section	.text.halide_set_num_threads,"ax",@progbits
	.weak	halide_set_num_threads  // -- Begin function halide_set_num_threads
	.p2align	2
	.type	halide_set_num_threads,@function
halide_set_num_threads:                 // @halide_set_num_threads
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	adrp	x19, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	mov	w20, w0
	add	x29, sp, #32            // =32
	tbnz	w0, #31, .LBB61_3
// %bb.1:                               // %if.end
	adrp	x0, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	bl	halide_mutex_lock
	cbnz	w20, .LBB61_4
// %bb.2:                               // %if.then2
	bl	_ZN6Halide7Runtime8Internal27default_desired_num_threadsEv
	mov	w20, w0
	b	.LBB61_4
.LBB61_3:                               // %if.end.thread
	adrp	x1, .L.str.4
	add	x1, x1, :lo12:.L.str.4
	mov	x0, xzr
	bl	halide_error
	adrp	x0, :got:_ZN6Halide7Runtime8Internal10work_queueE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal10work_queueE]
	bl	halide_mutex_lock
.LBB61_4:                               // %if.end3
	ldr	w21, [x19, #8]
	mov	w0, w20
	bl	_ZN6Halide7Runtime8Internal17clamp_num_threadsEi
	str	w0, [x19, #8]
	mov	x0, x19
	bl	halide_mutex_unlock
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w21
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end61:
	.size	halide_set_num_threads, .Lfunc_end61-halide_set_num_threads
                                        // -- End function
	.section	.text.halide_set_custom_do_task,"ax",@progbits
	.weak	halide_set_custom_do_task // -- Begin function halide_set_custom_do_task
	.p2align	2
	.type	halide_set_custom_do_task,@function
halide_set_custom_do_task:              // @halide_set_custom_do_task
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal14custom_do_taskE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal14custom_do_taskE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end62:
	.size	halide_set_custom_do_task, .Lfunc_end62-halide_set_custom_do_task
                                        // -- End function
	.section	.text.halide_set_custom_do_loop_task,"ax",@progbits
	.weak	halide_set_custom_do_loop_task // -- Begin function halide_set_custom_do_loop_task
	.p2align	2
	.type	halide_set_custom_do_loop_task,@function
halide_set_custom_do_loop_task:         // @halide_set_custom_do_loop_task
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19custom_do_loop_taskE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end63:
	.size	halide_set_custom_do_loop_task, .Lfunc_end63-halide_set_custom_do_loop_task
                                        // -- End function
	.section	.text.halide_set_custom_do_par_for,"ax",@progbits
	.weak	halide_set_custom_do_par_for // -- Begin function halide_set_custom_do_par_for
	.p2align	2
	.type	halide_set_custom_do_par_for,@function
halide_set_custom_do_par_for:           // @halide_set_custom_do_par_for
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal17custom_do_par_forE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal17custom_do_par_forE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end64:
	.size	halide_set_custom_do_par_for, .Lfunc_end64-halide_set_custom_do_par_for
                                        // -- End function
	.section	.text.halide_set_custom_parallel_runtime,"ax",@progbits
	.weak	halide_set_custom_parallel_runtime // -- Begin function halide_set_custom_parallel_runtime
	.p2align	2
	.type	halide_set_custom_parallel_runtime,@function
halide_set_custom_parallel_runtime:     // @halide_set_custom_parallel_runtime
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17custom_do_par_forE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17custom_do_par_forE]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	adrp	x10, :got:_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	adrp	x11, :got:_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	str	x0, [x8]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal14custom_do_taskE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal14custom_do_taskE]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19custom_do_loop_taskE]
	str	x1, [x8]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal21custom_semaphore_initE]
	str	x2, [x9]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE]
	ldr	x11, [x11, :got_lo12:_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE]
	str	x3, [x8]
	str	x4, [x10]
	str	x5, [x9]
	str	x6, [x11]
	ret
.Lfunc_end65:
	.size	halide_set_custom_parallel_runtime, .Lfunc_end65-halide_set_custom_parallel_runtime
                                        // -- End function
	.section	.text.halide_do_par_for,"ax",@progbits
	.weak	halide_do_par_for       // -- Begin function halide_do_par_for
	.p2align	2
	.type	halide_do_par_for,@function
halide_do_par_for:                      // @halide_do_par_for
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17custom_do_par_forE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17custom_do_par_forE]
	ldr	x5, [x8]
	br	x5
.Lfunc_end66:
	.size	halide_do_par_for, .Lfunc_end66-halide_do_par_for
                                        // -- End function
	.section	.text.halide_do_parallel_tasks,"ax",@progbits
	.weak	halide_do_parallel_tasks // -- Begin function halide_do_parallel_tasks
	.p2align	2
	.type	halide_do_parallel_tasks,@function
halide_do_parallel_tasks:               // @halide_do_parallel_tasks
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE]
	ldr	x4, [x8]
	br	x4
.Lfunc_end67:
	.size	halide_do_parallel_tasks, .Lfunc_end67-halide_do_parallel_tasks
                                        // -- End function
	.section	.text.halide_semaphore_init,"ax",@progbits
	.weak	halide_semaphore_init   // -- Begin function halide_semaphore_init
	.p2align	2
	.type	halide_semaphore_init,@function
halide_semaphore_init:                  // @halide_semaphore_init
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal21custom_semaphore_initE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end68:
	.size	halide_semaphore_init, .Lfunc_end68-halide_semaphore_init
                                        // -- End function
	.section	.text.halide_semaphore_release,"ax",@progbits
	.weak	halide_semaphore_release // -- Begin function halide_semaphore_release
	.p2align	2
	.type	halide_semaphore_release,@function
halide_semaphore_release:               // @halide_semaphore_release
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end69:
	.size	halide_semaphore_release, .Lfunc_end69-halide_semaphore_release
                                        // -- End function
	.section	.text.halide_semaphore_try_acquire,"ax",@progbits
	.weak	halide_semaphore_try_acquire // -- Begin function halide_semaphore_try_acquire
	.p2align	2
	.type	halide_semaphore_try_acquire,@function
halide_semaphore_try_acquire:           // @halide_semaphore_try_acquire
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end70:
	.size	halide_semaphore_try_acquire, .Lfunc_end70-halide_semaphore_try_acquire
                                        // -- End function
	.section	.text.halide_default_get_symbol,"ax",@progbits
	.weak	halide_default_get_symbol // -- Begin function halide_default_get_symbol
	.p2align	2
	.type	halide_default_get_symbol,@function
halide_default_get_symbol:              // @halide_default_get_symbol
// %bb.0:                               // %entry
	mov	x1, x0
	mov	x0, xzr
	b	dlsym
.Lfunc_end71:
	.size	halide_default_get_symbol, .Lfunc_end71-halide_default_get_symbol
                                        // -- End function
	.section	.text.halide_default_load_library,"ax",@progbits
	.weak	halide_default_load_library // -- Begin function halide_default_load_library
	.p2align	2
	.type	halide_default_load_library,@function
halide_default_load_library:            // @halide_default_load_library
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	mov	w1, #1
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	bl	dlopen
	mov	x19, x0
	cbz	x0, .LBB72_2
// %bb.1:                               // %if.end
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x19
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.LBB72_2:                               // %if.then
	bl	dlerror
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x19
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end72:
	.size	halide_default_load_library, .Lfunc_end72-halide_default_load_library
                                        // -- End function
	.section	.text.halide_default_get_library_symbol,"ax",@progbits
	.weak	halide_default_get_library_symbol // -- Begin function halide_default_get_library_symbol
	.p2align	2
	.type	halide_default_get_library_symbol,@function
halide_default_get_library_symbol:      // @halide_default_get_library_symbol
// %bb.0:                               // %entry
	b	dlsym
.Lfunc_end73:
	.size	halide_default_get_library_symbol, .Lfunc_end73-halide_default_get_library_symbol
                                        // -- End function
	.section	.text.halide_set_custom_get_symbol,"ax",@progbits
	.weak	halide_set_custom_get_symbol // -- Begin function halide_set_custom_get_symbol
	.p2align	2
	.type	halide_set_custom_get_symbol,@function
halide_set_custom_get_symbol:           // @halide_set_custom_get_symbol
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal17custom_get_symbolE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal17custom_get_symbolE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end74:
	.size	halide_set_custom_get_symbol, .Lfunc_end74-halide_set_custom_get_symbol
                                        // -- End function
	.section	.text.halide_set_custom_load_library,"ax",@progbits
	.weak	halide_set_custom_load_library // -- Begin function halide_set_custom_load_library
	.p2align	2
	.type	halide_set_custom_load_library,@function
halide_set_custom_load_library:         // @halide_set_custom_load_library
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19custom_load_libraryE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19custom_load_libraryE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end75:
	.size	halide_set_custom_load_library, .Lfunc_end75-halide_set_custom_load_library
                                        // -- End function
	.section	.text.halide_set_custom_get_library_symbol,"ax",@progbits
	.weak	halide_set_custom_get_library_symbol // -- Begin function halide_set_custom_get_library_symbol
	.p2align	2
	.type	halide_set_custom_get_library_symbol,@function
halide_set_custom_get_library_symbol:   // @halide_set_custom_get_library_symbol
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal25custom_get_library_symbolE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end76:
	.size	halide_set_custom_get_library_symbol, .Lfunc_end76-halide_set_custom_get_library_symbol
                                        // -- End function
	.section	.text.halide_get_symbol,"ax",@progbits
	.weak	halide_get_symbol       // -- Begin function halide_get_symbol
	.p2align	2
	.type	halide_get_symbol,@function
halide_get_symbol:                      // @halide_get_symbol
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17custom_get_symbolE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17custom_get_symbolE]
	ldr	x1, [x8]
	br	x1
.Lfunc_end77:
	.size	halide_get_symbol, .Lfunc_end77-halide_get_symbol
                                        // -- End function
	.section	.text.halide_load_library,"ax",@progbits
	.weak	halide_load_library     // -- Begin function halide_load_library
	.p2align	2
	.type	halide_load_library,@function
halide_load_library:                    // @halide_load_library
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal19custom_load_libraryE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal19custom_load_libraryE]
	ldr	x1, [x8]
	br	x1
.Lfunc_end78:
	.size	halide_load_library, .Lfunc_end78-halide_load_library
                                        // -- End function
	.section	.text.halide_get_library_symbol,"ax",@progbits
	.weak	halide_get_library_symbol // -- Begin function halide_get_library_symbol
	.p2align	2
	.type	halide_get_library_symbol,@function
halide_get_library_symbol:              // @halide_get_library_symbol
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal25custom_get_library_symbolE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end79:
	.size	halide_get_library_symbol, .Lfunc_end79-halide_get_library_symbol
                                        // -- End function
	.section	.text.halide_set_gpu_device,"ax",@progbits
	.weak	halide_set_gpu_device   // -- Begin function halide_set_gpu_device
	.p2align	2
	.type	halide_set_gpu_device,@function
halide_set_gpu_device:                  // @halide_set_gpu_device
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	adrp	x9, :got:_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17halide_gpu_deviceE]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE]
	mov	w10, #1
	str	w0, [x8]
	strb	w10, [x9]
	ret
.Lfunc_end80:
	.size	halide_set_gpu_device, .Lfunc_end80-halide_set_gpu_device
                                        // -- End function
	.section	.text.halide_get_gpu_device,"ax",@progbits
	.weak	halide_get_gpu_device   // -- Begin function halide_get_gpu_device
	.p2align	2
	.type	halide_get_gpu_device,@function
halide_get_gpu_device:                  // @halide_get_gpu_device
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x19, :got:_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE]
	mov	w8, #1
	add	x29, sp, #16            // =16
.LBB81_1:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w9, [x19]
	stlxr	w10, w8, [x19]
	orr	w9, w10, w9
	cbnz	w9, .LBB81_1
// %bb.2:                               // %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit
	adrp	x20, :got:_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE]
	ldrb	w8, [x20]
	cbz	w8, .LBB81_4
// %bb.3:                               // %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit.if.end4_crit_edge
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17halide_gpu_deviceE]
	ldr	w0, [x8]
	stlr	wzr, [x19]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB81_4:                               // %if.then
	adrp	x0, .L.str.10
	add	x0, x0, :lo12:.L.str.10
	bl	getenv
	cbz	x0, .LBB81_6
// %bb.5:                               // %if.then2
	bl	atoi
	b	.LBB81_7
.LBB81_6:
	mov	w0, #-1
.LBB81_7:                               // %if.end
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17halide_gpu_deviceE]
	mov	w9, #1
	strb	w9, [x20]
	str	w0, [x8]
	stlr	wzr, [x19]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end81:
	.size	halide_get_gpu_device, .Lfunc_end81-halide_get_gpu_device
                                        // -- End function
	.section	.text.halide_default_trace,"ax",@progbits
	.weak	halide_default_trace    // -- Begin function halide_default_trace
	.p2align	2
	.type	halide_default_trace,@function
halide_default_trace:                   // @halide_default_trace
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	sub	sp, sp, #1, lsl #12     // =4096
	sub	sp, sp, #48             // =48
	adrp	x8, _ZZ20halide_default_traceE3ids
	mov	x21, x1
	add	x8, x8, :lo12:_ZZ20halide_default_traceE3ids
	str	x0, [sp, #32]           // 8-byte Folded Spill
.LBB82_1:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w19, [x8]
	add	w9, w19, #1             // =1
	stlxr	w10, w9, [x8]
	cbnz	w10, .LBB82_1
// %bb.2:                               // %atomicrmw.end
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	bl	halide_get_trace_file
	cmp	w0, #1                  // =1
	str	w0, [sp, #28]           // 4-byte Folded Spill
	b.lt	.LBB82_5
// %bb.3:                               // %if.then
	ldrb	w8, [x21, #33]
	ldrh	w9, [x21, #34]
	ldr	w10, [x21, #48]
	ldr	x0, [x21]
	add	x8, x8, #7              // =7
	lsr	x8, x8, #3
	mul	x22, x8, x9
	lsl	w23, w10, #2
	bl	strlen
	ldr	x8, [x21, #24]
	add	w20, w0, #1             // =1
	cbz	x8, .LBB82_56
// %bb.4:                               // %cond.true
	mov	x0, x8
	bl	strlen
	add	w10, w0, #1             // =1
	b	.LBB82_57
.LBB82_5:                               // %if.else
	add	x8, sp, #40             // =40
	strb	wzr, [x8, #4095]
	ldrb	w8, [x21, #33]
	add	x9, sp, #40             // =40
	add	x22, x9, #4095          // =4095
	mov	w9, #8
.LBB82_6:                               // %while.cond
                                        // =>This Inner Loop Header: Depth=1
	mov	w26, w9
	cmp	w9, w8
	lsl	w9, w9, #1
	b.lt	.LBB82_6
// %bb.7:                               // %while.end
	cmp	w26, #65                // =65
	b.lt	.LBB82_9
// %bb.8:                               // %if.then63
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	adrp	x1, .L.str.2.13
	add	x1, x1, :lo12:.L.str.2.13
	bl	halide_print
	bl	abort
.LBB82_9:                               // %if.end64
	ldr	w20, [x21, #36]
	adrp	x8, .L__const.halide_default_trace.event_types
	add	x8, x8, :lo12:.L__const.halide_default_trace.event_types
	add	x0, sp, #40             // =40
	ldr	x2, [x8, x20, lsl #3]
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.71.224
	add	x2, x2, :lo12:.L.str.71.224
	mov	x1, x22
	bl	halide_string_to_string
	ldr	x2, [x21]
	cbnz	x2, .LBB82_11
// %bb.10:                              // %if.then.i462
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
.LBB82_11:                              // %if.else.i464
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.30.144
	add	x2, x2, :lo12:.L.str.30.144
	mov	x1, x22
	bl	halide_string_to_string
	ldrsw	x2, [x21, #44]
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.22.191
	add	x2, x2, :lo12:.L.str.22.191
	mov	x1, x22
	bl	halide_string_to_string
	ldrh	w8, [x21, #34]
	cmp	w8, #2                  // =2
	b.lo	.LBB82_13
// %bb.12:                              // %if.then80
	adrp	x2, .L.str.17
	add	x2, x2, :lo12:.L.str.17
	mov	x1, x22
	bl	halide_string_to_string
.LBB82_13:                              // %if.end82
	ldr	w8, [x21, #48]
	cmp	w8, #1                  // =1
	b.lt	.LBB82_22
// %bb.14:                              // %for.body.lr.ph
	adrp	x24, .L.str.18
	adrp	x25, .L.str.55
	mov	x23, xzr
	add	x24, x24, :lo12:.L.str.18
	add	x25, x25, :lo12:.L.str.55
	cbnz	x23, .LBB82_19
	b	.LBB82_17
.LBB82_15:                              // %if.else97.split
	mov	x2, x25
.LBB82_16:                              // %if.end100.sink.split
	mov	x1, x22
	bl	halide_string_to_string
.LBB82_17:                              // %if.end100
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x21, #16]
	mov	w3, #1
	mov	x1, x22
	ldrsw	x2, [x8, x23, lsl #2]
	bl	halide_int64_to_string
	ldrsw	x8, [x21, #48]
	add	x23, x23, #1            // =1
	cmp	x23, x8
	b.ge	.LBB82_22
// %bb.18:                              // %for.body
                                        //   in Loop: Header=BB82_17 Depth=1
	cbz	x23, .LBB82_17
.LBB82_19:                              // %if.then86
	ldrh	w8, [x21, #34]
	cmp	w8, #2                  // =2
	b.lo	.LBB82_15
// %bb.20:                              // %land.lhs.true
	udiv	w9, w23, w8
	msub	w8, w9, w8, w23
	cbnz	w8, .LBB82_15
// %bb.21:
	mov	x2, x24
	b	.LBB82_16
.LBB82_22:                              // %for.cond.cleanup
	ldrh	w8, [x21, #34]
	adrp	x9, .L.str.5.170
	adrp	x10, .L.str.20
	add	x9, x9, :lo12:.L.str.5.170
	add	x10, x10, :lo12:.L.str.20
	cmp	w8, #1                  // =1
	csel	x2, x10, x9, hi
	mov	x1, x22
	bl	halide_string_to_string
	cmp	w20, #1                 // =1
	mov	x23, x0
	b.gt	.LBB82_102
// %bb.23:                              // %if.then115
	ldrh	w8, [x21, #34]
	adrp	x9, .L.str.23
	adrp	x10, .L.str.22
	add	x9, x9, :lo12:.L.str.23
	add	x10, x10, :lo12:.L.str.22
	cmp	w8, #1                  // =1
	csel	x2, x10, x9, hi
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	ldrh	w8, [x21, #34]
	mov	x23, x0
	cbz	w8, .LBB82_102
// %bb.24:                              // %for.body132.lr.ph
	adrp	x27, .LJTI82_0
	adrp	x24, .L.str.24
	adrp	x25, .L.str.55
	mov	x20, xzr
	add	x27, x27, :lo12:.LJTI82_0
	add	x24, x24, :lo12:.L.str.24
	add	x25, x25, :lo12:.L.str.55
	cbnz	x20, .LBB82_30
	b	.LBB82_31
.LBB82_25:                              // %if.then186
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	ldrh	w2, [x8, x20, lsl #1]
.LBB82_26:                              // %for.inc250
                                        //   in Loop: Header=BB82_31 Depth=1
	mov	w3, #1
	mov	x0, x23
	mov	x1, x22
	bl	halide_int64_to_string
.LBB82_27:                              // %for.inc250
                                        //   in Loop: Header=BB82_31 Depth=1
	mov	x23, x0
.LBB82_28:                              // %for.inc250
                                        //   in Loop: Header=BB82_31 Depth=1
	ldrh	w8, [x21, #34]
	add	x20, x20, #1            // =1
	cmp	x20, x8
	b.hs	.LBB82_100
// %bb.29:                              // %for.body132
                                        //   in Loop: Header=BB82_31 Depth=1
	cbz	x20, .LBB82_31
.LBB82_30:                              // %if.then134
	mov	x0, x23
	mov	x1, x22
	mov	x2, x25
	bl	halide_string_to_string
	mov	x23, x0
.LBB82_31:                              // %if.end136
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w8, [x21, #32]
	cmp	w8, #3                  // =3
	b.hi	.LBB82_28
// %bb.32:                              // %if.end136
                                        //   in Loop: Header=BB82_31 Depth=1
	adr	x9, .LBB82_33
	ldrb	w10, [x27, x8]
	add	x9, x9, x10, lsl #2
	br	x9
.LBB82_33:                              // %if.then140
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w26, #16                // =16
	b.eq	.LBB82_44
// %bb.34:                              // %if.then140
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w26, #8                 // =8
	b.ne	.LBB82_45
// %bb.35:                              // %if.then142
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	ldrsb	x2, [x8, x20]
	b	.LBB82_26
.LBB82_36:                              // %if.then176
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w26, #16                // =16
	b.eq	.LBB82_25
// %bb.37:                              // %if.then176
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w26, #8                 // =8
	b.ne	.LBB82_47
// %bb.38:                              // %if.then178
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	ldrb	w2, [x8, x20]
	b	.LBB82_26
.LBB82_39:                              // %if.then212
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w26, #15                // =15
	b.le	.LBB82_43
// %bb.40:                              // %if.end215
                                        //   in Loop: Header=BB82_31 Depth=1
	cmp	w26, #32                // =32
	b.ne	.LBB82_49
// %bb.41:                              // %if.then217
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	mov	x0, x23
	mov	x1, x22
	mov	w2, wzr
	ldr	s0, [x8, x20, lsl #2]
	fcvt	d0, s0
	bl	halide_double_to_string
	b	.LBB82_27
.LBB82_42:                              // %if.then241
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	mov	x0, x23
	mov	x1, x22
	ldr	x2, [x8, x20, lsl #3]
	bl	halide_pointer_to_string
	b	.LBB82_27
.LBB82_43:                              // %if.else222.thread
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	mov	x1, x24
	bl	halide_print
	bl	abort
	ldr	x8, [x21, #8]
	b	.LBB82_51
.LBB82_44:                              // %if.then150
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	ldrsh	x2, [x8, x20, lsl #1]
	b	.LBB82_26
.LBB82_45:                              // %if.else156
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	cmp	w26, #32                // =32
	b.ne	.LBB82_53
// %bb.46:                              // %if.then158
                                        //   in Loop: Header=BB82_31 Depth=1
	ldrsw	x2, [x8, x20, lsl #2]
	b	.LBB82_26
.LBB82_47:                              // %if.else192
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	cmp	w26, #32                // =32
	b.ne	.LBB82_54
// %bb.48:                              // %if.then194
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	w2, [x8, x20, lsl #2]
	b	.LBB82_55
.LBB82_49:                              // %if.else222
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x8, [x21, #8]
	cmp	w26, #16                // =16
	b.ne	.LBB82_51
// %bb.50:                              // %if.then224
                                        //   in Loop: Header=BB82_31 Depth=1
	ldrh	w0, [x8, x20, lsl #1]
	bl	halide_float16_bits_to_double
	b	.LBB82_52
.LBB82_51:                              // %if.else229
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	d0, [x8, x20, lsl #3]
.LBB82_52:                              // %for.inc250
                                        //   in Loop: Header=BB82_31 Depth=1
	mov	w2, #1
	mov	x0, x23
	mov	x1, x22
	bl	halide_double_to_string
	b	.LBB82_27
.LBB82_53:                              // %if.else163
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x2, [x8, x20, lsl #3]
	b	.LBB82_26
.LBB82_54:                              // %if.else199
                                        //   in Loop: Header=BB82_31 Depth=1
	ldr	x2, [x8, x20, lsl #3]
.LBB82_55:                              // %for.inc250
                                        //   in Loop: Header=BB82_31 Depth=1
	mov	w3, #1
	mov	x0, x23
	mov	x1, x22
	bl	halide_uint64_to_string
	b	.LBB82_27
.LBB82_56:
	mov	w10, #1
.LBB82_57:                              // %cond.end
	str	x22, [sp, #8]           // 8-byte Folded Spill
	str	w23, [sp, #4]           // 4-byte Folded Spill
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19halide_trace_bufferE]
	add	w8, w23, w22
	add	w8, w8, w20
	add	w8, w8, w10
	ldr	x23, [x9]
	add	w8, w8, #31             // =31
	and	w28, w8, #0xfffffffc
	stp	w20, w10, [sp, #20]     // 8-byte Folded Spill
	add	x20, x23, #4            // =4
	add	x22, x23, #8            // =8
	cmp	w28, #256, lsl #12      // =1048576
	add	x24, x23, #12           // =12
	b.hi	.LBB82_77
// %bb.58:                              // %while.body.i.i.us.i.preheader
	mov	w27, #1073741824
	mov	w25, #-2147483648
	b	.LBB82_60
.LBB82_59:                              // %cmpxchg.nostore
                                        //   in Loop: Header=BB82_60 Depth=1
	clrex
.LBB82_60:                              // %while.body.i.i.us.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB82_61 Depth 2
                                        //     Child Loop BB82_63 Depth 2
                                        //     Child Loop BB82_65 Depth 2
                                        //     Child Loop BB82_66 Depth 2
                                        //     Child Loop BB82_68 Depth 2
                                        //       Child Loop BB82_69 Depth 3
                                        //     Child Loop BB82_73 Depth 2
                                        //     Child Loop BB82_76 Depth 2
	ldr	w8, [x23]
	and	x8, x8, #0x3fffffff
	add	x9, x8, #1              // =1
.LBB82_61:                              // %cmpxchg.start
                                        //   Parent Loop BB82_60 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w10, [x23]
	cmp	w10, w8
	b.ne	.LBB82_59
// %bb.62:                              // %cmpxchg.trystore
                                        //   in Loop: Header=BB82_61 Depth=2
	stlxr	w10, w9, [x23]
	cbnz	w10, .LBB82_61
.LBB82_63:                              // %atomicrmw.start2
                                        //   Parent Loop BB82_60 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x20]
	add	w9, w8, w28
	stlxr	w10, w9, [x20]
	cbnz	w10, .LBB82_63
// %bb.64:                              // %atomicrmw.end1
                                        //   in Loop: Header=BB82_60 Depth=1
	cmp	w9, #256, lsl #12       // =1048576
	b.ls	.LBB82_97
.LBB82_65:                              // %atomicrmw.start6
                                        //   Parent Loop BB82_60 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x22]
	add	w8, w8, w28
	stlxr	w9, w8, [x22]
	cbnz	w9, .LBB82_65
.LBB82_66:                              // %atomicrmw.start10
                                        //   Parent Loop BB82_60 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x23]
	sub	w8, w8, #1              // =1
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_66
	b	.LBB82_68
.LBB82_67:                              // %cmpxchg.nostore19
                                        //   in Loop: Header=BB82_68 Depth=2
	clrex
.LBB82_68:                              // %atomicrmw.start14
                                        //   Parent Loop BB82_60 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB82_69 Depth 3
	ldaxr	w8, [x23]
	orr	w8, w8, #0x40000000
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_68
.LBB82_69:                              // %cmpxchg.start24
                                        //   Parent Loop BB82_60 Depth=1
                                        //     Parent Loop BB82_68 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldaxr	w8, [x23]
	cmp	w8, w27
	b.ne	.LBB82_67
// %bb.70:                              // %cmpxchg.trystore22
                                        //   in Loop: Header=BB82_69 Depth=3
	stlxr	w8, w25, [x23]
	cbnz	w8, .LBB82_69
// %bb.71:                              // %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.us.i
                                        //   in Loop: Header=BB82_60 Depth=1
	ldr	w8, [x20]
	cbz	w8, .LBB82_76
// %bb.72:                              // %if.then.i9.us.i
                                        //   in Loop: Header=BB82_60 Depth=1
	ldr	w9, [x22]
	ldr	w0, [sp, #28]           // 4-byte Folded Reload
	mov	x1, x24
	sub	w26, w8, w9
	mov	x2, x26
	str	w26, [x20]
	bl	write
	str	xzr, [x20]
.LBB82_73:                              // %atomicrmw.start28
                                        //   Parent Loop BB82_60 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x23]
	and	w8, w8, #0x7fffffff
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_73
// %bb.74:                              // %atomicrmw.end27
                                        //   in Loop: Header=BB82_60 Depth=1
	cmp	w26, w0
	b.eq	.LBB82_60
// %bb.75:                              // %if.then10.i.us.i
                                        //   in Loop: Header=BB82_60 Depth=1
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	adrp	x1, .L.str.32
	add	x1, x1, :lo12:.L.str.32
	bl	halide_print
	bl	abort
	b	.LBB82_60
.LBB82_76:                              // %atomicrmw.start32
                                        //   Parent Loop BB82_60 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x23]
	and	w8, w8, #0x7fffffff
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_76
	b	.LBB82_60
.LBB82_77:
	mov	w26, #1073741824
	mov	w25, #-2147483648
	b	.LBB82_79
.LBB82_78:                              // %cmpxchg.nostore37
                                        //   in Loop: Header=BB82_79 Depth=1
	clrex
.LBB82_79:                              // %while.body.i.i.i
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB82_80 Depth 2
                                        //     Child Loop BB82_83 Depth 2
                                        //     Child Loop BB82_85 Depth 2
                                        //     Child Loop BB82_86 Depth 2
                                        //     Child Loop BB82_88 Depth 2
                                        //       Child Loop BB82_89 Depth 3
                                        //     Child Loop BB82_93 Depth 2
                                        //     Child Loop BB82_96 Depth 2
	ldr	w8, [x23]
	and	x8, x8, #0x3fffffff
	add	x9, x8, #1              // =1
.LBB82_80:                              // %cmpxchg.start42
                                        //   Parent Loop BB82_79 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w10, [x23]
	cmp	w10, w8
	b.ne	.LBB82_78
// %bb.81:                              // %cmpxchg.trystore40
                                        //   in Loop: Header=BB82_80 Depth=2
	stlxr	w10, w9, [x23]
	cbnz	w10, .LBB82_80
// %bb.82:                              // %if.then.i.i
                                        //   in Loop: Header=BB82_79 Depth=1
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	adrp	x1, .L.str.31
	add	x1, x1, :lo12:.L.str.31
	bl	halide_print
	bl	abort
.LBB82_83:                              // %atomicrmw.start46
                                        //   Parent Loop BB82_79 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x20]
	add	w9, w8, w28
	stlxr	w10, w9, [x20]
	cbnz	w10, .LBB82_83
// %bb.84:                              // %atomicrmw.end45
                                        //   in Loop: Header=BB82_79 Depth=1
	cmp	w9, #256, lsl #12       // =1048576
	b.ls	.LBB82_97
.LBB82_85:                              // %atomicrmw.start50
                                        //   Parent Loop BB82_79 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x22]
	add	w8, w8, w28
	stlxr	w9, w8, [x22]
	cbnz	w9, .LBB82_85
.LBB82_86:                              // %atomicrmw.start54
                                        //   Parent Loop BB82_79 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x23]
	sub	w8, w8, #1              // =1
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_86
	b	.LBB82_88
.LBB82_87:                              // %cmpxchg.nostore63
                                        //   in Loop: Header=BB82_88 Depth=2
	clrex
.LBB82_88:                              // %atomicrmw.start58
                                        //   Parent Loop BB82_79 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB82_89 Depth 3
	ldaxr	w8, [x23]
	orr	w8, w8, #0x40000000
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_88
.LBB82_89:                              // %cmpxchg.start68
                                        //   Parent Loop BB82_79 Depth=1
                                        //     Parent Loop BB82_88 Depth=2
                                        // =>    This Inner Loop Header: Depth=3
	ldaxr	w8, [x23]
	cmp	w8, w26
	b.ne	.LBB82_87
// %bb.90:                              // %cmpxchg.trystore66
                                        //   in Loop: Header=BB82_89 Depth=3
	stlxr	w8, w25, [x23]
	cbnz	w8, .LBB82_89
// %bb.91:                              // %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i.i
                                        //   in Loop: Header=BB82_79 Depth=1
	ldr	w8, [x20]
	cbz	w8, .LBB82_96
// %bb.92:                              // %if.then.i9.i
                                        //   in Loop: Header=BB82_79 Depth=1
	ldr	w9, [x22]
	ldr	w0, [sp, #28]           // 4-byte Folded Reload
	mov	x1, x24
	sub	w27, w8, w9
	mov	x2, x27
	str	w27, [x20]
	bl	write
	str	xzr, [x20]
.LBB82_93:                              // %atomicrmw.start72
                                        //   Parent Loop BB82_79 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x23]
	and	w8, w8, #0x7fffffff
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_93
// %bb.94:                              // %atomicrmw.end71
                                        //   in Loop: Header=BB82_79 Depth=1
	cmp	w27, w0
	b.eq	.LBB82_79
// %bb.95:                              // %if.then10.i.i
                                        //   in Loop: Header=BB82_79 Depth=1
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	adrp	x1, .L.str.32
	add	x1, x1, :lo12:.L.str.32
	bl	halide_print
	bl	abort
	b	.LBB82_79
.LBB82_96:                              // %atomicrmw.start76
                                        //   Parent Loop BB82_79 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w8, [x23]
	and	w8, w8, #0x7fffffff
	stlxr	w9, w8, [x23]
	cbnz	w9, .LBB82_96
	b	.LBB82_79
.LBB82_97:                              // %_ZN6Halide7Runtime8Internal11TraceBuffer14acquire_packetEPvij.exit
	ldr	x22, [sp, #8]           // 8-byte Folded Reload
	add	x8, x23, w8, uxtw
	cmp	w28, #1, lsl #12        // =4096
	add	x20, x8, #12            // =12
	b.ls	.LBB82_112
// %bb.98:                              // %if.then17
	mov	w1, #1024
	mov	x0, xzr
	bl	halide_malloc
	cbz	x0, .LBB82_110
// %bb.99:                              // %if.else.i416
	add	x25, x0, #1023          // =1023
	mov	w2, w28
	mov	w3, #1
	mov	x1, x25
	mov	x24, x0
	strb	wzr, [x0, #1023]
	bl	halide_uint64_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x25
	bl	halide_string_to_string
	sub	x8, x0, x24
	add	x2, x8, #1              // =1
	mov	x0, xzr
	mov	x1, x24
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, xzr
	mov	x1, x24
	bl	halide_print
	mov	x0, xzr
	mov	x1, x24
	b	.LBB82_111
.LBB82_100:                             // %for.cond.cleanup131
	cmp	w8, #1                  // =1
	b.ls	.LBB82_102
// %bb.101:                             // %if.then257
	adrp	x2, .L.str.25
	add	x2, x2, :lo12:.L.str.25
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	mov	x23, x0
.LBB82_102:                             // %if.end260
	ldr	x8, [x21, #24]
	cbz	x8, .LBB82_107
// %bb.103:                             // %land.lhs.true263
	ldrb	w8, [x8]
	cbz	w8, .LBB82_107
// %bb.104:                             // %if.then266
	adrp	x2, .L.str.26
	add	x2, x2, :lo12:.L.str.26
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	ldr	x2, [x21, #24]
	cbnz	x2, .LBB82_106
// %bb.105:                             // %if.then.i595
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
.LBB82_106:                             // %if.else.i597
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.27
	add	x2, x2, :lo12:.L.str.27
	mov	x1, x22
	bl	halide_string_to_string
	mov	x23, x0
.LBB82_107:                             // %if.end271
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	add	x8, sp, #40             // =40
	sub	x8, x0, x8
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	add	x21, x8, #1             // =1
	add	x1, sp, #40             // =40
	mov	x2, x21
	bl	halide_msan_annotate_memory_is_initialized
	adrp	x20, :got:_ZN6Halide7Runtime8Internal22halide_trace_file_lockE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal22halide_trace_file_lockE]
	mov	w8, #1
.LBB82_108:                             // %atomicrmw.start106
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w9, [x20]
	stlxr	w10, w8, [x20]
	orr	w9, w10, w9
	cbnz	w9, .LBB82_108
// %bb.109:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy4096EED2Ev.exit
	ldr	x22, [sp, #32]          // 8-byte Folded Reload
	add	x1, sp, #40             // =40
	mov	x0, x22
	bl	halide_print
	add	x1, sp, #40             // =40
	mov	x0, x22
	mov	x2, x21
	stlr	wzr, [x20]
	bl	halide_msan_annotate_memory_is_initialized
	b	.LBB82_132
.LBB82_110:                             // %if.then.i410
	mov	w2, w28
	mov	w3, #1
	mov	x1, xzr
	bl	halide_uint64_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, xzr
	bl	halide_error
	mov	x0, xzr
	mov	x1, xzr
.LBB82_111:                             // %if.end
	bl	halide_free
.LBB82_112:                             // %if.end
	stp	w28, w19, [x20]
	ldr	w8, [x21, #32]
	str	w8, [x20, #8]
	ldur	q0, [x21, #36]
	stur	q0, [x20, #12]
	ldr	x1, [x21, #16]
	cbz	x1, .LBB82_114
// %bb.113:                             // %if.then28
	ldr	w8, [sp, #4]            // 4-byte Folded Reload
	add	x0, x20, #28            // =28
	mov	w2, w8
	bl	memcpy
.LBB82_114:                             // %if.end33
	ldr	x1, [x21, #8]
	cbz	x1, .LBB82_116
// %bb.115:                             // %if.then35
	ldrsw	x8, [x20, #24]
	mov	x2, x22
	add	x8, x20, x8, lsl #2
	add	x0, x8, #28             // =28
	bl	memcpy
.LBB82_116:                             // %if.end40
	ldrb	w9, [x20, #9]
	ldrsw	x8, [x20, #24]
	ldrh	w10, [x20, #10]
	add	x22, x20, #28           // =28
	add	x9, x9, #7              // =7
	add	x8, x22, x8, lsl #2
	lsr	x9, x9, #3
	madd	x0, x9, x10, x8
	ldr	w8, [sp, #20]           // 4-byte Folded Reload
	ldr	x1, [x21]
	mov	w2, w8
	bl	memcpy
	ldrb	w9, [x20, #9]
	ldrsw	x8, [x20, #24]
	ldrh	w10, [x20, #10]
	add	x9, x9, #7              // =7
	add	x8, x22, x8, lsl #2
	lsr	x9, x9, #3
	madd	x0, x9, x10, x8
.LBB82_117:                             // %while.cond.i432
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w8, [x0], #1
	cbnz	w8, .LBB82_117
// %bb.118:                             // %_ZN21halide_trace_packet_t9trace_tagEv.exit
	ldr	x8, [x21, #24]
	adrp	x9, .L.str.165
	add	x9, x9, :lo12:.L.str.165
	cmp	x8, #0                  // =0
	csel	x1, x9, x8, eq
	ldr	w8, [sp, #24]           // 4-byte Folded Reload
	mov	w2, w8
	bl	memcpy
	adrp	x11, :got:_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	ldr	x11, [x11, :got_lo12:_ZN6Halide7Runtime8Internal19halide_trace_bufferE]
	ldr	x8, [x11]
	dmb	ish
.LBB82_119:                             // %atomicrmw.start80
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w9, [x8]
	sub	w9, w9, #1              // =1
	stlxr	w10, w9, [x8]
	cbnz	w10, .LBB82_119
// %bb.120:                             // %atomicrmw.end79
	ldr	w8, [x21, #36]
	cmp	w8, #9                  // =9
	b.ne	.LBB82_132
// %bb.121:                             // %if.then57
	ldr	x20, [x11]
	mov	w8, #1073741824
	mov	w9, #-2147483648
	b	.LBB82_123
.LBB82_122:                             // %cmpxchg.nostore89
                                        //   in Loop: Header=BB82_123 Depth=1
	clrex
.LBB82_123:                             // %atomicrmw.start84
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB82_124 Depth 2
	ldaxr	w10, [x20]
	orr	w10, w10, #0x40000000
	stlxr	w11, w10, [x20]
	cbnz	w11, .LBB82_123
.LBB82_124:                             // %cmpxchg.start94
                                        //   Parent Loop BB82_123 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldaxr	w10, [x20]
	cmp	w10, w8
	b.ne	.LBB82_122
// %bb.125:                             // %cmpxchg.trystore92
                                        //   in Loop: Header=BB82_124 Depth=2
	stlxr	w10, w9, [x20]
	cbnz	w10, .LBB82_124
// %bb.126:                             // %_ZN6Halide7Runtime8Internal23SharedExclusiveSpinLock17acquire_exclusiveEv.exit.i
	ldr	w8, [x20, #4]
	cbz	w8, .LBB82_131
// %bb.127:                             // %if.then.i437
	ldr	w9, [x20, #8]
	ldr	w0, [sp, #28]           // 4-byte Folded Reload
	add	x1, x20, #12            // =12
	sub	w21, w8, w9
	mov	x2, x21
	str	w21, [x20, #4]
	bl	write
	stp	wzr, wzr, [x20, #4]
.LBB82_128:                             // %atomicrmw.start98
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w8, [x20]
	and	w8, w8, #0x7fffffff
	stlxr	w9, w8, [x20]
	cbnz	w9, .LBB82_128
// %bb.129:                             // %atomicrmw.end97
	cmp	w21, w0
	b.eq	.LBB82_132
// %bb.130:                             // %if.then10.i
	ldr	x0, [sp, #32]           // 8-byte Folded Reload
	adrp	x1, .L.str.32
	add	x1, x1, :lo12:.L.str.32
	bl	halide_print
	bl	abort
	b	.LBB82_132
.LBB82_131:                             // %atomicrmw.start102
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w8, [x20]
	and	w8, w8, #0x7fffffff
	stlxr	w9, w8, [x20]
	cbnz	w9, .LBB82_131
.LBB82_132:                             // %if.end274
	mov	w0, w19
	add	sp, sp, #1, lsl #12     // =4096
	add	sp, sp, #48             // =48
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end82:
	.size	halide_default_trace, .Lfunc_end82-halide_default_trace
	.section	.rodata.halide_default_trace,"a",@progbits
.LJTI82_0:
	.byte	(.LBB82_33-.LBB82_33)>>2
	.byte	(.LBB82_36-.LBB82_33)>>2
	.byte	(.LBB82_39-.LBB82_33)>>2
	.byte	(.LBB82_42-.LBB82_33)>>2
                                        // -- End function
	.section	.text.halide_get_trace_file,"ax",@progbits
	.weak	halide_get_trace_file   // -- Begin function halide_get_trace_file
	.p2align	2
	.type	halide_get_trace_file,@function
halide_get_trace_file:                  // @halide_get_trace_file
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	adrp	x21, :got:_ZN6Halide7Runtime8Internal22halide_trace_file_lockE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal22halide_trace_file_lockE]
	mov	x19, x0
	mov	w8, #1
	add	x29, sp, #32            // =32
.LBB83_1:                               // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w9, [x21]
	stlxr	w10, w8, [x21]
	orr	w9, w10, w9
	cbnz	w9, .LBB83_1
// %bb.2:                               // %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit
	adrp	x22, :got:_ZN6Halide7Runtime8Internal17halide_trace_fileE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal17halide_trace_fileE]
	ldr	w8, [x22]
	tbnz	w8, #31, .LBB83_4
.LBB83_3:                               // %if.end11
	ldr	w0, [x22]
	stlr	wzr, [x21]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.LBB83_4:                               // %if.then
	adrp	x0, .L.str.28
	add	x0, x0, :lo12:.L.str.28
	bl	getenv
	cbz	x0, .LBB83_9
// %bb.5:                               // %if.then1
	adrp	x1, .L.str.29
	add	x1, x1, :lo12:.L.str.29
	bl	fopen
	mov	x20, x0
	cbnz	x0, .LBB83_7
// %bb.6:                               // %if.then4
	adrp	x1, .L.str.30
	add	x1, x1, :lo12:.L.str.30
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB83_7:                               // %if.end
	mov	x0, x20
	bl	fileno
	bl	halide_set_trace_file
	adrp	x19, :got:_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal19halide_trace_bufferE]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE
	ldr	x8, [x19]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE]
	str	x20, [x9]
	cbnz	x8, .LBB83_3
// %bb.8:                               // %if.then7
	mov	w0, #12
	movk	w0, #16, lsl #16
	bl	malloc
	str	x0, [x19]
	stp	wzr, wzr, [x0, #4]
	str	wzr, [x0]
	b	.LBB83_3
.LBB83_9:                               // %if.else
	bl	halide_set_trace_file
	b	.LBB83_3
.Lfunc_end83:
	.size	halide_get_trace_file, .Lfunc_end83-halide_get_trace_file
                                        // -- End function
	.section	.text.halide_set_trace_file,"ax",@progbits
	.weak	halide_set_trace_file   // -- Begin function halide_set_trace_file
	.p2align	2
	.type	halide_set_trace_file,@function
halide_set_trace_file:                  // @halide_set_trace_file
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17halide_trace_fileE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17halide_trace_fileE]
	str	w0, [x8]
	ret
.Lfunc_end84:
	.size	halide_set_trace_file, .Lfunc_end84-halide_set_trace_file
                                        // -- End function
	.section	.text.halide_trace_cleanup,"ax",@progbits
	.weak	halide_trace_cleanup    // -- Begin function halide_trace_cleanup
	.p2align	2
	.type	halide_trace_cleanup,@function
halide_trace_cleanup:                   // @halide_trace_cleanup
// %bb.0:                               // %entry
	b	halide_shutdown_trace
.Lfunc_end85:
	.size	halide_trace_cleanup, .Lfunc_end85-halide_trace_cleanup
                                        // -- End function
	.section	.text.halide_shutdown_trace,"ax",@progbits
	.weak	halide_shutdown_trace   // -- Begin function halide_shutdown_trace
	.p2align	2
	.type	halide_shutdown_trace,@function
halide_shutdown_trace:                  // @halide_shutdown_trace
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x20, :got:_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE]
	add	x29, sp, #16            // =16
	ldr	x0, [x20]
	cbz	x0, .LBB86_4
// %bb.1:                               // %if.then
	bl	fclose
	adrp	x8, :got:_ZN6Halide7Runtime8Internal17halide_trace_fileE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal17halide_trace_fileE]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19halide_trace_bufferE]
	mov	w19, w0
	str	wzr, [x8]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE
	ldr	x0, [x9]
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE]
	str	xzr, [x20]
	strb	wzr, [x8]
	cbz	x0, .LBB86_3
// %bb.2:                               // %if.then2
	bl	free
.LBB86_3:                               // %return
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB86_4:
	mov	w19, wzr
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end86:
	.size	halide_shutdown_trace, .Lfunc_end86-halide_shutdown_trace
                                        // -- End function
	.section	.text.halide_set_custom_trace,"ax",@progbits
	.weak	halide_set_custom_trace // -- Begin function halide_set_custom_trace
	.p2align	2
	.type	halide_set_custom_trace,@function
halide_set_custom_trace:                // @halide_set_custom_trace
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19halide_custom_traceE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19halide_custom_traceE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end87:
	.size	halide_set_custom_trace, .Lfunc_end87-halide_set_custom_trace
                                        // -- End function
	.section	.text.halide_trace,"ax",@progbits
	.weak	halide_trace            // -- Begin function halide_trace
	.p2align	2
	.type	halide_trace,@function
halide_trace:                           // @halide_trace
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal19halide_custom_traceE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal19halide_custom_traceE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end88:
	.size	halide_trace, .Lfunc_end88-halide_trace
                                        // -- End function
	.section	.text.halide_trace_helper,"ax",@progbits
	.weak	halide_trace_helper     // -- Begin function halide_trace_helper
	.p2align	2
	.type	halide_trace_helper,@function
halide_trace_helper:                    // @halide_trace_helper
// %bb.0:                               // %entry
	sub	sp, sp, #128            // =128
	stp	x29, x30, [sp, #112]    // 16-byte Folded Spill
	add	x29, sp, #112           // =112
	stp	x24, x23, [sp, #64]     // 16-byte Folded Spill
	ldrsw	x24, [x29, #32]
	ldr	w8, [x29, #24]
	ldr	w9, [x29, #16]
	ldr	x10, [x29, #40]
	stp	x22, x21, [sp, #80]     // 16-byte Folded Spill
	mov	x22, x2
	stp	x1, x2, [sp, #8]
	add	x1, sp, #8              // =8
	mov	w2, #56
	stp	x20, x19, [sp, #96]     // 16-byte Folded Spill
	mov	w19, w6
	mov	w20, w5
	mov	x21, x3
	mov	x23, x0
	strb	w4, [sp, #40]
	strb	w5, [sp, #41]
	strh	w6, [sp, #42]
	stp	x3, x10, [sp, #24]
	stp	w7, w9, [sp, #44]
	stp	w8, w24, [sp, #52]
	bl	halide_msan_annotate_memory_is_initialized
	add	w8, w20, #7             // =7
	add	w9, w20, #14            // =14
	cmp	w8, #0                  // =0
	csel	w8, w9, w8, lt
	asr	w8, w8, #3
	mul	w8, w8, w19
	sxtw	x2, w8
	mov	x0, x23
	mov	x1, x22
	bl	halide_msan_annotate_memory_is_initialized
	lsl	x2, x24, #2
	mov	x0, x23
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	add	x1, sp, #8              // =8
	mov	x0, x23
	bl	halide_trace
	ldp	x29, x30, [sp, #112]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #96]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #80]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #64]     // 16-byte Folded Reload
	add	sp, sp, #128            // =128
	ret
.Lfunc_end89:
	.size	halide_trace_helper, .Lfunc_end89-halide_trace_helper
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal9ends_withEPKcS3_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_ // -- Begin function _ZN6Halide7Runtime8Internal9ends_withEPKcS3_
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_,@function
_ZN6Halide7Runtime8Internal9ends_withEPKcS3_: // @_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
// %bb.0:                               // %entry
	mov	w10, #1
	mov	x8, x0
.LBB90_1:                               // %while.cond
                                        // =>This Inner Loop Header: Depth=1
	mov	x12, x8
	ldrb	w11, [x8], #1
	mov	x9, x10
	sub	x10, x10, #1            // =1
	cbnz	w11, .LBB90_1
// %bb.2:                               // %while.cond1.preheader
	mov	w13, #1
	mov	x10, x1
.LBB90_3:                               // %while.cond1
                                        // =>This Inner Loop Header: Depth=1
	mov	x14, x10
	ldrb	w15, [x10], #1
	mov	x11, x13
	sub	x13, x13, #1            // =1
	cbnz	w15, .LBB90_3
// %bb.4:                               // %while.cond6.preheader
	cmp	x12, x0
	mov	w13, #1
	b.eq	.LBB90_10
// %bb.5:                               // %while.cond6.preheader
	cmp	x14, x1
	mov	w14, #1
	b.eq	.LBB90_9
// %bb.6:                               // %if.end.preheader
	mov	x12, #-2
.LBB90_7:                               // %if.end
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w15, [x8, x12]
	ldrb	w16, [x10, x12]
	cmp	x11, #0                 // =0
	cset	w13, eq
	cmp	x9, #0                  // =0
	cset	w14, eq
	cmp	w15, w16
	orr	w14, w13, w14
	cset	w13, eq
	tbnz	w14, #0, .LBB90_9
// %bb.8:                               // %if.end
                                        //   in Loop: Header=BB90_7 Depth=1
	sub	x12, x12, #1            // =1
	add	x11, x11, #1            // =1
	cmp	w15, w16
	add	x9, x9, #1              // =1
	b.eq	.LBB90_7
.LBB90_9:                               // %cleanup
	and	w0, w13, w14
	ret
.LBB90_10:
	mov	w14, #1
	and	w0, w13, w14
	ret
.Lfunc_end90:
	.size	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_, .Lfunc_end90-_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               // -- Begin function halide_debug_to_file
.LCPI91_0:
	.word	0                       // 0x0
	.word	1                       // 0x1
.LCPI91_1:
	.word	6                       // 0x6
	.word	8                       // 0x8
.LCPI91_2:
	.word	1                       // 0x1
	.word	5                       // 0x5
.LCPI91_3:
	.word	1                       // 0x1
	.word	194                     // 0xc2
.LCPI91_4:
	.word	1                       // 0x1
	.word	202                     // 0xca
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4
.LCPI91_5:
	.word	0                       // 0x0
	.word	1                       // 0x1
	.word	1                       // 0x1
	.word	1                       // 0x1
	.section	.text.halide_debug_to_file,"ax",@progbits
	.weak	halide_debug_to_file
	.p2align	2
	.type	halide_debug_to_file,@function
halide_debug_to_file:                   // @halide_debug_to_file
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	sub	sp, sp, #1, lsl #12     // =4096
	sub	sp, sp, #368            // =368
	ldr	x8, [x3, #16]
	mov	x21, x3
	mov	w23, w2
	mov	x24, x1
	mov	x25, x0
	cbnz	x8, .LBB91_2
// %bb.1:                               // %_ZNK15halide_buffer_t15is_bounds_queryEv.exit
	ldr	x8, [x21]
	cbz	x8, .LBB91_11
.LBB91_2:                               // %if.end
	ldr	w8, [x21, #36]
	cmp	w8, #5                  // =5
	b.lt	.LBB91_4
// %bb.3:                               // %if.then1
	adrp	x1, .L.str.1.36
	add	x1, x1, :lo12:.L.str.1.36
	b	.LBB91_12
.LBB91_4:                               // %if.end2
	mov	x0, x25
	mov	x1, x21
	bl	halide_copy_to_host
	adrp	x1, .L.str.2.37
	add	x1, x1, :lo12:.L.str.2.37
	mov	x0, x24
	bl	fopen
	mov	x28, x0
	cbz	x0, .LBB91_10
// %bb.5:                               // %if.end6
	movi	v0.2d, #0000000000000000
	stp	q0, q0, [x29, #-128]
	stp	q0, q0, [x29, #-160]
	ldrsw	x8, [x21, #36]
	cmp	w8, #0                  // =0
	b.le	.LBB91_13
// %bb.6:                               // %for.body.lr.ph
	ldr	x9, [x21, #40]
	sub	x10, x29, #160          // =160
	orr	x10, x10, #0x4
	mov	w11, #1
	mov	w19, #1
.LBB91_7:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	q0, [x9]
	cmp	x11, #3                 // =3
	stur	q0, [x10, #-4]
	ldrsw	x12, [x10]
	mul	x19, x19, x12
	b.hi	.LBB91_9
// %bb.8:                               // %for.body
                                        //   in Loop: Header=BB91_7 Depth=1
	cmp	x11, x8
	add	x11, x11, #1            // =1
	add	x10, x10, #16           // =16
	add	x9, x9, #16             // =16
	b.lt	.LBB91_7
.LBB91_9:                               // %for.cond16.preheader
	cmp	w8, #3                  // =3
	b.le	.LBB91_14
	b	.LBB91_21
.LBB91_10:
	mov	w24, #-2
	b	.LBB91_133
.LBB91_11:                              // %if.then
	adrp	x1, .L.str.35
	add	x1, x1, :lo12:.L.str.35
.LBB91_12:                              // %return
	mov	x0, x25
	bl	halide_error
	mov	w24, #-1
	b	.LBB91_134
.LBB91_13:                              // %if.end6.for.body19.preheader_crit_edge
	mov	w19, #1
.LBB91_14:                              // %for.body19.preheader
	mov	w9, #4
	sub	x10, x9, x8
	cmp	x10, #1                 // =1
	adrp	x9, .LCPI91_0
	b.hi	.LBB91_16
// %bb.15:
	mov	x11, x8
	b	.LBB91_19
.LBB91_16:                              // %vector.ph
	ldr	d0, [x9, :lo12:.LCPI91_0]
	and	x12, x10, #0xfffffffffffffffe
	sub	x13, x29, #160          // =160
	add	x11, x8, x12
	add	x8, x13, x8, lsl #4
	add	x8, x8, #16             // =16
	mov	x13, x12
.LBB91_17:                              // %vector.body
                                        // =>This Inner Loop Header: Depth=1
	stur	d0, [x8, #-16]
	str	d0, [x8]
	stur	wzr, [x8, #-8]
	str	wzr, [x8, #8]
	subs	x13, x13, #2            // =2
	add	x8, x8, #32             // =32
	b.ne	.LBB91_17
// %bb.18:                              // %middle.block
	cmp	x10, x12
	b.eq	.LBB91_21
.LBB91_19:                              // %for.body19.preheader2
	ldr	d0, [x9, :lo12:.LCPI91_0]
	sub	x9, x29, #160           // =160
	add	x9, x9, x11, lsl #4
	sub	x8, x11, #4             // =4
	orr	x9, x9, #0x8
.LBB91_20:                              // %for.body19
                                        // =>This Inner Loop Header: Depth=1
	stur	d0, [x9, #-8]
	str	wzr, [x9], #16
	adds	x8, x8, #1              // =1
	b.lo	.LBB91_20
.LBB91_21:                              // %for.cond.cleanup18
	ldrb	w8, [x21, #33]
	adrp	x1, .L.str.3.38
	add	x1, x1, :lo12:.L.str.3.38
	mov	x0, x24
	add	x20, x8, #7             // =7
	lsr	x22, x20, #3
	bl	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
	tbnz	w0, #0, .LBB91_23
// %bb.22:                              // %lor.lhs.false
	adrp	x1, .L.str.4.39
	add	x1, x1, :lo12:.L.str.4.39
	mov	x0, x24
	bl	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
	cbz	w0, .LBB91_32
.LBB91_23:                              // %if.then33
	ldur	w10, [x29, #-108]
	ldur	w11, [x29, #-124]
	mov	w15, #4
	strh	w15, [sp, #92]
	cmp	w10, #2                 // =2
	cset	w9, lo
	cmp	w11, #5                 // =5
	cset	w14, lt
	tst	w9, w14
	mov	w14, #15
	movk	w14, #256, lsl #16
	str	w14, [sp, #88]
	mov	x14, #257
	movk	x14, #4, lsl #16
	movk	x14, #1, lsl #32
	and	w15, w20, #0x1f8
	stur	x14, [sp, #102]
	mov	x14, #258
	movk	x14, #3, lsl #16
	strh	w15, [sp, #122]
	mov	x15, #262
	movk	x14, #1, lsl #32
	movk	x15, #3, lsl #16
	stur	x14, [sp, #114]
	mov	x14, #259
	movk	x15, #1, lsl #32
	movk	x14, #3, lsl #16
	stur	x15, [sp, #138]
	mov	x15, #210
	movk	x14, #1, lsl #32
	movk	x15, #277, lsl #32
	stur	x14, [sp, #126]
	mov	w14, #273
	movk	x15, #3, lsl #48
	movk	w14, #4, lsl #16
	stur	x15, [sp, #158]
	mov	w15, #279
	stur	w14, [sp, #150]
	mov	x14, #278
	movk	w15, #4, lsl #16
	movk	x14, #4, lsl #16
	stur	w15, [sp, #186]
	adrp	x15, .LCPI91_3
	mov	x9, #18761
	movk	x14, #1, lsl #32
	ldr	d0, [x15, :lo12:.LCPI91_3]
	movk	x9, #42, lsl #16
	stur	x14, [sp, #174]
	mov	w14, #282
	movk	x9, #8, lsl #32
	mul	w16, w22, w19
	movk	w14, #5, lsl #16
	csel	w19, w11, w10, ne
	str	x9, [sp, #80]
	mov	w9, #1
	stur	w14, [sp, #198]
	adrp	x14, .LCPI91_4
	csinc	w20, w11, wzr, eq
	cmp	w19, #2                 // =2
	stur	d0, [sp, #202]
	ldr	d0, [x14, :lo12:.LCPI91_4]
	adrp	x14, :got:_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE
	cinc	w10, w9, gt
	ldur	w12, [x29, #-140]
	ldur	w13, [x29, #-156]
	ldr	x14, [x14, :got_lo12:_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE]
	strh	w10, [sp, #146]
	lsl	w10, w19, #2
	add	w10, w10, #210          // =210
	cmp	w19, #1                 // =1
	csel	w10, w16, w10, eq
	add	x8, sp, #80             // =80
	stur	w10, [sp, #194]
	adrp	x10, .LCPI91_5
	ldrh	w14, [x14, w23, sxtw #1]
	stur	w13, [sp, #98]
	stur	w12, [sp, #110]
	stur	w12, [sp, #182]
	stur	w9, [sp, #94]
	strh	w9, [sp, #134]
	stur	w9, [sp, #166]
	stur	w19, [sp, #154]
	strh	w19, [sp, #170]
	stur	w19, [sp, #190]
	stur	d0, [x8, #134]
	ldr	q0, [x10, :lo12:.LCPI91_5]
	mov	x17, #284
	mov	x11, #296
	mov	x10, #339
	mov	x12, #32997
	mov	w15, #283
	movk	x17, #3, lsl #16
	movk	x11, #3, lsl #16
	movk	x10, #3, lsl #16
	movk	x12, #4, lsl #16
	movk	w15, #5, lsl #16
	movk	x17, #1, lsl #32
	mov	w13, #2
	movk	x11, #1, lsl #32
	movk	x10, #1, lsl #32
	movk	x12, #1, lsl #32
	add	x0, sp, #80             // =80
	mov	w1, #210
	mov	w2, #1
	mov	x3, x28
	stur	w15, [x8, #130]
	stur	x17, [x8, #142]
	strh	w13, [sp, #230]
	stur	x11, [x8, #154]
	strh	w9, [sp, #242]
	stur	x10, [x8, #166]
	strh	w14, [sp, #254]
	stur	x12, [x8, #178]
	stur	w20, [x8, #186]
	stur	q0, [x8, #190]
	stur	w9, [x8, #206]
	bl	fwrite
	cbz	x0, .LBB91_31
// %bb.24:                              // %if.end100
	cmp	w19, #2                 // =2
	b.lt	.LBB91_49
// %bb.25:                              // %for.body112.lr.ph
	ldur	w10, [x29, #-156]
	lsl	w8, w19, #3
	ldur	w9, [x29, #-140]
	add	w8, w8, #210            // =210
	str	w8, [sp, #4240]
	mul	w8, w20, w22
	mul	w8, w8, w10
	mul	w20, w8, w9
	mov	w23, w19
.LBB91_26:                              // %for.body112
                                        // =>This Inner Loop Header: Depth=1
	add	x0, sp, #1, lsl #12     // =4096
	add	x0, x0, #144            // =144
	mov	w1, #4
	mov	w2, #1
	mov	x3, x28
	bl	fwrite
	cbz	x0, .LBB91_84
// %bb.27:                              // %if.end115
                                        //   in Loop: Header=BB91_26 Depth=1
	ldr	w8, [sp, #4240]
	subs	w23, w23, #1            // =1
	add	w8, w20, w8
	str	w8, [sp, #4240]
	b.ne	.LBB91_26
// %bb.28:                              // %for.end126
	cmp	w19, #1                 // =1
	str	w20, [sp, #4208]
	b.lt	.LBB91_49
.LBB91_29:                              // %for.body138
                                        // =>This Inner Loop Header: Depth=1
	add	x0, sp, #1, lsl #12     // =4096
	add	x0, x0, #112            // =112
	mov	w1, #4
	mov	w2, #1
	mov	x3, x28
	bl	fwrite
	cbz	x0, .LBB91_126
// %bb.30:                              // %for.cond135
                                        //   in Loop: Header=BB91_29 Depth=1
	subs	w19, w19, #1            // =1
	b.ne	.LBB91_29
	b	.LBB91_49
.LBB91_31:
	mov	w24, #-3
	b	.LBB91_133
.LBB91_32:                              // %if.else161
	adrp	x1, .L.str.5.40
	add	x1, x1, :lo12:.L.str.5.40
	mov	x0, x24
	bl	_ZN6Halide7Runtime8Internal9ends_withEPKcS3_
	cbz	w0, .LBB91_48
// %bb.33:                              // %for.cond164.preheader
	add	x20, sp, #1, lsl #12    // =4096
	mov	x8, xzr
	add	x20, x20, #112          // =112
.LBB91_34:                              // %for.cond164
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w9, [x24, x8]
	add	x8, x8, #1              // =1
	cbnz	w9, .LBB91_34
.LBB91_35:                              // %for.inc173
                                        // =>This Inner Loop Header: Depth=1
	add	x9, x24, x8
	ldurb	w9, [x9, #-2]
	sub	x8, x8, #1              // =1
	cmp	w9, #46                 // =46
	b.ne	.LBB91_35
// %bb.36:                              // %for.cond176.preheader
	mov	w9, #1
	mov	x12, xzr
	mov	x10, xzr
	sub	x9, x9, x8
.LBB91_37:                              // %for.cond176
                                        // =>This Inner Loop Header: Depth=1
	mov	x11, x10
	mov	x27, x12
	cbz	x9, .LBB91_39
// %bb.38:                              // %land.rhs178
                                        //   in Loop: Header=BB91_37 Depth=1
	add	x10, x24, x27
	add	x10, x10, x8
	ldurb	w13, [x10, #-2]
	add	x10, x11, #1            // =1
	sub	x12, x27, #1            // =1
	add	x9, x9, #1              // =1
	cmp	w13, #47                // =47
	b.ne	.LBB91_37
.LBB91_39:                              // %for.end186
	neg	x26, x27
	add	x9, sp, #80             // =80
	cbz	x27, .LBB91_87
// %bb.40:                              // %while.body.preheader
	sub	x10, x27, #1            // =1
	cmn	x10, #32                // =32
	add	x0, sp, #80             // =80
	b.hs	.LBB91_46
// %bb.41:                              // %vector.memcheck
	add	x12, x24, x8
	sub	x13, x12, #1            // =1
	cmp	x0, x13
	b.hs	.LBB91_43
// %bb.42:                              // %vector.memcheck
	add	x12, x12, x27
	sub	x13, x0, x27
	sub	x12, x12, #1            // =1
	cmp	x12, x13
	b.lo	.LBB91_46
.LBB91_43:                              // %vector.ph50
	add	x10, x24, x8
	neg	x12, x27
	ubfx	x13, x11, #5, #58
	add	x15, sp, #80            // =80
	ubfx	x14, x26, #5, #58
	add	x10, x10, x27
	and	x11, x12, #0x7fffffffffffffe0
	add	x16, x27, x13, lsl #5
	lsl	x13, x14, #5
	add	x14, x10, #15           // =15
	add	x0, x15, x11
	sub	x10, x16, #1            // =1
	add	x15, x15, #16           // =16
.LBB91_44:                              // %vector.body42
                                        // =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x14, #-16]
	subs	x13, x13, #32           // =32
	add	x14, x14, #32           // =32
	stp	q0, q1, [x15, #-16]
	add	x15, x15, #32           // =32
	b.ne	.LBB91_44
// %bb.45:                              // %middle.block43
	cmp	x12, x11
	b.eq	.LBB91_47
.LBB91_46:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	add	x11, x24, x10
	ldrb	w11, [x11, x8]
	add	x10, x10, #1            // =1
	cmn	x10, #1                 // =1
	strb	w11, [x0], #1
	b.ne	.LBB91_46
.LBB91_47:                              // %while.cond191.preheader
	add	x8, sp, #80             // =80
	add	x8, x8, #256            // =256
	cmp	x0, x8
	b.lo	.LBB91_88
	b	.LBB91_89
.LBB91_48:                              // %if.else285
	ldur	w8, [x29, #-156]
	ldur	w9, [x29, #-140]
	ldur	w10, [x29, #-108]
	ldur	w11, [x29, #-124]
	add	x0, sp, #80             // =80
	mov	w1, #20
	mov	w2, #1
	mov	x3, x28
	stp	w8, w9, [sp, #80]
	stp	w10, w23, [sp, #92]
	str	w11, [sp, #88]
	bl	fwrite
	cbz	x0, .LBB91_92
.LBB91_49:
	mov	w26, wzr
.LBB91_50:                              // %if.end308
	ldur	w8, [x29, #-108]
	cmp	w8, #1                  // =1
	b.lt	.LBB91_80
// %bb.51:                              // %for.body319.lr.ph
	ldur	w10, [x29, #-108]
	ldp	w14, w13, [x29, #-144]
	ldp	w16, w15, [x29, #-160]
	ldp	w12, w11, [x29, #-128]
	str	w10, [sp, #20]          // 4-byte Folded Spill
	ldur	w10, [x29, #-112]
	add	x17, sp, #1, lsl #12    // =4096
	mov	w9, #4096
	add	x17, x17, #144          // =144
	udiv	w27, w9, w22
	add	x9, x17, #16            // =16
	mov	w23, wzr
	stp	x9, x28, [sp, #64]      // 16-byte Folded Spill
	mul	w24, w27, w22
	add	w28, w16, w15
	add	w9, w13, w14
	mov	w20, w10
	str	x26, [sp, #8]           // 8-byte Folded Spill
	stp	w14, w16, [sp, #48]     // 8-byte Folded Spill
	stp	w9, w15, [sp, #56]      // 8-byte Folded Spill
	str	x25, [sp, #24]          // 8-byte Folded Spill
	str	w10, [sp, #16]          // 4-byte Folded Spill
	stp	w12, w11, [sp, #40]     // 8-byte Folded Spill
	str	w13, [sp, #36]          // 4-byte Folded Spill
.LBB91_52:                              // %for.body319
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB91_54 Depth 2
                                        //       Child Loop BB91_62 Depth 3
                                        //         Child Loop BB91_69 Depth 4
                                        //         Child Loop BB91_72 Depth 4
	cmp	w11, #1                 // =1
	b.lt	.LBB91_77
// %bb.53:                              // %for.body330.preheader
                                        //   in Loop: Header=BB91_52 Depth=1
	mov	w26, w12
.LBB91_54:                              // %for.body330
                                        //   Parent Loop BB91_52 Depth=1
                                        // =>  This Loop Header: Depth=2
                                        //       Child Loop BB91_62 Depth 3
                                        //         Child Loop BB91_69 Depth 4
                                        //         Child Loop BB91_72 Depth 4
	cmp	w13, #1                 // =1
	b.lt	.LBB91_75
// %bb.55:                              // %for.body341.preheader
                                        //   in Loop: Header=BB91_54 Depth=2
	ldr	w19, [sp, #48]          // 4-byte Folded Reload
	mov	w8, w23
	ldr	w9, [sp, #60]           // 4-byte Folded Reload
	cmp	w9, #1                  // =1
	b.ge	.LBB91_59
.LBB91_56:                              //   in Loop: Header=BB91_54 Depth=2
	mov	w23, w8
.LBB91_57:                              // %for.inc386
                                        //   in Loop: Header=BB91_54 Depth=2
	ldr	w8, [sp, #56]           // 4-byte Folded Reload
	add	w19, w19, #1            // =1
	cmp	w19, w8
	mov	w8, w23
	b.ge	.LBB91_75
// %bb.58:                              // %for.body341
                                        //   in Loop: Header=BB91_54 Depth=2
	ldr	w9, [sp, #60]           // 4-byte Folded Reload
	cmp	w9, #1                  // =1
	b.lt	.LBB91_56
.LBB91_59:                              // %for.body352.preheader
                                        //   in Loop: Header=BB91_54 Depth=2
	ldr	w25, [sp, #52]          // 4-byte Folded Reload
	b	.LBB91_62
.LBB91_60:                              //   in Loop: Header=BB91_62 Depth=3
	mov	w23, wzr
.LBB91_61:                              // %for.inc381
                                        //   in Loop: Header=BB91_62 Depth=3
	add	w25, w25, #1            // =1
	cmp	w25, w28
	mov	w8, w23
	b.ge	.LBB91_57
.LBB91_62:                              // %for.body352
                                        //   Parent Loop BB91_52 Depth=1
                                        //     Parent Loop BB91_54 Depth=2
                                        // =>    This Loop Header: Depth=3
                                        //         Child Loop BB91_69 Depth 4
                                        //         Child Loop BB91_72 Depth 4
	str	w19, [sp, #4244]
	str	w25, [sp, #4240]
	str	w20, [sp, #4252]
	str	w26, [sp, #4248]
	ldrsw	x9, [x21, #36]
	add	w23, w8, #1             // =1
	cmp	w9, #1                  // =1
	b.lt	.LBB91_67
// %bb.63:                              // %for.body.lr.ph.i
                                        //   in Loop: Header=BB91_62 Depth=3
	ldr	x10, [x21, #40]
	sxtw	x13, w25
	cmp	w9, #1                  // =1
	ldrsw	x11, [x10]
	ldrsw	x12, [x10, #8]
	sub	x11, x13, x11
	mul	x11, x11, x12
	b.eq	.LBB91_73
// %bb.64:                              // %for.body.i.for.body.i_crit_edge.preheader
                                        //   in Loop: Header=BB91_62 Depth=3
	ldrsw	x12, [x10, #16]
	ldrsw	x13, [x10, #24]
	sxtw	x14, w19
	cmp	w9, #2                  // =2
	sub	x12, x14, x12
	madd	x11, x12, x13, x11
	b.eq	.LBB91_73
// %bb.65:                              // %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.lr.ph
                                        //   in Loop: Header=BB91_62 Depth=3
	sub	x12, x9, #2             // =2
	cmp	x12, #5                 // =5
	b.hs	.LBB91_68
// %bb.66:                              //   in Loop: Header=BB91_62 Depth=3
	mov	w12, #2
	b	.LBB91_71
.LBB91_67:                              //   in Loop: Header=BB91_62 Depth=3
	mov	x11, xzr
	b	.LBB91_73
.LBB91_68:                              // %vector.ph109
                                        //   in Loop: Header=BB91_62 Depth=3
	and	x13, x12, #0x3
	tst	x12, #0x3
	mov	w14, #4
	csel	x13, x14, x13, eq
	ldr	x14, [sp, #64]          // 8-byte Folded Reload
	movi	v1.2d, #0000000000000000
	mov	v1.d[0], x11
	sub	x11, x12, x13
	sub	x13, x9, x13
	movi	v0.2d, #0000000000000000
	add	x12, x11, #2            // =2
	sub	x11, x13, #2            // =2
	add	x13, x10, #64           // =64
.LBB91_69:                              // %vector.body105
                                        //   Parent Loop BB91_52 Depth=1
                                        //     Parent Loop BB91_54 Depth=2
                                        //       Parent Loop BB91_62 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	sub	x15, x13, #32           // =32
	ldp	d2, d3, [x14, #-8]
	ld4	{ v4.2s, v5.2s, v6.2s, v7.2s }, [x13]
	ld4	{ v16.2s, v17.2s, v18.2s, v19.2s }, [x15]
	subs	x11, x11, #4            // =4
	add	x13, x13, #64           // =64
	sub	v3.2s, v3.2s, v4.2s
	sub	v2.2s, v2.2s, v16.2s
	mul	v3.2s, v3.2s, v6.2s
	mul	v2.2s, v2.2s, v18.2s
	saddw	v0.2d, v0.2d, v3.2s
	saddw	v1.2d, v1.2d, v2.2s
	add	x14, x14, #16           // =16
	b.ne	.LBB91_69
// %bb.70:                              // %middle.block106
                                        //   in Loop: Header=BB91_62 Depth=3
	add	v0.2d, v0.2d, v1.2d
	addp	d0, v0.2d
	fmov	x11, d0
.LBB91_71:                              // %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge.preheader
                                        //   in Loop: Header=BB91_62 Depth=3
	add	x13, sp, #1, lsl #12    // =4096
	add	x10, x10, x12, lsl #4
	add	x13, x13, #144          // =144
	sub	x9, x9, x12
	add	x10, x10, #8            // =8
	add	x12, x13, x12, lsl #2
.LBB91_72:                              // %for.body.i.for.body.i_crit_edge.for.body.i.for.body.i_crit_edge_crit_edge
                                        //   Parent Loop BB91_52 Depth=1
                                        //     Parent Loop BB91_54 Depth=2
                                        //       Parent Loop BB91_62 Depth=3
                                        // =>      This Inner Loop Header: Depth=4
	ldrsw	x13, [x12], #4
	ldursw	x14, [x10, #-8]
	ldrsw	x15, [x10]
	subs	x9, x9, #1              // =1
	add	x10, x10, #16           // =16
	sub	x13, x13, x14
	madd	x11, x13, x15, x11
	b.ne	.LBB91_72
.LBB91_73:                              // %_ZNK15halide_buffer_t10address_ofEPKi.exit
                                        //   in Loop: Header=BB91_62 Depth=3
	ldrb	w9, [x21, #33]
	ldr	x10, [x21, #16]
	mul	w8, w8, w22
	mov	x2, x22
	add	x9, x9, #7              // =7
	lsr	x9, x9, #3
	madd	x1, x9, x11, x10
	add	x9, sp, #80             // =80
	add	x0, x9, w8, sxtw
	bl	memcpy
	cmp	w23, w27
	b.ne	.LBB91_61
// %bb.74:                              // %if.then368
                                        //   in Loop: Header=BB91_62 Depth=3
	ldr	x3, [sp, #72]           // 8-byte Folded Reload
	add	x0, sp, #80             // =80
	mov	w2, #1
	mov	x1, x24
	bl	fwrite
	cbnz	x0, .LBB91_60
	b	.LBB91_83
.LBB91_75:                              // %for.inc391
                                        //   in Loop: Header=BB91_54 Depth=2
	ldp	w12, w11, [sp, #40]     // 8-byte Folded Reload
	ldr	w13, [sp, #36]          // 4-byte Folded Reload
	add	w26, w26, #1            // =1
	add	w8, w11, w12
	cmp	w26, w8
	b.lt	.LBB91_54
// %bb.76:                              //   in Loop: Header=BB91_52 Depth=1
	ldp	w10, w8, [sp, #16]      // 8-byte Folded Reload
	ldr	x25, [sp, #24]          // 8-byte Folded Reload
.LBB91_77:                              // %for.inc396
                                        //   in Loop: Header=BB91_52 Depth=1
	add	w20, w20, #1            // =1
	add	w9, w8, w10
	cmp	w20, w9
	b.lt	.LBB91_52
// %bb.78:                              // %for.end400
	ldr	x28, [sp, #72]          // 8-byte Folded Reload
	ldr	x26, [sp, #8]           // 8-byte Folded Reload
	cmp	w23, #1                 // =1
	b.lt	.LBB91_80
// %bb.79:                              // %if.then402
	mul	w8, w23, w22
	sxtw	x1, w8
	add	x0, sp, #80             // =80
	mov	w2, #1
	mov	x3, x28
	bl	fwrite
	cbz	x0, .LBB91_132
.LBB91_80:                              // %if.end409
	str	xzr, [sp, #4240]
	cbz	w26, .LBB91_86
// %bb.81:                              // %if.then411
	cmp	w26, #9                 // =9
	b.lo	.LBB91_85
// %bb.82:                              // %if.then414
	adrp	x1, .L.str.7.42
	add	x1, x1, :lo12:.L.str.7.42
	mov	x0, x25
	bl	halide_error
	mov	w24, #-15
	b	.LBB91_133
.LBB91_83:                              // %cleanup398
	ldr	x28, [sp, #72]          // 8-byte Folded Reload
	mov	w24, #-13
	b	.LBB91_133
.LBB91_84:
	mov	w24, #-4
	b	.LBB91_133
.LBB91_85:                              // %if.end415
	add	x0, sp, #1, lsl #12     // =4096
	add	x0, x0, #144            // =144
	mov	w2, #1
	mov	x1, x26
	mov	x3, x28
	bl	fwrite
	cbz	x0, .LBB91_128
.LBB91_86:                              // %if.end420
	mov	w24, wzr
	b	.LBB91_133
.LBB91_87:
	add	x0, sp, #80             // =80
.LBB91_88:                              // %while.body194.preheader
	sub	x8, x9, x0
	add	x2, x8, #256            // =256
	mov	w1, wzr
	bl	memset
.LBB91_89:                              // %while.end196
	adrp	x8, .L__const.halide_debug_to_file.header
	add	x8, x8, :lo12:.L__const.halide_debug_to_file.header
	ldp	q0, q1, [x8, #64]
	ldp	q2, q3, [x8, #96]
	add	x0, sp, #1, lsl #12     // =4096
	add	x0, x0, #144            // =144
	str	q0, [sp, #4304]
	ldp	q0, q5, [x8, #32]
	str	q1, [sp, #4320]
	ldp	q4, q1, [x8]
	mov	w1, #128
	mov	w2, #1
	mov	x3, x28
	str	q3, [sp, #4352]
	str	q2, [sp, #4336]
	str	q4, [sp, #4240]
	str	q5, [sp, #4288]
	str	q1, [sp, #4256]
	strb	wzr, [x20, #160]
	str	q0, [sp, #4272]
	bl	fwrite
	ldrsw	x8, [x21, #36]
	cmp	w8, #0                  // =0
	b.le	.LBB91_93
// %bb.90:                              // %for.body.lr.ph.i.i
	ldr	x9, [x21, #40]
	cmp	w8, #3                  // =3
	b.hs	.LBB91_94
// %bb.91:
	mov	x11, xzr
	mov	x10, xzr
	b	.LBB91_101
.LBB91_92:
	mov	w24, #-12
	b	.LBB91_133
.LBB91_93:                              // %_ZNK15halide_buffer_t3endEv.exit.thread.i
	ldrb	w11, [x21, #33]
	mov	x13, xzr
	mov	w9, #1
	b	.LBB91_119
.LBB91_94:                              // %vector.ph69
	and	x11, x8, #0xfffffffffffffffe
	mov	x10, xzr
	mov	x12, xzr
	add	x13, x9, #24            // =24
	mov	x14, x11
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.ge	.LBB91_97
	b	.LBB91_98
.LBB91_95:                              // %pred.load.continue80
                                        //   in Loop: Header=BB91_98 Depth=1
	sub	w17, w17, #1            // =1
	sub	w18, w18, #1            // =1
	cmp	w16, #0                 // =0
	mul	w16, w17, w16
	mul	w17, w18, w15
	csel	w16, w16, wzr, gt
	cmp	w15, #0                 // =0
	csel	w15, w17, wzr, gt
	add	x10, x10, w16, sxtw
	subs	x14, x14, #2            // =2
	add	x12, x12, w15, sxtw
	add	x13, x13, #32           // =32
	b.eq	.LBB91_100
// %bb.96:                              // %vector.body65
                                        //   in Loop: Header=BB91_98 Depth=1
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.lt	.LBB91_98
.LBB91_97:                              // %pred.load.if
	ldur	w17, [x13, #-20]
.LBB91_98:                              // %pred.load.continue
                                        // =>This Inner Loop Header: Depth=1
	cmp	w15, #1                 // =1
                                        // implicit-def: $w18
	b.lt	.LBB91_95
// %bb.99:                              // %pred.load.if79
                                        //   in Loop: Header=BB91_98 Depth=1
	ldur	w18, [x13, #-4]
	b	.LBB91_95
.LBB91_100:                             // %middle.block66
	cmp	x11, x8
	add	x10, x12, x10
	b.eq	.LBB91_105
.LBB91_101:                             // %for.body.i.i.preheader
	sub	x12, x8, x11
	add	x11, x9, x11, lsl #4
	add	x11, x11, #8            // =8
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.ge	.LBB91_104
.LBB91_102:                             // %for.inc.i.i
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.eq	.LBB91_105
.LBB91_103:                             // %for.body.i.i
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.lt	.LBB91_102
.LBB91_104:                             // %if.then.i.i
	ldursw	x14, [x11, #-4]
	sub	x14, x14, #1            // =1
	madd	x10, x14, x13, x10
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.ne	.LBB91_103
.LBB91_105:                             // %for.body.lr.ph.i5.i
	ldrb	w11, [x21, #33]
	cmp	w8, #3                  // =3
	b.hs	.LBB91_107
// %bb.106:
	mov	x12, xzr
	mov	x13, xzr
	b	.LBB91_114
.LBB91_107:                             // %vector.ph86
	and	x12, x8, #0xfffffffffffffffe
	mov	x13, xzr
	mov	x14, xzr
	add	x15, x9, #24            // =24
	mov	x16, x12
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbz	w17, #31, .LBB91_110
	b	.LBB91_111
.LBB91_108:                             // %pred.load.continue100
	sub	w0, w0, #1              // =1
	sub	w1, w1, #1              // =1
	mul	w0, w0, w17
	mul	w1, w1, w18
	and	w17, w0, w17, asr #31
	and	w18, w1, w18, asr #31
	subs	x16, x16, #2            // =2
	add	x13, x13, w17, sxtw
	add	x14, x14, w18, sxtw
	add	x15, x15, #32           // =32
	b.eq	.LBB91_113
// %bb.109:                             // %vector.body82
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbnz	w17, #31, .LBB91_111
.LBB91_110:                             // %pred.load.continue98
                                        // implicit-def: $w1
	tbz	w18, #31, .LBB91_108
	b	.LBB91_112
.LBB91_111:                             // %pred.load.if97
	ldur	w0, [x15, #-20]
                                        // implicit-def: $w1
	tbz	w18, #31, .LBB91_108
.LBB91_112:                             // %pred.load.if99
	ldur	w1, [x15, #-4]
	b	.LBB91_108
.LBB91_113:                             // %middle.block83
	cmp	x12, x8
	add	x13, x14, x13
	b.eq	.LBB91_118
.LBB91_114:                             // %for.body.i16.i.preheader
	add	x9, x9, x12, lsl #4
	sub	x14, x8, x12
	add	x9, x9, #8              // =8
	ldrsw	x12, [x9]
	tbnz	w12, #31, .LBB91_117
.LBB91_115:                             // %for.inc.i26.i
	subs	x14, x14, #1            // =1
	add	x9, x9, #16             // =16
	b.eq	.LBB91_118
.LBB91_116:                             // %for.body.i16.i
	ldrsw	x12, [x9]
	tbz	w12, #31, .LBB91_115
.LBB91_117:                             // %if.then.i22.i
	ldursw	x15, [x9, #-4]
	sub	x15, x15, #1            // =1
	madd	x13, x15, x12, x13
	subs	x14, x14, #1            // =1
	add	x9, x9, #16             // =16
	b.ne	.LBB91_116
.LBB91_118:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	add	x9, x10, #1             // =1
.LBB91_119:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	add	x10, x11, #7            // =7
	lsr	x10, x10, #3
	sub	x9, x9, x13
	mul	x19, x9, x10
	lsr	x9, x19, #32
	cbz	x9, .LBB91_121
// %bb.120:                             // %cleanup275.thread
	adrp	x1, .L.str.6.41
	add	x1, x1, :lo12:.L.str.6.41
	mov	x0, x25
	bl	halide_error
	mov	w24, #-6
	b	.LBB91_133
.LBB91_121:                             // %if.end204
	adrp	x12, .LCPI91_1
	ldr	d0, [x12, :lo12:.LCPI91_1]
	adrp	x12, :got:_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE
	cmp	w8, #2                  // =2
	mov	w10, #2
	ldr	x12, [x12, :got_lo12:_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE]
	mov	w9, #7
	csel	w8, w8, w10, gt
	sub	w9, w9, w27
	lsl	w8, w8, #2
	sxtw	x23, w23
	adrp	x10, .LCPI91_2
	and	w24, w9, #0xfffffff8
	add	w9, w8, #4              // =4
	ldrb	w12, [x12, x23]
	str	d0, [sp, #4216]
	ldr	d0, [x10, :lo12:.LCPI91_2]
	and	w27, w9, #0xfffffff8
	add	w9, w24, w27
	add	w9, w9, w19
	add	x0, sp, #1, lsl #12     // =4096
	mov	w11, #14
	add	w9, w9, #40             // =40
	add	x0, x0, #112            // =112
	mov	w1, #32
	mov	w2, #1
	mov	x3, x28
	str	w12, [sp, #4224]
	str	w9, [sp, #4212]
	str	w11, [sp, #4208]
	stur	d0, [x20, #20]
	str	w8, [sp, #4236]
	mov	w20, #1
	bl	fwrite
	cbz	x0, .LBB91_127
// %bb.122:                             // %if.end228
	ldur	w8, [x29, #-124]
	ldur	w9, [x29, #-156]
	ldur	w10, [x29, #-140]
	ldur	w11, [x29, #-108]
	add	x0, sp, #1, lsl #12     // =4096
	sxtw	x1, w27
	add	x0, x0, #96             // =96
	mov	w2, #1
	mov	x3, x28
	str	w8, [sp, #4200]
	str	w9, [sp, #4192]
	str	w10, [sp, #4196]
	str	w11, [sp, #4204]
	mov	w20, #1
	bl	fwrite
	cbz	x0, .LBB91_129
// %bb.123:                             // %if.end245
	add	x0, sp, #1, lsl #12     // =4096
	add	x0, x0, #88             // =88
	mov	w1, #8
	mov	w2, #1
	mov	x3, x28
	str	w26, [sp, #4188]
	str	w20, [sp, #4184]
	bl	fwrite
	cbz	x0, .LBB91_130
// %bb.124:                             // %if.end250
	mov	w1, w24
	add	x0, sp, #80             // =80
	mov	w2, #1
	mov	x3, x28
	mov	w20, #1
	bl	fwrite
	cbz	x0, .LBB91_131
// %bb.125:                             // %if.end255
	adrp	x9, :got:_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE]
	sub	w8, w19, #1             // =1
	add	x0, sp, #1, lsl #12     // =4096
	mvn	w8, w8
	ldrb	w9, [x9, x23]
	add	x0, x0, #80             // =80
	mov	w1, #8
	mov	w2, #1
	mov	x3, x28
	and	w26, w8, #0x7
	str	w19, [sp, #4180]
	str	w9, [sp, #4176]
	bl	fwrite
	cmp	x0, #0                  // =0
	cset	w20, eq
	mov	w24, #-11
	cbnz	w20, .LBB91_133
	b	.LBB91_50
.LBB91_126:                             // %cleanup148
	mov	w24, #-5
	b	.LBB91_133
.LBB91_127:
	mov	w26, wzr
	mov	w24, #-7
	cbnz	w20, .LBB91_133
	b	.LBB91_50
.LBB91_128:
	mov	w24, #-16
	b	.LBB91_133
.LBB91_129:
	mov	w26, wzr
	mov	w24, #-8
	cbnz	w20, .LBB91_133
	b	.LBB91_50
.LBB91_130:
	mov	w26, wzr
	mov	w24, #-9
	cbnz	w20, .LBB91_133
	b	.LBB91_50
.LBB91_131:
	mov	w26, wzr
	mov	w24, #-10
	cbnz	w20, .LBB91_133
	b	.LBB91_50
.LBB91_132:
	mov	w24, #-14
.LBB91_133:                             // %cleanup430
	mov	x0, x28
	bl	fclose
.LBB91_134:                             // %return
	mov	w0, w24
	add	sp, sp, #1, lsl #12     // =4096
	add	sp, sp, #368            // =368
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end91:
	.size	halide_debug_to_file, .Lfunc_end91-halide_debug_to_file
                                        // -- End function
	.section	.text.halide_cache_cleanup,"ax",@progbits
	.weak	halide_cache_cleanup    // -- Begin function halide_cache_cleanup
	.p2align	2
	.type	halide_cache_cleanup,@function
halide_cache_cleanup:                   // @halide_cache_cleanup
// %bb.0:                               // %entry
	b	halide_memoization_cache_cleanup
.Lfunc_end92:
	.size	halide_cache_cleanup, .Lfunc_end92-halide_cache_cleanup
                                        // -- End function
	.section	.text.halide_memoization_cache_cleanup,"ax",@progbits
	.weak	halide_memoization_cache_cleanup // -- Begin function halide_memoization_cache_cleanup
	.p2align	2
	.type	halide_memoization_cache_cleanup,@function
halide_memoization_cache_cleanup:       // @halide_memoization_cache_cleanup
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	adrp	x21, :got:_ZN6Halide7Runtime8Internal13cache_entriesE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal13cache_entriesE]
	mov	x20, xzr
	add	x29, sp, #32            // =32
	lsl	x8, x20, #3
	ldr	x19, [x21, x8]
	str	xzr, [x21, x8]
	cbnz	x19, .LBB93_3
.LBB93_1:                               // %while.end
                                        // =>This Inner Loop Header: Depth=1
	add	x20, x20, #1            // =1
	cmp	x20, #256               // =256
	b.eq	.LBB93_4
// %bb.2:                               // %for.body
                                        //   in Loop: Header=BB93_1 Depth=1
	lsl	x8, x20, #3
	ldr	x19, [x21, x8]
	str	xzr, [x21, x8]
	cbz	x19, .LBB93_1
.LBB93_3:                               // %while.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x22, [x19]
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
	mov	x0, xzr
	mov	x1, x19
	bl	halide_free
	mov	x19, x22
	cbnz	x22, .LBB93_3
	b	.LBB93_1
.LBB93_4:                               // %for.cond.cleanup
	adrp	x8, :got:_ZN6Halide7Runtime8Internal18current_cache_sizeE
	adrp	x9, :got:_ZN6Halide7Runtime8Internal18most_recently_usedE
	adrp	x10, :got:_ZN6Halide7Runtime8Internal19least_recently_usedE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal18current_cache_sizeE]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal18most_recently_usedE]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal19least_recently_usedE]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	str	xzr, [x8]
	str	xzr, [x9]
	str	xzr, [x10]
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end93:
	.size	halide_memoization_cache_cleanup, .Lfunc_end93-halide_memoization_cache_cleanup
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal10CacheEntry7destroyEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv // -- Begin function _ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv,@function
_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv: // @_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	ldr	w8, [x0, #56]
	mov	x19, x0
	add	x29, sp, #32            // =32
	cbz	w8, .LBB94_3
// %bb.1:                               // %for.body.lr.ph
	mov	x20, xzr
	mov	w21, #16
.LBB94_2:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, #72]
	mov	x0, xzr
	add	x8, x8, x21
	sub	x1, x8, #16             // =16
	bl	halide_device_free
	ldr	x8, [x19, #72]
	ldr	x0, [x8, x21]
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	mov	x1, x0
	mov	x0, xzr
	bl	halide_free
	ldr	w8, [x19, #56]
	add	x20, x20, #1            // =1
	add	x21, x21, #56           // =56
	cmp	x20, x8
	b.lo	.LBB94_2
.LBB94_3:                               // %for.cond.cleanup
	ldr	x1, [x19, #24]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	x0, xzr
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	b	halide_free
.Lfunc_end94:
	.size	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv, .Lfunc_end94-_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh // -- Begin function _ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh,@function
_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh: // @_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
// %bb.0:                               // %entry
	sub	x0, x0, #32             // =32
	ret
.Lfunc_end95:
	.size	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh, .Lfunc_end95-_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx // -- Begin function _ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx,@function
_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx: // @_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
// %bb.0:                               // %entry
	stp	x26, x25, [sp, #-80]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x19, x3
	mov	x20, x2
	mov	x21, x0
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
                                        // kill: def $w1 killed $w1 def $x1
	tbnz	w1, #31, .LBB96_5
// %bb.1:                               // %land.rhs.preheader
	sxtw	x1, w1
	add	x8, x21, #24            // =24
.LBB96_2:                               // %land.rhs
                                        // =>This Inner Loop Header: Depth=1
	ldr	x9, [x8, x1, lsl #3]
	cmp	x9, #1                  // =1
	b.ne	.LBB96_5
// %bb.3:                               // %while.body
                                        //   in Loop: Header=BB96_2 Depth=1
	sub	x9, x1, #1              // =1
	cmp	x1, #0                  // =0
	mov	x1, x9
	b.gt	.LBB96_2
// %bb.4:                               // %while.end.loopexit
	mov	w1, w9
.LBB96_5:                               // %while.end
	cmn	w1, #1                  // =1
	b.eq	.LBB96_10
// %bb.6:                               // %for.cond.preheader
	add	x23, x21, w1, sxtw #3
	ldr	x8, [x23, #24]!
	cbz	x8, .LBB96_9
// %bb.7:                               // %for.body.lr.ph
	sxtw	x8, w1
	add	x8, x21, x8, lsl #3
	mov	x24, xzr
	sub	w22, w1, #1             // =1
	add	x25, x8, #152           // =152
	add	x26, x8, #280           // =280
.LBB96_8:                               // %for.body
                                        // =>This Inner Loop Header: Depth=1
	mov	x0, x21
	mov	w1, w22
	mov	x2, x20
	mov	x3, x19
	bl	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
	ldr	x8, [x25]
	ldr	x9, [x23]
	ldr	x10, [x26]
	add	x24, x24, #1            // =1
	add	x20, x8, x20
	cmp	x24, x9
	add	x19, x10, x19
	b.lo	.LBB96_8
.LBB96_9:                               // %if.end
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldp	x26, x25, [sp], #80     // 16-byte Folded Reload
	ret
.LBB96_10:                              // %if.then
	ldp	x8, x9, [x21]
	ldr	x2, [x21, #408]
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	add	x1, x8, x20
	add	x0, x9, x19
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldp	x26, x25, [sp], #80     // 16-byte Folded Reload
	b	memcpy
.Lfunc_end96:
	.size	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx, .Lfunc_end96-_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv // -- Begin function _ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv,@function
_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv: // @_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
// %bb.0:                               // %entry
	ldp	x8, x9, [x0]
	cmp	x8, x9
	b.ne	.LBB97_2
// %bb.1:                               // %if.end
	ret
.LBB97_2:                               // %if.then
	ldr	x2, [x0, #16]
	mov	w1, #15
	mov	x3, xzr
	b	_ZN6Halide7Runtime8Internal18copy_memory_helperERKNS1_11device_copyEixx
.Lfunc_end97:
	.size	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv, .Lfunc_end97-_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b // -- Begin function _ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b,@function
_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b: // @_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
// %bb.0:                               // %entry
	sub	sp, sp, #448            // =448
	cmp	w1, #0                  // =0
	mov	w10, #16
	stp	x28, x19, [sp, #416]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #432]    // 16-byte Folded Spill
	csel	x9, x10, xzr, ne
	ldr	x11, [x0, x9]
	cmp	w3, #0                  // =0
	csel	x10, x10, xzr, ne
	mov	x9, sp
	str	x11, [sp]
	ldr	x11, [x2, x10]
	mov	w12, #1
	movi	v0.2d, #0000000000000000
	add	x10, x9, #280           // =280
	str	x11, [sp, #8]
	ldrb	w11, [x0, #33]
	add	x13, x9, #152           // =152
	dup	v1.2d, x12
	stur	q1, [sp, #24]
	add	x11, x11, #7            // =7
	lsr	x11, x11, #3
	str	x11, [sp, #408]
	stur	q0, [x9, #152]
	stp	q0, q0, [x10]
	stur	q1, [sp, #40]
	stur	q0, [x9, #168]
	str	x12, [sp, #56]
	stur	q0, [x9, #184]
	stp	q0, q0, [x10, #32]
	stp	q1, q1, [sp, #64]
	stur	q0, [x9, #200]
	str	xzr, [x10, #64]
	str	x12, [sp, #96]
	stur	q0, [x9, #216]
	stp	q0, q0, [sp, #352]
	stur	q1, [sp, #104]
	stur	q0, [x9, #232]
	stur	q1, [sp, #120]
	stur	q0, [x9, #248]
	stp	x12, x12, [sp, #136]
	str	q0, [x13, #112]
	str	q0, [sp, #384]
	str	xzr, [sp, #400]
	str	xzr, [sp, #16]
	ldrsw	x13, [x0, #36]
	add	x29, sp, #432           // =432
	cmp	w13, #1                 // =1
	and	x12, x13, #0xffffffff
	b.lt	.LBB98_3
// %bb.1:                               // %for.body19.lr.ph
	ldr	x15, [x0, #40]
	ldr	x14, [x2, #40]
	cmp	w13, #4                 // =4
	b.hi	.LBB98_4
// %bb.2:
	mov	x16, xzr
	mov	x17, xzr
	b	.LBB98_7
.LBB98_3:
	mov	x17, xzr
	b	.LBB98_10
.LBB98_4:                               // %vector.ph
	and	x16, x13, #0x3
	tst	x13, #0x3
	mov	w1, #4
	csel	x16, x1, x16, eq
	sub	x16, x13, x16
	add	x17, x14, #32           // =32
	add	x18, x15, #32           // =32
	movi	v0.2d, #0000000000000000
	mov	x1, x16
	movi	v1.2d, #0000000000000000
.LBB98_5:                               // %vector.body
                                        // =>This Inner Loop Header: Depth=1
	ldp	q2, q3, [x18, #-32]
	ldp	q4, q5, [x18], #64
	ldp	q6, q7, [x17, #-32]
	ldp	q16, q17, [x17], #64
	zip2	v18.4s, v2.4s, v3.4s
	zip2	v19.4s, v4.4s, v5.4s
	sub	v3.4s, v7.4s, v3.4s
	sub	v2.4s, v6.4s, v2.4s
	sub	v5.4s, v17.4s, v5.4s
	sub	v4.4s, v16.4s, v4.4s
	zip1	v2.4s, v2.4s, v3.4s
	zip1	v3.4s, v4.4s, v5.4s
	mul	v2.2s, v2.2s, v18.2s
	mul	v3.2s, v3.2s, v19.2s
	subs	x1, x1, #4              // =4
	saddw	v0.2d, v0.2d, v2.2s
	saddw	v1.2d, v1.2d, v3.2s
	b.ne	.LBB98_5
// %bb.6:                               // %middle.block
	add	v0.2d, v1.2d, v0.2d
	addp	d0, v0.2d
	fmov	x17, d0
.LBB98_7:                               // %for.body19.preheader
	sub	x18, x13, x16
	lsl	x16, x16, #4
	add	x15, x15, x16
	add	x15, x15, #8            // =8
	add	x14, x14, x16
.LBB98_8:                               // %for.body19
                                        // =>This Inner Loop Header: Depth=1
	ldrsw	x16, [x15]
	ldrsw	x1, [x14], #16
	ldursw	x3, [x15, #-8]
	subs	x18, x18, #1            // =1
	add	x15, x15, #16           // =16
	sub	x1, x1, x3
	madd	x17, x1, x16, x17
	b.ne	.LBB98_8
// %bb.9:                               // %for.cond16.for.cond.cleanup18_crit_edge
	str	x17, [sp, #16]
.LBB98_10:                              // %for.cond.cleanup18
	ldr	x14, [sp, #408]
	mul	x15, x14, x17
	str	x15, [sp, #16]
	ldr	w15, [x2, #36]
	cmp	w12, w15
	b.ne	.LBB98_27
// %bb.11:                              // %lor.lhs.false
	cmp	w12, #16                // =16
	b.gt	.LBB98_27
// %bb.12:                              // %lor.lhs.false
	ldrb	w15, [x2, #33]
	add	w15, w15, #7            // =7
	lsr	w15, w15, #3
	cmp	w11, w15
	b.ne	.LBB98_27
// %bb.13:                              // %if.end
	cbz	x14, .LBB98_27
// %bb.14:                              // %for.cond53.preheader
	cmp	w13, #1                 // =1
	b.lt	.LBB98_32
// %bb.15:                              // %for.body57.lr.ph
	ldr	x14, [x2, #40]
	ldr	x15, [x0, #40]
	mov	x16, sp
	mov	x13, xzr
	add	x17, x16, #280          // =280
	add	x18, x16, #144          // =144
	b	.LBB98_17
.LBB98_16:                              // %for.cond.cleanup91
                                        //   in Loop: Header=BB98_17 Depth=1
	add	x3, x14, x13, lsl #4
	ldrsw	x3, [x3, #4]
	add	x13, x13, #1            // =1
	add	x2, x16, x2, lsl #3
	cmp	x13, x12
	add	x18, x18, #8            // =8
	str	x0, [x2, #280]
	str	x1, [x2, #152]
	str	x3, [x2, #24]
	b.eq	.LBB98_28
.LBB98_17:                              // %for.body57
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB98_20 Depth 2
                                        //     Child Loop BB98_25 Depth 2
	lsl	x0, x13, #4
	add	x1, x14, x0
	ldrsw	x2, [x1, #8]
	add	x0, x15, x0
	ldrsw	x1, [x0, #8]
	mul	x0, x2, x11
	cbz	x13, .LBB98_22
// %bb.18:                              // %for.body78.lr.ph
                                        //   in Loop: Header=BB98_17 Depth=1
	cbz	w0, .LBB98_26
// %bb.19:                              // %for.body78.us.preheader
                                        //   in Loop: Header=BB98_17 Depth=1
	mov	x2, xzr
.LBB98_20:                              // %for.body78.us
                                        //   Parent Loop BB98_17 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x3, [x17, x2, lsl #3]
	cmp	x3, x0
	b.hi	.LBB98_23
// %bb.21:                              // %for.inc86.us
                                        //   in Loop: Header=BB98_20 Depth=2
	add	x2, x2, #1              // =1
	cmp	x13, x2
	b.ne	.LBB98_20
	b	.LBB98_23
.LBB98_22:                              //   in Loop: Header=BB98_17 Depth=1
	mov	w2, wzr
.LBB98_23:                              // %for.end88
                                        //   in Loop: Header=BB98_17 Depth=1
	mov	w2, w2
	cmp	x13, x2
	mul	x1, x1, x11
	b.ls	.LBB98_16
.LBB98_24:                              // %for.body92.preheader
                                        //   in Loop: Header=BB98_17 Depth=1
	sxtw	x3, w2
	mov	x4, x18
	mov	x5, x13
.LBB98_25:                              // %for.body92
                                        //   Parent Loop BB98_17 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldur	x6, [x4, #-128]
	ldr	x7, [x4, #128]
	ldr	x19, [x4]
	sub	x5, x5, #1              // =1
	cmp	x5, x3
	stur	x6, [x4, #-120]
	str	x7, [x4, #136]
	str	x19, [x4, #8]
	sub	x4, x4, #8              // =8
	b.gt	.LBB98_25
	b	.LBB98_16
.LBB98_26:                              // %for.body78.preheader
                                        //   in Loop: Header=BB98_17 Depth=1
	mov	w2, w13
	mov	w2, w2
	cmp	x13, x2
	mul	x1, x1, x11
	b.ls	.LBB98_16
	b	.LBB98_24
.LBB98_27:                              // %if.then
	movi	v0.2d, #0000000000000000
	stp	q0, q0, [x8, #384]
	stp	q0, q0, [x8, #352]
	stp	q0, q0, [x8, #320]
	stp	q0, q0, [x8, #288]
	stp	q0, q0, [x8, #256]
	stp	q0, q0, [x8, #224]
	stp	q0, q0, [x8, #192]
	stp	q0, q0, [x8, #160]
	stp	q0, q0, [x8, #128]
	stp	q0, q0, [x8, #96]
	stp	q0, q0, [x8, #64]
	stp	q0, q0, [x8, #32]
	stp	q0, q0, [x8]
	ldp	x29, x30, [sp, #432]    // 16-byte Folded Reload
	ldp	x28, x19, [sp, #416]    // 16-byte Folded Reload
	add	sp, sp, #448            // =448
	ret
.LBB98_28:                              // %while.cond.preheader
	ldr	x12, [sp, #408]
	ldr	x11, [sp, #152]
	cmp	x12, x11
	b.ne	.LBB98_32
// %bb.29:                              // %land.rhs.lr.ph
	ldr	x13, [sp, #280]
	mov	w11, #1
.LBB98_30:                              // %land.rhs
                                        // =>This Inner Loop Header: Depth=1
	cmp	x12, x13
	b.ne	.LBB98_32
// %bb.31:                              // %while.body
                                        //   in Loop: Header=BB98_30 Depth=1
	ldr	x12, [sp, #24]
	ldp	q0, q2, [sp, #32]
	ldp	q1, q3, [sp, #160]
	mul	x12, x12, x13
	stur	q0, [sp, #24]
	str	x12, [sp, #408]
	stur	q1, [x9, #152]
	stur	q2, [sp, #40]
	stur	q3, [x9, #168]
	ldp	q0, q2, [sp, #288]
	stp	q0, q2, [x10]
	ldr	x13, [sp, #64]
	ldr	x14, [sp, #320]
	ldr	x15, [sp, #192]
	ldur	q2, [sp, #72]
	str	x13, [sp, #56]
	str	x14, [sp, #312]
	str	x15, [sp, #184]
	str	q2, [sp, #64]
	ldur	q2, [x9, #200]
	ldur	q3, [sp, #88]
	ldr	x13, [sp, #232]
	ldr	x14, [sp, #360]
	str	q2, [sp, #192]
	ldr	q2, [x10, #48]
	str	q3, [sp, #80]
	ldur	q3, [sp, #104]
	str	q2, [sp, #320]
	ldur	q2, [x9, #216]
	str	q2, [sp, #208]
	ldr	q2, [x10, #64]
	str	q3, [sp, #96]
	ldr	q3, [sp, #240]
	str	x13, [sp, #224]
	str	x14, [sp, #352]
	str	q2, [sp, #336]
	stur	q3, [x9, #232]
	ldr	q2, [sp, #368]
	fmov	x13, d1
	cmp	x12, x13
	str	q2, [x10, #80]
	ldur	q2, [sp, #120]
	ldr	q3, [sp, #256]
	str	q2, [sp, #112]
	stur	q3, [x9, #248]
	ldr	q2, [sp, #384]
	str	q2, [x10, #96]
	ldr	x13, [sp, #400]
	ldur	q1, [x9, #136]
	ldr	x14, [sp, #272]
	str	x11, [sp, #144]
	stp	x13, xzr, [sp, #392]
	fmov	x13, d0
	stp	x14, xzr, [sp, #264]
	str	q1, [sp, #128]
	b.eq	.LBB98_30
.LBB98_32:                              // %while.end
	mov	x1, sp
	mov	w2, #416
	mov	x0, x8
	bl	memcpy
	ldp	x29, x30, [sp, #432]    // 16-byte Folded Reload
	ldp	x28, x19, [sp, #416]    // 16-byte Folded Reload
	add	sp, sp, #448            // =448
	ret
.Lfunc_end98:
	.size	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b, .Lfunc_end98-_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m // -- Begin function _ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m,@function
_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m: // @_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	x29, sp
	bl	memcmp
	cmp	w0, #0                  // =0
	cset	w0, eq
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end99:
	.size	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m, .Lfunc_end99-_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t // -- Begin function _ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t,@function
_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t: // @_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
// %bb.0:                               // %entry
	ldrsw	x8, [x0, #36]
	cmp	w8, #1                  // =1
	b.lt	.LBB100_7
// %bb.1:                               // %for.body.lr.ph
	ldr	x10, [x0, #40]
	add	x9, x1, #8              // =8
	add	x10, x10, #8            // =8
.LBB100_2:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldur	w11, [x10, #-8]
	ldur	w12, [x9, #-8]
	cmp	w11, w12
	b.ne	.LBB100_8
// %bb.3:                               // %land.lhs.true.i.i
                                        //   in Loop: Header=BB100_2 Depth=1
	ldur	w11, [x10, #-4]
	ldur	w12, [x9, #-4]
	cmp	w11, w12
	b.ne	.LBB100_8
// %bb.4:                               // %land.lhs.true5.i.i
                                        //   in Loop: Header=BB100_2 Depth=1
	ldr	w11, [x10]
	ldr	w12, [x9]
	cmp	w11, w12
	b.ne	.LBB100_8
// %bb.5:                               // %_ZNK18halide_dimension_tneERKS_.exit
                                        //   in Loop: Header=BB100_2 Depth=1
	ldr	w11, [x10, #4]
	ldr	w12, [x9, #4]
	cmp	w11, w12
	b.ne	.LBB100_8
// %bb.6:                               // %for.cond
                                        //   in Loop: Header=BB100_2 Depth=1
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	add	x10, x10, #16           // =16
	b.ne	.LBB100_2
.LBB100_7:
	mov	w0, #1
	ret
.LBB100_8:
	mov	w0, wzr
	ret
.Lfunc_end100:
	.size	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t, .Lfunc_end100-_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_ // -- Begin function _ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_,@function
_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_: // @_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_
// %bb.0:                               // %entry
	str	x25, [sp, #-80]!        // 8-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	stp	xzr, xzr, [x0]
	str	xzr, [x0, #16]
	str	x2, [x0, #32]
	stp	w3, wzr, [x0, #48]
	str	w5, [x0, #56]
	ldrsw	x8, [x4, #36]
	add	w9, w5, #1              // =1
	mov	w25, #56
	mov	x22, x1
	str	w8, [x0, #60]
	mul	x8, x9, x8
	lsl	x8, x8, #4
	umaddl	x24, w5, w25, x8
	mov	x20, x0
	add	x1, x24, x2
	mov	x0, xzr
	add	x29, sp, #64            // =64
	mov	x19, x6
	mov	w23, w5
	mov	x21, x4
	bl	halide_malloc
	str	x0, [x20, #24]
	cbz	x0, .LBB101_16
// %bb.1:                               // %if.end
	ldr	x9, [x20, #32]
	umull	x8, w23, w25
	add	x8, x0, x8
	stp	x8, x0, [x20, #64]
	add	x8, x0, x24
	str	x8, [x20, #40]
	cbz	x9, .LBB101_5
// %bb.2:                               // %for.body.preheader
	ldrb	w9, [x22]
	strb	w9, [x8]
	ldr	x8, [x20, #32]
	cmp	x8, #2                  // =2
	b.lo	.LBB101_5
// %bb.3:                               // %for.body.for.body_crit_edge.preheader
	mov	w8, #1
.LBB101_4:                              // %for.body.for.body_crit_edge
                                        // =>This Inner Loop Header: Depth=1
	ldr	x9, [x20, #40]
	ldrb	w10, [x22, x8]
	strb	w10, [x9, x8]
	ldr	x9, [x20, #32]
	add	x8, x8, #1              // =1
	cmp	x8, x9
	b.lo	.LBB101_4
.LBB101_5:                              // %for.cond23.preheader
	ldr	w8, [x20, #60]
	cmp	w8, #1                  // =1
	b.lt	.LBB101_8
// %bb.6:                               // %for.body27.lr.ph
	mov	x8, xzr
	mov	x9, xzr
.LBB101_7:                              // %for.body27
                                        // =>This Inner Loop Header: Depth=1
	ldr	x10, [x21, #40]
	ldr	x11, [x20, #64]
	add	x9, x9, #1              // =1
	ldr	q0, [x10, x8]
	str	q0, [x11, x8]
	ldrsw	x10, [x20, #60]
	add	x8, x8, #16             // =16
	cmp	x9, x10
	b.lt	.LBB101_7
.LBB101_8:                              // %for.cond36.preheader
	ldr	w8, [x20, #56]
	cbz	w8, .LBB101_15
// %bb.9:                               // %for.body40.preheader
	mov	x9, xzr
	mov	w8, #56
	b	.LBB101_11
.LBB101_10:                             // %for.cond36.loopexit
                                        //   in Loop: Header=BB101_11 Depth=1
	ldr	w9, [x20, #56]
	cmp	x10, x9
	mov	x9, x10
	b.hs	.LBB101_15
.LBB101_11:                             // %for.body40
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB101_14 Depth 2
	ldr	x11, [x19, x9, lsl #3]
	ldr	x10, [x20, #72]
	mul	x12, x9, x8
	ldr	x13, [x11, #48]
	ldp	q2, q0, [x11, #16]
	ldr	q1, [x11]
	add	x10, x10, x12
	str	x13, [x10, #48]
	stp	q2, q0, [x10, #16]
	str	q1, [x10]
	ldp	x14, x11, [x20, #64]
	ldr	w13, [x20, #60]
	add	x10, x9, #1             // =1
	add	x12, x11, x12
	mul	w11, w13, w10
	add	x11, x14, w11, uxtw #4
	cmp	w13, #1                 // =1
	str	x11, [x12, #40]
	b.lt	.LBB101_10
// %bb.12:                              // %for.body59.preheader
                                        //   in Loop: Header=BB101_11 Depth=1
	ldr	x12, [x19, x9, lsl #3]
	ldr	x12, [x12, #40]
	ldr	q0, [x12]
	str	q0, [x11]
	ldr	w11, [x20, #60]
	cmp	w11, #2                 // =2
	b.lt	.LBB101_10
// %bb.13:                              // %for.body59.for.body59_crit_edge.preheader
                                        //   in Loop: Header=BB101_11 Depth=1
	mov	w11, #16
	mov	w12, #1
.LBB101_14:                             // %for.body59.for.body59_crit_edge
                                        //   Parent Loop BB101_11 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	ldr	x13, [x19, x9, lsl #3]
	ldr	x14, [x20, #72]
	add	x12, x12, #1            // =1
	ldr	x13, [x13, #40]
	madd	x14, x9, x8, x14
	ldr	x14, [x14, #40]
	ldr	q0, [x13, x11]
	str	q0, [x14, x11]
	ldrsw	x13, [x20, #60]
	add	x11, x11, #16           // =16
	cmp	x12, x13
	b.lt	.LBB101_14
	b	.LBB101_10
.LBB101_15:
	mov	w0, #1
.LBB101_16:                             // %cleanup
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldr	x25, [sp], #80          // 8-byte Folded Reload
	ret
.Lfunc_end101:
	.size	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_, .Lfunc_end101-_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal8djb_hashEPKhm,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal8djb_hashEPKhm // -- Begin function _ZN6Halide7Runtime8Internal8djb_hashEPKhm
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal8djb_hashEPKhm,@function
_ZN6Halide7Runtime8Internal8djb_hashEPKhm: // @_ZN6Halide7Runtime8Internal8djb_hashEPKhm
// %bb.0:                               // %entry
	mov	w8, #5381
	cbz	x1, .LBB102_2
.LBB102_1:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w9, [x0], #1
	add	w8, w8, w8, lsl #5
	subs	x1, x1, #1              // =1
	add	w8, w8, w9
	b.ne	.LBB102_1
.LBB102_2:                              // %for.cond.cleanup
	mov	w0, w8
	ret
.Lfunc_end102:
	.size	_ZN6Halide7Runtime8Internal8djb_hashEPKhm, .Lfunc_end102-_ZN6Halide7Runtime8Internal8djb_hashEPKhm
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal11prune_cacheEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal11prune_cacheEv // -- Begin function _ZN6Halide7Runtime8Internal11prune_cacheEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal11prune_cacheEv,@function
_ZN6Halide7Runtime8Internal11prune_cacheEv: // @_ZN6Halide7Runtime8Internal11prune_cacheEv
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	adrp	x21, :got:_ZN6Halide7Runtime8Internal19least_recently_usedE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal19least_recently_usedE]
	add	x29, sp, #80            // =80
	ldr	x19, [x21]
	cbz	x19, .LBB103_53
// %bb.1:                               // %entry
	adrp	x22, :got:_ZN6Halide7Runtime8Internal18current_cache_sizeE
	adrp	x23, :got:_ZN6Halide7Runtime8Internal14max_cache_sizeE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal18current_cache_sizeE]
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal14max_cache_sizeE]
	ldr	x8, [x22]
	ldr	x9, [x23]
	cmp	x8, x9
	b.le	.LBB103_53
// %bb.2:                               // %while.body.preheader
	adrp	x24, :got:_ZN6Halide7Runtime8Internal13cache_entriesE
	adrp	x25, :got:_ZN6Halide7Runtime8Internal18most_recently_usedE
	ldr	x24, [x24, :got_lo12:_ZN6Halide7Runtime8Internal13cache_entriesE]
	ldr	x25, [x25, :got_lo12:_ZN6Halide7Runtime8Internal18most_recently_usedE]
	adrp	x20, .L.str.4.44
	mov	w26, #56
	add	x20, x20, :lo12:.L.str.4.44
.LBB103_3:                              // %while.body
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB103_5 Depth 2
                                        //     Child Loop BB103_28 Depth 2
	ldr	w10, [x19, #52]
	ldr	x27, [x19, #8]
	cbnz	w10, .LBB103_50
// %bb.4:                               // %if.then
                                        //   in Loop: Header=BB103_3 Depth=1
	ldrb	w9, [x19, #48]
	ldr	x8, [x24, x9, lsl #3]
	cmp	x8, x19
	b.eq	.LBB103_7
.LBB103_5:                              // %while.cond9
                                        //   Parent Loop BB103_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	mov	x28, x8
	cbz	x8, .LBB103_8
// %bb.6:                               // %land.rhs11
                                        //   in Loop: Header=BB103_5 Depth=2
	ldr	x8, [x28]
	cmp	x8, x19
	b.ne	.LBB103_5
	b	.LBB103_9
.LBB103_7:                              // %if.then6
                                        //   in Loop: Header=BB103_3 Depth=1
	ldr	x8, [x19]
	str	x8, [x24, x9, lsl #3]
	ldr	x8, [x21]
	cmp	x8, x19
	b.ne	.LBB103_11
	b	.LBB103_10
.LBB103_8:                              // %if.then18
                                        //   in Loop: Header=BB103_3 Depth=1
	mov	x0, xzr
	mov	x1, x20
	bl	halide_print
	bl	abort
.LBB103_9:                              // %if.end
                                        //   in Loop: Header=BB103_3 Depth=1
	ldr	x8, [x19]
	str	x8, [x28]
	ldr	x8, [x21]
	cmp	x8, x19
	b.ne	.LBB103_11
.LBB103_10:                             // %if.then23
                                        //   in Loop: Header=BB103_3 Depth=1
	str	x27, [x21]
.LBB103_11:                             // %if.end24
                                        //   in Loop: Header=BB103_3 Depth=1
	cbz	x27, .LBB103_13
// %bb.12:                              // %if.then26
                                        //   in Loop: Header=BB103_3 Depth=1
	ldr	x8, [x19, #16]
	str	x8, [x27, #16]
.LBB103_13:                             // %if.end28
                                        //   in Loop: Header=BB103_3 Depth=1
	ldr	x8, [x25]
	cmp	x8, x19
	b.eq	.LBB103_52
// %bb.14:                              // %if.end28.if.end32_crit_edge
                                        //   in Loop: Header=BB103_3 Depth=1
	ldr	x8, [x19, #16]
	cbz	x8, .LBB103_16
.LBB103_15:                             // %if.then35
                                        //   in Loop: Header=BB103_3 Depth=1
	str	x27, [x19, #16]
.LBB103_16:                             // %if.end37
                                        //   in Loop: Header=BB103_3 Depth=1
	ldr	w8, [x19, #56]
	cbz	w8, .LBB103_49
// %bb.17:                              // %for.body.lr.ph
                                        //   in Loop: Header=BB103_3 Depth=1
	ldr	x10, [x19, #72]
	ldr	x9, [x22]
	mov	x11, xzr
	madd	x12, x11, x26, x10
	ldrsw	x12, [x12, #36]
	cmp	w12, #0                 // =0
	b.gt	.LBB103_21
	b	.LBB103_23
.LBB103_18:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
                                        //   in Loop: Header=BB103_3 Depth=1
	add	x12, x14, #1            // =1
.LBB103_19:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
                                        //   in Loop: Header=BB103_3 Depth=1
	add	x13, x15, #7            // =7
	sub	x12, x12, x17
	add	x11, x11, #1            // =1
	lsr	x13, x13, #3
	cmp	x11, x8
	msub	x9, x12, x13, x9
	b.eq	.LBB103_48
// %bb.20:                              // %for.body
                                        //   in Loop: Header=BB103_3 Depth=1
	madd	x12, x11, x26, x10
	ldrsw	x12, [x12, #36]
	cmp	w12, #0                 // =0
	b.le	.LBB103_23
.LBB103_21:                             // %for.body.lr.ph.i.i
                                        //   in Loop: Header=BB103_3 Depth=1
	madd	x13, x11, x26, x10
	ldr	x13, [x13, #40]
	cmp	w12, #3                 // =3
	b.hs	.LBB103_24
// %bb.22:                              //   in Loop: Header=BB103_3 Depth=1
	mov	x15, xzr
	mov	x14, xzr
	b	.LBB103_31
.LBB103_23:                             // %_ZNK15halide_buffer_t3endEv.exit.thread.i
                                        //   in Loop: Header=BB103_3 Depth=1
	madd	x12, x11, x26, x10
	ldrb	w15, [x12, #33]
	mov	x17, xzr
	mov	w12, #1
	b	.LBB103_19
.LBB103_24:                             // %vector.ph30
                                        //   in Loop: Header=BB103_3 Depth=1
	and	x15, x12, #0xfffffffffffffffe
	mov	x14, xzr
	mov	x16, xzr
	add	x17, x13, #24           // =24
	mov	x18, x15
	ldur	w1, [x17, #-16]
	ldr	w0, [x17]
                                        // implicit-def: $w2
	cmp	w1, #1                  // =1
	b.ge	.LBB103_27
	b	.LBB103_28
.LBB103_25:                             // %pred.load.continue44
                                        //   in Loop: Header=BB103_28 Depth=2
	sub	w2, w2, #1              // =1
	sub	w3, w3, #1              // =1
	cmp	w1, #0                  // =0
	mul	w1, w2, w1
	mul	w2, w3, w0
	csel	w1, w1, wzr, gt
	cmp	w0, #0                  // =0
	csel	w0, w2, wzr, gt
	add	x14, x14, w1, sxtw
	subs	x18, x18, #2            // =2
	add	x16, x16, w0, sxtw
	add	x17, x17, #32           // =32
	b.eq	.LBB103_30
// %bb.26:                              // %vector.body26
                                        //   in Loop: Header=BB103_28 Depth=2
	ldur	w1, [x17, #-16]
	ldr	w0, [x17]
                                        // implicit-def: $w2
	cmp	w1, #1                  // =1
	b.lt	.LBB103_28
.LBB103_27:                             // %pred.load.if41
                                        //   in Loop: Header=BB103_3 Depth=1
	ldur	w2, [x17, #-20]
.LBB103_28:                             // %pred.load.continue42
                                        //   Parent Loop BB103_3 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	cmp	w0, #1                  // =1
                                        // implicit-def: $w3
	b.lt	.LBB103_25
// %bb.29:                              // %pred.load.if43
                                        //   in Loop: Header=BB103_28 Depth=2
	ldur	w3, [x17, #-4]
	b	.LBB103_25
.LBB103_30:                             // %middle.block27
                                        //   in Loop: Header=BB103_3 Depth=1
	cmp	x15, x12
	add	x14, x16, x14
	b.eq	.LBB103_35
.LBB103_31:                             // %for.body.i.i.preheader
                                        //   in Loop: Header=BB103_3 Depth=1
	sub	x16, x12, x15
	add	x15, x13, x15, lsl #4
	add	x15, x15, #8            // =8
	ldrsw	x17, [x15]
	cmp	w17, #1                 // =1
	b.ge	.LBB103_34
.LBB103_32:                             // %for.inc.i.i
                                        //   in Loop: Header=BB103_3 Depth=1
	subs	x16, x16, #1            // =1
	add	x15, x15, #16           // =16
	b.eq	.LBB103_35
.LBB103_33:                             // %for.body.i.i
                                        //   in Loop: Header=BB103_3 Depth=1
	ldrsw	x17, [x15]
	cmp	w17, #1                 // =1
	b.lt	.LBB103_32
.LBB103_34:                             // %if.then.i.i
                                        //   in Loop: Header=BB103_3 Depth=1
	ldursw	x18, [x15, #-4]
	sub	x18, x18, #1            // =1
	madd	x14, x18, x17, x14
	subs	x16, x16, #1            // =1
	add	x15, x15, #16           // =16
	b.ne	.LBB103_33
.LBB103_35:                             // %for.body.lr.ph.i5.i
                                        //   in Loop: Header=BB103_3 Depth=1
	madd	x15, x11, x26, x10
	ldrb	w15, [x15, #33]
	cmp	w12, #3                 // =3
	b.hs	.LBB103_37
// %bb.36:                              //   in Loop: Header=BB103_3 Depth=1
	mov	x16, xzr
	mov	x17, xzr
	b	.LBB103_44
.LBB103_37:                             // %vector.ph
                                        //   in Loop: Header=BB103_3 Depth=1
	and	x16, x12, #0xfffffffffffffffe
	mov	x17, xzr
	mov	x18, xzr
	add	x0, x13, #24            // =24
	mov	x1, x16
	ldur	w2, [x0, #-16]
	ldr	w3, [x0]
                                        // implicit-def: $w4
	tbz	w2, #31, .LBB103_40
	b	.LBB103_41
.LBB103_38:                             // %pred.load.continue24
                                        //   in Loop: Header=BB103_3 Depth=1
	sub	w4, w4, #1              // =1
	sub	w5, w5, #1              // =1
	mul	w4, w4, w2
	mul	w5, w5, w3
	and	w2, w4, w2, asr #31
	and	w3, w5, w3, asr #31
	subs	x1, x1, #2              // =2
	add	x17, x17, w2, sxtw
	add	x18, x18, w3, sxtw
	add	x0, x0, #32             // =32
	b.eq	.LBB103_43
// %bb.39:                              // %vector.body
                                        //   in Loop: Header=BB103_3 Depth=1
	ldur	w2, [x0, #-16]
	ldr	w3, [x0]
                                        // implicit-def: $w4
	tbnz	w2, #31, .LBB103_41
.LBB103_40:                             // %pred.load.continue
                                        //   in Loop: Header=BB103_3 Depth=1
                                        // implicit-def: $w5
	tbz	w3, #31, .LBB103_38
	b	.LBB103_42
.LBB103_41:                             // %pred.load.if
                                        //   in Loop: Header=BB103_3 Depth=1
	ldur	w4, [x0, #-20]
                                        // implicit-def: $w5
	tbz	w3, #31, .LBB103_38
.LBB103_42:                             // %pred.load.if23
                                        //   in Loop: Header=BB103_3 Depth=1
	ldur	w5, [x0, #-4]
	b	.LBB103_38
.LBB103_43:                             // %middle.block
                                        //   in Loop: Header=BB103_3 Depth=1
	cmp	x16, x12
	add	x17, x18, x17
	b.eq	.LBB103_18
.LBB103_44:                             // %for.body.i16.i.preheader
                                        //   in Loop: Header=BB103_3 Depth=1
	add	x13, x13, x16, lsl #4
	sub	x12, x12, x16
	add	x13, x13, #8            // =8
	ldrsw	x16, [x13]
	tbnz	w16, #31, .LBB103_47
.LBB103_45:                             // %for.inc.i26.i
                                        //   in Loop: Header=BB103_3 Depth=1
	subs	x12, x12, #1            // =1
	add	x13, x13, #16           // =16
	b.eq	.LBB103_18
.LBB103_46:                             // %for.body.i16.i
                                        //   in Loop: Header=BB103_3 Depth=1
	ldrsw	x16, [x13]
	tbz	w16, #31, .LBB103_45
.LBB103_47:                             // %if.then.i22.i
                                        //   in Loop: Header=BB103_3 Depth=1
	ldursw	x18, [x13, #-4]
	sub	x18, x18, #1            // =1
	madd	x17, x18, x16, x17
	subs	x12, x12, #1            // =1
	add	x13, x13, #16           // =16
	b.ne	.LBB103_46
	b	.LBB103_18
.LBB103_48:                             // %for.cond.for.cond.cleanup_crit_edge
                                        //   in Loop: Header=BB103_3 Depth=1
	str	x9, [x22]
.LBB103_49:                             // %for.cond.cleanup
                                        //   in Loop: Header=BB103_3 Depth=1
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal10CacheEntry7destroyEv
	mov	x0, xzr
	mov	x1, x19
	bl	halide_free
	ldr	x8, [x22]
	ldr	x9, [x23]
.LBB103_50:                             // %if.end41
                                        //   in Loop: Header=BB103_3 Depth=1
	cbz	x27, .LBB103_53
// %bb.51:                              // %if.end41
                                        //   in Loop: Header=BB103_3 Depth=1
	cmp	x8, x9
	mov	x19, x27
	b.gt	.LBB103_3
	b	.LBB103_53
.LBB103_52:                             // %if.then30
                                        //   in Loop: Header=BB103_3 Depth=1
	ldr	x8, [x19, #16]
	str	x8, [x25]
	cbnz	x8, .LBB103_15
	b	.LBB103_16
.LBB103_53:                             // %while.end42
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end103:
	.size	_ZN6Halide7Runtime8Internal11prune_cacheEv, .Lfunc_end103-_ZN6Halide7Runtime8Internal11prune_cacheEv
                                        // -- End function
	.section	.text.halide_memoization_cache_set_size,"ax",@progbits
	.weak	halide_memoization_cache_set_size // -- Begin function halide_memoization_cache_set_size
	.p2align	2
	.type	halide_memoization_cache_set_size,@function
halide_memoization_cache_set_size:      // @halide_memoization_cache_set_size
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x19, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	cmp	x0, #0                  // =0
	mov	w8, #1048576
	csel	x20, x8, x0, eq
	mov	x0, x19
	add	x29, sp, #16            // =16
	bl	halide_mutex_lock
	adrp	x8, :got:_ZN6Halide7Runtime8Internal14max_cache_sizeE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal14max_cache_sizeE]
	str	x20, [x8]
	bl	_ZN6Halide7Runtime8Internal11prune_cacheEv
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_mutex_unlock
.Lfunc_end104:
	.size	halide_memoization_cache_set_size, .Lfunc_end104-halide_memoization_cache_set_size
                                        // -- End function
	.section	.text.halide_memoization_cache_lookup,"ax",@progbits
	.weak	halide_memoization_cache_lookup // -- Begin function halide_memoization_cache_lookup
	.p2align	2
	.type	halide_memoization_cache_lookup,@function
halide_memoization_cache_lookup:        // @halide_memoization_cache_lookup
// %bb.0:                               // %entry
	sub	sp, sp, #112            // =112
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
                                        // kill: def $w2 killed $w2 def $x2
	sxtw	x25, w2
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	mov	x24, x1
	mov	x20, x0
	mov	x0, x1
	mov	x1, x25
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #96            // =96
	mov	x19, x5
	mov	w28, w4
	mov	x23, x3
	bl	_ZN6Halide7Runtime8Internal8djb_hashEPKhm
	mov	w21, w0
	and	w22, w0, #0xff
	adrp	x0, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	bl	halide_mutex_lock
	adrp	x8, :got:_ZN6Halide7Runtime8Internal13cache_entriesE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal13cache_entriesE]
	ldr	x26, [x8, w22, uxtw #3]
	cbz	x26, .LBB105_32
// %bb.1:                               // %while.body.lr.ph
	cmp	w28, #0                 // =0
	b.le	.LBB105_14
// %bb.2:                               // %while.body.us.preheader
	sxtw	x27, w28
	ldr	w8, [x26, #48]
	cmp	w8, w21
	b.eq	.LBB105_5
.LBB105_3:                              // %if.end67.us
                                        // =>This Inner Loop Header: Depth=1
	ldr	x26, [x26]
	cbz	x26, .LBB105_32
// %bb.4:                               // %while.body.us
                                        //   in Loop: Header=BB105_3 Depth=1
	ldr	w8, [x26, #48]
	cmp	w8, w21
	b.ne	.LBB105_3
.LBB105_5:                              // %land.lhs.true.us
	ldr	x8, [x26, #32]
	cmp	x8, x25
	b.ne	.LBB105_3
// %bb.6:                               // %land.lhs.true7.us
	ldr	x0, [x26, #40]
	mov	x1, x24
	mov	x2, x25
	bl	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
	cbz	w0, .LBB105_3
// %bb.7:                               // %land.lhs.true10.us
	ldr	x1, [x26, #64]
	mov	x0, x23
	bl	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	cbz	w0, .LBB105_3
// %bb.8:                               // %land.lhs.true13.us
	ldr	w8, [x26, #56]
	cmp	w8, w28
	b.ne	.LBB105_3
// %bb.9:                               // %for.body.lr.ph.us
	str	x28, [sp, #8]           // 8-byte Folded Spill
	mov	x28, xzr
	mov	w22, #40
.LBB105_10:                             // %for.body.us
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x26, #72]
	ldr	x0, [x19, x28, lsl #3]
	ldr	x1, [x8, x22]
	bl	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	add	x28, x28, #1            // =1
	cmp	x28, x27
	b.ge	.LBB105_12
// %bb.11:                              // %for.body.us
                                        //   in Loop: Header=BB105_10 Depth=1
	add	x22, x22, #56           // =56
	tbnz	w0, #0, .LBB105_10
.LBB105_12:                             // %for.cond.for.cond.cleanup_crit_edge.us
	ldr	x28, [sp, #8]           // 8-byte Folded Reload
	tbz	w0, #0, .LBB105_3
	b	.LBB105_19
.LBB105_13:                             // %if.end67
                                        //   in Loop: Header=BB105_14 Depth=1
	ldr	x26, [x26]
	cbz	x26, .LBB105_32
.LBB105_14:                             // %while.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	w8, [x26, #48]
	cmp	w8, w21
	b.ne	.LBB105_13
// %bb.15:                              // %land.lhs.true
                                        //   in Loop: Header=BB105_14 Depth=1
	ldr	x8, [x26, #32]
	cmp	x8, x25
	b.ne	.LBB105_13
// %bb.16:                              // %land.lhs.true7
                                        //   in Loop: Header=BB105_14 Depth=1
	ldr	x0, [x26, #40]
	mov	x1, x24
	mov	x2, x25
	bl	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
	cbz	w0, .LBB105_13
// %bb.17:                              // %land.lhs.true10
                                        //   in Loop: Header=BB105_14 Depth=1
	ldr	x1, [x26, #64]
	mov	x0, x23
	bl	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	cbz	w0, .LBB105_13
// %bb.18:                              // %land.lhs.true13
                                        //   in Loop: Header=BB105_14 Depth=1
	ldr	w8, [x26, #56]
	cmp	w8, w28
	b.ne	.LBB105_13
.LBB105_19:                             // %if.then23
	adrp	x21, :got:_ZN6Halide7Runtime8Internal18most_recently_usedE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal18most_recently_usedE]
	ldr	x8, [x21]
	cmp	x26, x8
	b.eq	.LBB105_28
// %bb.20:                              // %if.then25
	ldr	x8, [x26, #8]
	cbnz	x8, .LBB105_22
// %bb.21:                              // %if.then27
	adrp	x1, .L.str.5.45
	add	x1, x1, :lo12:.L.str.5.45
	mov	x0, x20
	bl	halide_print
	bl	abort
.LBB105_22:                             // %if.end
	ldr	x8, [x26, #16]
	cbz	x8, .LBB105_71
// %bb.23:                              // %if.then29
	ldr	x9, [x26, #8]
	str	x9, [x8, #8]
	ldr	x8, [x26, #8]
	cbnz	x8, .LBB105_25
.LBB105_24:                             // %if.then40
	adrp	x1, .L.str.7.47
	add	x1, x1, :lo12:.L.str.7.47
	mov	x0, x20
	bl	halide_print
	bl	abort
	ldr	x8, [x26, #8]
.LBB105_25:                             // %if.end41
	ldr	x9, [x26, #16]
	str	x9, [x8, #16]
	ldr	x8, [x21]
	stp	xzr, x8, [x26, #8]
	cbz	x8, .LBB105_27
// %bb.26:                              // %if.then48
	str	x26, [x8, #8]
.LBB105_27:                             // %if.end50
	str	x26, [x21]
.LBB105_28:                             // %if.end51
	cmp	w28, #1                 // =1
	b.lt	.LBB105_31
// %bb.29:                              // %for.body56.lr.ph
	mov	x8, xzr
	mov	w9, w28
.LBB105_30:                             // %for.body56
                                        // =>This Inner Loop Header: Depth=1
	ldr	x10, [x19], #8
	ldr	x11, [x26, #72]
	subs	x9, x9, #1              // =1
	add	x11, x11, x8
	ldr	x12, [x11, #48]
	ldp	q2, q0, [x11, #16]
	ldr	q1, [x11]
	add	x8, x8, #56             // =56
	str	x12, [x10, #48]
	stp	q2, q0, [x10, #16]
	str	q1, [x10]
	b.ne	.LBB105_30
.LBB105_31:                             // %for.cond.cleanup55
	ldr	w8, [x26, #52]
	mov	w19, wzr
	add	w8, w8, w28
	str	w8, [x26, #52]
	b	.LBB105_70
.LBB105_32:                             // %for.cond69.preheader
	cmp	w28, #1                 // =1
	b.lt	.LBB105_65
// %bb.33:                              // %for.body72.preheader
	mov	x23, xzr
	mov	w22, w28
	orr	x24, xzr, #0x20
.LBB105_34:                             // %for.body72
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB105_42 Depth 2
	ldr	x25, [x19, x23, lsl #3]
	ldrsw	x8, [x25, #36]
	cmp	w8, #0                  // =0
	b.le	.LBB105_37
// %bb.35:                              // %for.body.lr.ph.i.i
                                        //   in Loop: Header=BB105_34 Depth=1
	ldr	x9, [x25, #40]
	cmp	w8, #3                  // =3
	b.hs	.LBB105_38
// %bb.36:                              //   in Loop: Header=BB105_34 Depth=1
	mov	x11, xzr
	mov	x10, xzr
	b	.LBB105_45
.LBB105_37:                             // %_ZNK15halide_buffer_t3endEv.exit.thread.i
                                        //   in Loop: Header=BB105_34 Depth=1
	ldrb	w11, [x25, #33]
	mov	x13, xzr
	mov	w8, #1
	b	.LBB105_63
.LBB105_38:                             // %vector.ph40
                                        //   in Loop: Header=BB105_34 Depth=1
	and	x11, x8, #0xfffffffffffffffe
	mov	x10, xzr
	mov	x12, xzr
	add	x13, x9, #24            // =24
	mov	x14, x11
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.ge	.LBB105_41
	b	.LBB105_42
.LBB105_39:                             // %pred.load.continue54
                                        //   in Loop: Header=BB105_42 Depth=2
	sub	w17, w17, #1            // =1
	sub	w18, w18, #1            // =1
	cmp	w16, #0                 // =0
	mul	w16, w17, w16
	mul	w17, w18, w15
	csel	w16, w16, wzr, gt
	cmp	w15, #0                 // =0
	csel	w15, w17, wzr, gt
	add	x10, x10, w16, sxtw
	subs	x14, x14, #2            // =2
	add	x12, x12, w15, sxtw
	add	x13, x13, #32           // =32
	b.eq	.LBB105_44
// %bb.40:                              // %vector.body36
                                        //   in Loop: Header=BB105_42 Depth=2
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.lt	.LBB105_42
.LBB105_41:                             // %pred.load.if51
                                        //   in Loop: Header=BB105_34 Depth=1
	ldur	w17, [x13, #-20]
.LBB105_42:                             // %pred.load.continue52
                                        //   Parent Loop BB105_34 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	cmp	w15, #1                 // =1
                                        // implicit-def: $w18
	b.lt	.LBB105_39
// %bb.43:                              // %pred.load.if53
                                        //   in Loop: Header=BB105_42 Depth=2
	ldur	w18, [x13, #-4]
	b	.LBB105_39
.LBB105_44:                             // %middle.block37
                                        //   in Loop: Header=BB105_34 Depth=1
	cmp	x11, x8
	add	x10, x12, x10
	b.eq	.LBB105_49
.LBB105_45:                             // %for.body.i.i.preheader
                                        //   in Loop: Header=BB105_34 Depth=1
	sub	x12, x8, x11
	add	x11, x9, x11, lsl #4
	add	x11, x11, #8            // =8
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.ge	.LBB105_48
.LBB105_46:                             // %for.inc.i.i
                                        //   in Loop: Header=BB105_34 Depth=1
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.eq	.LBB105_49
.LBB105_47:                             // %for.body.i.i
                                        //   in Loop: Header=BB105_34 Depth=1
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.lt	.LBB105_46
.LBB105_48:                             // %if.then.i.i
                                        //   in Loop: Header=BB105_34 Depth=1
	ldursw	x14, [x11, #-4]
	sub	x14, x14, #1            // =1
	madd	x10, x14, x13, x10
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.ne	.LBB105_47
.LBB105_49:                             // %for.body.lr.ph.i5.i
                                        //   in Loop: Header=BB105_34 Depth=1
	ldrb	w11, [x25, #33]
	cmp	w8, #3                  // =3
	b.hs	.LBB105_51
// %bb.50:                              //   in Loop: Header=BB105_34 Depth=1
	mov	x12, xzr
	mov	x13, xzr
	b	.LBB105_58
.LBB105_51:                             // %vector.ph
                                        //   in Loop: Header=BB105_34 Depth=1
	and	x12, x8, #0xfffffffffffffffe
	mov	x13, xzr
	mov	x14, xzr
	add	x15, x9, #24            // =24
	mov	x16, x12
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbz	w17, #31, .LBB105_55
.LBB105_52:                             // %pred.load.if
                                        //   in Loop: Header=BB105_34 Depth=1
	ldur	w0, [x15, #-20]
                                        // implicit-def: $w1
	tbnz	w18, #31, .LBB105_56
.LBB105_53:                             // %pred.load.continue34
                                        //   in Loop: Header=BB105_34 Depth=1
	sub	w0, w0, #1              // =1
	sub	w1, w1, #1              // =1
	mul	w0, w0, w17
	mul	w1, w1, w18
	and	w17, w0, w17, asr #31
	and	w18, w1, w18, asr #31
	subs	x16, x16, #2            // =2
	add	x13, x13, w17, sxtw
	add	x14, x14, w18, sxtw
	add	x15, x15, #32           // =32
	b.eq	.LBB105_57
// %bb.54:                              // %vector.body
                                        //   in Loop: Header=BB105_34 Depth=1
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbnz	w17, #31, .LBB105_52
.LBB105_55:                             // %pred.load.continue
                                        //   in Loop: Header=BB105_34 Depth=1
                                        // implicit-def: $w1
	tbz	w18, #31, .LBB105_53
.LBB105_56:                             // %pred.load.if33
                                        //   in Loop: Header=BB105_34 Depth=1
	ldur	w1, [x15, #-4]
	b	.LBB105_53
.LBB105_57:                             // %middle.block
                                        //   in Loop: Header=BB105_34 Depth=1
	cmp	x12, x8
	add	x13, x14, x13
	b.eq	.LBB105_62
.LBB105_58:                             // %for.body.i16.i.preheader
                                        //   in Loop: Header=BB105_34 Depth=1
	add	x9, x9, x12, lsl #4
	sub	x8, x8, x12
	add	x9, x9, #8              // =8
	ldrsw	x12, [x9]
	tbnz	w12, #31, .LBB105_61
.LBB105_59:                             // %for.inc.i26.i
                                        //   in Loop: Header=BB105_34 Depth=1
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	b.eq	.LBB105_62
.LBB105_60:                             // %for.body.i16.i
                                        //   in Loop: Header=BB105_34 Depth=1
	ldrsw	x12, [x9]
	tbz	w12, #31, .LBB105_59
.LBB105_61:                             // %if.then.i22.i
                                        //   in Loop: Header=BB105_34 Depth=1
	ldursw	x14, [x9, #-4]
	sub	x14, x14, #1            // =1
	madd	x13, x14, x12, x13
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	b.ne	.LBB105_60
.LBB105_62:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
                                        //   in Loop: Header=BB105_34 Depth=1
	add	x8, x10, #1             // =1
.LBB105_63:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
                                        //   in Loop: Header=BB105_34 Depth=1
	add	x9, x11, #7             // =7
	lsr	x9, x9, #3
	sub	x8, x8, x13
	madd	x1, x8, x9, x24
	mov	x0, x20
	bl	halide_malloc
	str	x0, [x25, #16]
	cbz	x0, .LBB105_66
// %bb.64:                              // %for.inc108
                                        //   in Loop: Header=BB105_34 Depth=1
	add	x0, x0, #32             // =32
	str	x0, [x25, #16]
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	add	x23, x23, #1            // =1
	cmp	x23, x22
	str	w21, [x0, #8]
	str	xzr, [x0]
	b.ne	.LBB105_34
.LBB105_65:
	mov	w19, #1
	b	.LBB105_70
.LBB105_66:                             // %for.cond83.preheader
	cbz	w23, .LBB105_69
// %bb.67:                              // %for.body86.preheader
	and	x8, x23, #0xffffffff
	sub	x19, x19, #8            // =8
.LBB105_68:                             // %for.body86
                                        // =>This Inner Loop Header: Depth=1
	lsl	x21, x8, #3
	ldr	x9, [x19, x21]
	sub	x22, x8, #1             // =1
	ldr	x0, [x9, #16]
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	mov	x1, x0
	mov	x0, x20
	bl	halide_free
	ldr	x8, [x19, x21]
	cmp	x22, #0                 // =0
	str	xzr, [x8, #16]
	mov	x8, x22
	b.gt	.LBB105_68
.LBB105_69:
	mov	w19, #-1
.LBB105_70:                             // %cleanup113
	adrp	x0, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	bl	halide_mutex_unlock
	mov	w0, w19
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB105_71:                             // %if.else
	adrp	x22, :got:_ZN6Halide7Runtime8Internal19least_recently_usedE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal19least_recently_usedE]
	ldr	x8, [x22]
	cmp	x8, x26
	b.eq	.LBB105_73
// %bb.72:                              // %if.then34
	adrp	x1, .L.str.6.46
	add	x1, x1, :lo12:.L.str.6.46
	mov	x0, x20
	bl	halide_print
	bl	abort
.LBB105_73:                             // %if.end35
	ldr	x8, [x26, #8]
	str	x8, [x22]
	cbnz	x8, .LBB105_25
	b	.LBB105_24
.Lfunc_end105:
	.size	halide_memoization_cache_lookup, .Lfunc_end105-halide_memoization_cache_lookup
                                        // -- End function
	.section	.text.halide_memoization_cache_store,"ax",@progbits
	.weak	halide_memoization_cache_store // -- Begin function halide_memoization_cache_store
	.p2align	2
	.type	halide_memoization_cache_store,@function
halide_memoization_cache_store:         // @halide_memoization_cache_store
// %bb.0:                               // %entry
	sub	sp, sp, #144            // =144
	stp	x28, x27, [sp, #48]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #64]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #80]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #96]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #112]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #128]    // 16-byte Folded Spill
	stp	x2, x1, [sp, #32]       // 16-byte Folded Spill
	ldr	x8, [x5]
	mov	x22, x0
	add	x29, sp, #128           // =128
	mov	x19, x5
	ldr	x8, [x8, #16]
	mov	w20, w4
	mov	x27, x3
	mov	x0, x8
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	ldr	w25, [x0, #8]
	adrp	x0, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	and	x23, x25, #0xff
	bl	halide_mutex_lock
	adrp	x8, :got:_ZN6Halide7Runtime8Internal13cache_entriesE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal13cache_entriesE]
	ldr	x21, [x8, x23, lsl #3]
	cbz	x21, .LBB106_19
// %bb.1:                               // %while.body.lr.ph
	ldr	x8, [sp, #32]           // 8-byte Folded Reload
	cmp	w20, #0                 // =0
	sxtw	x26, w8
	b.le	.LBB106_4
// %bb.2:                               // %while.body.us.preheader
	sxtw	x24, w20
	ldr	w8, [x21, #48]
	cmp	w8, w25
	b.ne	.LBB106_10
	b	.LBB106_12
.LBB106_3:                              // %if.end53
                                        //   in Loop: Header=BB106_4 Depth=1
	ldr	x21, [x21]
	cbz	x21, .LBB106_19
.LBB106_4:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	w8, [x21, #48]
	cmp	w8, w25
	b.ne	.LBB106_3
// %bb.5:                               // %land.lhs.true
                                        //   in Loop: Header=BB106_4 Depth=1
	ldr	x8, [x21, #32]
	cmp	x8, x26
	b.ne	.LBB106_3
// %bb.6:                               // %land.lhs.true8
                                        //   in Loop: Header=BB106_4 Depth=1
	ldr	x0, [x21, #40]
	ldr	x1, [sp, #40]           // 8-byte Folded Reload
	mov	x2, x26
	bl	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
	cbz	w0, .LBB106_3
// %bb.7:                               // %land.lhs.true11
                                        //   in Loop: Header=BB106_4 Depth=1
	ldr	x1, [x21, #64]
	mov	x0, x27
	bl	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	cbz	w0, .LBB106_3
// %bb.8:                               // %land.lhs.true14
                                        //   in Loop: Header=BB106_4 Depth=1
	ldr	w8, [x21, #56]
	cmp	w8, w20
	b.ne	.LBB106_3
	b	.LBB106_69
.LBB106_9:                              // %for.cond.for.cond.cleanup_crit_edge.us
	ldp	x23, x22, [sp, #16]     // 16-byte Folded Reload
	ldr	x27, [sp, #8]           // 8-byte Folded Reload
	tbnz	w0, #0, .LBB106_67
.LBB106_10:                             // %if.end53.us
                                        // =>This Inner Loop Header: Depth=1
	ldr	x21, [x21]
	cbz	x21, .LBB106_19
// %bb.11:                              // %while.body.us
                                        //   in Loop: Header=BB106_10 Depth=1
	ldr	w8, [x21, #48]
	cmp	w8, w25
	b.ne	.LBB106_10
.LBB106_12:                             // %land.lhs.true.us
	ldr	x8, [x21, #32]
	cmp	x8, x26
	b.ne	.LBB106_10
// %bb.13:                              // %land.lhs.true8.us
	ldr	x0, [x21, #40]
	ldr	x1, [sp, #40]           // 8-byte Folded Reload
	mov	x2, x26
	bl	_ZN6Halide7Runtime8Internal10keys_equalEPKhS3_m
	cbz	w0, .LBB106_10
// %bb.14:                              // %land.lhs.true11.us
	ldr	x1, [x21, #64]
	mov	x0, x27
	bl	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	cbz	w0, .LBB106_10
// %bb.15:                              // %land.lhs.true14.us
	ldr	w8, [x21, #56]
	cmp	w8, w20
	b.ne	.LBB106_10
// %bb.16:                              // %for.body.lr.ph.us
	stp	x27, x23, [sp, #8]      // 16-byte Folded Spill
	ldr	x8, [x21, #72]
	str	x22, [sp, #24]          // 8-byte Folded Spill
	mov	x22, xzr
	mov	x23, xzr
	mov	w28, #1
.LBB106_17:                             // %for.body.us
                                        // =>This Inner Loop Header: Depth=1
	ldr	x27, [x19, x23, lsl #3]
	add	x8, x8, x22
	ldr	x1, [x8, #40]
	mov	x0, x27
	bl	_ZN6Halide7Runtime8Internal16buffer_has_shapeEPK15halide_buffer_tPK18halide_dimension_t
	ldr	x8, [x21, #72]
	ldr	x9, [x27, #16]
	add	x23, x23, #1            // =1
	add	x10, x8, x22
	ldr	x10, [x10, #16]
	cmp	x10, x9
	csel	w28, wzr, w28, eq
	cmp	x23, x24
	b.ge	.LBB106_9
// %bb.18:                              // %for.body.us
                                        //   in Loop: Header=BB106_17 Depth=1
	add	x22, x22, #56           // =56
	tbnz	w0, #0, .LBB106_17
	b	.LBB106_9
.LBB106_19:                             // %for.cond55.preheader
	mov	x24, x27
	cmp	w20, #1                 // =1
	b.lt	.LBB106_51
// %bb.20:                              // %for.body58.preheader
	mov	x8, xzr
	mov	x27, xzr
	mov	w9, w20
	ldr	x13, [x19, x8, lsl #3]
	ldrsw	x10, [x13, #36]
	cmp	w10, #0                 // =0
	b.gt	.LBB106_24
	b	.LBB106_26
.LBB106_21:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	add	x10, x12, #1            // =1
.LBB106_22:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	add	x11, x13, #7            // =7
	sub	x10, x10, x15
	add	x8, x8, #1              // =1
	lsr	x11, x11, #3
	cmp	x8, x9
	madd	x27, x10, x11, x27
	b.eq	.LBB106_52
// %bb.23:                              // %for.body58
	ldr	x13, [x19, x8, lsl #3]
	ldrsw	x10, [x13, #36]
	cmp	w10, #0                 // =0
	b.le	.LBB106_26
.LBB106_24:                             // %for.body.lr.ph.i.i
	ldr	x11, [x13, #40]
	cmp	w10, #3                 // =3
	b.hs	.LBB106_27
// %bb.25:
	mov	x14, xzr
	mov	x12, xzr
	b	.LBB106_34
.LBB106_26:                             // %_ZNK15halide_buffer_t3endEv.exit.thread.i
	ldrb	w13, [x13, #33]
	mov	x15, xzr
	mov	w10, #1
	b	.LBB106_22
.LBB106_27:                             // %vector.ph22
	and	x14, x10, #0xfffffffffffffffe
	mov	x12, xzr
	mov	x15, xzr
	add	x16, x11, #24           // =24
	mov	x17, x14
	ldur	w0, [x16, #-16]
	ldr	w18, [x16]
                                        // implicit-def: $w1
	cmp	w0, #1                  // =1
	b.ge	.LBB106_30
	b	.LBB106_31
.LBB106_28:                             // %pred.load.continue36
                                        //   in Loop: Header=BB106_31 Depth=1
	sub	w1, w1, #1              // =1
	sub	w2, w2, #1              // =1
	cmp	w0, #0                  // =0
	mul	w0, w1, w0
	mul	w1, w2, w18
	csel	w0, w0, wzr, gt
	cmp	w18, #0                 // =0
	csel	w18, w1, wzr, gt
	add	x12, x12, w0, sxtw
	subs	x17, x17, #2            // =2
	add	x15, x15, w18, sxtw
	add	x16, x16, #32           // =32
	b.eq	.LBB106_33
// %bb.29:                              // %vector.body18
                                        //   in Loop: Header=BB106_31 Depth=1
	ldur	w0, [x16, #-16]
	ldr	w18, [x16]
                                        // implicit-def: $w1
	cmp	w0, #1                  // =1
	b.lt	.LBB106_31
.LBB106_30:                             // %pred.load.if33
	ldur	w1, [x16, #-20]
.LBB106_31:                             // %pred.load.continue34
                                        // =>This Inner Loop Header: Depth=1
	cmp	w18, #1                 // =1
                                        // implicit-def: $w2
	b.lt	.LBB106_28
// %bb.32:                              // %pred.load.if35
                                        //   in Loop: Header=BB106_31 Depth=1
	ldur	w2, [x16, #-4]
	b	.LBB106_28
.LBB106_33:                             // %middle.block19
	cmp	x14, x10
	add	x12, x15, x12
	b.eq	.LBB106_38
.LBB106_34:                             // %for.body.i.i.preheader
	sub	x15, x10, x14
	add	x14, x11, x14, lsl #4
	add	x14, x14, #8            // =8
	ldrsw	x16, [x14]
	cmp	w16, #1                 // =1
	b.ge	.LBB106_37
.LBB106_35:                             // %for.inc.i.i
	subs	x15, x15, #1            // =1
	add	x14, x14, #16           // =16
	b.eq	.LBB106_38
.LBB106_36:                             // %for.body.i.i
	ldrsw	x16, [x14]
	cmp	w16, #1                 // =1
	b.lt	.LBB106_35
.LBB106_37:                             // %if.then.i.i
	ldursw	x17, [x14, #-4]
	sub	x17, x17, #1            // =1
	madd	x12, x17, x16, x12
	subs	x15, x15, #1            // =1
	add	x14, x14, #16           // =16
	b.ne	.LBB106_36
.LBB106_38:                             // %for.body.lr.ph.i5.i
	ldrb	w13, [x13, #33]
	cmp	w10, #3                 // =3
	b.hs	.LBB106_40
// %bb.39:
	mov	x14, xzr
	mov	x15, xzr
	b	.LBB106_47
.LBB106_40:                             // %vector.ph
	and	x14, x10, #0xfffffffffffffffe
	mov	x15, xzr
	mov	x16, xzr
	add	x17, x11, #24           // =24
	mov	x18, x14
	ldur	w0, [x17, #-16]
	ldr	w1, [x17]
                                        // implicit-def: $w2
	tbz	w0, #31, .LBB106_43
	b	.LBB106_44
.LBB106_41:                             // %pred.load.continue16
	sub	w2, w2, #1              // =1
	sub	w3, w3, #1              // =1
	mul	w2, w2, w0
	mul	w3, w3, w1
	and	w0, w2, w0, asr #31
	and	w1, w3, w1, asr #31
	subs	x18, x18, #2            // =2
	add	x15, x15, w0, sxtw
	add	x16, x16, w1, sxtw
	add	x17, x17, #32           // =32
	b.eq	.LBB106_46
// %bb.42:                              // %vector.body
	ldur	w0, [x17, #-16]
	ldr	w1, [x17]
                                        // implicit-def: $w2
	tbnz	w0, #31, .LBB106_44
.LBB106_43:                             // %pred.load.continue
                                        // implicit-def: $w3
	tbz	w1, #31, .LBB106_41
	b	.LBB106_45
.LBB106_44:                             // %pred.load.if
	ldur	w2, [x17, #-20]
                                        // implicit-def: $w3
	tbz	w1, #31, .LBB106_41
.LBB106_45:                             // %pred.load.if15
	ldur	w3, [x17, #-4]
	b	.LBB106_41
.LBB106_46:                             // %middle.block
	cmp	x14, x10
	add	x15, x16, x15
	b.eq	.LBB106_21
.LBB106_47:                             // %for.body.i16.i.preheader
	add	x11, x11, x14, lsl #4
	sub	x10, x10, x14
	add	x11, x11, #8            // =8
	ldrsw	x14, [x11]
	tbnz	w14, #31, .LBB106_50
.LBB106_48:                             // %for.inc.i26.i
	subs	x10, x10, #1            // =1
	add	x11, x11, #16           // =16
	b.eq	.LBB106_21
.LBB106_49:                             // %for.body.i16.i
	ldrsw	x14, [x11]
	tbz	w14, #31, .LBB106_48
.LBB106_50:                             // %if.then.i22.i
	ldursw	x16, [x11, #-4]
	sub	x16, x16, #1            // =1
	madd	x15, x16, x14, x15
	subs	x10, x10, #1            // =1
	add	x11, x11, #16           // =16
	b.ne	.LBB106_49
	b	.LBB106_21
.LBB106_51:
	mov	x27, xzr
.LBB106_52:                             // %for.cond.cleanup57
	adrp	x21, :got:_ZN6Halide7Runtime8Internal18current_cache_sizeE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal18current_cache_sizeE]
	ldr	x8, [x21]
	add	x8, x8, x27
	str	x8, [x21]
	bl	_ZN6Halide7Runtime8Internal11prune_cacheEv
	mov	w1, #80
	mov	x0, xzr
	bl	halide_malloc
	mov	x26, x0
	cbz	x0, .LBB106_61
// %bb.53:                              // %if.then70
	ldp	x8, x1, [sp, #32]       // 16-byte Folded Reload
	mov	x0, x26
	mov	w3, w25
	mov	x4, x24
	sxtw	x2, w8
	mov	w5, w20
	mov	x6, x19
	bl	_ZN6Halide7Runtime8Internal10CacheEntry4initEPKhmjPK15halide_buffer_tiPPS5_
	tbz	w0, #0, .LBB106_61
// %bb.54:                              // %if.end94
	adrp	x11, :got:_ZN6Halide7Runtime8Internal13cache_entriesE
	ldr	x11, [x11, :got_lo12:_ZN6Halide7Runtime8Internal13cache_entriesE]
	ldr	x8, [x11, x23, lsl #3]
	str	x8, [x26]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal18most_recently_usedE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal18most_recently_usedE]
	ldr	x9, [x8]
	str	x9, [x26, #16]
	cbz	x9, .LBB106_56
// %bb.55:                              // %if.then99
	str	x26, [x9, #8]
.LBB106_56:                             // %if.end100
	adrp	x9, :got:_ZN6Halide7Runtime8Internal19least_recently_usedE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal19least_recently_usedE]
	str	x26, [x8]
	ldr	x10, [x9]
	cbnz	x10, .LBB106_58
// %bb.57:                              // %if.then102
	str	x26, [x9]
.LBB106_58:                             // %if.end103
	cmp	w20, #1                 // =1
	str	x26, [x11, x23, lsl #3]
	str	w20, [x26, #52]
	b.lt	.LBB106_66
// %bb.59:                              // %for.body110.preheader
	mov	w20, w20
.LBB106_60:                             // %for.body110
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19], #8
	ldr	x0, [x8, #16]
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	subs	x20, x20, #1            // =1
	str	x26, [x0]
	b.ne	.LBB106_60
	b	.LBB106_66
.LBB106_61:                             // %if.then76
	ldr	x8, [x21]
	cmp	w20, #1                 // =1
	sub	x8, x8, x27
	str	x8, [x21]
	b.lt	.LBB106_64
// %bb.62:                              // %for.body81.preheader
	mov	w20, w20
.LBB106_63:                             // %for.body81
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19], #8
	ldr	x0, [x8, #16]
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	subs	x20, x20, #1            // =1
	str	xzr, [x0]
	b.ne	.LBB106_63
.LBB106_64:                             // %for.cond.cleanup80
	cbz	x26, .LBB106_66
// %bb.65:                              // %if.then92
	mov	x0, x22
	mov	x1, x26
	bl	halide_free
.LBB106_66:                             // %cleanup125
	adrp	x0, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	bl	halide_mutex_unlock
	ldp	x29, x30, [sp, #128]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #48]     // 16-byte Folded Reload
	mov	w0, wzr
	add	sp, sp, #144            // =144
	ret
.LBB106_67:                             // %if.then34
	tbnz	w28, #0, .LBB106_69
// %bb.68:                              // %if.then36
	adrp	x1, .L.str.9.48
	add	x1, x1, :lo12:.L.str.9.48
	mov	x0, x22
	bl	halide_print
	bl	abort
.LBB106_69:                             // %if.end37
	cmp	w20, #1                 // =1
	b.lt	.LBB106_66
// %bb.70:                              // %for.body42.preheader
	mov	w20, w20
.LBB106_71:                             // %for.body42
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19], #8
	ldr	x0, [x8, #16]
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	subs	x20, x20, #1            // =1
	str	xzr, [x0]
	b.ne	.LBB106_71
	b	.LBB106_66
.Lfunc_end106:
	.size	halide_memoization_cache_store, .Lfunc_end106-halide_memoization_cache_store
                                        // -- End function
	.section	.text.halide_memoization_cache_release,"ax",@progbits
	.weak	halide_memoization_cache_release // -- Begin function halide_memoization_cache_release
	.p2align	2
	.type	halide_memoization_cache_release,@function
halide_memoization_cache_release:       // @halide_memoization_cache_release
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	x19, x0
	mov	x0, x1
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	bl	_ZN6Halide7Runtime8Internal21get_pointer_to_headerEPh
	ldr	x20, [x0]
	cbz	x20, .LBB107_4
// %bb.1:                               // %if.else
	adrp	x0, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	bl	halide_mutex_lock
	ldr	w8, [x20, #52]
	cbnz	w8, .LBB107_3
// %bb.2:                               // %if.then4
	adrp	x1, .L.str.12.49
	add	x1, x1, :lo12:.L.str.12.49
	mov	x0, x19
	bl	halide_print
	bl	abort
	ldr	w8, [x20, #52]
.LBB107_3:                              // %if.end
	sub	w8, w8, #1              // =1
	adrp	x0, :got:_ZN6Halide7Runtime8Internal16memoization_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal16memoization_lockE]
	str	w8, [x20, #52]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_mutex_unlock
.LBB107_4:                              // %if.then
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x1, x0
	mov	x0, x19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_free
.Lfunc_end107:
	.size	halide_memoization_cache_release, .Lfunc_end107-halide_memoization_cache_release
                                        // -- End function
	.section	.text.halide_string_to_string,"ax",@progbits
	.weak	halide_string_to_string // -- Begin function halide_string_to_string
	.p2align	2
	.type	halide_string_to_string,@function
halide_string_to_string:                // @halide_string_to_string
// %bb.0:                               // %entry
	cmp	x0, x1
	b.hs	.LBB108_4
.LBB108_1:                              // %if.end3
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w8, [x2]
	strb	w8, [x0]
	cbz	w8, .LBB108_4
// %bb.2:                               // %if.end6
                                        //   in Loop: Header=BB108_1 Depth=1
	add	x0, x0, #1              // =1
	cmp	x1, x0
	add	x2, x2, #1              // =1
	b.ne	.LBB108_1
// %bb.3:                               // %if.then2
	sturb	wzr, [x0, #-1]
	mov	x0, x1
.LBB108_4:
	ret
.Lfunc_end108:
	.size	halide_string_to_string, .Lfunc_end108-halide_string_to_string
                                        // -- End function
	.section	.text.halide_uint64_to_string,"ax",@progbits
	.weak	halide_uint64_to_string // -- Begin function halide_uint64_to_string
	.p2align	2
	.type	halide_uint64_to_string,@function
halide_uint64_to_string:                // @halide_uint64_to_string
// %bb.0:                               // %entry
	sub	sp, sp, #48             // =48
	mov	x8, sp
	add	x8, x8, #30             // =30
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	strb	wzr, [sp, #31]
	cbnz	x2, .LBB109_2
// %bb.1:                               // %entry
	cmp	w3, #1                  // =1
	b.lt	.LBB109_5
.LBB109_2:                              // %for.body.preheader
	mov	x9, #-3689348814741910324
	mov	w11, #1
	movk	x9, #52429
	mov	w10, #-10
.LBB109_3:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	mov	w12, w11
	umulh	x11, x2, x9
	mov	x13, x2
	cmp	x2, #9                  // =9
	lsr	x2, x11, #3
	madd	w11, w2, w10, w13
	add	w11, w11, #48           // =48
	strb	w11, [x8], #-1
	add	w11, w12, #1            // =1
	b.hi	.LBB109_3
// %bb.4:                               // %for.body
                                        //   in Loop: Header=BB109_3 Depth=1
	cmp	w12, w3
	b.lt	.LBB109_3
.LBB109_5:                              // %for.cond.cleanup
	add	x2, x8, #1              // =1
	bl	halide_string_to_string
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #48             // =48
	ret
.Lfunc_end109:
	.size	halide_uint64_to_string, .Lfunc_end109-halide_uint64_to_string
                                        // -- End function
	.section	.text.halide_int64_to_string,"ax",@progbits
	.weak	halide_int64_to_string  // -- Begin function halide_int64_to_string
	.p2align	2
	.type	halide_int64_to_string,@function
halide_int64_to_string:                 // @halide_int64_to_string
// %bb.0:                               // %entry
	cmp	x0, x1
	b.hs	.LBB110_3
// %bb.1:                               // %entry
	tbz	x2, #63, .LBB110_3
// %bb.2:                               // %if.then
	mov	w8, #45
	strb	w8, [x0], #1
	neg	x2, x2
.LBB110_3:                              // %if.end
	b	halide_uint64_to_string
.Lfunc_end110:
	.size	halide_int64_to_string, .Lfunc_end110-halide_int64_to_string
                                        // -- End function
	.section	.text.halide_double_to_string,"ax",@progbits
	.weak	halide_double_to_string // -- Begin function halide_double_to_string
	.p2align	2
	.type	halide_double_to_string,@function
halide_double_to_string:                // @halide_double_to_string
// %bb.0:                               // %entry
	str	d8, [sp, #-80]!         // 8-byte Folded Spill
	str	x28, [sp, #8]           // 8-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	sub	sp, sp, #528            // =528
	mov	w21, w2
	mov	x19, x1
	mov	x20, x0
	sub	x0, x29, #80            // =80
	sub	x1, x29, #72            // =72
	mov	w2, #8
	mov	v8.16b, v0.16b
	stur	d0, [x29, #-72]
	stur	xzr, [x29, #-80]
	bl	memcpy
	ldur	x8, [x29, #-80]
	ubfx	x22, x8, #52, #11
	and	x24, x8, #0xfffffffffffff
	cmp	w22, #2047              // =2047
	lsr	x8, x8, #63
	b.ne	.LBB111_4
// %bb.1:                               // %if.then
	cbz	x24, .LBB111_20
// %bb.2:                               // %if.then4
	cbz	w8, .LBB111_22
// %bb.3:                               // %if.then6
	adrp	x2, .L.str.58
	add	x2, x2, :lo12:.L.str.58
	b	.LBB111_33
.LBB111_4:                              // %if.else15
	cbnz	x24, .LBB111_9
// %bb.5:                               // %if.else15
	cbnz	w22, .LBB111_9
// %bb.6:                               // %if.then18
	cbz	w21, .LBB111_23
// %bb.7:                               // %if.then20
	cbz	w8, .LBB111_29
// %bb.8:                               // %if.then22
	adrp	x2, .L.str.4.62
	add	x2, x2, :lo12:.L.str.4.62
	b	.LBB111_33
.LBB111_9:                              // %if.end32
	cbz	w8, .LBB111_11
// %bb.10:                              // %if.then34
	adrp	x2, .L.str.8.66
	add	x2, x2, :lo12:.L.str.8.66
	mov	x0, x20
	mov	x1, x19
	bl	halide_string_to_string
	mov	x20, x0
	fneg	d8, d8
	stur	d8, [x29, #-72]
.LBB111_11:                             // %if.end37
	cbz	w21, .LBB111_25
// %bb.12:                              // %while.condthread-pre-split
	fmov	d1, #1.00000000
	fcmp	d8, d1
	fmov	d0, #10.00000000
	mov	w22, wzr
	b.pl	.LBB111_15
.LBB111_13:                             // %while.body
                                        // =>This Inner Loop Header: Depth=1
	fmul	d8, d8, d0
	fcmp	d8, d1
	sub	w22, w22, #1            // =1
	b.mi	.LBB111_13
// %bb.14:                              // %while.cond.while.cond41thread-pre-split_crit_edge
	stur	d8, [x29, #-72]
.LBB111_15:                             // %while.cond41thread-pre-split
	fcmp	d8, d0
	b.lt	.LBB111_18
.LBB111_16:                             // %while.body43
                                        // =>This Inner Loop Header: Depth=1
	fdiv	d8, d8, d0
	fcmp	d8, d0
	add	w22, w22, #1            // =1
	b.ge	.LBB111_16
// %bb.17:                              // %while.cond41.while.end44_crit_edge
	stur	d8, [x29, #-72]
.LBB111_18:                             // %while.end44
	mov	x8, #145685290680320
	movk	x8, #16686, lsl #48
	mov	x9, #13531
	fmov	d0, #0.50000000
	movk	x9, #55222, lsl #16
	fmov	d1, x8
	movk	x9, #56962, lsl #32
	fmadd	d0, d8, d1, d0
	movk	x9, #17179, lsl #48
	fcvtzu	x8, d0
	umulh	x9, x8, x9
	lsr	x2, x9, #18
	mov	x9, #-16960
	movk	x9, #65520, lsl #16
	mov	w3, #1
	mov	x0, x20
	mov	x1, x19
	madd	x21, x2, x9, x8
	bl	halide_int64_to_string
	adrp	x2, .L.str.30.144
	add	x2, x2, :lo12:.L.str.30.144
	mov	x1, x19
	bl	halide_string_to_string
	mov	w3, #6
	mov	x1, x19
	mov	x2, x21
	bl	halide_int64_to_string
	tbnz	w22, #31, .LBB111_30
// %bb.19:                              // %if.then54
	adrp	x2, .L.str.10.68
	add	x2, x2, :lo12:.L.str.10.68
	mov	x1, x19
	bl	halide_string_to_string
	b	.LBB111_31
.LBB111_20:                             // %if.else9
	cbz	w8, .LBB111_28
// %bb.21:                              // %if.then11
	adrp	x2, .L.str.2.60
	add	x2, x2, :lo12:.L.str.2.60
	b	.LBB111_33
.LBB111_22:                             // %if.else
	adrp	x2, .L.str.1.59
	add	x2, x2, :lo12:.L.str.1.59
	b	.LBB111_33
.LBB111_23:                             // %if.else26
	cbz	w8, .LBB111_32
// %bb.24:                              // %if.then28
	adrp	x2, .L.str.6.64
	add	x2, x2, :lo12:.L.str.6.64
	b	.LBB111_33
.LBB111_25:                             // %if.else62
	cbz	w22, .LBB111_34
// %bb.26:                              // %if.end66
	subs	w23, w22, #1075         // =1075
	orr	x2, x24, #0x10000000000000
	b.mi	.LBB111_35
// %bb.27:
	mov	x21, xzr
	b	.LBB111_39
.LBB111_28:                             // %if.else13
	adrp	x2, .L.str.3.61
	add	x2, x2, :lo12:.L.str.3.61
	b	.LBB111_33
.LBB111_29:                             // %if.else24
	adrp	x2, .L.str.5.63
	add	x2, x2, :lo12:.L.str.5.63
	b	.LBB111_33
.LBB111_30:                             // %if.else56
	adrp	x2, .L.str.11.69
	add	x2, x2, :lo12:.L.str.11.69
	mov	x1, x19
	bl	halide_string_to_string
	neg	w22, w22
.LBB111_31:                             // %if.end59
	sxtw	x2, w22
	mov	w3, #2
	mov	x1, x19
	b	.LBB111_50
.LBB111_32:                             // %if.else30
	adrp	x2, .L.str.7.65
	add	x2, x2, :lo12:.L.str.7.65
.LBB111_33:                             // %cleanup148
	mov	x0, x20
	mov	x1, x19
	bl	halide_string_to_string
	b	.LBB111_51
.LBB111_34:                             // %if.then64
	fmov	d0, xzr
	mov	x0, x20
	mov	x1, x19
	mov	w2, wzr
	bl	halide_double_to_string
	b	.LBB111_51
.LBB111_35:                             // %if.then72
	cmn	w23, #52                // =52
	b.ge	.LBB111_37
// %bb.36:
	mov	x8, xzr
	b	.LBB111_38
.LBB111_37:                             // %if.else76
	mov	w8, #1075
	sub	w9, w8, w22
	lsr	x8, x2, x9
	lsl	x9, x8, x9
	sub	x2, x2, x9
.LBB111_38:                             // %if.end84
	mov	x9, #145685290680320
	movk	x9, #16686, lsl #48
	add	x9, x9, x23, lsl #52
	ucvtf	d0, x2
	fmov	d1, #0.50000000
	fmov	d2, x9
	fmadd	d0, d2, d0, d1
	fcvtzu	x9, d0
	ucvtf	d1, x9
	fcmp	d0, d1
	cset	w10, eq
	and	w10, w9, w10
	sub	x9, x9, x10
	mov	w10, #16960
	movk	w10, #15, lsl #16
	cmp	x9, x10
	cinc	x2, x8, eq
	csel	x21, xzr, x9, eq
	mov	w23, wzr
.LBB111_39:                             // %if.end105
	mov	x8, sp
	add	x22, x8, #480           // =480
	add	x1, x8, #512            // =512
	mov	w3, #1
	mov	x0, x22
	bl	halide_int64_to_string
	cmp	w23, #1                 // =1
	b.lt	.LBB111_48
// %bb.40:                              // %for.cond112.preheader.preheader
	mov	w8, wzr
	mov	w9, #49
	cmp	x0, x22
	mov	x2, x0
	b.ne	.LBB111_44
	b	.LBB111_42
.LBB111_41:                             // %if.end138
	mov	x2, x22
.LBB111_42:                             // %if.end138
                                        // =>This Inner Loop Header: Depth=1
	add	w8, w8, #1              // =1
	cmp	w8, w23
	mov	x22, x2
	b.eq	.LBB111_49
// %bb.43:                              // %for.cond112.preheader
                                        //   in Loop: Header=BB111_42 Depth=1
	cmp	x0, x22
	mov	x2, x0
	b.eq	.LBB111_42
.LBB111_44:                             // %for.body116.preheader
	mov	w11, wzr
	mov	x10, x0
.LBB111_45:                             // %for.body116
                                        // =>This Inner Loop Header: Depth=1
	ldrb	w12, [x10, #-1]!
	sub	w12, w12, #48           // =48
	sxtb	w12, w12
	orr	w13, w11, w12, lsl #1
	sxtb	w12, w13
	sub	w14, w13, #10           // =10
	cmp	w12, #9                 // =9
	csel	w13, w14, w13, gt
	cset	w11, gt
	add	w13, w13, #48           // =48
	cmp	x22, x10
	strb	w13, [x10]
	b.ne	.LBB111_45
// %bb.46:                              // %for.cond.cleanup115
	cmp	w12, #9                 // =9
	b.le	.LBB111_41
// %bb.47:                              // %if.then136
	strb	w9, [x22, #-1]!
	b	.LBB111_41
.LBB111_48:
	mov	x2, x22
.LBB111_49:                             // %for.cond.cleanup
	mov	x0, x20
	mov	x1, x19
	bl	halide_string_to_string
	adrp	x2, .L.str.30.144
	add	x2, x2, :lo12:.L.str.30.144
	mov	x1, x19
	bl	halide_string_to_string
	mov	w3, #6
	mov	x1, x19
	mov	x2, x21
.LBB111_50:                             // %cleanup148
	bl	halide_int64_to_string
.LBB111_51:                             // %cleanup148
	add	sp, sp, #528            // =528
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldr	x28, [sp, #8]           // 8-byte Folded Reload
	ldr	d8, [sp], #80           // 8-byte Folded Reload
	ret
.Lfunc_end111:
	.size	halide_double_to_string, .Lfunc_end111-halide_double_to_string
                                        // -- End function
	.section	.text.halide_pointer_to_string,"ax",@progbits
	.weak	halide_pointer_to_string // -- Begin function halide_pointer_to_string
	.p2align	2
	.type	halide_pointer_to_string,@function
halide_pointer_to_string:               // @halide_pointer_to_string
// %bb.0:                               // %entry
	sub	sp, sp, #48             // =48
	add	x8, sp, #8              // =8
	adrp	x10, .L.str.12.72
	mov	w9, #1
	add	x8, x8, #17             // =17
	add	x10, x10, :lo12:.L.str.12.72
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	stp	xzr, xzr, [sp, #8]
	str	wzr, [sp, #24]
.LBB112_1:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	and	x11, x2, #0xf
	ldrb	w11, [x10, x11]
	cmp	w9, #15                 // =15
	strb	w11, [x8, #1]
	sub	x8, x8, #1              // =1
	b.hi	.LBB112_3
// %bb.2:                               // %for.body
                                        //   in Loop: Header=BB112_1 Depth=1
	lsr	x2, x2, #4
	add	w9, w9, #1              // =1
	cbnz	x2, .LBB112_1
.LBB112_3:                              // %cleanup
	mov	w9, #30768
	mov	x2, x8
	strh	w9, [x8]
	bl	halide_string_to_string
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #48             // =48
	ret
.Lfunc_end112:
	.size	halide_pointer_to_string, .Lfunc_end112-halide_pointer_to_string
                                        // -- End function
	.section	.text.halide_type_to_string,"ax",@progbits
	.weak	halide_type_to_string   // -- Begin function halide_type_to_string
	.p2align	2
	.type	halide_type_to_string,@function
halide_type_to_string:                  // @halide_type_to_string
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldrsb	x8, [x2]
	mov	x20, x2
	mov	x19, x1
	add	x29, sp, #16            // =16
	cmp	x8, #3                  // =3
	b.hi	.LBB113_2
// %bb.1:                               // %switch.lookup
	adrp	x9, .Lswitch.table.halide_type_to_string
	add	x9, x9, :lo12:.Lswitch.table.halide_type_to_string
	ldr	x2, [x9, x8, lsl #3]
	b	.LBB113_3
.LBB113_2:
	adrp	x2, .L.str.17.73
	add	x2, x2, :lo12:.L.str.17.73
.LBB113_3:                              // %sw.epilog
	mov	x1, x19
	bl	halide_string_to_string
	ldrb	w2, [x20, #1]
	mov	w3, #1
	mov	x1, x19
	bl	halide_uint64_to_string
	ldrh	w8, [x20, #2]
	cmp	w8, #1                  // =1
	b.ne	.LBB113_5
// %bb.4:                               // %if.end
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB113_5:                              // %if.then
	adrp	x2, .L.str.18.78
	add	x2, x2, :lo12:.L.str.18.78
	mov	x1, x19
	bl	halide_string_to_string
	ldrh	w2, [x20, #2]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w3, #1
	mov	x1, x19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_uint64_to_string
.Lfunc_end113:
	.size	halide_type_to_string, .Lfunc_end113-halide_type_to_string
                                        // -- End function
	.section	.text.halide_buffer_to_string,"ax",@progbits
	.weak	halide_buffer_to_string // -- Begin function halide_buffer_to_string
	.p2align	2
	.type	halide_buffer_to_string,@function
halide_buffer_to_string:                // @halide_buffer_to_string
// %bb.0:                               // %entry
	str	x25, [sp, #-80]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x19, x1
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	cbz	x2, .LBB114_5
// %bb.1:                               // %if.end
	mov	x20, x2
	adrp	x2, .L.str.20.80
	add	x2, x2, :lo12:.L.str.20.80
	mov	x1, x19
	bl	halide_string_to_string
	ldr	x2, [x20]
	mov	w3, #1
	mov	x1, x19
	bl	halide_uint64_to_string
	adrp	x21, .L.str.55
	add	x21, x21, :lo12:.L.str.55
	mov	x1, x19
	mov	x2, x21
	bl	halide_string_to_string
	ldr	x2, [x20, #8]
	mov	x1, x19
	bl	halide_pointer_to_string
	mov	x1, x19
	mov	x2, x21
	bl	halide_string_to_string
	ldr	x2, [x20, #16]
	mov	x1, x19
	bl	halide_pointer_to_string
	mov	x1, x19
	mov	x2, x21
	bl	halide_string_to_string
	ldr	x2, [x20, #24]
	mov	w3, #1
	mov	x1, x19
	bl	halide_uint64_to_string
	mov	x1, x19
	mov	x2, x21
	bl	halide_string_to_string
	add	x2, x20, #32            // =32
	mov	x1, x19
	bl	halide_type_to_string
	ldr	w8, [x20, #36]
	cmp	w8, #1                  // =1
	b.lt	.LBB114_4
// %bb.2:                               // %for.body.lr.ph
	adrp	x21, .L.str.22.83
	adrp	x22, .L.str.55
	adrp	x23, .L.str.23.84
	mov	x24, xzr
	mov	x25, xzr
	add	x21, x21, :lo12:.L.str.22.83
	add	x22, x22, :lo12:.L.str.55
	add	x23, x23, :lo12:.L.str.23.84
.LBB114_3:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	mov	x1, x19
	mov	x2, x21
	bl	halide_string_to_string
	ldr	x8, [x20, #40]
	mov	w3, #1
	mov	x1, x19
	ldrsw	x2, [x8, x24]
	bl	halide_int64_to_string
	mov	x1, x19
	mov	x2, x22
	bl	halide_string_to_string
	ldr	x8, [x20, #40]
	mov	w3, #1
	mov	x1, x19
	add	x8, x8, x24
	ldrsw	x2, [x8, #4]
	bl	halide_int64_to_string
	mov	x1, x19
	mov	x2, x22
	bl	halide_string_to_string
	ldr	x8, [x20, #40]
	mov	w3, #1
	mov	x1, x19
	add	x8, x8, x24
	ldrsw	x2, [x8, #8]
	bl	halide_int64_to_string
	mov	x1, x19
	mov	x2, x23
	bl	halide_string_to_string
	ldrsw	x8, [x20, #36]
	add	x25, x25, #1            // =1
	add	x24, x24, #16           // =16
	cmp	x25, x8
	b.lt	.LBB114_3
.LBB114_4:                              // %for.cond.cleanup
	adrp	x2, .L.str.5.170
	add	x2, x2, :lo12:.L.str.5.170
	b	.LBB114_6
.LBB114_5:                              // %if.then
	adrp	x2, .L.str.19.79
	add	x2, x2, :lo12:.L.str.19.79
.LBB114_6:                              // %if.then
	mov	x1, x19
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldr	x25, [sp], #80          // 8-byte Folded Reload
	b	halide_string_to_string
.Lfunc_end114:
	.size	halide_buffer_to_string, .Lfunc_end114-halide_buffer_to_string
                                        // -- End function
	.section	.text.halide_reuse_device_allocations,"ax",@progbits
	.weak	halide_reuse_device_allocations // -- Begin function halide_reuse_device_allocations
	.p2align	2
	.type	halide_reuse_device_allocations,@function
halide_reuse_device_allocations:        // @halide_reuse_device_allocations
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	adrp	x8, :got:_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE]
	add	x29, sp, #32            // =32
	strb	w1, [x8]
	tbz	w1, #0, .LBB115_2
// %bb.1:
	mov	w20, wzr
	b	.LBB115_7
.LBB115_2:                              // %if.then
	mov	x19, x0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal21allocation_pools_lockE]
	bl	halide_mutex_lock
	adrp	x8, :got:_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal23device_allocation_poolsE]
	ldr	x21, [x8]
	cbz	x21, .LBB115_5
// %bb.3:                               // %for.body.preheader
	mov	w20, wzr
.LBB115_4:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x21]
	mov	x0, x19
	blr	x8
	ldr	x21, [x21, #8]
	cmp	w0, #0                  // =0
	csel	w20, w20, w0, eq
	cbnz	x21, .LBB115_4
	b	.LBB115_6
.LBB115_5:
	mov	w20, wzr
.LBB115_6:                              // %for.cond.cleanup
	adrp	x0, :got:_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal21allocation_pools_lockE]
	bl	halide_mutex_unlock
.LBB115_7:                              // %if.end5
	mov	w0, w20
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end115:
	.size	halide_reuse_device_allocations, .Lfunc_end115-halide_reuse_device_allocations
                                        // -- End function
	.section	.text.halide_can_reuse_device_allocations,"ax",@progbits
	.weak	halide_can_reuse_device_allocations // -- Begin function halide_can_reuse_device_allocations
	.p2align	2
	.type	halide_can_reuse_device_allocations,@function
halide_can_reuse_device_allocations:    // @halide_can_reuse_device_allocations
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE]
	ldrb	w0, [x8]
	ret
.Lfunc_end116:
	.size	halide_can_reuse_device_allocations, .Lfunc_end116-halide_can_reuse_device_allocations
                                        // -- End function
	.section	.text.halide_register_device_allocation_pool,"ax",@progbits
	.weak	halide_register_device_allocation_pool // -- Begin function halide_register_device_allocation_pool
	.p2align	2
	.type	halide_register_device_allocation_pool,@function
halide_register_device_allocation_pool: // @halide_register_device_allocation_pool
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x20, :got:_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal21allocation_pools_lockE]
	mov	x19, x0
	add	x29, sp, #16            // =16
	mov	x0, x20
	bl	halide_mutex_lock
	adrp	x8, :got:_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal23device_allocation_poolsE]
	mov	x0, x20
	ldr	x9, [x8]
	str	x9, [x19, #8]
	str	x19, [x8]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_mutex_unlock
.Lfunc_end117:
	.size	halide_register_device_allocation_pool, .Lfunc_end117-halide_register_device_allocation_pool
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t // -- Begin function _ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t,@function
_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t: // @_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldr	x8, [x1, #24]
	add	x29, sp, #16            // =16
	tbnz	w8, #1, .LBB118_2
// %bb.1:                               // %return
	mov	w0, wzr
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB118_2:                              // %if.end
	tbnz	w8, #0, .LBB118_5
// %bb.3:                               // %if.end9
	ldr	x8, [x1, #8]
	mov	x19, x1
	cbz	x8, .LBB118_6
// %bb.4:                               // %if.end15
	ldr	x8, [x8, #120]
	mov	x1, x19
	mov	x20, x0
	ldr	x8, [x8, #48]
	blr	x8
	cbz	w0, .LBB118_7
.LBB118_5:
	mov	w0, #-14
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB118_6:
	mov	w0, #-19
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB118_7:                              // %if.end23
	ldr	x8, [x19, #24]
	mov	x0, x20
	mov	x1, x19
	and	x8, x8, #0xfffffffffffffffd
	str	x8, [x19, #24]
	bl	halide_msan_annotate_buffer_is_initialized
	mov	w0, wzr
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end118:
	.size	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t, .Lfunc_end118-_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
                                        // -- End function
	.section	.text.halide_device_release,"ax",@progbits
	.weak	halide_device_release   // -- Begin function halide_device_release
	.p2align	2
	.type	halide_device_release,@function
halide_device_release:                  // @halide_device_release
// %bb.0:                               // %entry
	ldr	x8, [x1, #120]
	ldr	x1, [x8, #40]
	br	x1
.Lfunc_end119:
	.size	halide_device_release, .Lfunc_end119-halide_device_release
                                        // -- End function
	.section	.text.halide_copy_to_host,"ax",@progbits
	.weak	halide_copy_to_host     // -- Begin function halide_copy_to_host
	.p2align	2
	.type	halide_copy_to_host,@function
halide_copy_to_host:                    // @halide_copy_to_host
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	mov	x20, x0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	add	x29, sp, #32            // =32
	mov	x19, x1
	bl	halide_mutex_lock
	cbz	x19, .LBB120_4
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x19]
	cbnz	x8, .LBB120_5
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB120_5
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	mov	w21, w0
	cbnz	w0, .LBB120_11
	b	.LBB120_10
.LBB120_4:                              // %if.then.i
	adrp	x1, .L.str.9.89
	add	x1, x1, :lo12:.L.str.9.89
	mov	x0, x20
	bl	halide_error_buffer_is_null
	mov	w21, w0
	cbnz	w0, .LBB120_11
	b	.LBB120_10
.LBB120_5:                              // %if.end10.i
	cbnz	x9, .LBB120_8
// %bb.6:                               // %if.end10.i
	cbz	x8, .LBB120_8
// %bb.7:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	mov	w21, w0
	cbnz	w0, .LBB120_11
	b	.LBB120_10
.LBB120_8:                              // %if.end16.i
	ldr	w8, [x19, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB120_10
// %bb.9:                               // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	mov	w21, w0
	cbnz	w0, .LBB120_11
.LBB120_10:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	mov	x0, x20
	mov	x1, x19
	bl	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
	mov	w21, w0
.LBB120_11:                             // %cleanup
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	bl	halide_mutex_unlock
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w21
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end120:
	.size	halide_copy_to_host, .Lfunc_end120-halide_copy_to_host
                                        // -- End function
	.section	.text.copy_to_device_already_locked,"ax",@progbits
	.weak	copy_to_device_already_locked // -- Begin function copy_to_device_already_locked
	.p2align	2
	.type	copy_to_device_already_locked,@function
copy_to_device_already_locked:          // @copy_to_device_already_locked
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x21, x2
	mov	x19, x1
	mov	x20, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB121_4
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x19]
	cbnz	x8, .LBB121_5
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB121_5
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	cbnz	w0, .LBB121_16
	b	.LBB121_10
.LBB121_4:                              // %if.then.i
	adrp	x1, .L.str.10.90
	add	x1, x1, :lo12:.L.str.10.90
	mov	x0, x20
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB121_16
	b	.LBB121_10
.LBB121_5:                              // %if.end10.i
	cbnz	x9, .LBB121_8
// %bb.6:                               // %if.end10.i
	cbz	x8, .LBB121_8
// %bb.7:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB121_16
	b	.LBB121_10
.LBB121_8:                              // %if.end16.i
	ldr	w8, [x19, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB121_10
// %bb.9:                               // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB121_16
.LBB121_10:                             // %if.end
	cbnz	x21, .LBB121_12
// %bb.11:                              // %if.then2
	ldr	x21, [x19, #8]
	cbz	x21, .LBB121_22
.LBB121_12:                             // %if.end11
	ldr	x8, [x19]
	cbz	x8, .LBB121_15
// %bb.13:                              // %land.lhs.true
	ldr	x8, [x19, #8]
	cmp	x8, x21
	b.eq	.LBB121_17
// %bb.14:                              // %if.then14
	adrp	x1, .L.str.12.91
	add	x1, x1, :lo12:.L.str.12.91
	mov	x0, x20
	bl	halide_error
	mov	w0, #-42
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB121_15:                             // %if.then18
	mov	x0, x20
	mov	x1, x19
	mov	x2, x21
	bl	halide_device_malloc
	cbz	w0, .LBB121_17
.LBB121_16:                             // %cleanup
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB121_17:                             // %if.end27
	ldr	x8, [x19, #24]
	tbnz	w8, #0, .LBB121_19
// %bb.18:
	mov	w0, wzr
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB121_19:                             // %if.then29
	tbnz	w8, #1, .LBB121_21
// %bb.20:                              // %if.else
	ldr	x8, [x21, #120]
	mov	x0, x20
	mov	x1, x19
	ldr	x8, [x8, #56]
	blr	x8
	cbz	w0, .LBB121_23
.LBB121_21:
	mov	w0, #-15
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB121_22:                             // %if.then7
	mov	x0, x20
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	b	halide_error_no_device_interface
.LBB121_23:                             // %if.then42
	ldr	x8, [x19, #24]
	and	x8, x8, #0xfffffffffffffffe
	str	x8, [x19, #24]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end121:
	.size	copy_to_device_already_locked, .Lfunc_end121-copy_to_device_already_locked
                                        // -- End function
	.section	.text.halide_device_malloc,"ax",@progbits
	.weak	halide_device_malloc    // -- Begin function halide_device_malloc
	.p2align	2
	.type	halide_device_malloc,@function
halide_device_malloc:                   // @halide_device_malloc
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x2
	mov	x21, x1
	mov	x20, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB122_5
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x21]
	cbnz	x8, .LBB122_6
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB122_6
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	cbz	w0, .LBB122_11
.LBB122_4:                              // %cleanup12
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB122_5:                              // %if.then.i
	adrp	x1, .L.str.18.92
	add	x1, x1, :lo12:.L.str.18.92
	mov	x0, x20
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB122_4
	b	.LBB122_11
.LBB122_6:                              // %if.end10.i
	cbnz	x9, .LBB122_9
// %bb.7:                               // %if.end10.i
	cbz	x8, .LBB122_9
// %bb.8:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB122_4
	b	.LBB122_11
.LBB122_9:                              // %if.end16.i
	ldr	w9, [x21, #24]
	mvn	w9, w9
	tst	x9, #0x3
	b.ne	.LBB122_12
// %bb.10:                              // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB122_4
.LBB122_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x8, [x21, #8]
.LBB122_12:                             // %if.end
	cbz	x8, .LBB122_15
// %bb.13:                              // %if.end
	cmp	x8, x19
	b.eq	.LBB122_15
// %bb.14:                              // %if.then6
	adrp	x1, .L.str.20.93
	add	x1, x1, :lo12:.L.str.20.93
	mov	x0, x20
	bl	halide_error
	mov	w0, #-42
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB122_15:                             // %if.end7
	ldr	x8, [x19, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x19, #120]
	mov	x0, x20
	mov	x1, x21
	ldr	x8, [x8, #16]
	blr	x8
	ldr	x8, [x19, #120]
	mov	w19, w0
	ldr	x8, [x8, #8]
	blr	x8
	cmp	w19, #0                 // =0
	mov	w8, #-16
	csel	w0, wzr, w8, eq
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end122:
	.size	halide_device_malloc, .Lfunc_end122-halide_device_malloc
                                        // -- End function
	.section	.text.halide_copy_to_device,"ax",@progbits
	.weak	halide_copy_to_device   // -- Begin function halide_copy_to_device
	.p2align	2
	.type	halide_copy_to_device,@function
halide_copy_to_device:                  // @halide_copy_to_device
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	adrp	x22, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	mov	x21, x0
	add	x29, sp, #32            // =32
	mov	x19, x2
	mov	x0, x22
	mov	x20, x1
	bl	halide_mutex_lock
	mov	x0, x21
	mov	x1, x20
	mov	x2, x19
	bl	copy_to_device_already_locked
	mov	w19, w0
	mov	x0, x22
	bl	halide_mutex_unlock
	mov	w0, w19
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end123:
	.size	halide_copy_to_device, .Lfunc_end123-halide_copy_to_device
                                        // -- End function
	.section	.text.halide_device_sync,"ax",@progbits
	.weak	halide_device_sync      // -- Begin function halide_device_sync
	.p2align	2
	.type	halide_device_sync,@function
halide_device_sync:                     // @halide_device_sync
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	x19, x1
	mov	x20, x0
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	cbz	x1, .LBB124_5
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x19]
	cbnz	x8, .LBB124_6
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB124_6
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	cbz	w0, .LBB124_11
.LBB124_4:                              // %cleanup8
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB124_5:                              // %if.then.i
	adrp	x1, .L.str.17.94
	add	x1, x1, :lo12:.L.str.17.94
	mov	x0, x20
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB124_4
	b	.LBB124_11
.LBB124_6:                              // %if.end10.i
	cbnz	x9, .LBB124_9
// %bb.7:                               // %if.end10.i
	cbz	x8, .LBB124_9
// %bb.8:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB124_4
	b	.LBB124_11
.LBB124_9:                              // %if.end16.i
	ldr	w9, [x19, #24]
	mvn	w9, w9
	tst	x9, #0x3
	b.ne	.LBB124_12
// %bb.10:                              // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB124_4
.LBB124_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x8, [x19, #8]
.LBB124_12:                             // %if.end
	cbz	x8, .LBB124_14
// %bb.13:                              // %if.end5
	ldr	x8, [x8, #120]
	mov	x0, x20
	mov	x1, x19
	ldr	x8, [x8, #32]
	blr	x8
	cmp	w0, #0                  // =0
	mov	w8, #-17
	csel	w0, wzr, w8, eq
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB124_14:                             // %if.then3
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x20
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_error_no_device_interface
.Lfunc_end124:
	.size	halide_device_sync, .Lfunc_end124-halide_device_sync
                                        // -- End function
	.section	.text.halide_device_free,"ax",@progbits
	.weak	halide_device_free      // -- Begin function halide_device_free
	.p2align	2
	.type	halide_device_free,@function
halide_device_free:                     // @halide_device_free
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x20, x1
	mov	x19, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB125_5
// %bb.1:                               // %if.end.i
	ldp	x8, x21, [x20]
	cbnz	x21, .LBB125_6
// %bb.2:                               // %if.end.i
	cbz	x8, .LBB125_6
// %bb.3:                               // %if.then8.i
	mov	x0, x19
	bl	halide_error_no_device_interface
	cbz	w0, .LBB125_11
.LBB125_4:                              // %cleanup12
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB125_5:                              // %if.then.i
	adrp	x1, .L.str.21.97
	add	x1, x1, :lo12:.L.str.21.97
	mov	x0, x19
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB125_4
	b	.LBB125_11
.LBB125_6:                              // %if.end10.i
	cbnz	x8, .LBB125_9
// %bb.7:                               // %if.end10.i
	cbz	x21, .LBB125_9
// %bb.8:                               // %if.then14.i
	mov	x0, x19
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB125_4
	b	.LBB125_11
.LBB125_9:                              // %if.end16.i
	ldr	w8, [x20, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB125_12
// %bb.10:                              // %if.then24.i
	mov	x0, x19
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB125_4
.LBB125_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x21, [x20, #8]
.LBB125_12:                             // %if.end
	cbz	x21, .LBB125_16
// %bb.13:                              // %if.then3
	ldr	x8, [x21, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x21, #120]
	mov	x0, x19
	mov	x1, x20
	ldr	x8, [x8, #24]
	blr	x8
	ldr	x8, [x21, #120]
	mov	w21, w0
	ldr	x8, [x8, #8]
	blr	x8
	ldr	x8, [x20]
	cbz	x8, .LBB125_15
// %bb.14:                              // %if.then8
	adrp	x1, .L.str.22.98
	add	x1, x1, :lo12:.L.str.22.98
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB125_15:                             // %if.end9
	cmp	w21, #0                 // =0
	mov	w8, #-18
	csel	w0, wzr, w8, eq
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB125_16:                             // %if.end11
	ldr	x8, [x20, #24]
	mov	w0, wzr
	and	x8, x8, #0xfffffffffffffffd
	str	x8, [x20, #24]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end125:
	.size	halide_device_free, .Lfunc_end125-halide_device_free
                                        // -- End function
	.section	.text.halide_device_free_as_destructor,"ax",@progbits
	.weak	halide_device_free_as_destructor // -- Begin function halide_device_free_as_destructor
	.p2align	2
	.type	halide_device_free_as_destructor,@function
halide_device_free_as_destructor:       // @halide_device_free_as_destructor
// %bb.0:                               // %entry
	b	halide_device_free
.Lfunc_end126:
	.size	halide_device_free_as_destructor, .Lfunc_end126-halide_device_free_as_destructor
                                        // -- End function
	.section	.text.halide_device_and_host_malloc,"ax",@progbits
	.weak	halide_device_and_host_malloc // -- Begin function halide_device_and_host_malloc
	.p2align	2
	.type	halide_device_and_host_malloc,@function
halide_device_and_host_malloc:          // @halide_device_and_host_malloc
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x20, x2
	mov	x21, x1
	mov	x19, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB127_5
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x21]
	cbnz	x8, .LBB127_6
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB127_6
// %bb.3:                               // %if.then8.i
	mov	x0, x19
	bl	halide_error_no_device_interface
	cbz	w0, .LBB127_11
.LBB127_4:                              // %cleanup14
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB127_5:                              // %if.then.i
	adrp	x1, .L.str.23.99
	add	x1, x1, :lo12:.L.str.23.99
	mov	x0, x19
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB127_4
	b	.LBB127_11
.LBB127_6:                              // %if.end10.i
	cbnz	x9, .LBB127_9
// %bb.7:                               // %if.end10.i
	cbz	x8, .LBB127_9
// %bb.8:                               // %if.then14.i
	mov	x0, x19
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB127_4
	b	.LBB127_11
.LBB127_9:                              // %if.end16.i
	ldr	w9, [x21, #24]
	mvn	w9, w9
	tst	x9, #0x3
	b.ne	.LBB127_12
// %bb.10:                              // %if.then24.i
	mov	x0, x19
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB127_4
.LBB127_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x8, [x21, #8]
.LBB127_12:                             // %if.end
	cbz	x8, .LBB127_15
// %bb.13:                              // %if.end
	cmp	x8, x20
	b.eq	.LBB127_15
// %bb.14:                              // %if.then6
	adrp	x1, .L.str.25.100
	add	x1, x1, :lo12:.L.str.25.100
	mov	x0, x19
	bl	halide_error
	mov	w0, #-42
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB127_15:                             // %if.end7
	ldr	x8, [x20, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x20, #120]
	mov	x0, x19
	mov	x1, x21
	ldr	x8, [x8, #64]
	blr	x8
	ldr	x8, [x20, #120]
	mov	w20, w0
	ldr	x8, [x8, #8]
	blr	x8
	cbz	w20, .LBB127_17
// %bb.16:                              // %if.then12
	adrp	x1, .L.str.26.101
	add	x1, x1, :lo12:.L.str.26.101
	mov	x0, x19
	bl	halide_error
	mov	w0, #-16
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB127_17:
	mov	w0, wzr
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end127:
	.size	halide_device_and_host_malloc, .Lfunc_end127-halide_device_and_host_malloc
                                        // -- End function
	.section	.text.halide_device_and_host_free,"ax",@progbits
	.weak	halide_device_and_host_free // -- Begin function halide_device_and_host_free
	.p2align	2
	.type	halide_device_and_host_free,@function
halide_device_and_host_free:            // @halide_device_and_host_free
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x1
	mov	x20, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB128_5
// %bb.1:                               // %if.end.i
	ldp	x8, x21, [x19]
	cbnz	x21, .LBB128_6
// %bb.2:                               // %if.end.i
	cbz	x8, .LBB128_6
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	cbz	w0, .LBB128_11
.LBB128_4:                              // %cleanup18
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB128_5:                              // %if.then.i
	adrp	x1, .L.str.27.102
	add	x1, x1, :lo12:.L.str.27.102
	mov	x0, x20
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB128_4
	b	.LBB128_11
.LBB128_6:                              // %if.end10.i
	cbnz	x8, .LBB128_9
// %bb.7:                               // %if.end10.i
	cbz	x21, .LBB128_9
// %bb.8:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB128_4
	b	.LBB128_11
.LBB128_9:                              // %if.end16.i
	ldr	w8, [x19, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB128_12
// %bb.10:                              // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB128_4
.LBB128_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x21, [x19, #8]
.LBB128_12:                             // %if.end
	cbz	x21, .LBB128_16
// %bb.13:                              // %if.then3
	ldr	x8, [x21, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x21, #120]
	mov	x0, x20
	mov	x1, x19
	ldr	x8, [x8, #72]
	blr	x8
	ldr	x8, [x21, #120]
	mov	w21, w0
	ldr	x8, [x8, #8]
	blr	x8
	ldr	x8, [x19]
	cbz	x8, .LBB128_15
// %bb.14:                              // %if.then8
	adrp	x1, .L.str.28.103
	add	x1, x1, :lo12:.L.str.28.103
	mov	x0, x20
	bl	halide_print
	bl	abort
.LBB128_15:                             // %if.end9
	cmp	w21, #0                 // =0
	mov	w8, #-18
	csel	w0, wzr, w8, eq
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB128_16:                             // %if.else11
	ldr	x1, [x19, #16]
	cbz	x1, .LBB128_18
// %bb.17:                              // %if.then13
	mov	x0, x20
	bl	halide_free
	str	xzr, [x19, #16]
.LBB128_18:                             // %if.end17
	ldr	x8, [x19, #24]
	mov	w0, wzr
	and	x8, x8, #0xfffffffffffffffd
	str	x8, [x19, #24]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end128:
	.size	halide_device_and_host_free, .Lfunc_end128-halide_device_and_host_free
                                        // -- End function
	.section	.text.halide_default_device_and_host_malloc,"ax",@progbits
	.weak	halide_default_device_and_host_malloc // -- Begin function halide_default_device_and_host_malloc
	.p2align	2
	.type	halide_default_device_and_host_malloc,@function
halide_default_device_and_host_malloc:  // @halide_default_device_and_host_malloc
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x21, x2
	mov	x19, x1
	mov	x20, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB129_4
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x19]
	cbnz	x8, .LBB129_5
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB129_5
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	mov	w22, w0
	cbnz	w0, .LBB129_43
	b	.LBB129_10
.LBB129_4:                              // %if.then.i
	adrp	x1, .L.str.29.104
	add	x1, x1, :lo12:.L.str.29.104
	mov	x0, x20
	bl	halide_error_buffer_is_null
	mov	w22, w0
	cbnz	w0, .LBB129_43
	b	.LBB129_10
.LBB129_5:                              // %if.end10.i
	cbnz	x9, .LBB129_8
// %bb.6:                               // %if.end10.i
	cbz	x8, .LBB129_8
// %bb.7:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	mov	w22, w0
	cbnz	w0, .LBB129_43
	b	.LBB129_10
.LBB129_8:                              // %if.end16.i
	ldr	w8, [x19, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB129_10
// %bb.9:                               // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	mov	w22, w0
	cbnz	w0, .LBB129_43
.LBB129_10:                             // %if.end
	ldrsw	x8, [x19, #36]
	cmp	w8, #0                  // =0
	b.le	.LBB129_13
// %bb.11:                              // %for.body.lr.ph.i.i
	ldr	x9, [x19, #40]
	cmp	w8, #3                  // =3
	b.hs	.LBB129_14
// %bb.12:
	mov	x11, xzr
	mov	x10, xzr
	b	.LBB129_21
.LBB129_13:                             // %_ZNK15halide_buffer_t3endEv.exit.thread.i
	ldrb	w11, [x19, #33]
	mov	x13, xzr
	mov	w8, #1
	b	.LBB129_39
.LBB129_14:                             // %vector.ph
	and	x11, x8, #0xfffffffffffffffe
	mov	x10, xzr
	mov	x12, xzr
	add	x13, x9, #24            // =24
	mov	x14, x11
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.ge	.LBB129_17
	b	.LBB129_18
.LBB129_15:                             // %pred.load.continue7
                                        //   in Loop: Header=BB129_18 Depth=1
	sub	w17, w17, #1            // =1
	sub	w18, w18, #1            // =1
	cmp	w16, #0                 // =0
	mul	w16, w17, w16
	mul	w17, w18, w15
	csel	w16, w16, wzr, gt
	cmp	w15, #0                 // =0
	csel	w15, w17, wzr, gt
	add	x10, x10, w16, sxtw
	subs	x14, x14, #2            // =2
	add	x12, x12, w15, sxtw
	add	x13, x13, #32           // =32
	b.eq	.LBB129_20
// %bb.16:                              // %vector.body
                                        //   in Loop: Header=BB129_18 Depth=1
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.lt	.LBB129_18
.LBB129_17:                             // %pred.load.if
	ldur	w17, [x13, #-20]
.LBB129_18:                             // %pred.load.continue
                                        // =>This Inner Loop Header: Depth=1
	cmp	w15, #1                 // =1
                                        // implicit-def: $w18
	b.lt	.LBB129_15
// %bb.19:                              // %pred.load.if6
                                        //   in Loop: Header=BB129_18 Depth=1
	ldur	w18, [x13, #-4]
	b	.LBB129_15
.LBB129_20:                             // %middle.block
	cmp	x11, x8
	add	x10, x12, x10
	b.eq	.LBB129_25
.LBB129_21:                             // %for.body.i.i.preheader
	sub	x12, x8, x11
	add	x11, x9, x11, lsl #4
	add	x11, x11, #8            // =8
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.ge	.LBB129_24
.LBB129_22:                             // %for.inc.i.i
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.eq	.LBB129_25
.LBB129_23:                             // %for.body.i.i
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.lt	.LBB129_22
.LBB129_24:                             // %if.then.i.i
	ldursw	x14, [x11, #-4]
	sub	x14, x14, #1            // =1
	madd	x10, x14, x13, x10
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.ne	.LBB129_23
.LBB129_25:                             // %for.body.lr.ph.i5.i
	ldrb	w11, [x19, #33]
	cmp	w8, #3                  // =3
	b.hs	.LBB129_27
// %bb.26:
	mov	x12, xzr
	mov	x13, xzr
	b	.LBB129_34
.LBB129_27:                             // %vector.ph13
	and	x12, x8, #0xfffffffffffffffe
	mov	x13, xzr
	mov	x14, xzr
	add	x15, x9, #24            // =24
	mov	x16, x12
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbz	w17, #31, .LBB129_30
	b	.LBB129_31
.LBB129_28:                             // %pred.load.continue27
	sub	w0, w0, #1              // =1
	sub	w1, w1, #1              // =1
	mul	w0, w0, w17
	mul	w1, w1, w18
	and	w17, w0, w17, asr #31
	and	w18, w1, w18, asr #31
	subs	x16, x16, #2            // =2
	add	x13, x13, w17, sxtw
	add	x14, x14, w18, sxtw
	add	x15, x15, #32           // =32
	b.eq	.LBB129_33
// %bb.29:                              // %vector.body9
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbnz	w17, #31, .LBB129_31
.LBB129_30:                             // %pred.load.continue25
                                        // implicit-def: $w1
	tbz	w18, #31, .LBB129_28
	b	.LBB129_32
.LBB129_31:                             // %pred.load.if24
	ldur	w0, [x15, #-20]
                                        // implicit-def: $w1
	tbz	w18, #31, .LBB129_28
.LBB129_32:                             // %pred.load.if26
	ldur	w1, [x15, #-4]
	b	.LBB129_28
.LBB129_33:                             // %middle.block10
	cmp	x12, x8
	add	x13, x14, x13
	b.eq	.LBB129_38
.LBB129_34:                             // %for.body.i16.i.preheader
	add	x9, x9, x12, lsl #4
	sub	x8, x8, x12
	add	x9, x9, #8              // =8
	ldrsw	x12, [x9]
	tbnz	w12, #31, .LBB129_37
.LBB129_35:                             // %for.inc.i26.i
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	b.eq	.LBB129_38
.LBB129_36:                             // %for.body.i16.i
	ldrsw	x12, [x9]
	tbz	w12, #31, .LBB129_35
.LBB129_37:                             // %if.then.i22.i
	ldursw	x14, [x9, #-4]
	sub	x14, x14, #1            // =1
	madd	x13, x14, x12, x13
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	b.ne	.LBB129_36
.LBB129_38:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	add	x8, x10, #1             // =1
.LBB129_39:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	add	x9, x11, #7             // =7
	lsr	x9, x9, #3
	sub	x8, x8, x13
	mul	x1, x8, x9
	mov	x0, x20
	bl	halide_malloc
	str	x0, [x19, #16]
	cbz	x0, .LBB129_42
// %bb.40:                              // %if.end6
	mov	x0, x20
	mov	x1, x19
	mov	x2, x21
	bl	halide_device_malloc
	mov	w22, w0
	cbz	w0, .LBB129_43
// %bb.41:                              // %if.then9
	ldr	x1, [x19, #16]
	mov	x0, x20
	bl	halide_free
	str	xzr, [x19, #16]
	b	.LBB129_43
.LBB129_42:
	mov	w22, #-1
.LBB129_43:                             // %cleanup13
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w22
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end129:
	.size	halide_default_device_and_host_malloc, .Lfunc_end129-halide_default_device_and_host_malloc
                                        // -- End function
	.section	.text.halide_default_device_and_host_free,"ax",@progbits
	.weak	halide_default_device_and_host_free // -- Begin function halide_default_device_and_host_free
	.p2align	2
	.type	halide_default_device_and_host_free,@function
halide_default_device_and_host_free:    // @halide_default_device_and_host_free
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x1
	mov	x20, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB130_4
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x19]
	cbnz	x8, .LBB130_5
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB130_5
// %bb.3:                               // %if.then8.i
	mov	x0, x20
	bl	halide_error_no_device_interface
	mov	w21, w0
	cbnz	w0, .LBB130_13
	b	.LBB130_10
.LBB130_4:                              // %if.then.i
	adrp	x1, .L.str.30.105
	add	x1, x1, :lo12:.L.str.30.105
	mov	x0, x20
	bl	halide_error_buffer_is_null
	mov	w21, w0
	cbnz	w0, .LBB130_13
	b	.LBB130_10
.LBB130_5:                              // %if.end10.i
	cbnz	x9, .LBB130_8
// %bb.6:                               // %if.end10.i
	cbz	x8, .LBB130_8
// %bb.7:                               // %if.then14.i
	mov	x0, x20
	bl	halide_error_device_interface_no_device
	mov	w21, w0
	cbnz	w0, .LBB130_13
	b	.LBB130_10
.LBB130_8:                              // %if.end16.i
	ldr	w8, [x19, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB130_10
// %bb.9:                               // %if.then24.i
	mov	x0, x20
	bl	halide_error_host_and_device_dirty
	mov	w21, w0
	cbnz	w0, .LBB130_13
.LBB130_10:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.split
	mov	x0, x20
	mov	x1, x19
	bl	halide_device_free
	ldr	x1, [x19, #16]
	mov	w21, w0
	cbz	x1, .LBB130_12
// %bb.11:                              // %if.then2
	mov	x0, x20
	bl	halide_free
	str	xzr, [x19, #16]
.LBB130_12:                             // %if.end5
	ldr	x8, [x19, #24]
	and	x8, x8, #0xfffffffffffffffc
	str	x8, [x19, #24]
.LBB130_13:                             // %cleanup
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w21
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end130:
	.size	halide_default_device_and_host_free, .Lfunc_end130-halide_default_device_and_host_free
                                        // -- End function
	.section	.text.halide_device_wrap_native,"ax",@progbits
	.weak	halide_device_wrap_native // -- Begin function halide_device_wrap_native
	.p2align	2
	.type	halide_device_wrap_native,@function
halide_device_wrap_native:              // @halide_device_wrap_native
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x19, x3
	mov	x20, x2
	mov	x22, x1
	mov	x21, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB131_5
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x22]
	cbnz	x8, .LBB131_6
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB131_6
// %bb.3:                               // %if.then8.i
	mov	x0, x21
	bl	halide_error_no_device_interface
	cbz	w0, .LBB131_11
.LBB131_4:                              // %cleanup12
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.LBB131_5:                              // %if.then.i
	adrp	x1, .L.str.31.106
	add	x1, x1, :lo12:.L.str.31.106
	mov	x0, x21
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB131_4
	b	.LBB131_11
.LBB131_6:                              // %if.end10.i
	cbnz	x9, .LBB131_9
// %bb.7:                               // %if.end10.i
	cbz	x8, .LBB131_9
// %bb.8:                               // %if.then14.i
	mov	x0, x21
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB131_4
	b	.LBB131_11
.LBB131_9:                              // %if.end16.i
	ldr	w9, [x22, #24]
	mvn	w9, w9
	tst	x9, #0x3
	b.ne	.LBB131_12
// %bb.10:                              // %if.then24.i
	mov	x0, x21
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB131_4
.LBB131_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x8, [x22, #8]
.LBB131_12:                             // %if.end
	cbz	x8, .LBB131_15
// %bb.13:                              // %if.end
	cmp	x8, x19
	b.eq	.LBB131_15
// %bb.14:                              // %if.then4
	adrp	x1, .L.str.32.107
	add	x1, x1, :lo12:.L.str.32.107
	mov	x0, x21
	bl	halide_error
	mov	w0, #-42
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.LBB131_15:                             // %if.end5
	ldr	x8, [x19, #120]
	ldr	x8, [x8]
	blr	x8
	str	x19, [x22, #8]
	ldr	x8, [x19, #120]
	mov	x0, x21
	mov	x1, x22
	mov	x2, x20
	ldr	x8, [x8, #112]
	blr	x8
	ldr	x8, [x19, #120]
	mov	w19, w0
	ldr	x8, [x8, #8]
	blr	x8
	cmp	w19, #0                 // =0
	mov	w8, #-16
	csel	w0, wzr, w8, eq
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end131:
	.size	halide_device_wrap_native, .Lfunc_end131-halide_device_wrap_native
                                        // -- End function
	.section	.text.halide_device_detach_native,"ax",@progbits
	.weak	halide_device_detach_native // -- Begin function halide_device_detach_native
	.p2align	2
	.type	halide_device_detach_native,@function
halide_device_detach_native:            // @halide_device_detach_native
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x20, x1
	mov	x19, x0
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x1, .LBB132_5
// %bb.1:                               // %if.end.i
	ldp	x8, x21, [x20]
	cbnz	x21, .LBB132_6
// %bb.2:                               // %if.end.i
	cbz	x8, .LBB132_6
// %bb.3:                               // %if.then8.i
	mov	x0, x19
	bl	halide_error_no_device_interface
	cbz	w0, .LBB132_11
.LBB132_4:                              // %cleanup
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB132_5:                              // %if.then.i
	adrp	x1, .L.str.33.108
	add	x1, x1, :lo12:.L.str.33.108
	mov	x0, x19
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB132_4
	b	.LBB132_11
.LBB132_6:                              // %if.end10.i
	cbnz	x8, .LBB132_9
// %bb.7:                               // %if.end10.i
	cbz	x21, .LBB132_9
// %bb.8:                               // %if.then14.i
	mov	x0, x19
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB132_4
	b	.LBB132_11
.LBB132_9:                              // %if.end16.i
	ldr	w8, [x20, #24]
	mvn	w8, w8
	tst	x8, #0x3
	b.ne	.LBB132_12
// %bb.10:                              // %if.then24.i
	mov	x0, x19
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB132_4
.LBB132_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x21, [x20, #8]
.LBB132_12:                             // %if.end
	cbz	x21, .LBB132_16
// %bb.13:                              // %if.then3
	ldr	x8, [x21, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x21, #120]
	mov	x0, x19
	mov	x1, x20
	ldr	x8, [x8, #120]
	blr	x8
	ldr	x8, [x21, #120]
	mov	w21, w0
	ldr	x8, [x8, #8]
	blr	x8
	ldr	x8, [x20]
	cbz	x8, .LBB132_15
// %bb.14:                              // %if.then8
	adrp	x1, .L.str.34.109
	add	x1, x1, :lo12:.L.str.34.109
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB132_15:                             // %if.end9
	cmp	w21, #0                 // =0
	mov	w8, #-33
	csel	w0, wzr, w8, eq
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.LBB132_16:
	mov	w0, wzr
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end132:
	.size	halide_device_detach_native, .Lfunc_end132-halide_device_detach_native
                                        // -- End function
	.section	.text.halide_default_device_wrap_native,"ax",@progbits
	.weak	halide_default_device_wrap_native // -- Begin function halide_default_device_wrap_native
	.p2align	2
	.type	halide_default_device_wrap_native,@function
halide_default_device_wrap_native:      // @halide_default_device_wrap_native
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	x19, x2
	mov	x20, x1
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	cbz	x1, .LBB133_5
// %bb.1:                               // %if.end.i
	ldp	x9, x8, [x20]
	cbnz	x8, .LBB133_6
// %bb.2:                               // %if.end.i
	cbz	x9, .LBB133_6
// %bb.3:                               // %if.then8.i
	bl	halide_error_no_device_interface
	cbz	w0, .LBB133_11
.LBB133_4:                              // %cleanup
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB133_5:                              // %if.then.i
	adrp	x1, .L.str.35.110
	add	x1, x1, :lo12:.L.str.35.110
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB133_4
	b	.LBB133_11
.LBB133_6:                              // %if.end10.i
	cbnz	x9, .LBB133_9
// %bb.7:                               // %if.end10.i
	cbz	x8, .LBB133_9
// %bb.8:                               // %if.then14.i
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB133_4
	b	.LBB133_11
.LBB133_9:                              // %if.end16.i
	ldr	w9, [x20, #24]
	mvn	w9, w9
	tst	x9, #0x3
	b.ne	.LBB133_12
// %bb.10:                              // %if.then24.i
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB133_4
.LBB133_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x8, [x20, #8]
.LBB133_12:                             // %if.end
	ldr	x8, [x8, #120]
	ldr	x8, [x8]
	blr	x8
	mov	w0, wzr
	str	x19, [x20]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end133:
	.size	halide_default_device_wrap_native, .Lfunc_end133-halide_default_device_wrap_native
                                        // -- End function
	.section	.text.halide_default_device_detach_native,"ax",@progbits
	.weak	halide_default_device_detach_native // -- Begin function halide_default_device_detach_native
	.p2align	2
	.type	halide_default_device_detach_native,@function
halide_default_device_detach_native:    // @halide_default_device_detach_native
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	mov	x19, x1
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	cbz	x1, .LBB134_5
// %bb.1:                               // %if.end.i
	ldp	x8, x9, [x19]
	cbnz	x9, .LBB134_6
// %bb.2:                               // %if.end.i
	cbz	x8, .LBB134_6
// %bb.3:                               // %if.then8.i
	bl	halide_error_no_device_interface
	cbz	w0, .LBB134_11
.LBB134_4:                              // %cleanup
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.LBB134_5:                              // %if.then.i
	adrp	x1, .L.str.36
	add	x1, x1, :lo12:.L.str.36
	bl	halide_error_buffer_is_null
	cbnz	w0, .LBB134_4
	b	.LBB134_11
.LBB134_6:                              // %if.end10.i
	cbnz	x8, .LBB134_9
// %bb.7:                               // %if.end10.i
	cbz	x9, .LBB134_9
// %bb.8:                               // %if.then14.i
	bl	halide_error_device_interface_no_device
	cbnz	w0, .LBB134_4
	b	.LBB134_11
.LBB134_9:                              // %if.end16.i
	ldr	w9, [x19, #24]
	mvn	w9, w9
	tst	x9, #0x3
	b.ne	.LBB134_12
// %bb.10:                              // %if.then24.i
	bl	halide_error_host_and_device_dirty
	cbnz	w0, .LBB134_4
.LBB134_11:                             // %_ZN12_GLOBAL__N_126debug_log_and_validate_bufEPvPK15halide_buffer_tPKc.exit.if.end_crit_edge
	ldr	x8, [x19]
.LBB134_12:                             // %if.end
	cbz	x8, .LBB134_14
// %bb.13:                              // %if.end3
	ldr	x8, [x19, #8]
	ldr	x8, [x8, #120]
	ldr	x8, [x8, #8]
	blr	x8
	mov	w0, wzr
	stp	xzr, xzr, [x19]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.LBB134_14:
	mov	w0, wzr
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end134:
	.size	halide_default_device_detach_native, .Lfunc_end134-halide_default_device_detach_native
                                        // -- End function
	.section	.text.halide_device_and_host_free_as_destructor,"ax",@progbits
	.weak	halide_device_and_host_free_as_destructor // -- Begin function halide_device_and_host_free_as_destructor
	.p2align	2
	.type	halide_device_and_host_free_as_destructor,@function
halide_device_and_host_free_as_destructor: // @halide_device_and_host_free_as_destructor
// %bb.0:                               // %entry
	b	halide_device_and_host_free
.Lfunc_end135:
	.size	halide_device_and_host_free_as_destructor, .Lfunc_end135-halide_device_and_host_free_as_destructor
                                        // -- End function
	.section	.text.halide_device_host_nop_free,"ax",@progbits
	.weak	halide_device_host_nop_free // -- Begin function halide_device_host_nop_free
	.p2align	2
	.type	halide_device_host_nop_free,@function
halide_device_host_nop_free:            // @halide_device_host_nop_free
// %bb.0:                               // %entry
	ret
.Lfunc_end136:
	.size	halide_device_host_nop_free, .Lfunc_end136-halide_device_host_nop_free
                                        // -- End function
	.section	.text.halide_default_buffer_copy,"ax",@progbits
	.weak	halide_default_buffer_copy // -- Begin function halide_default_buffer_copy
	.p2align	2
	.type	halide_default_buffer_copy,@function
halide_default_buffer_copy:             // @halide_default_buffer_copy
// %bb.0:                               // %entry
	mov	w0, #-39
	ret
.Lfunc_end137:
	.size	halide_default_buffer_copy, .Lfunc_end137-halide_default_buffer_copy
                                        // -- End function
	.section	.text.halide_buffer_copy_already_locked,"ax",@progbits
	.weak	halide_buffer_copy_already_locked // -- Begin function halide_buffer_copy_already_locked
	.p2align	2
	.type	halide_buffer_copy_already_locked,@function
halide_buffer_copy_already_locked:      // @halide_buffer_copy_already_locked
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	sub	sp, sp, #432            // =432
	mov	x19, x3
	mov	x20, x2
	mov	x21, x1
	mov	x22, x0
	cbz	x2, .LBB138_5
// %bb.1:                               // %land.lhs.true
	ldr	x8, [x19, #8]
	cbz	x8, .LBB138_4
// %bb.2:                               // %land.lhs.true
	cmp	x8, x20
	b.eq	.LBB138_4
// %bb.3:                               // %if.then
	adrp	x1, .L.str.42
	add	x1, x1, :lo12:.L.str.42
	mov	x0, x22
	bl	halide_error
	mov	w0, #-42
	b	.LBB138_39
.LBB138_4:                              // %land.lhs.true5
	ldr	x8, [x19]
	cbz	x8, .LBB138_23
.LBB138_5:                              // %if.end13
	ldr	x9, [x21]
	ldr	x8, [x21, #16]
	cbz	x9, .LBB138_9
// %bb.6:                               // %land.rhs
	cbz	x8, .LBB138_14
// %bb.7:                               // %land.end.thread
	ldr	x8, [x21, #24]
	cmp	x20, #0                 // =0
	cset	w24, eq
	and	w23, w8, #0x1
	tbnz	w8, #1, .LBB138_11
.LBB138_8:
	mov	w26, wzr
	mov	w25, #1
	ldr	x27, [x19, #16]
	eor	w28, w24, #0x1
	cbz	x27, .LBB138_12
	b	.LBB138_15
.LBB138_9:                              // %land.end
	cmp	x20, #0                 // =0
	cset	w24, eq
	cbz	x8, .LBB138_25
// %bb.10:                              // %land.end.land.rhs26_crit_edge
	ldr	x8, [x21, #24]
	mov	w23, #1
	tbz	w8, #1, .LBB138_8
.LBB138_11:                             // %lor.rhs28
	ldr	x8, [x21, #8]
	cmp	x8, #0                  // =0
	cset	w26, ne
	mov	w25, #1
	ldr	x27, [x19, #16]
	eor	w28, w24, #0x1
	cbnz	x27, .LBB138_15
.LBB138_12:                             // %land.end32
	cbnz	w28, .LBB138_15
// %bb.13:
	mov	w0, #-34
	b	.LBB138_39
.LBB138_14:                             // %land.end.thread259
	cmp	x20, #0                 // =0
	mov	w25, wzr
	mov	w23, wzr
	cset	w24, eq
	mov	w26, #1
	ldr	x27, [x19, #16]
	eor	w28, w24, #0x1
	cbz	x27, .LBB138_12
.LBB138_15:                             // %if.end41
	cmp	x20, #0                 // =0
	cset	w8, eq
	orr	w8, w23, w8
	tbnz	w8, #0, .LBB138_17
// %bb.16:                              // %if.end49
	ldr	x8, [x20, #120]
	mov	x0, x22
	mov	x1, x21
	mov	x2, x20
	ldr	x8, [x8, #80]
	mov	x3, x19
	blr	x8
	cmn	w0, #42                 // =42
	b.ne	.LBB138_32
.LBB138_17:                             // %if.then51
	cmp	x27, #0                 // =0
	cset	w8, eq
	bic	w8, w8, w25
	tbnz	w8, #0, .LBB138_24
// %bb.18:                              // %if.end58
	orr	w8, w26, w28
	tbz	w8, #0, .LBB138_26
// %bb.19:                              // %if.else
	cbz	w24, .LBB138_27
// %bb.20:                              // %if.then64
	ldr	x8, [x21, #8]
	mov	x0, x22
	mov	x1, x21
	mov	x2, xzr
	ldr	x8, [x8, #120]
	mov	x3, x19
	ldr	x8, [x8, #80]
	blr	x8
	cmn	w0, #42                 // =42
	b.ne	.LBB138_32
// %bb.21:                              // %if.then72
	mov	x0, x22
	mov	x1, x21
	bl	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
	cbnz	w0, .LBB138_39
// %bb.22:                              // %if.then75
	mov	x0, x22
	mov	x1, x21
	mov	x2, xzr
	mov	x3, x19
	bl	halide_buffer_copy_already_locked
	cbnz	w0, .LBB138_39
	b	.LBB138_33
.LBB138_23:                             // %if.then7
	mov	x0, x22
	mov	x1, x19
	mov	x2, x20
	bl	halide_device_malloc
	cbnz	w0, .LBB138_39
	b	.LBB138_5
.LBB138_24:
	mov	w0, #-42
	b	.LBB138_39
.LBB138_25:
	mov	w25, wzr
	mov	w23, #1
	mov	w26, #1
	ldr	x27, [x19, #16]
	eor	w28, w24, #0x1
	cbz	x27, .LBB138_12
	b	.LBB138_15
.LBB138_26:                             // %if.end109.thread249
	add	x8, sp, #8              // =8
	mov	w1, #1
	mov	w3, #1
	mov	x0, x21
	mov	x2, x19
	bl	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
	add	x0, sp, #8              // =8
	mov	x1, x22
	bl	_ZN6Halide7Runtime8Internal11copy_memoryERKNS1_11device_copyEPv
	cmp	x19, x21
	b.ne	.LBB138_34
	b	.LBB138_36
.LBB138_27:                             // %if.else79
	cmp	x27, #0                 // =0
	cset	w8, eq
	orr	w8, w23, w8
	tbz	w8, #0, .LBB138_30
// %bb.28:                              // %if.else96
	mov	x0, x22
	mov	x1, x21
	bl	_ZN6Halide7Runtime8Internal27copy_to_host_already_lockedEPvP15halide_buffer_t
	cbnz	w0, .LBB138_39
// %bb.29:                              // %if.then101
	ldr	x8, [x20, #120]
	mov	x0, x22
	mov	x1, x21
	mov	x2, x20
	ldr	x8, [x8, #80]
	mov	x3, x19
	blr	x8
	cbnz	w0, .LBB138_39
	b	.LBB138_33
.LBB138_30:                             // %if.then83
	ldr	x8, [x21, #8]
	mov	x0, x22
	mov	x1, x21
	mov	x2, xzr
	ldr	x8, [x8, #120]
	mov	x3, x19
	ldr	x8, [x8, #80]
	blr	x8
	cbnz	w0, .LBB138_39
// %bb.31:                              // %if.then93
	ldr	x8, [x19, #24]
	mov	x0, x22
	mov	x1, x19
	mov	x2, x20
	orr	x8, x8, #0x1
	str	x8, [x19, #24]
	bl	copy_to_device_already_locked
.LBB138_32:                             // %if.end109
	cbnz	w0, .LBB138_39
.LBB138_33:                             // %land.lhs.true118
	cmp	x19, x21
	b.eq	.LBB138_36
.LBB138_34:                             // %if.then120
	ldr	x8, [x19, #24]
	mov	w0, wzr
	and	x8, x8, #0xfffffffffffffffc
	cbz	x20, .LBB138_37
// %bb.35:                              // %if.then122
	orr	x8, x8, #0x2
	b	.LBB138_38
.LBB138_36:
	mov	w0, wzr
	b	.LBB138_39
.LBB138_37:                             // %if.else125
	orr	x8, x8, #0x1
.LBB138_38:                             // %cleanup135
	str	x8, [x19, #24]
.LBB138_39:                             // %cleanup135
	add	sp, sp, #432            // =432
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end138:
	.size	halide_buffer_copy_already_locked, .Lfunc_end138-halide_buffer_copy_already_locked
                                        // -- End function
	.section	.text.halide_buffer_copy,"ax",@progbits
	.weak	halide_buffer_copy      // -- Begin function halide_buffer_copy
	.p2align	2
	.type	halide_buffer_copy,@function
halide_buffer_copy:                     // @halide_buffer_copy
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	mov	x22, x0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	add	x29, sp, #32            // =32
	mov	x21, x3
	mov	x20, x2
	mov	x19, x1
	bl	halide_mutex_lock
	cbz	x20, .LBB139_2
// %bb.1:                               // %if.then
	ldr	x8, [x20, #120]
	ldr	x8, [x8]
	blr	x8
.LBB139_2:                              // %if.end
	ldr	x8, [x19, #8]
	cbz	x8, .LBB139_4
// %bb.3:                               // %if.then12
	ldr	x8, [x8, #120]
	ldr	x8, [x8]
	blr	x8
.LBB139_4:                              // %if.end16
	mov	x0, x22
	mov	x1, x19
	mov	x2, x20
	mov	x3, x21
	bl	halide_buffer_copy_already_locked
	mov	w21, w0
	cbz	x20, .LBB139_6
// %bb.5:                               // %if.then18
	ldr	x8, [x20, #120]
	ldr	x8, [x8, #8]
	blr	x8
.LBB139_6:                              // %if.end20
	ldr	x8, [x19, #8]
	cbz	x8, .LBB139_8
// %bb.7:                               // %if.then23
	ldr	x8, [x8, #120]
	ldr	x8, [x8, #8]
	blr	x8
.LBB139_8:                              // %if.end27
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	bl	halide_mutex_unlock
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, w21
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end139:
	.size	halide_buffer_copy, .Lfunc_end139-halide_buffer_copy
                                        // -- End function
	.section	.text.halide_default_device_crop,"ax",@progbits
	.weak	halide_default_device_crop // -- Begin function halide_default_device_crop
	.p2align	2
	.type	halide_default_device_crop,@function
halide_default_device_crop:             // @halide_default_device_crop
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x1, .L.str.58.111
	add	x1, x1, :lo12:.L.str.58.111
	mov	x29, sp
	bl	halide_error
	mov	w0, #-40
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end140:
	.size	halide_default_device_crop, .Lfunc_end140-halide_default_device_crop
                                        // -- End function
	.section	.text.halide_default_device_slice,"ax",@progbits
	.weak	halide_default_device_slice // -- Begin function halide_default_device_slice
	.p2align	2
	.type	halide_default_device_slice,@function
halide_default_device_slice:            // @halide_default_device_slice
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x1, .L.str.59
	add	x1, x1, :lo12:.L.str.59
	mov	x29, sp
	bl	halide_error
	mov	w0, #-40
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end141:
	.size	halide_default_device_slice, .Lfunc_end141-halide_default_device_slice
                                        // -- End function
	.section	.text.halide_device_crop,"ax",@progbits
	.weak	halide_device_crop      // -- Begin function halide_device_crop
	.p2align	2
	.type	halide_device_crop,@function
halide_device_crop:                     // @halide_device_crop
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	mov	x19, x0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	add	x29, sp, #32            // =32
	mov	x20, x2
	mov	x21, x1
	bl	halide_mutex_lock
	ldr	x8, [x21]
	cbz	x8, .LBB142_3
// %bb.1:                               // %if.end
	ldr	x8, [x20]
	cbz	x8, .LBB142_4
// %bb.2:                               // %if.then3
	adrp	x1, .L.str.60
	add	x1, x1, :lo12:.L.str.60
	b	.LBB142_7
.LBB142_3:
	mov	w19, wzr
	b	.LBB142_8
.LBB142_4:                              // %if.end4
	ldr	w8, [x21, #36]
	ldr	w9, [x20, #36]
	cmp	w8, w9
	b.ne	.LBB142_6
// %bb.5:                               // %if.end7
	ldr	x8, [x21, #8]
	ldr	x8, [x8, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x21, #8]
	mov	x0, x19
	mov	x1, x21
	mov	x2, x20
	ldr	x8, [x8, #120]
	ldr	x8, [x8, #88]
	blr	x8
	mov	w19, w0
	b	.LBB142_8
.LBB142_6:                              // %if.then6
	adrp	x1, .L.str.61
	add	x1, x1, :lo12:.L.str.61
.LBB142_7:                              // %cleanup
	mov	x0, x19
	bl	halide_error
	mov	w19, #-41
.LBB142_8:                              // %cleanup
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	bl	halide_mutex_unlock
	mov	w0, w19
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end142:
	.size	halide_device_crop, .Lfunc_end142-halide_device_crop
                                        // -- End function
	.section	.text.halide_device_slice,"ax",@progbits
	.weak	halide_device_slice     // -- Begin function halide_device_slice
	.p2align	2
	.type	halide_device_slice,@function
halide_device_slice:                    // @halide_device_slice
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	mov	x20, x0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	add	x29, sp, #48            // =48
	mov	x19, x4
	mov	w21, w3
	mov	w22, w2
	mov	x23, x1
	bl	halide_mutex_lock
	ldr	x8, [x23]
	cbz	x8, .LBB143_3
// %bb.1:                               // %if.end
	ldr	x8, [x19]
	cbz	x8, .LBB143_4
// %bb.2:                               // %if.then3
	adrp	x1, .L.str.60
	add	x1, x1, :lo12:.L.str.60
	b	.LBB143_7
.LBB143_3:
	mov	w19, wzr
	b	.LBB143_8
.LBB143_4:                              // %if.end4
	ldr	w8, [x19, #36]
	ldr	w9, [x23, #36]
	add	w8, w8, #1              // =1
	cmp	w9, w8
	b.ne	.LBB143_6
// %bb.5:                               // %if.end7
	ldr	x8, [x23, #8]
	ldr	x8, [x8, #120]
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x23, #8]
	mov	x0, x20
	mov	x1, x23
	mov	w2, w22
	ldr	x8, [x8, #120]
	mov	w3, w21
	mov	x4, x19
	ldr	x8, [x8, #96]
	blr	x8
	mov	w19, w0
	b	.LBB143_8
.LBB143_6:                              // %if.then6
	adrp	x1, .L.str.64
	add	x1, x1, :lo12:.L.str.64
.LBB143_7:                              // %cleanup
	mov	x0, x20
	bl	halide_error
	mov	w19, #-41
.LBB143_8:                              // %cleanup
	adrp	x0, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	bl	halide_mutex_unlock
	mov	w0, w19
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end143:
	.size	halide_device_slice, .Lfunc_end143-halide_device_slice
                                        // -- End function
	.section	.text.halide_default_device_release_crop,"ax",@progbits
	.weak	halide_default_device_release_crop // -- Begin function halide_default_device_release_crop
	.p2align	2
	.type	halide_default_device_release_crop,@function
halide_default_device_release_crop:     // @halide_default_device_release_crop
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	ldr	x8, [x1]
	mov	x29, sp
	cbz	x8, .LBB144_2
// %bb.1:                               // %if.end
	adrp	x1, .L.str.58.111
	add	x1, x1, :lo12:.L.str.58.111
	bl	halide_error
	mov	w0, #-40
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.LBB144_2:
	mov	w0, wzr
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end144:
	.size	halide_default_device_release_crop, .Lfunc_end144-halide_default_device_release_crop
                                        // -- End function
	.section	.text.halide_device_release_crop,"ax",@progbits
	.weak	halide_device_release_crop // -- Begin function halide_device_release_crop
	.p2align	2
	.type	halide_device_release_crop,@function
halide_device_release_crop:             // @halide_device_release_crop
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	ldr	x8, [x1]
	add	x29, sp, #32            // =32
	cbz	x8, .LBB145_2
// %bb.1:                               // %if.then
	adrp	x21, :got:_ZN6Halide7Runtime8Internal17device_copy_mutexE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal17device_copy_mutexE]
	mov	x20, x0
	mov	x19, x1
	mov	x0, x21
	bl	halide_mutex_lock
	ldr	x22, [x19, #8]
	mov	x0, x20
	mov	x1, x19
	ldr	x8, [x22, #120]
	ldr	x8, [x8, #104]
	blr	x8
	str	xzr, [x19]
	ldr	x8, [x22, #120]
	mov	w20, w0
	ldr	x8, [x8, #8]
	blr	x8
	mov	x0, x21
	str	xzr, [x19, #8]
	bl	halide_mutex_unlock
	mov	w0, w20
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.LBB145_2:                              // %return
	mov	w0, wzr
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end145:
	.size	halide_device_release_crop, .Lfunc_end145-halide_device_release_crop
                                        // -- End function
	.section	.text.halide_float16_bits_to_float,"ax",@progbits
	.weak	halide_float16_bits_to_float // -- Begin function halide_float16_bits_to_float
	.p2align	2
	.type	halide_float16_bits_to_float,@function
halide_float16_bits_to_float:           // @halide_float16_bits_to_float
// %bb.0:                               // %entry
	lsl	w8, w0, #16
	ands	w9, w0, #0x3ff
	and	w8, w8, #0x80000000
	ubfx	w10, w0, #10, #5
	b.eq	.LBB146_3
// %bb.1:                               // %entry
	cbnz	w10, .LBB146_3
// %bb.2:                               // %if.then
	clz	w10, w9
	mov	w11, #1
	eor	w14, w10, #0x1f
	mov	w12, #23
	lsl	w10, w11, w14
	mov	w13, #864026624
	sub	w11, w12, w14
	bic	w9, w9, w10
	lsl	w10, w9, w11
	add	w9, w13, w14, lsl #23
	orr	w8, w9, w8
	orr	w8, w8, w10
	fmov	s0, w8
	ret
.LBB146_3:                              // %if.else
	lsl	w9, w9, #13
	cbz	w10, .LBB146_6
// %bb.4:                               // %if.else18
	cmp	w10, #31                // =31
	b.ne	.LBB146_7
// %bb.5:
	mov	w10, #2139095040
.LBB146_6:                              // %if.end28
	orr	w8, w9, w8
	orr	w8, w8, w10
	fmov	s0, w8
	ret
.LBB146_7:                              // %if.else21
	mov	w11, #939524096
	add	w10, w11, w10, lsl #23
	orr	w8, w9, w8
	orr	w8, w8, w10
	fmov	s0, w8
	ret
.Lfunc_end146:
	.size	halide_float16_bits_to_float, .Lfunc_end146-halide_float16_bits_to_float
                                        // -- End function
	.section	.text.halide_float16_bits_to_double,"ax",@progbits
	.weak	halide_float16_bits_to_double // -- Begin function halide_float16_bits_to_double
	.p2align	2
	.type	halide_float16_bits_to_double,@function
halide_float16_bits_to_double:          // @halide_float16_bits_to_double
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	x29, sp
	bl	halide_float16_bits_to_float
	fcvt	d0, s0
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end147:
	.size	halide_float16_bits_to_double, .Lfunc_end147-halide_float16_bits_to_double
                                        // -- End function
	.section	.text.halide_error_bounds_inference_call_failed,"ax",@progbits
	.weak	halide_error_bounds_inference_call_failed // -- Begin function halide_error_bounds_inference_call_failed
	.p2align	2
	.type	halide_error_bounds_inference_call_failed,@function
halide_error_bounds_inference_call_failed: // @halide_error_bounds_inference_call_failed
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	w19, w2
	mov	x20, x0
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB148_3
// %bb.1:                               // %if.then.i
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.114
	add	x2, x2, :lo12:.L.str.114
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	cbz	x23, .LBB148_4
.LBB148_2:                              // %if.else.i13
	mov	x1, x22
	mov	x2, x23
	b	.LBB148_5
.LBB148_3:                              // %entry.split
	adrp	x2, .L.str.114
	add	x2, x2, :lo12:.L.str.114
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x23, .LBB148_2
.LBB148_4:                              // %if.then.i11
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB148_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.1.115
	add	x2, x2, :lo12:.L.str.1.115
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w19
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	cbz	x21, .LBB148_7
// %bb.6:                               // %if.else.i25
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	b	.LBB148_8
.LBB148_7:                              // %if.then.i24
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
.LBB148_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	mov	w0, w19
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end148:
	.size	halide_error_bounds_inference_call_failed, .Lfunc_end148-halide_error_bounds_inference_call_failed
                                        // -- End function
	.section	.text.halide_error_extern_stage_failed,"ax",@progbits
	.weak	halide_error_extern_stage_failed // -- Begin function halide_error_extern_stage_failed
	.p2align	2
	.type	halide_error_extern_stage_failed,@function
halide_error_extern_stage_failed:       // @halide_error_extern_stage_failed
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	w19, w2
	mov	x20, x0
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB149_3
// %bb.1:                               // %if.then.i
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.2.116
	add	x2, x2, :lo12:.L.str.2.116
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	cbz	x23, .LBB149_4
.LBB149_2:                              // %if.else.i13
	mov	x1, x22
	mov	x2, x23
	b	.LBB149_5
.LBB149_3:                              // %entry.split
	adrp	x2, .L.str.2.116
	add	x2, x2, :lo12:.L.str.2.116
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x23, .LBB149_2
.LBB149_4:                              // %if.then.i11
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB149_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.1.115
	add	x2, x2, :lo12:.L.str.1.115
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w19
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	cbz	x21, .LBB149_7
// %bb.6:                               // %if.else.i25
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x20
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x20
	mov	x1, x21
	bl	halide_error
	mov	x0, x20
	mov	x1, x21
	b	.LBB149_8
.LBB149_7:                              // %if.then.i24
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x20
	bl	halide_error
	mov	x0, x20
	mov	x1, xzr
.LBB149_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	mov	w0, w19
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end149:
	.size	halide_error_extern_stage_failed, .Lfunc_end149-halide_error_extern_stage_failed
                                        // -- End function
	.section	.text.halide_error_explicit_bounds_too_small,"ax",@progbits
	.weak	halide_error_explicit_bounds_too_small // -- Begin function halide_error_explicit_bounds_too_small
	.p2align	2
	.type	halide_error_explicit_bounds_too_small,@function
halide_error_explicit_bounds_too_small: // @halide_error_explicit_bounds_too_small
// %bb.0:                               // %entry
	str	x27, [sp, #-96]!        // 8-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	mov	x26, x1
	mov	w1, #1024
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	mov	w21, w6
	mov	w22, w5
	mov	w24, w4
	mov	w25, w3
	mov	x27, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB150_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.3.117
	add	x2, x2, :lo12:.L.str.3.117
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x27, .LBB150_4
.LBB150_2:                              // %if.else.i21
	mov	x1, x23
	mov	x2, x27
	b	.LBB150_5
.LBB150_3:                              // %entry.split
	adrp	x2, .L.str.3.117
	add	x2, x2, :lo12:.L.str.3.117
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x27, .LBB150_2
.LBB150_4:                              // %if.then.i19
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x23
.LBB150_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.4.118
	add	x2, x2, :lo12:.L.str.4.118
	mov	x1, x23
	bl	halide_string_to_string
	cbz	x26, .LBB150_7
// %bb.6:                               // %if.else.i33
	mov	x1, x23
	mov	x2, x26
	b	.LBB150_8
.LBB150_7:                              // %if.then.i31
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x23
.LBB150_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit35
	bl	halide_string_to_string
	adrp	x2, .L.str.5.119
	add	x2, x2, :lo12:.L.str.5.119
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w25
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x25, .L.str.6.120
	add	x25, x25, :lo12:.L.str.6.120
	mov	x1, x23
	mov	x2, x25
	bl	halide_string_to_string
	sxtw	x2, w24
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.7.121
	add	x2, x2, :lo12:.L.str.7.121
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w22
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	mov	x1, x23
	mov	x2, x25
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.5.170
	add	x2, x2, :lo12:.L.str.5.170
	mov	x1, x23
	bl	halide_string_to_string
	cbz	x20, .LBB150_10
// %bb.9:                               // %if.else.i79
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB150_11
.LBB150_10:                             // %if.then.i78
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB150_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-2
	ldr	x27, [sp], #96          // 8-byte Folded Reload
	ret
.Lfunc_end150:
	.size	halide_error_explicit_bounds_too_small, .Lfunc_end150-halide_error_explicit_bounds_too_small
                                        // -- End function
	.section	.text.halide_error_bad_type,"ax",@progbits
	.weak	halide_error_bad_type   // -- Begin function halide_error_bad_type
	.p2align	2
	.type	halide_error_bad_type,@function
halide_error_bad_type:                  // @halide_error_bad_type
// %bb.0:                               // %entry
	sub	sp, sp, #80             // =80
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	x22, x1
	mov	x19, x0
	stp	w3, w2, [sp, #24]
	add	x0, sp, #16             // =16
	add	x1, sp, #24             // =24
	mov	w2, #4
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	str	wzr, [sp, #16]
	str	wzr, [sp, #8]
	bl	memcpy
	add	x0, sp, #8              // =8
	add	x1, sp, #28             // =28
	mov	w2, #4
	bl	memcpy
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB151_3
// %bb.1:                               // %if.then.i13
	add	x21, x20, #1023         // =1023
	strb	wzr, [x20, #1023]
	cbz	x22, .LBB151_4
.LBB151_2:                              // %if.else.i20
	mov	x0, x20
	mov	x1, x21
	mov	x2, x22
	b	.LBB151_5
.LBB151_3:
	mov	x21, xzr
	cbnz	x22, .LBB151_2
.LBB151_4:                              // %if.then.i19
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x20
	mov	x1, x21
.LBB151_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.9.123
	add	x2, x2, :lo12:.L.str.9.123
	mov	x1, x21
	bl	halide_string_to_string
	add	x2, sp, #16             // =16
	mov	x1, x21
	bl	halide_type_to_string
	adrp	x2, .L.str.10.124
	add	x2, x2, :lo12:.L.str.10.124
	mov	x1, x21
	bl	halide_string_to_string
	add	x2, sp, #8              // =8
	mov	x1, x21
	bl	halide_type_to_string
	cbz	x20, .LBB151_7
// %bb.6:                               // %if.else.i
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB151_8
.LBB151_7:                              // %if.then.i
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB151_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	mov	w0, #-3
	add	sp, sp, #80             // =80
	ret
.Lfunc_end151:
	.size	halide_error_bad_type, .Lfunc_end151-halide_error_bad_type
                                        // -- End function
	.section	.text.halide_error_bad_dimensions,"ax",@progbits
	.weak	halide_error_bad_dimensions // -- Begin function halide_error_bad_dimensions
	.p2align	2
	.type	halide_error_bad_dimensions,@function
halide_error_bad_dimensions:            // @halide_error_bad_dimensions
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	w23, w3
	mov	w21, w2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB152_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	strb	wzr, [x20, #1023]
	cbz	x24, .LBB152_4
.LBB152_2:                              // %if.else.i10
	mov	x0, x20
	mov	x1, x22
	mov	x2, x24
	b	.LBB152_5
.LBB152_3:
	mov	x22, xzr
	cbnz	x24, .LBB152_2
.LBB152_4:                              // %if.then.i9
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x20
	mov	x1, x22
.LBB152_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.11.125
	add	x2, x2, :lo12:.L.str.11.125
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w23
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.12.126
	add	x2, x2, :lo12:.L.str.12.126
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.13.127
	add	x2, x2, :lo12:.L.str.13.127
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB152_7
// %bb.6:                               // %if.else.i36
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB152_8
.LBB152_7:                              // %if.then.i35
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB152_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-43
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end152:
	.size	halide_error_bad_dimensions, .Lfunc_end152-halide_error_bad_dimensions
                                        // -- End function
	.section	.text.halide_error_access_out_of_bounds,"ax",@progbits
	.weak	halide_error_access_out_of_bounds // -- Begin function halide_error_access_out_of_bounds
	.p2align	2
	.type	halide_error_access_out_of_bounds,@function
halide_error_access_out_of_bounds:      // @halide_error_access_out_of_bounds
// %bb.0:                               // %entry
	stp	x26, x25, [sp, #-80]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	mov	w21, w2
	mov	x25, x1
	cmp	w3, w5
	mov	x19, x0
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	b.ge	.LBB153_4
// %bb.1:                               // %if.then
	mov	w1, #1024
	mov	x0, x19
	mov	w23, w5
	mov	w26, w3
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB153_8
// %bb.2:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	strb	wzr, [x20, #1023]
	cbz	x25, .LBB153_9
.LBB153_3:                              // %if.else.i29
	mov	x0, x20
	mov	x1, x22
	mov	x2, x25
	b	.LBB153_10
.LBB153_4:                              // %if.else
	mov	w22, w6
	mov	w24, w4
	cmp	w4, w6
	b.le	.LBB153_17
// %bb.5:                               // %if.then8
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB153_12
// %bb.6:                               // %if.then.i69
	add	x23, x20, #1023         // =1023
	strb	wzr, [x20, #1023]
	cbz	x25, .LBB153_13
.LBB153_7:                              // %if.else.i80
	mov	x0, x20
	mov	x1, x23
	mov	x2, x25
	b	.LBB153_14
.LBB153_8:
	mov	x22, xzr
	cbnz	x25, .LBB153_3
.LBB153_9:                              // %if.then.i28
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x20
	mov	x1, x22
.LBB153_10:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.14.128
	add	x2, x2, :lo12:.L.str.14.128
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w26
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.15.129
	add	x2, x2, :lo12:.L.str.15.129
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w23
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.16.130
	add	x2, x2, :lo12:.L.str.16.130
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	cbz	x20, .LBB153_15
.LBB153_11:                             // %if.else.i123
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	b	.LBB153_16
.LBB153_12:
	mov	x23, xzr
	cbnz	x25, .LBB153_7
.LBB153_13:                             // %if.then.i78
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x20
	mov	x1, x23
.LBB153_14:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit83
	bl	halide_string_to_string
	adrp	x2, .L.str.14.128
	add	x2, x2, :lo12:.L.str.14.128
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w24
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.17.131
	add	x2, x2, :lo12:.L.str.17.131
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w22
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.16.130
	add	x2, x2, :lo12:.L.str.16.130
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	cbnz	x20, .LBB153_11
.LBB153_15:                             // %if.then.i58
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
.LBB153_16:                             // %if.end17.sink.split
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	bl	halide_free
.LBB153_17:                             // %if.end17
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-4
	ldp	x26, x25, [sp], #80     // 16-byte Folded Reload
	ret
.Lfunc_end153:
	.size	halide_error_access_out_of_bounds, .Lfunc_end153-halide_error_access_out_of_bounds
                                        // -- End function
	.section	.text.halide_error_buffer_allocation_too_large,"ax",@progbits
	.weak	halide_error_buffer_allocation_too_large // -- Begin function halide_error_buffer_allocation_too_large
	.p2align	2
	.type	halide_error_buffer_allocation_too_large,@function
halide_error_buffer_allocation_too_large: // @halide_error_buffer_allocation_too_large
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x22, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB154_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.18.132
	add	x2, x2, :lo12:.L.str.18.132
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB154_4
.LBB154_2:                              // %if.else.i14
	mov	x1, x23
	mov	x2, x24
	b	.LBB154_5
.LBB154_3:                              // %entry.split
	adrp	x2, .L.str.18.132
	add	x2, x2, :lo12:.L.str.18.132
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x24, .LBB154_2
.LBB154_4:                              // %if.then.i12
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x23
.LBB154_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x22
	bl	halide_uint64_to_string
	adrp	x2, .L.str.20.134
	add	x2, x2, :lo12:.L.str.20.134
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x21
	bl	halide_uint64_to_string
	cbz	x20, .LBB154_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB154_8
.LBB154_7:                              // %if.then.i33
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB154_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-5
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end154:
	.size	halide_error_buffer_allocation_too_large, .Lfunc_end154-halide_error_buffer_allocation_too_large
                                        // -- End function
	.section	.text.halide_error_buffer_extents_negative,"ax",@progbits
	.weak	halide_error_buffer_extents_negative // -- Begin function halide_error_buffer_extents_negative
	.p2align	2
	.type	halide_error_buffer_extents_negative,@function
halide_error_buffer_extents_negative:   // @halide_error_buffer_extents_negative
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	w21, w3
	mov	w23, w2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB155_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.21.135
	add	x2, x2, :lo12:.L.str.21.135
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB155_4
.LBB155_2:                              // %if.else.i15
	mov	x1, x22
	mov	x2, x24
	b	.LBB155_5
.LBB155_3:                              // %entry.split
	adrp	x2, .L.str.21.135
	add	x2, x2, :lo12:.L.str.21.135
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x24, .LBB155_2
.LBB155_4:                              // %if.then.i13
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB155_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.22.136
	add	x2, x2, :lo12:.L.str.22.136
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w23
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.23.137
	add	x2, x2, :lo12:.L.str.23.137
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.5.170
	add	x2, x2, :lo12:.L.str.5.170
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB155_7
// %bb.6:                               // %if.else.i41
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB155_8
.LBB155_7:                              // %if.then.i40
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB155_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-28
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end155:
	.size	halide_error_buffer_extents_negative, .Lfunc_end155-halide_error_buffer_extents_negative
                                        // -- End function
	.section	.text.halide_error_buffer_extents_too_large,"ax",@progbits
	.weak	halide_error_buffer_extents_too_large // -- Begin function halide_error_buffer_extents_too_large
	.p2align	2
	.type	halide_error_buffer_extents_too_large,@function
halide_error_buffer_extents_too_large:  // @halide_error_buffer_extents_too_large
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x22, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB156_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.24.138
	add	x2, x2, :lo12:.L.str.24.138
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB156_4
.LBB156_2:                              // %if.else.i14
	mov	x1, x23
	mov	x2, x24
	b	.LBB156_5
.LBB156_3:                              // %entry.split
	adrp	x2, .L.str.24.138
	add	x2, x2, :lo12:.L.str.24.138
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x24, .LBB156_2
.LBB156_4:                              // %if.then.i12
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x23
.LBB156_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.20.134
	add	x2, x2, :lo12:.L.str.20.134
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x21
	bl	halide_int64_to_string
	cbz	x20, .LBB156_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB156_8
.LBB156_7:                              // %if.then.i33
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB156_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-6
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end156:
	.size	halide_error_buffer_extents_too_large, .Lfunc_end156-halide_error_buffer_extents_too_large
                                        // -- End function
	.section	.text.halide_error_constraints_make_required_region_smaller,"ax",@progbits
	.weak	halide_error_constraints_make_required_region_smaller // -- Begin function halide_error_constraints_make_required_region_smaller
	.p2align	2
	.type	halide_error_constraints_make_required_region_smaller,@function
halide_error_constraints_make_required_region_smaller: // @halide_error_constraints_make_required_region_smaller
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	mov	x25, x1
	mov	w1, #1024
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	mov	w23, w5
	mov	w21, w3
	mov	w24, w2
	mov	x19, x0
	add	w26, w5, w6
	add	w28, w3, w4
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB157_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.25.139
	add	x2, x2, :lo12:.L.str.25.139
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	sub	w27, w26, #1            // =1
	sub	w26, w28, #1            // =1
	cbz	x25, .LBB157_4
.LBB157_2:                              // %if.else.i29
	mov	x1, x22
	mov	x2, x25
	b	.LBB157_5
.LBB157_3:                              // %entry.split
	adrp	x2, .L.str.25.139
	add	x2, x2, :lo12:.L.str.25.139
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	sub	w27, w26, #1            // =1
	sub	w26, w28, #1            // =1
	cbnz	x25, .LBB157_2
.LBB157_4:                              // %if.then.i27
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB157_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.26.140
	add	x2, x2, :lo12:.L.str.26.140
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w24
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x24, .L.str.27.141
	add	x24, x24, :lo12:.L.str.27.141
	mov	x1, x22
	mov	x2, x24
	bl	halide_string_to_string
	adrp	x2, .L.str.28.142
	add	x2, x2, :lo12:.L.str.28.142
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w23
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x23, .L.str.6.120
	add	x23, x23, :lo12:.L.str.6.120
	mov	x1, x22
	mov	x2, x23
	bl	halide_string_to_string
	sxtw	x2, w27
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	mov	x1, x22
	mov	x2, x24
	bl	halide_string_to_string
	adrp	x2, .L.str.29.143
	add	x2, x2, :lo12:.L.str.29.143
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	mov	x1, x22
	mov	x2, x23
	bl	halide_string_to_string
	sxtw	x2, w26
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.30.144
	add	x2, x2, :lo12:.L.str.30.144
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB157_7
// %bb.6:                               // %if.else.i92
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB157_8
.LBB157_7:                              // %if.then.i91
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB157_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-7
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.Lfunc_end157:
	.size	halide_error_constraints_make_required_region_smaller, .Lfunc_end157-halide_error_constraints_make_required_region_smaller
                                        // -- End function
	.section	.text.halide_error_constraint_violated,"ax",@progbits
	.weak	halide_error_constraint_violated // -- Begin function halide_error_constraint_violated
	.p2align	2
	.type	halide_error_constraint_violated,@function
halide_error_constraint_violated:       // @halide_error_constraint_violated
// %bb.0:                               // %entry
	str	x25, [sp, #-80]!        // 8-byte Folded Spill
	mov	x25, x1
	mov	w1, #1024
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	mov	w21, w4
	mov	x23, x3
	mov	w24, w2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB158_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.31.145
	add	x2, x2, :lo12:.L.str.31.145
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x25, .LBB158_4
.LBB158_2:                              // %if.else.i17
	mov	x1, x22
	mov	x2, x25
	b	.LBB158_5
.LBB158_3:                              // %entry.split
	adrp	x2, .L.str.31.145
	add	x2, x2, :lo12:.L.str.31.145
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x25, .LBB158_2
.LBB158_4:                              // %if.then.i15
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB158_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.32.146
	add	x2, x2, :lo12:.L.str.32.146
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w24
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.33.147
	add	x2, x2, :lo12:.L.str.33.147
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x23, .LBB158_7
// %bb.6:                               // %if.else.i37
	mov	x1, x22
	mov	x2, x23
	b	.LBB158_8
.LBB158_7:                              // %if.then.i35
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB158_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit39
	bl	halide_string_to_string
	adrp	x2, .L.str.32.146
	add	x2, x2, :lo12:.L.str.32.146
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.5.170
	add	x2, x2, :lo12:.L.str.5.170
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB158_10
// %bb.9:                               // %if.else.i57
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB158_11
.LBB158_10:                             // %if.then.i56
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB158_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-8
	ldr	x25, [sp], #80          // 8-byte Folded Reload
	ret
.Lfunc_end158:
	.size	halide_error_constraint_violated, .Lfunc_end158-halide_error_constraint_violated
                                        // -- End function
	.section	.text.halide_error_param_too_small_i64,"ax",@progbits
	.weak	halide_error_param_too_small_i64 // -- Begin function halide_error_param_too_small_i64
	.p2align	2
	.type	halide_error_param_too_small_i64,@function
halide_error_param_too_small_i64:       // @halide_error_param_too_small_i64
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x22, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB159_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB159_4
.LBB159_2:                              // %if.else.i14
	mov	x1, x23
	mov	x2, x24
	b	.LBB159_5
.LBB159_3:                              // %entry.split
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x24, .LBB159_2
.LBB159_4:                              // %if.then.i12
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x23
.LBB159_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.35.149
	add	x2, x2, :lo12:.L.str.35.149
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x21
	bl	halide_int64_to_string
	cbz	x20, .LBB159_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB159_8
.LBB159_7:                              // %if.then.i33
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB159_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-9
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end159:
	.size	halide_error_param_too_small_i64, .Lfunc_end159-halide_error_param_too_small_i64
                                        // -- End function
	.section	.text.halide_error_param_too_small_u64,"ax",@progbits
	.weak	halide_error_param_too_small_u64 // -- Begin function halide_error_param_too_small_u64
	.p2align	2
	.type	halide_error_param_too_small_u64,@function
halide_error_param_too_small_u64:       // @halide_error_param_too_small_u64
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x22, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB160_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB160_4
.LBB160_2:                              // %if.else.i14
	mov	x1, x23
	mov	x2, x24
	b	.LBB160_5
.LBB160_3:                              // %entry.split
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x24, .LBB160_2
.LBB160_4:                              // %if.then.i12
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x23
.LBB160_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x22
	bl	halide_uint64_to_string
	adrp	x2, .L.str.35.149
	add	x2, x2, :lo12:.L.str.35.149
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x21
	bl	halide_uint64_to_string
	cbz	x20, .LBB160_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB160_8
.LBB160_7:                              // %if.then.i33
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB160_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-9
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end160:
	.size	halide_error_param_too_small_u64, .Lfunc_end160-halide_error_param_too_small_u64
                                        // -- End function
	.section	.text.halide_error_param_too_small_f64,"ax",@progbits
	.weak	halide_error_param_too_small_f64 // -- Begin function halide_error_param_too_small_f64
	.p2align	2
	.type	halide_error_param_too_small_f64,@function
halide_error_param_too_small_f64:       // @halide_error_param_too_small_f64
// %bb.0:                               // %entry
	stp	d9, d8, [sp, #-64]!     // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x22, x1
	mov	w1, #1024
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	v8.16b, v1.16b
	mov	v9.16b, v0.16b
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB161_3
// %bb.1:                               // %if.then.i
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x22, .LBB161_4
.LBB161_2:                              // %if.else.i14
	mov	x1, x21
	mov	x2, x22
	b	.LBB161_5
.LBB161_3:                              // %entry.split
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x21, xzr
	cbnz	x22, .LBB161_2
.LBB161_4:                              // %if.then.i12
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x21
.LBB161_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x21
	bl	halide_string_to_string
	mov	w2, #1
	mov	x1, x21
	mov	v0.16b, v9.16b
	bl	halide_double_to_string
	adrp	x2, .L.str.35.149
	add	x2, x2, :lo12:.L.str.35.149
	mov	x1, x21
	bl	halide_string_to_string
	mov	w2, #1
	mov	x1, x21
	mov	v0.16b, v8.16b
	bl	halide_double_to_string
	cbz	x20, .LBB161_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB161_8
.LBB161_7:                              // %if.then.i33
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB161_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-9
	ldp	d9, d8, [sp], #64       // 16-byte Folded Reload
	ret
.Lfunc_end161:
	.size	halide_error_param_too_small_f64, .Lfunc_end161-halide_error_param_too_small_f64
                                        // -- End function
	.section	.text.halide_error_param_too_large_i64,"ax",@progbits
	.weak	halide_error_param_too_large_i64 // -- Begin function halide_error_param_too_large_i64
	.p2align	2
	.type	halide_error_param_too_large_i64,@function
halide_error_param_too_large_i64:       // @halide_error_param_too_large_i64
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x22, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB162_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB162_4
.LBB162_2:                              // %if.else.i14
	mov	x1, x23
	mov	x2, x24
	b	.LBB162_5
.LBB162_3:                              // %entry.split
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x24, .LBB162_2
.LBB162_4:                              // %if.then.i12
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x23
.LBB162_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.36.150
	add	x2, x2, :lo12:.L.str.36.150
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x21
	bl	halide_int64_to_string
	cbz	x20, .LBB162_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB162_8
.LBB162_7:                              // %if.then.i33
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB162_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-10
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end162:
	.size	halide_error_param_too_large_i64, .Lfunc_end162-halide_error_param_too_large_i64
                                        // -- End function
	.section	.text.halide_error_param_too_large_u64,"ax",@progbits
	.weak	halide_error_param_too_large_u64 // -- Begin function halide_error_param_too_large_u64
	.p2align	2
	.type	halide_error_param_too_large_u64,@function
halide_error_param_too_large_u64:       // @halide_error_param_too_large_u64
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x22, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB163_3
// %bb.1:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB163_4
.LBB163_2:                              // %if.else.i14
	mov	x1, x23
	mov	x2, x24
	b	.LBB163_5
.LBB163_3:                              // %entry.split
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
	cbnz	x24, .LBB163_2
.LBB163_4:                              // %if.then.i12
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x23
.LBB163_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x22
	bl	halide_uint64_to_string
	adrp	x2, .L.str.36.150
	add	x2, x2, :lo12:.L.str.36.150
	mov	x1, x23
	bl	halide_string_to_string
	mov	w3, #1
	mov	x1, x23
	mov	x2, x21
	bl	halide_uint64_to_string
	cbz	x20, .LBB163_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB163_8
.LBB163_7:                              // %if.then.i33
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB163_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-10
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end163:
	.size	halide_error_param_too_large_u64, .Lfunc_end163-halide_error_param_too_large_u64
                                        // -- End function
	.section	.text.halide_error_param_too_large_f64,"ax",@progbits
	.weak	halide_error_param_too_large_f64 // -- Begin function halide_error_param_too_large_f64
	.p2align	2
	.type	halide_error_param_too_large_f64,@function
halide_error_param_too_large_f64:       // @halide_error_param_too_large_f64
// %bb.0:                               // %entry
	stp	d9, d8, [sp, #-64]!     // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	mov	x22, x1
	mov	w1, #1024
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	v8.16b, v1.16b
	mov	v9.16b, v0.16b
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB164_3
// %bb.1:                               // %if.then.i
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x22, .LBB164_4
.LBB164_2:                              // %if.else.i14
	mov	x1, x21
	mov	x2, x22
	b	.LBB164_5
.LBB164_3:                              // %entry.split
	adrp	x2, .L.str.34.148
	add	x2, x2, :lo12:.L.str.34.148
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x21, xzr
	cbnz	x22, .LBB164_2
.LBB164_4:                              // %if.then.i12
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x21
.LBB164_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.133
	add	x2, x2, :lo12:.L.str.19.133
	mov	x1, x21
	bl	halide_string_to_string
	mov	w2, #1
	mov	x1, x21
	mov	v0.16b, v9.16b
	bl	halide_double_to_string
	adrp	x2, .L.str.36.150
	add	x2, x2, :lo12:.L.str.36.150
	mov	x1, x21
	bl	halide_string_to_string
	mov	w2, #1
	mov	x1, x21
	mov	v0.16b, v8.16b
	bl	halide_double_to_string
	cbz	x20, .LBB164_7
// %bb.6:                               // %if.else.i34
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB164_8
.LBB164_7:                              // %if.then.i33
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB164_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-10
	ldp	d9, d8, [sp], #64       // 16-byte Folded Reload
	ret
.Lfunc_end164:
	.size	halide_error_param_too_large_f64, .Lfunc_end164-halide_error_param_too_large_f64
                                        // -- End function
	.section	.text.halide_error_out_of_memory,"ax",@progbits
	.weak	halide_error_out_of_memory // -- Begin function halide_error_out_of_memory
	.p2align	2
	.type	halide_error_out_of_memory,@function
halide_error_out_of_memory:             // @halide_error_out_of_memory
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	adrp	x1, .L.str.37
	add	x1, x1, :lo12:.L.str.37
	mov	x29, sp
	bl	halide_error
	mov	w0, #-11
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end165:
	.size	halide_error_out_of_memory, .Lfunc_end165-halide_error_out_of_memory
                                        // -- End function
	.section	.text.halide_error_buffer_argument_is_null,"ax",@progbits
	.weak	halide_error_buffer_argument_is_null // -- Begin function halide_error_buffer_argument_is_null
	.p2align	2
	.type	halide_error_buffer_argument_is_null,@function
halide_error_buffer_argument_is_null:   // @halide_error_buffer_argument_is_null
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	mov	x21, x1
	mov	w1, #1024
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB166_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.38
	add	x2, x2, :lo12:.L.str.38
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x21, .LBB166_4
.LBB166_2:                              // %if.else.i11
	mov	x1, x22
	mov	x2, x21
	b	.LBB166_5
.LBB166_3:                              // %entry.split
	adrp	x2, .L.str.38
	add	x2, x2, :lo12:.L.str.38
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x21, .LBB166_2
.LBB166_4:                              // %if.then.i9
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB166_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.39
	add	x2, x2, :lo12:.L.str.39
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB166_7
// %bb.6:                               // %if.else.i20
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB166_8
.LBB166_7:                              // %if.then.i19
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB166_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-12
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end166:
	.size	halide_error_buffer_argument_is_null, .Lfunc_end166-halide_error_buffer_argument_is_null
                                        // -- End function
	.section	.text.halide_error_debug_to_file_failed,"ax",@progbits
	.weak	halide_error_debug_to_file_failed // -- Begin function halide_error_debug_to_file_failed
	.p2align	2
	.type	halide_error_debug_to_file_failed,@function
halide_error_debug_to_file_failed:      // @halide_error_debug_to_file_failed
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	w21, w3
	mov	x23, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB167_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.40
	add	x2, x2, :lo12:.L.str.40
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB167_4
.LBB167_2:                              // %if.else.i14
	mov	x1, x22
	mov	x2, x24
	b	.LBB167_5
.LBB167_3:                              // %entry.split
	adrp	x2, .L.str.40
	add	x2, x2, :lo12:.L.str.40
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x24, .LBB167_2
.LBB167_4:                              // %if.then.i12
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB167_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.41
	add	x2, x2, :lo12:.L.str.41
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x23, .LBB167_7
// %bb.6:                               // %if.else.i26
	mov	x1, x22
	mov	x2, x23
	b	.LBB167_8
.LBB167_7:                              // %if.then.i24
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB167_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit28
	bl	halide_string_to_string
	adrp	x2, .L.str.42.151
	add	x2, x2, :lo12:.L.str.42.151
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	cbz	x20, .LBB167_10
// %bb.9:                               // %if.else.i40
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB167_11
.LBB167_10:                             // %if.then.i39
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB167_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-13
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end167:
	.size	halide_error_debug_to_file_failed, .Lfunc_end167-halide_error_debug_to_file_failed
                                        // -- End function
	.section	.text.halide_error_failed_to_upgrade_buffer_t,"ax",@progbits
	.weak	halide_error_failed_to_upgrade_buffer_t // -- Begin function halide_error_failed_to_upgrade_buffer_t
	.p2align	2
	.type	halide_error_failed_to_upgrade_buffer_t,@function
halide_error_failed_to_upgrade_buffer_t: // @halide_error_failed_to_upgrade_buffer_t
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB168_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.43
	add	x2, x2, :lo12:.L.str.43
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x23, .LBB168_4
.LBB168_2:                              // %if.else.i12
	mov	x1, x22
	mov	x2, x23
	b	.LBB168_5
.LBB168_3:                              // %entry.split
	adrp	x2, .L.str.43
	add	x2, x2, :lo12:.L.str.43
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x23, .LBB168_2
.LBB168_4:                              // %if.then.i10
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB168_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.188
	add	x2, x2, :lo12:.L.str.19.188
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB168_8
// %bb.6:                               // %if.else.i24
	mov	x1, x22
	mov	x2, x21
	bl	halide_string_to_string
	cbz	x20, .LBB168_9
.LBB168_7:                              // %if.else.i30
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB168_10
.LBB168_8:                              // %if.then.i22
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
	bl	halide_string_to_string
	cbnz	x20, .LBB168_7
.LBB168_9:                              // %if.then.i29
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB168_10:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-29
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end168:
	.size	halide_error_failed_to_upgrade_buffer_t, .Lfunc_end168-halide_error_failed_to_upgrade_buffer_t
                                        // -- End function
	.section	.text.halide_error_failed_to_downgrade_buffer_t,"ax",@progbits
	.weak	halide_error_failed_to_downgrade_buffer_t // -- Begin function halide_error_failed_to_downgrade_buffer_t
	.p2align	2
	.type	halide_error_failed_to_downgrade_buffer_t,@function
halide_error_failed_to_downgrade_buffer_t: // @halide_error_failed_to_downgrade_buffer_t
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB169_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.45
	add	x2, x2, :lo12:.L.str.45
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x23, .LBB169_4
.LBB169_2:                              // %if.else.i12
	mov	x1, x22
	mov	x2, x23
	b	.LBB169_5
.LBB169_3:                              // %entry.split
	adrp	x2, .L.str.45
	add	x2, x2, :lo12:.L.str.45
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x23, .LBB169_2
.LBB169_4:                              // %if.then.i10
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB169_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.19.188
	add	x2, x2, :lo12:.L.str.19.188
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB169_8
// %bb.6:                               // %if.else.i24
	mov	x1, x22
	mov	x2, x21
	bl	halide_string_to_string
	cbz	x20, .LBB169_9
.LBB169_7:                              // %if.else.i30
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB169_10
.LBB169_8:                              // %if.then.i22
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
	bl	halide_string_to_string
	cbnz	x20, .LBB169_7
.LBB169_9:                              // %if.then.i29
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB169_10:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-30
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end169:
	.size	halide_error_failed_to_downgrade_buffer_t, .Lfunc_end169-halide_error_failed_to_downgrade_buffer_t
                                        // -- End function
	.section	.text.halide_error_unaligned_host_ptr,"ax",@progbits
	.weak	halide_error_unaligned_host_ptr // -- Begin function halide_error_unaligned_host_ptr
	.p2align	2
	.type	halide_error_unaligned_host_ptr,@function
halide_error_unaligned_host_ptr:        // @halide_error_unaligned_host_ptr
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	w21, w2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB170_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.46
	add	x2, x2, :lo12:.L.str.46
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x23, .LBB170_4
.LBB170_2:                              // %if.else.i13
	mov	x1, x22
	mov	x2, x23
	b	.LBB170_5
.LBB170_3:                              // %entry.split
	adrp	x2, .L.str.46
	add	x2, x2, :lo12:.L.str.46
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x23, .LBB170_2
.LBB170_4:                              // %if.then.i11
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB170_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.47
	add	x2, x2, :lo12:.L.str.47
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.48
	add	x2, x2, :lo12:.L.str.48
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB170_7
// %bb.6:                               // %if.else.i30
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB170_8
.LBB170_7:                              // %if.then.i29
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB170_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-24
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end170:
	.size	halide_error_unaligned_host_ptr, .Lfunc_end170-halide_error_unaligned_host_ptr
                                        // -- End function
	.section	.text.halide_error_host_is_null,"ax",@progbits
	.weak	halide_error_host_is_null // -- Begin function halide_error_host_is_null
	.p2align	2
	.type	halide_error_host_is_null,@function
halide_error_host_is_null:              // @halide_error_host_is_null
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	mov	x21, x1
	mov	w1, #1024
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB171_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.46
	add	x2, x2, :lo12:.L.str.46
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x21, .LBB171_4
.LBB171_2:                              // %if.else.i11
	mov	x1, x22
	mov	x2, x21
	b	.LBB171_5
.LBB171_3:                              // %entry.split
	adrp	x2, .L.str.46
	add	x2, x2, :lo12:.L.str.46
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x21, .LBB171_2
.LBB171_4:                              // %if.then.i9
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB171_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.49
	add	x2, x2, :lo12:.L.str.49
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB171_7
// %bb.6:                               // %if.else.i20
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB171_8
.LBB171_7:                              // %if.then.i19
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB171_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-34
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end171:
	.size	halide_error_host_is_null, .Lfunc_end171-halide_error_host_is_null
                                        // -- End function
	.section	.text.halide_error_bad_fold,"ax",@progbits
	.weak	halide_error_bad_fold   // -- Begin function halide_error_bad_fold
	.p2align	2
	.type	halide_error_bad_fold,@function
halide_error_bad_fold:                  // @halide_error_bad_fold
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	x24, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB172_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.50
	add	x2, x2, :lo12:.L.str.50
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x24, .LBB172_4
.LBB172_2:                              // %if.else.i15
	mov	x1, x22
	mov	x2, x24
	b	.LBB172_5
.LBB172_3:                              // %entry.split
	adrp	x2, .L.str.50
	add	x2, x2, :lo12:.L.str.50
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x24, .LBB172_2
.LBB172_4:                              // %if.then.i13
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB172_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.51
	add	x2, x2, :lo12:.L.str.51
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x23, .LBB172_7
// %bb.6:                               // %if.else.i27
	mov	x1, x22
	mov	x2, x23
	b	.LBB172_8
.LBB172_7:                              // %if.then.i25
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB172_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit29
	bl	halide_string_to_string
	adrp	x2, .L.str.52
	add	x2, x2, :lo12:.L.str.52
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB172_10
// %bb.9:                               // %if.else.i41
	mov	x1, x22
	mov	x2, x21
	b	.LBB172_11
.LBB172_10:                             // %if.then.i39
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB172_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit43
	bl	halide_string_to_string
	adrp	x2, .L.str.30.144
	add	x2, x2, :lo12:.L.str.30.144
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB172_13
// %bb.12:                              // %if.else.i52
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB172_14
.LBB172_13:                             // %if.then.i51
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB172_14:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-25
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end172:
	.size	halide_error_bad_fold, .Lfunc_end172-halide_error_bad_fold
                                        // -- End function
	.section	.text.halide_error_bad_extern_fold,"ax",@progbits
	.weak	halide_error_bad_extern_fold // -- Begin function halide_error_bad_extern_fold
	.p2align	2
	.type	halide_error_bad_extern_fold,@function
halide_error_bad_extern_fold:           // @halide_error_bad_extern_fold
// %bb.0:                               // %entry
	str	x27, [sp, #-96]!        // 8-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	mov	w21, w6
	mov	w23, w5
	mov	w26, w4
	mov	w22, w3
	mov	w27, w2
	mov	x24, x1
	cmp	w3, w5
	mov	x19, x0
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	add	x29, sp, #80            // =80
	b.lt	.LBB173_2
// %bb.1:                               // %lor.lhs.false
	add	w25, w26, w22
	add	w8, w21, w23
	cmp	w25, w8
	b.le	.LBB173_10
.LBB173_2:                              // %if.then
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB173_4
// %bb.3:                               // %if.then.i
	add	x25, x20, #1023         // =1023
	adrp	x2, .L.str.53
	add	x2, x2, :lo12:.L.str.53
	mov	x0, x20
	mov	x1, x25
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	b	.LBB173_5
.LBB173_4:                              // %if.then.split
	adrp	x2, .L.str.53
	add	x2, x2, :lo12:.L.str.53
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x25, xzr
.LBB173_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	sxtw	x2, w27
	mov	w3, #1
	mov	x1, x25
	bl	halide_int64_to_string
	adrp	x2, .L.str.51
	add	x2, x2, :lo12:.L.str.51
	mov	x1, x25
	bl	halide_string_to_string
	cbz	x24, .LBB173_7
// %bb.6:                               // %if.else.i65
	mov	x1, x25
	mov	x2, x24
	b	.LBB173_8
.LBB173_7:                              // %if.then.i63
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x25
.LBB173_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.54
	add	x2, x2, :lo12:.L.str.54
	mov	x1, x25
	bl	halide_string_to_string
	sxtw	x2, w22
	mov	w3, #1
	mov	x1, x25
	bl	halide_int64_to_string
	adrp	x24, .L.str.55
	add	x24, x24, :lo12:.L.str.55
	mov	x1, x25
	mov	x2, x24
	bl	halide_string_to_string
	add	w8, w26, w22
	sub	w8, w8, #1              // =1
	sxtw	x2, w8
	mov	w3, #1
	mov	x1, x25
	bl	halide_int64_to_string
	adrp	x2, .L.str.56
	add	x2, x2, :lo12:.L.str.56
	mov	x1, x25
	bl	halide_string_to_string
	adrp	x2, .L.str.57
	add	x2, x2, :lo12:.L.str.57
	mov	x1, x25
	bl	halide_string_to_string
	sxtw	x2, w23
	mov	w3, #1
	mov	x1, x25
	bl	halide_int64_to_string
	mov	x1, x25
	mov	x2, x24
	bl	halide_string_to_string
	add	w8, w21, w23
	sub	w8, w8, #1              // =1
	sxtw	x2, w8
	mov	w3, #1
	mov	x1, x25
	bl	halide_int64_to_string
	adrp	x2, .L.str.58.152
	add	x2, x2, :lo12:.L.str.58.152
	mov	x1, x25
	bl	halide_string_to_string
	cbz	x20, .LBB173_17
.LBB173_9:                              // %if.else.i213
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	b	.LBB173_18
.LBB173_10:                             // %if.else
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB173_12
// %bb.11:                              // %if.then.i125
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.53
	add	x2, x2, :lo12:.L.str.53
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	b	.LBB173_13
.LBB173_12:                             // %if.else.split
	adrp	x2, .L.str.53
	add	x2, x2, :lo12:.L.str.53
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
.LBB173_13:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit129
	sxtw	x2, w27
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.51
	add	x2, x2, :lo12:.L.str.51
	mov	x1, x23
	bl	halide_string_to_string
	cbz	x24, .LBB173_15
// %bb.14:                              // %if.else.i152
	mov	x1, x23
	mov	x2, x24
	b	.LBB173_16
.LBB173_15:                             // %if.then.i150
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x23
.LBB173_16:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit155
	bl	halide_string_to_string
	adrp	x2, .L.str.54
	add	x2, x2, :lo12:.L.str.54
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w22
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.55
	add	x2, x2, :lo12:.L.str.55
	mov	x1, x23
	bl	halide_string_to_string
	sub	w8, w25, #1             // =1
	sxtw	x2, w8
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.56
	add	x2, x2, :lo12:.L.str.56
	mov	x1, x23
	bl	halide_string_to_string
	adrp	x2, .L.str.59.153
	add	x2, x2, :lo12:.L.str.59.153
	mov	x1, x23
	bl	halide_string_to_string
	adrp	x2, .L.str.60.154
	add	x2, x2, :lo12:.L.str.60.154
	mov	x1, x23
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x23
	bl	halide_int64_to_string
	adrp	x2, .L.str.30.144
	add	x2, x2, :lo12:.L.str.30.144
	mov	x1, x23
	bl	halide_string_to_string
	cbnz	x20, .LBB173_9
.LBB173_17:                             // %if.then.i114
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
.LBB173_18:                             // %if.end
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	bl	halide_free
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-35
	ldr	x27, [sp], #96          // 8-byte Folded Reload
	ret
.Lfunc_end173:
	.size	halide_error_bad_extern_fold, .Lfunc_end173-halide_error_bad_extern_fold
                                        // -- End function
	.section	.text.halide_error_fold_factor_too_small,"ax",@progbits
	.weak	halide_error_fold_factor_too_small // -- Begin function halide_error_fold_factor_too_small
	.p2align	2
	.type	halide_error_fold_factor_too_small,@function
halide_error_fold_factor_too_small:     // @halide_error_fold_factor_too_small
// %bb.0:                               // %entry
	stp	x26, x25, [sp, #-80]!   // 16-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	mov	x24, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	mov	w21, w5
	mov	x23, x4
	mov	w26, w3
	mov	x25, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB174_2
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.61.155
	add	x2, x2, :lo12:.L.str.61.155
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	b	.LBB174_3
.LBB174_2:                              // %entry.split
	adrp	x2, .L.str.61.155
	add	x2, x2, :lo12:.L.str.61.155
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB174_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	sxtw	x2, w26
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.62
	add	x2, x2, :lo12:.L.str.62
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x25, .LBB174_5
// %bb.4:                               // %if.else.i26
	mov	x1, x22
	mov	x2, x25
	b	.LBB174_6
.LBB174_5:                              // %if.then.i24
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB174_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.51
	add	x2, x2, :lo12:.L.str.51
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x24, .LBB174_8
// %bb.7:                               // %if.else.i38
	mov	x1, x22
	mov	x2, x24
	b	.LBB174_9
.LBB174_8:                              // %if.then.i36
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB174_9:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit40
	bl	halide_string_to_string
	adrp	x2, .L.str.63
	add	x2, x2, :lo12:.L.str.63
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x23, .LBB174_11
// %bb.10:                              // %if.else.i52
	mov	x1, x22
	mov	x2, x23
	b	.LBB174_12
.LBB174_11:                             // %if.then.i50
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB174_12:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit54
	bl	halide_string_to_string
	adrp	x2, .L.str.32.146
	add	x2, x2, :lo12:.L.str.32.146
	mov	x1, x22
	bl	halide_string_to_string
	sxtw	x2, w21
	mov	w3, #1
	mov	x1, x22
	bl	halide_int64_to_string
	adrp	x2, .L.str.64.156
	add	x2, x2, :lo12:.L.str.64.156
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB174_14
// %bb.13:                              // %if.else.i72
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB174_15
.LBB174_14:                             // %if.then.i71
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB174_15:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-26
	ldp	x26, x25, [sp], #80     // 16-byte Folded Reload
	ret
.Lfunc_end174:
	.size	halide_error_fold_factor_too_small, .Lfunc_end174-halide_error_fold_factor_too_small
                                        // -- End function
	.section	.text.halide_error_requirement_failed,"ax",@progbits
	.weak	halide_error_requirement_failed // -- Begin function halide_error_requirement_failed
	.p2align	2
	.type	halide_error_requirement_failed,@function
halide_error_requirement_failed:        // @halide_error_requirement_failed
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	mov	x23, x1
	mov	w1, #1024
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x2
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB175_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.65
	add	x2, x2, :lo12:.L.str.65
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x23, .LBB175_4
.LBB175_2:                              // %if.else.i12
	mov	x1, x22
	mov	x2, x23
	b	.LBB175_5
.LBB175_3:                              // %entry.split
	adrp	x2, .L.str.65
	add	x2, x2, :lo12:.L.str.65
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x23, .LBB175_2
.LBB175_4:                              // %if.then.i10
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB175_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.3.168
	add	x2, x2, :lo12:.L.str.3.168
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB175_8
// %bb.6:                               // %if.else.i24
	mov	x1, x22
	mov	x2, x21
	bl	halide_string_to_string
	cbz	x20, .LBB175_9
.LBB175_7:                              // %if.else.i30
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB175_10
.LBB175_8:                              // %if.then.i22
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
	bl	halide_string_to_string
	cbnz	x20, .LBB175_7
.LBB175_9:                              // %if.then.i29
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB175_10:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-27
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end175:
	.size	halide_error_requirement_failed, .Lfunc_end175-halide_error_requirement_failed
                                        // -- End function
	.section	.text.halide_error_specialize_fail,"ax",@progbits
	.weak	halide_error_specialize_fail // -- Begin function halide_error_specialize_fail
	.p2align	2
	.type	halide_error_specialize_fail,@function
halide_error_specialize_fail:           // @halide_error_specialize_fail
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	mov	x21, x1
	mov	w1, #1024
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB176_4
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.67
	add	x2, x2, :lo12:.L.str.67
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x21, .LBB176_5
.LBB176_2:                              // %if.else.i10
	mov	x1, x22
	mov	x2, x21
	bl	halide_string_to_string
	cbz	x20, .LBB176_6
.LBB176_3:                              // %if.else.i14
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB176_7
.LBB176_4:                              // %entry.split
	adrp	x2, .L.str.67
	add	x2, x2, :lo12:.L.str.67
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x21, .LBB176_2
.LBB176_5:                              // %if.then.i8
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
	bl	halide_string_to_string
	cbnz	x20, .LBB176_3
.LBB176_6:                              // %if.then.i13
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB176_7:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-31
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end176:
	.size	halide_error_specialize_fail, .Lfunc_end176-halide_error_specialize_fail
                                        // -- End function
	.section	.text.halide_error_no_device_interface,"ax",@progbits
	.weak	halide_error_no_device_interface // -- Begin function halide_error_no_device_interface
	.p2align	2
	.type	halide_error_no_device_interface,@function
halide_error_no_device_interface:       // @halide_error_no_device_interface
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	w1, #1024
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	mov	x19, x0
	bl	halide_malloc
	cbz	x0, .LBB177_2
// %bb.1:                               // %if.else.i7
	adrp	x2, .L.str.68
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.68
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB177_3
.LBB177_2:                              // %if.then.i6
	adrp	x2, .L.str.68
	add	x2, x2, :lo12:.L.str.68
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB177_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end177:
	.size	halide_error_no_device_interface, .Lfunc_end177-halide_error_no_device_interface
                                        // -- End function
	.section	.text.halide_error_device_interface_no_device,"ax",@progbits
	.weak	halide_error_device_interface_no_device // -- Begin function halide_error_device_interface_no_device
	.p2align	2
	.type	halide_error_device_interface_no_device,@function
halide_error_device_interface_no_device: // @halide_error_device_interface_no_device
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	w1, #1024
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	mov	x19, x0
	bl	halide_malloc
	cbz	x0, .LBB178_2
// %bb.1:                               // %if.else.i7
	adrp	x2, .L.str.69
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.69
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB178_3
.LBB178_2:                              // %if.then.i6
	adrp	x2, .L.str.69
	add	x2, x2, :lo12:.L.str.69
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB178_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-36
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end178:
	.size	halide_error_device_interface_no_device, .Lfunc_end178-halide_error_device_interface_no_device
                                        // -- End function
	.section	.text.halide_error_host_and_device_dirty,"ax",@progbits
	.weak	halide_error_host_and_device_dirty // -- Begin function halide_error_host_and_device_dirty
	.p2align	2
	.type	halide_error_host_and_device_dirty,@function
halide_error_host_and_device_dirty:     // @halide_error_host_and_device_dirty
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	w1, #1024
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	mov	x19, x0
	bl	halide_malloc
	cbz	x0, .LBB179_2
// %bb.1:                               // %if.else.i7
	adrp	x2, .L.str.70
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.70
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB179_3
.LBB179_2:                              // %if.then.i6
	adrp	x2, .L.str.70
	add	x2, x2, :lo12:.L.str.70
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB179_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-37
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end179:
	.size	halide_error_host_and_device_dirty, .Lfunc_end179-halide_error_host_and_device_dirty
                                        // -- End function
	.section	.text.halide_error_buffer_is_null,"ax",@progbits
	.weak	halide_error_buffer_is_null // -- Begin function halide_error_buffer_is_null
	.p2align	2
	.type	halide_error_buffer_is_null,@function
halide_error_buffer_is_null:            // @halide_error_buffer_is_null
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	mov	x21, x1
	mov	w1, #1024
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x0
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB180_3
// %bb.1:                               // %if.then.i
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.71
	add	x2, x2, :lo12:.L.str.71
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	cbz	x21, .LBB180_4
.LBB180_2:                              // %if.else.i11
	mov	x1, x22
	mov	x2, x21
	b	.LBB180_5
.LBB180_3:                              // %entry.split
	adrp	x2, .L.str.71
	add	x2, x2, :lo12:.L.str.71
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x21, .LBB180_2
.LBB180_4:                              // %if.then.i9
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB180_5:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	adrp	x2, .L.str.72
	add	x2, x2, :lo12:.L.str.72
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB180_7
// %bb.6:                               // %if.else.i20
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB180_8
.LBB180_7:                              // %if.then.i19
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB180_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-38
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.Lfunc_end180:
	.size	halide_error_buffer_is_null, .Lfunc_end180-halide_error_buffer_is_null
                                        // -- End function
	.section	.text.halide_error_integer_division_by_zero,"ax",@progbits
	.weak	halide_error_integer_division_by_zero // -- Begin function halide_error_integer_division_by_zero
	.p2align	2
	.type	halide_error_integer_division_by_zero,@function
halide_error_integer_division_by_zero:  // @halide_error_integer_division_by_zero
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	w1, #1024
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	mov	x19, x0
	bl	halide_malloc
	cbz	x0, .LBB181_2
// %bb.1:                               // %if.else.i7
	adrp	x2, .L.str.73
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.73
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB181_3
.LBB181_2:                              // %if.then.i6
	adrp	x2, .L.str.73
	add	x2, x2, :lo12:.L.str.73
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB181_3:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, #-44
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end181:
	.size	halide_error_integer_division_by_zero, .Lfunc_end181-halide_error_integer_division_by_zero
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t // -- Begin function _ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t,@function
_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t: // @_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
// %bb.0:                               // %entry
	mov	w8, #4
	str	w8, [x2, #36]
	ldr	w8, [x1, #16]
	cbz	w8, .LBB182_7
// %bb.1:                               // %for.inc
	ldr	w8, [x1, #20]
	cbz	w8, .LBB182_5
// %bb.2:                               // %for.inc.1
	ldr	w8, [x1, #24]
	cbz	w8, .LBB182_6
// %bb.3:                               // %for.inc.2
	ldr	w8, [x1, #28]
	cbnz	w8, .LBB182_8
// %bb.4:
	mov	w8, #3
	b	.LBB182_7
.LBB182_5:
	mov	w8, #1
	b	.LBB182_7
.LBB182_6:
	mov	w8, #2
.LBB182_7:                              // %if.then
	str	w8, [x2, #36]
.LBB182_8:                              // %cleanup
	ldr	w8, [x1, #64]
	sub	w8, w8, #1              // =1
	cmp	w8, #7                  // =7
	b.hi	.LBB182_12
// %bb.9:                               // %cleanup
	adrp	x9, .LJTI182_0
	add	x9, x9, :lo12:.LJTI182_0
	adr	x10, .LBB182_10
	ldrb	w11, [x9, x8]
	add	x10, x10, x11, lsl #2
	br	x10
.LBB182_10:                             // %sw.bb
	mov	w8, #2049
	movk	w8, #1, lsl #16
	mov	w0, wzr
	str	w8, [x2, #32]
	ret
.LBB182_11:                             // %sw.bb3
	mov	w8, #2049
	movk	w8, #1, lsl #16
	add	w8, w8, #2048           // =2048
	mov	w0, wzr
	str	w8, [x2, #32]
	ret
.LBB182_12:                             // %sw.default
	adrp	x1, .L.str.165
	adrp	x2, .L.str.1.166
	add	x1, x1, :lo12:.L.str.165
	add	x2, x2, :lo12:.L.str.1.166
	b	halide_error_failed_to_upgrade_buffer_t
.LBB182_13:                             // %sw.bb6
	mov	w8, #8193
	movk	w8, #1, lsl #16
	mov	w0, wzr
	str	w8, [x2, #32]
	ret
.LBB182_14:                             // %sw.bb9
	mov	w8, #8193
	movk	w8, #1, lsl #16
	add	w8, w8, #2, lsl #12     // =8192
	mov	w0, wzr
	str	w8, [x2, #32]
	ret
.Lfunc_end182:
	.size	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t, .Lfunc_end182-_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	.section	.rodata._ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t,"a",@progbits
.LJTI182_0:
	.byte	(.LBB182_10-.LBB182_10)>>2
	.byte	(.LBB182_11-.LBB182_10)>>2
	.byte	(.LBB182_12-.LBB182_10)>>2
	.byte	(.LBB182_13-.LBB182_10)>>2
	.byte	(.LBB182_12-.LBB182_10)>>2
	.byte	(.LBB182_12-.LBB182_10)>>2
	.byte	(.LBB182_12-.LBB182_10)>>2
	.byte	(.LBB182_14-.LBB182_10)>>2
                                        // -- End function
	.section	.text.halide_upgrade_buffer_t,"ax",@progbits
	.weak	halide_upgrade_buffer_t // -- Begin function halide_upgrade_buffer_t
	.p2align	2
	.type	halide_upgrade_buffer_t,@function
halide_upgrade_buffer_t:                // @halide_upgrade_buffer_t
// %bb.0:                               // %entry
	stp	x24, x23, [sp, #-64]!   // 16-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	ldr	x8, [x2, #8]
	mov	x21, x2
	mov	x20, x1
	mov	x19, x0
	add	x29, sp, #48            // =48
	cbnz	x8, .LBB183_2
// %bb.1:                               // %lor.lhs.false
	ldr	x9, [x21]
	cbz	x9, .LBB183_15
.LBB183_2:                              // %if.then
	ldrb	w9, [x3, #33]
	ldr	w10, [x21, #64]
	add	w9, w9, #7              // =7
	cmp	w10, w9, lsr #3
	b.ne	.LBB183_6
// %bb.3:                               // %if.end
	cbz	w4, .LBB183_8
// %bb.4:                               // %if.then14
	ldr	x9, [x3, #16]
	cmp	x9, x8
	b.eq	.LBB183_20
// %bb.5:                               // %if.then18
	mov	x0, x19
	mov	x1, x20
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	adrp	x2, .L.str.6.172
	add	x2, x2, :lo12:.L.str.6.172
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	b	halide_error_failed_to_upgrade_buffer_t
.LBB183_6:                              // %if.then2
	mov	w1, #1024
	mov	x0, x19
	add	x23, x3, #32            // =32
	bl	halide_malloc
	mov	x22, x0
	cbz	x0, .LBB183_10
// %bb.7:                               // %if.then.i97
	add	x24, x22, #1023         // =1023
	adrp	x2, .L.str.2.167
	add	x2, x2, :lo12:.L.str.2.167
	mov	x0, x22
	mov	x1, x24
	strb	wzr, [x22, #1023]
	bl	halide_string_to_string
	b	.LBB183_11
.LBB183_8:                              // %if.end22
	ldr	x9, [x21]
	str	x8, [x3, #16]
	cbz	x9, .LBB183_16
// %bb.9:                               // %if.then27
	ldp	x9, x8, [x9]
	stp	x9, x8, [x3]
	ldrsw	x8, [x3, #36]
	cmp	w8, #1                  // =1
	b.ge	.LBB183_17
	b	.LBB183_19
.LBB183_10:                             // %if.then2.split
	adrp	x2, .L.str.2.167
	add	x2, x2, :lo12:.L.str.2.167
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x24, xzr
.LBB183_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EEC2EPvPc.exit
	ldrsw	x2, [x21, #64]
	mov	w3, #1
	mov	x1, x24
	bl	halide_int64_to_string
	adrp	x2, .L.str.3.168
	add	x2, x2, :lo12:.L.str.3.168
	mov	x1, x24
	bl	halide_string_to_string
	adrp	x2, .L.str.4.169
	add	x2, x2, :lo12:.L.str.4.169
	mov	x1, x24
	bl	halide_string_to_string
	mov	x1, x24
	mov	x2, x23
	bl	halide_type_to_string
	adrp	x2, .L.str.5.170
	add	x2, x2, :lo12:.L.str.5.170
	mov	x1, x24
	bl	halide_string_to_string
	cbz	x22, .LBB183_13
// %bb.12:                              // %if.else.i
	sub	x8, x0, x22
	add	x21, x8, #1             // =1
	mov	x0, x19
	mov	x1, x22
	mov	x2, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	mov	x2, x22
	bl	halide_error_failed_to_upgrade_buffer_t
	mov	w20, w0
	mov	x0, x19
	mov	x1, x22
	mov	x2, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x22
	b	.LBB183_14
.LBB183_13:                             // %if.then.i
	adrp	x21, .L.str.242
	add	x21, x21, :lo12:.L.str.242
	mov	x0, x19
	mov	x1, x20
	mov	x2, x21
	bl	halide_error_failed_to_upgrade_buffer_t
	mov	w20, w0
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB183_14:                             // %if.then.i
	bl	halide_free
	mov	w0, w20
	b	.LBB183_21
.LBB183_15:                             // %if.end22.thread
	str	x8, [x3, #16]
.LBB183_16:                             // %if.else
	mov	x9, xzr
	stp	x9, xzr, [x3]
	ldrsw	x8, [x3, #36]
	cmp	w8, #1                  // =1
	b.lt	.LBB183_19
.LBB183_17:                             // %for.body.lr.ph
	ldr	x9, [x3, #40]
	add	x10, x21, #32           // =32
	add	x9, x9, #4              // =4
.LBB183_18:                             // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	w11, [x10, #16]
	subs	x8, x8, #1              // =1
	stur	w11, [x9, #-4]
	ldur	w11, [x10, #-16]
	str	w11, [x9]
	ldr	w11, [x10], #4
	str	w11, [x9, #4]
	add	x9, x9, #16             // =16
	b.ne	.LBB183_18
.LBB183_19:                             // %for.cond.cleanup
	ldrb	w8, [x21, #68]
	ldrb	w9, [x21, #69]
	orr	x10, x8, #0x2
	cmp	w9, #0                  // =0
	csel	x8, x8, x10, eq
	str	x8, [x3, #24]
.LBB183_20:                             // %return
	mov	w0, wzr
.LBB183_21:                             // %return
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldp	x24, x23, [sp], #64     // 16-byte Folded Reload
	ret
.Lfunc_end183:
	.size	halide_upgrade_buffer_t, .Lfunc_end183-halide_upgrade_buffer_t
                                        // -- End function
	.section	.text.halide_downgrade_buffer_t,"ax",@progbits
	.weak	halide_downgrade_buffer_t // -- Begin function halide_downgrade_buffer_t
	.p2align	2
	.type	halide_downgrade_buffer_t,@function
halide_downgrade_buffer_t:              // @halide_downgrade_buffer_t
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	mov	x21, x2
	mov	x20, x1
	mov	x22, x0
	mov	w2, #72
	mov	x0, x3
	mov	w1, wzr
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x19, x3
	bl	memset
	ldr	w8, [x21, #36]
	cmp	w8, #5                  // =5
	b.lt	.LBB184_2
// %bb.1:                               // %if.then
	mov	x1, x20
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	adrp	x2, .L.str.7.173
	add	x2, x2, :lo12:.L.str.7.173
	mov	x0, x22
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	b	halide_error_failed_to_downgrade_buffer_t
.LBB184_2:                              // %if.end
	ldr	x9, [x21, #16]
	cmp	w8, #1                  // =1
	str	x9, [x19, #8]
	b.lt	.LBB184_5
// %bb.3:                               // %for.body.lr.ph
	ldr	x10, [x21, #40]
	mov	x8, xzr
	add	x9, x19, #48            // =48
	add	x10, x10, #4            // =4
.LBB184_4:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldur	w11, [x10, #-4]
	add	x8, x8, #1              // =1
	str	w11, [x9]
	ldr	w11, [x10]
	stur	w11, [x9, #-32]
	ldr	w11, [x10, #4]
	add	x10, x10, #16           // =16
	stur	w11, [x9, #-16]
	ldrsw	x11, [x21, #36]
	add	x9, x9, #4              // =4
	cmp	x8, x11
	b.lt	.LBB184_4
.LBB184_5:                              // %for.cond.cleanup
	ldrb	w8, [x21, #33]
	mov	x1, x20
	mov	x3, x19
	mov	x0, x22
	add	w8, w8, #7              // =7
	lsr	w8, w8, #3
	str	w8, [x19, #64]
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	mov	x2, x21
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	b	halide_downgrade_buffer_t_device_fields
.Lfunc_end184:
	.size	halide_downgrade_buffer_t, .Lfunc_end184-halide_downgrade_buffer_t
                                        // -- End function
	.section	.text.halide_downgrade_buffer_t_device_fields,"ax",@progbits
	.weak	halide_downgrade_buffer_t_device_fields // -- Begin function halide_downgrade_buffer_t_device_fields
	.p2align	2
	.type	halide_downgrade_buffer_t_device_fields,@function
halide_downgrade_buffer_t_device_fields: // @halide_downgrade_buffer_t_device_fields
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldrb	w8, [x2, #24]
	ldr	x0, [x3]
	mov	x19, x3
	add	x29, sp, #16            // =16
	and	w9, w8, #0x1
	ubfx	w8, w8, #1, #1
	strb	w9, [x3, #68]
	strb	w8, [x3, #69]
	ldr	x8, [x2]
	cbz	x8, .LBB185_3
// %bb.1:                               // %if.then
	mov	x20, x2
	cbz	x0, .LBB185_6
// %bb.2:                               // %if.then4
	str	x8, [x0]
	ldr	x8, [x20, #8]
	str	x8, [x0, #8]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB185_3:                              // %if.else15
	cbz	x0, .LBB185_5
// %bb.4:                               // %if.then18
	bl	free
	str	xzr, [x19]
.LBB185_5:                              // %if.end22
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB185_6:                              // %if.else
	mov	w0, #16
	bl	malloc
	ldr	q0, [x20]
	str	q0, [x0]
	str	x0, [x19]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end185:
	.size	halide_downgrade_buffer_t_device_fields, .Lfunc_end185-halide_downgrade_buffer_t_device_fields
                                        // -- End function
	.section	.text.halide_copy_to_host_legacy,"ax",@progbits
	.weak	halide_copy_to_host_legacy // -- Begin function halide_copy_to_host_legacy
	.p2align	2
	.type	halide_copy_to_host_legacy,@function
halide_copy_to_host_legacy:             // @halide_copy_to_host_legacy
// %bb.0:                               // %entry
	sub	sp, sp, #160            // =160
	movi	v0.2d, #0000000000000000
	mov	x8, sp
	add	x2, sp, #64             // =64
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #144]    // 16-byte Folded Spill
	add	x29, sp, #144           // =144
	mov	x19, x1
	mov	x20, x0
	stp	q0, q0, [sp, #80]
	stp	q0, q0, [sp, #48]
	stp	q0, q0, [sp, #16]
	str	q0, [sp]
	stp	x8, xzr, [sp, #104]
	bl	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	cbnz	w0, .LBB186_3
// %bb.1:                               // %lor.rhs
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x3, sp, #64             // =64
	mov	x0, x20
	mov	x2, x19
	mov	w4, wzr
	bl	halide_upgrade_buffer_t
	cbnz	w0, .LBB186_3
// %bb.2:                               // %lor.rhs4
	add	x1, sp, #64             // =64
	mov	x0, x20
	bl	halide_copy_to_host
	cbz	w0, .LBB186_4
.LBB186_3:
	mov	w0, #1
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB186_4:                              // %lor.rhs10
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x2, sp, #64             // =64
	mov	x0, x20
	mov	x3, x19
	bl	halide_downgrade_buffer_t_device_fields
	cmp	w0, #0                  // =0
	cset	w0, ne
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.Lfunc_end186:
	.size	halide_copy_to_host_legacy, .Lfunc_end186-halide_copy_to_host_legacy
                                        // -- End function
	.section	.text.halide_copy_to_device_legacy,"ax",@progbits
	.weak	halide_copy_to_device_legacy // -- Begin function halide_copy_to_device_legacy
	.p2align	2
	.type	halide_copy_to_device_legacy,@function
halide_copy_to_device_legacy:           // @halide_copy_to_device_legacy
// %bb.0:                               // %entry
	sub	sp, sp, #176            // =176
	str	x21, [sp, #128]         // 8-byte Folded Spill
	mov	x21, x2
	movi	v0.2d, #0000000000000000
	mov	x8, sp
	add	x2, sp, #64             // =64
	stp	x20, x19, [sp, #144]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #160]    // 16-byte Folded Spill
	add	x29, sp, #160           // =160
	mov	x19, x1
	mov	x20, x0
	stp	q0, q0, [sp, #80]
	stp	q0, q0, [sp, #48]
	stp	q0, q0, [sp, #16]
	str	q0, [sp]
	stp	x8, xzr, [sp, #104]
	bl	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	cbnz	w0, .LBB187_3
// %bb.1:                               // %lor.rhs
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x3, sp, #64             // =64
	mov	x0, x20
	mov	x2, x19
	mov	w4, wzr
	bl	halide_upgrade_buffer_t
	cbnz	w0, .LBB187_3
// %bb.2:                               // %lor.rhs5
	add	x1, sp, #64             // =64
	mov	x0, x20
	mov	x2, x21
	bl	halide_copy_to_device
	cbz	w0, .LBB187_5
.LBB187_3:
	mov	w0, #1
.LBB187_4:                              // %lor.end14
	ldp	x29, x30, [sp, #160]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]    // 16-byte Folded Reload
	ldr	x21, [sp, #128]         // 8-byte Folded Reload
	add	sp, sp, #176            // =176
	ret
.LBB187_5:                              // %lor.rhs11
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x2, sp, #64             // =64
	mov	x0, x20
	mov	x3, x19
	bl	halide_downgrade_buffer_t_device_fields
	cmp	w0, #0                  // =0
	cset	w0, ne
	b	.LBB187_4
.Lfunc_end187:
	.size	halide_copy_to_device_legacy, .Lfunc_end187-halide_copy_to_device_legacy
                                        // -- End function
	.section	.text.halide_device_sync_legacy,"ax",@progbits
	.weak	halide_device_sync_legacy // -- Begin function halide_device_sync_legacy
	.p2align	2
	.type	halide_device_sync_legacy,@function
halide_device_sync_legacy:              // @halide_device_sync_legacy
// %bb.0:                               // %entry
	sub	sp, sp, #160            // =160
	movi	v0.2d, #0000000000000000
	mov	x8, sp
	add	x2, sp, #64             // =64
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #144]    // 16-byte Folded Spill
	add	x29, sp, #144           // =144
	mov	x19, x1
	mov	x20, x0
	stp	q0, q0, [sp, #80]
	stp	q0, q0, [sp, #48]
	stp	q0, q0, [sp, #16]
	str	q0, [sp]
	stp	x8, xzr, [sp, #104]
	bl	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	cbnz	w0, .LBB188_3
// %bb.1:                               // %lor.rhs
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x3, sp, #64             // =64
	mov	x0, x20
	mov	x2, x19
	mov	w4, wzr
	bl	halide_upgrade_buffer_t
	cbnz	w0, .LBB188_3
// %bb.2:                               // %lor.rhs4
	add	x1, sp, #64             // =64
	mov	x0, x20
	bl	halide_device_sync
	cbz	w0, .LBB188_4
.LBB188_3:
	mov	w0, #1
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB188_4:                              // %lor.rhs10
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x2, sp, #64             // =64
	mov	x0, x20
	mov	x3, x19
	bl	halide_downgrade_buffer_t_device_fields
	cmp	w0, #0                  // =0
	cset	w0, ne
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.Lfunc_end188:
	.size	halide_device_sync_legacy, .Lfunc_end188-halide_device_sync_legacy
                                        // -- End function
	.section	.text.halide_device_malloc_legacy,"ax",@progbits
	.weak	halide_device_malloc_legacy // -- Begin function halide_device_malloc_legacy
	.p2align	2
	.type	halide_device_malloc_legacy,@function
halide_device_malloc_legacy:            // @halide_device_malloc_legacy
// %bb.0:                               // %entry
	sub	sp, sp, #176            // =176
	str	x21, [sp, #128]         // 8-byte Folded Spill
	mov	x21, x2
	movi	v0.2d, #0000000000000000
	mov	x8, sp
	add	x2, sp, #64             // =64
	stp	x20, x19, [sp, #144]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #160]    // 16-byte Folded Spill
	add	x29, sp, #160           // =160
	mov	x19, x1
	mov	x20, x0
	stp	q0, q0, [sp, #80]
	stp	q0, q0, [sp, #48]
	stp	q0, q0, [sp, #16]
	str	q0, [sp]
	stp	x8, xzr, [sp, #104]
	bl	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	cbnz	w0, .LBB189_3
// %bb.1:                               // %lor.rhs
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x3, sp, #64             // =64
	mov	x0, x20
	mov	x2, x19
	mov	w4, wzr
	bl	halide_upgrade_buffer_t
	cbnz	w0, .LBB189_3
// %bb.2:                               // %lor.rhs5
	add	x1, sp, #64             // =64
	mov	x0, x20
	mov	x2, x21
	bl	halide_device_malloc
	cbz	w0, .LBB189_5
.LBB189_3:
	mov	w0, #1
.LBB189_4:                              // %lor.end14
	ldp	x29, x30, [sp, #160]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #144]    // 16-byte Folded Reload
	ldr	x21, [sp, #128]         // 8-byte Folded Reload
	add	sp, sp, #176            // =176
	ret
.LBB189_5:                              // %lor.rhs11
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x2, sp, #64             // =64
	mov	x0, x20
	mov	x3, x19
	bl	halide_downgrade_buffer_t_device_fields
	cmp	w0, #0                  // =0
	cset	w0, ne
	b	.LBB189_4
.Lfunc_end189:
	.size	halide_device_malloc_legacy, .Lfunc_end189-halide_device_malloc_legacy
                                        // -- End function
	.section	.text.halide_device_free_legacy,"ax",@progbits
	.weak	halide_device_free_legacy // -- Begin function halide_device_free_legacy
	.p2align	2
	.type	halide_device_free_legacy,@function
halide_device_free_legacy:              // @halide_device_free_legacy
// %bb.0:                               // %entry
	sub	sp, sp, #160            // =160
	movi	v0.2d, #0000000000000000
	mov	x8, sp
	add	x2, sp, #64             // =64
	stp	x20, x19, [sp, #128]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #144]    // 16-byte Folded Spill
	add	x29, sp, #144           // =144
	mov	x19, x1
	mov	x20, x0
	stp	q0, q0, [sp, #80]
	stp	q0, q0, [sp, #48]
	stp	q0, q0, [sp, #16]
	str	q0, [sp]
	stp	x8, xzr, [sp, #104]
	bl	_ZN6Halide7Runtime8Internal29guess_type_and_dimensionalityEPvP8buffer_tP15halide_buffer_t
	cbnz	w0, .LBB190_3
// %bb.1:                               // %lor.rhs
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x3, sp, #64             // =64
	mov	x0, x20
	mov	x2, x19
	mov	w4, wzr
	bl	halide_upgrade_buffer_t
	cbnz	w0, .LBB190_3
// %bb.2:                               // %lor.rhs4
	add	x1, sp, #64             // =64
	mov	x0, x20
	bl	halide_device_free
	cbz	w0, .LBB190_4
.LBB190_3:
	mov	w0, #1
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.LBB190_4:                              // %lor.rhs10
	adrp	x1, .L.str.165
	add	x1, x1, :lo12:.L.str.165
	add	x2, sp, #64             // =64
	mov	x0, x20
	mov	x3, x19
	bl	halide_downgrade_buffer_t_device_fields
	cmp	w0, #0                  // =0
	cset	w0, ne
	ldp	x29, x30, [sp, #144]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #128]    // 16-byte Folded Reload
	add	sp, sp, #160            // =160
	ret
.Lfunc_end190:
	.size	halide_device_free_legacy, .Lfunc_end190-halide_device_free_legacy
                                        // -- End function
	.section	.text.halide_profiler_shutdown,"ax",@progbits
	.weak	halide_profiler_shutdown // -- Begin function halide_profiler_shutdown
	.p2align	2
	.type	halide_profiler_shutdown,@function
halide_profiler_shutdown:               // @halide_profiler_shutdown
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	bl	halide_profiler_get_state
	mov	x19, x0
	ldr	x0, [x0, #40]
	cbz	x0, .LBB191_2
// %bb.1:                               // %if.end
	mov	w8, #-2
	str	w8, [x19, #16]
	bl	halide_join_thread
	mov	w8, #-1
	mov	x0, xzr
	mov	x1, x19
	str	xzr, [x19, #40]
	str	w8, [x19, #16]
	bl	halide_profiler_report_unlocked
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x19
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	b	halide_profiler_reset_unlocked
.LBB191_2:                              // %cleanup
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end191:
	.size	halide_profiler_shutdown, .Lfunc_end191-halide_profiler_shutdown
                                        // -- End function
	.section	.text.halide_profiler_get_state,"ax",@progbits
	.weak	halide_profiler_get_state // -- Begin function halide_profiler_get_state
	.p2align	2
	.type	halide_profiler_get_state,@function
halide_profiler_get_state:              // @halide_profiler_get_state
// %bb.0:                               // %entry
	adrp	x0, _ZZ25halide_profiler_get_stateE1s
	add	x0, x0, :lo12:_ZZ25halide_profiler_get_stateE1s
	ret
.Lfunc_end192:
	.size	halide_profiler_get_state, .Lfunc_end192-halide_profiler_get_state
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               // -- Begin function halide_profiler_report_unlocked
.LCPI193_0:
	.xword	4457293557087583675     // double 1.0E-10
	.section	.text.halide_profiler_report_unlocked,"ax",@progbits
	.weak	halide_profiler_report_unlocked
	.p2align	2
	.type	halide_profiler_report_unlocked,@function
halide_profiler_report_unlocked:        // @halide_profiler_report_unlocked
// %bb.0:                               // %entry
	stp	d9, d8, [sp, #-112]!    // 16-byte Folded Spill
	stp	x28, x27, [sp, #16]     // 16-byte Folded Spill
	stp	x26, x25, [sp, #32]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	add	x29, sp, #96            // =96
	sub	sp, sp, #1072           // =1072
	strb	wzr, [sp, #1063]
	ldr	x27, [x1, #24]
	add	x23, sp, #40            // =40
	mov	w8, #1
	sub	x8, x8, x23
	stp	x8, x0, [sp, #24]       // 16-byte Folded Spill
	cbz	x27, .LBB193_50
// %bb.1:                               // %for.body.preheader
	adrp	x8, .LCPI193_0
	ldr	d8, [x8, :lo12:.LCPI193_0]
	adrp	x22, .L.str.3.232
	adrp	x28, .L.str.71.224
	add	x20, x23, #1023         // =1023
	add	x22, x22, :lo12:.L.str.3.232
	mov	w25, #72
	add	x28, x28, :lo12:.L.str.71.224
	add	x21, sp, #40            // =40
	ldr	w8, [x27, #80]
	cbnz	w8, .LBB193_4
.LBB193_2:                              // %cleanup191
                                        // =>This Inner Loop Header: Depth=1
	ldr	x27, [x27, #64]
	cbz	x27, .LBB193_51
// %bb.3:                               // %for.body
                                        //   in Loop: Header=BB193_2 Depth=1
	ldr	w8, [x27, #80]
	cbz	w8, .LBB193_2
.LBB193_4:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5clearEv.exit
	ldr	x8, [x27]
	strb	wzr, [sp, #40]
	ldp	x21, x2, [x27, #40]
	ldr	x19, [x27, #32]
	ucvtf	s0, x8
	mov	w8, #9216
	movk	w8, #18804, lsl #16
	fmov	s1, w8
	fdiv	s9, s0, s1
	add	x0, sp, #40             // =40
	mov	x1, x20
	cbnz	x2, .LBB193_6
// %bb.5:                               // %if.then.i290
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
.LBB193_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EElsEPKc.exit
	bl	halide_string_to_string
	mov	x1, x20
	mov	x2, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.8.177
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.8.177
	bl	halide_string_to_string
	fcvt	d0, s9
	mov	x1, x20
	mov	w2, wzr
	bl	halide_double_to_string
	adrp	x2, .L.str.9.178
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.9.178
	bl	halide_string_to_string
	adrp	x2, .L.str.10.179
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.10.179
	bl	halide_string_to_string
	ldrsw	x2, [x27, #84]
	mov	w3, #1
	mov	x1, x20
	bl	halide_int64_to_string
	adrp	x2, .L.str.11.180
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.11.180
	bl	halide_string_to_string
	ldrsw	x2, [x27, #80]
	mov	w3, #1
	mov	x1, x20
	bl	halide_int64_to_string
	adrp	x2, .L.str.12.181
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.12.181
	bl	halide_string_to_string
	ldr	s0, [x27, #80]
	mov	x1, x20
	mov	w2, wzr
	scvtf	s0, s0
	fdiv	s0, s9, s0
	fcvt	d0, s0
	bl	halide_double_to_string
	adrp	x2, .L.str.13.182
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.13.182
	bl	halide_string_to_string
	cmp	x19, x21
	stp	x19, x21, [sp, #8]      // 16-byte Folded Spill
	b.eq	.LBB193_8
// %bb.7:                               // %if.then31
	ucvtf	d1, x21
	ucvtf	d0, x19
	fadd	d1, d1, d8
	adrp	x2, .L.str.14.183
	fdiv	d0, d0, d1
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.14.183
	fcvt	s9, d0
	bl	halide_string_to_string
	fcvt	d0, s9
	mov	x1, x20
	mov	w2, wzr
	bl	halide_double_to_string
	mov	x1, x20
	mov	x2, x22
	bl	halide_string_to_string
.LBB193_8:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE3strEv.exit401
	adrp	x2, .L.str.15.184
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.15.184
	bl	halide_string_to_string
	ldrsw	x2, [x27, #88]
	mov	w3, #1
	mov	x1, x20
	bl	halide_int64_to_string
	adrp	x2, .L.str.16.185
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.16.185
	bl	halide_string_to_string
	ldr	x2, [x27, #16]
	mov	w3, #1
	mov	x1, x20
	bl	halide_uint64_to_string
	adrp	x2, .L.str.17.186
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.17.186
	bl	halide_string_to_string
	ldp	x8, x19, [sp, #24]      // 16-byte Folded Reload
	mov	x21, x0
	add	x1, sp, #40             // =40
	add	x2, x8, x0
	mov	x0, x19
	bl	halide_msan_annotate_memory_is_initialized
	add	x1, sp, #40             // =40
	mov	x0, x19
	bl	halide_print
	ldr	x8, [x27]
	cbnz	x8, .LBB193_10
// %bb.9:                               // %lor.end
	ldr	x8, [x27, #24]
	cbz	x8, .LBB193_46
.LBB193_10:                             // %for.cond62.preheader
	ldr	w8, [x27, #72]
	cmp	w8, #1                  // =1
	b.lt	.LBB193_2
// %bb.11:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5clearEv.exit407.lr.ph
	mov	x26, xzr
	strb	wzr, [sp, #40]
	ldr	x21, [x27, #56]
	madd	x24, x26, x25, x21
	cbnz	x26, .LBB193_15
	b	.LBB193_14
.LBB193_12:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE3strEv.exit
	mov	x1, x20
	mov	x2, x22
	bl	halide_string_to_string
	ldp	x8, x19, [sp, #24]      // 16-byte Folded Reload
	mov	x21, x0
	add	x1, sp, #40             // =40
	add	x2, x8, x0
	mov	x0, x19
	bl	halide_msan_annotate_memory_is_initialized
	add	x1, sp, #40             // =40
	mov	x0, x19
	bl	halide_print
	ldr	w8, [x27, #72]
	add	x26, x26, #1            // =1
	cmp	x26, w8, sxtw
	b.ge	.LBB193_2
.LBB193_13:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5clearEv.exit407
	strb	wzr, [sp, #40]
	ldr	x21, [x27, #56]
	madd	x24, x26, x25, x21
	cbnz	x26, .LBB193_15
.LBB193_14:                             // %land.lhs.true
	ldr	x9, [x24]
	cbz	x9, .LBB193_45
.LBB193_15:                             // %if.end75
	adrp	x2, .L.str.18.187
	add	x0, sp, #40             // =40
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.18.187
	bl	halide_string_to_string
	madd	x8, x26, x25, x21
	ldr	x2, [x8, #56]
	cbz	x2, .LBB193_17
// %bb.16:                              // %if.else.i420
	mov	x1, x20
	b	.LBB193_18
.LBB193_17:                             // %if.then.i418
	adrp	x2, .L.str.243
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.243
.LBB193_18:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EElsEPKc.exit423
	bl	halide_string_to_string
	adrp	x2, .L.str.19.188
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.19.188
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #24                 // =24
	b.hi	.LBB193_20
.LBB193_19:                             // %while.body
                                        // =>This Inner Loop Header: Depth=1
	mov	x1, x20
	mov	x2, x28
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #25                 // =25
	b.lo	.LBB193_19
.LBB193_20:                             // %while.end
	ldr	x8, [x24]
	ldr	s0, [x27, #80]
	mov	x1, x20
	mov	w2, wzr
	ucvtf	s1, x8
	mov	w8, #9216
	movk	w8, #18804, lsl #16
	scvtf	s0, s0
	fmov	s2, w8
	fmul	s0, s0, s2
	fdiv	s0, s1, s0
	fcvt	d0, s0
	bl	halide_double_to_string
	cbz	x0, .LBB193_22
// %bb.21:                              // %if.then.i446
	sub	x8, x0, #3              // =3
	cmp	x8, x23
	csel	x0, x23, x8, lo
	strb	wzr, [x0]
.LBB193_22:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5eraseEi.exit
	adrp	x2, .L.str.21.190
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.21.190
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #34                 // =34
	b.hi	.LBB193_24
.LBB193_23:                             // %while.body95
                                        // =>This Inner Loop Header: Depth=1
	mov	x1, x20
	mov	x2, x28
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #35                 // =35
	b.lo	.LBB193_23
.LBB193_24:                             // %while.end97
	ldr	x8, [x27]
	cbz	x8, .LBB193_26
// %bb.25:                              // %if.then100
	ldr	x9, [x24]
	mov	w10, #100
	mul	x9, x9, x10
	udiv	x19, x9, x8
	b	.LBB193_27
.LBB193_26:
	mov	x19, xzr
.LBB193_27:                             // %if.end106
	adrp	x2, .L.str.22.191
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.22.191
	bl	halide_string_to_string
	sxtw	x2, w19
	mov	w3, #1
	mov	x1, x20
	bl	halide_int64_to_string
	adrp	x2, .L.str.23.192
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.23.192
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #42                 // =42
	b.hi	.LBB193_29
.LBB193_28:                             // %while.body114
                                        // =>This Inner Loop Header: Depth=1
	mov	x1, x20
	mov	x2, x28
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #43                 // =43
	b.lo	.LBB193_28
.LBB193_29:                             // %while.end116.loopexit
	ldp	x8, x9, [sp, #8]        // 16-byte Folded Reload
	cmp	x8, x9
	b.ne	.LBB193_37
// %bb.30:
	mov	w22, #58
	madd	x19, x26, x25, x21
	ldrsw	x8, [x19, #64]!
	cbz	w8, .LBB193_42
.LBB193_31:                             // %if.then140
	madd	x9, x26, x25, x21
	ldr	x9, [x9, #24]
	udiv	x24, x9, x8
	mov	w8, #72
	madd	x25, x26, x8, x21
	ldr	x8, [x25, #16]!
	cbz	x8, .LBB193_43
.LBB193_32:                             // %if.then149
	adrp	x2, .L.str.25.194
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.25.194
	bl	halide_string_to_string
	ldr	x2, [x25]
	mov	w3, #1
	mov	x1, x20
	bl	halide_uint64_to_string
	sub	x8, x0, x23
	mov	w25, #72
	mov	x1, x20
	cmp	x8, x22
	b.hs	.LBB193_34
.LBB193_33:                             // %while.body157
                                        // =>This Inner Loop Header: Depth=1
	mov	x2, x28
	bl	halide_string_to_string
	sub	x8, x0, x23
	mov	x1, x20
	cmp	x8, x22
	b.lo	.LBB193_33
.LBB193_34:                             // %while.end159
	adrp	x2, .L.str.26.195
	add	x2, x2, :lo12:.L.str.26.195
	bl	halide_string_to_string
	ldrsw	x2, [x19]
	mov	w3, #1
	mov	x1, x20
	bl	halide_int64_to_string
	add	x19, x22, #15           // =15
	adrp	x22, .L.str.3.232
	sub	x8, x0, x23
	add	x22, x22, :lo12:.L.str.3.232
	mov	x1, x20
	cmp	x8, x19
	b.hs	.LBB193_36
.LBB193_35:                             // %while.body167
                                        // =>This Inner Loop Header: Depth=1
	mov	x2, x28
	bl	halide_string_to_string
	sub	x8, x0, x23
	mov	x1, x20
	cmp	x8, x19
	b.lo	.LBB193_35
.LBB193_36:                             // %while.end169
	adrp	x2, .L.str.27.196
	add	x2, x2, :lo12:.L.str.27.196
	bl	halide_string_to_string
	sxtw	x2, w24
	mov	w3, #1
	mov	x1, x20
	bl	halide_int64_to_string
	madd	x19, x26, x25, x21
	ldr	x8, [x19, #32]!
	cbnz	x8, .LBB193_44
	b	.LBB193_12
.LBB193_37:                             // %if.then118
	madd	x8, x26, x25, x21
	ldp	d0, d1, [x8, #40]
	adrp	x2, .L.str.24.193
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.24.193
	ucvtf	d1, d1
	ucvtf	d0, d0
	fadd	d1, d1, d8
	fdiv	d0, d0, d1
	fcvt	s9, d0
	bl	halide_string_to_string
	fcvt	d0, s9
	mov	x1, x20
	mov	w2, wzr
	bl	halide_double_to_string
	cbz	x0, .LBB193_39
// %bb.38:                              // %if.then.i510
	sub	x8, x0, #3              // =3
	cmp	x8, x23
	csel	x0, x23, x8, lo
	strb	wzr, [x0]
.LBB193_39:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE5eraseEi.exit511
	sub	x8, x0, x23
	cmp	x8, #57                 // =57
	b.hi	.LBB193_41
.LBB193_40:                             // %while.body133
                                        // =>This Inner Loop Header: Depth=1
	mov	x1, x20
	mov	x2, x28
	bl	halide_string_to_string
	sub	x8, x0, x23
	cmp	x8, #58                 // =58
	b.lo	.LBB193_40
.LBB193_41:                             // %if.end136.loopexit
	mov	w22, #73
	madd	x19, x26, x25, x21
	ldrsw	x8, [x19, #64]!
	cbnz	w8, .LBB193_31
.LBB193_42:
	mov	x24, xzr
	mov	w8, #72
	madd	x25, x26, x8, x21
	ldr	x8, [x25, #16]!
	cbnz	x8, .LBB193_32
.LBB193_43:
	adrp	x22, .L.str.3.232
	add	x22, x22, :lo12:.L.str.3.232
	mov	w25, #72
	madd	x19, x26, x25, x21
	ldr	x8, [x19, #32]!
	cbz	x8, .LBB193_12
.LBB193_44:                             // %if.then175
	adrp	x2, .L.str.28.197
	mov	x1, x20
	add	x2, x2, :lo12:.L.str.28.197
	bl	halide_string_to_string
	ldr	x2, [x19]
	mov	w3, #1
	mov	x1, x20
	bl	halide_uint64_to_string
	b	.LBB193_12
.LBB193_45:
	add	x21, sp, #40            // =40
	add	x26, x26, #1            // =1
	cmp	x26, w8, sxtw
	b.lt	.LBB193_13
	b	.LBB193_2
.LBB193_46:                             // %for.cond50.preheader
	ldrsw	x8, [x27, #72]
	cmp	w8, #1                  // =1
	b.lt	.LBB193_2
// %bb.47:                              // %for.body53.lr.ph
	ldr	x9, [x27, #56]
	add	x9, x9, #32             // =32
.LBB193_48:                             // %for.body53
                                        // =>This Inner Loop Header: Depth=1
	ldr	x10, [x9]
	cbnz	x10, .LBB193_10
// %bb.49:                              // %for.cond50
                                        //   in Loop: Header=BB193_48 Depth=1
	subs	x8, x8, #1              // =1
	add	x9, x9, #72             // =72
	b.ne	.LBB193_48
	b	.LBB193_2
.LBB193_50:
	add	x21, sp, #40            // =40
.LBB193_51:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EED2Ev.exit
	ldp	x8, x0, [sp, #24]       // 16-byte Folded Reload
	add	x1, sp, #40             // =40
	add	x2, x21, x8
	bl	halide_msan_annotate_memory_is_initialized
	add	sp, sp, #1072           // =1072
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #16]     // 16-byte Folded Reload
	ldp	d9, d8, [sp], #112      // 16-byte Folded Reload
	ret
.Lfunc_end193:
	.size	halide_profiler_report_unlocked, .Lfunc_end193-halide_profiler_report_unlocked
                                        // -- End function
	.section	.text.halide_profiler_reset_unlocked,"ax",@progbits
	.weak	halide_profiler_reset_unlocked // -- Begin function halide_profiler_reset_unlocked
	.p2align	2
	.type	halide_profiler_reset_unlocked,@function
halide_profiler_reset_unlocked:         // @halide_profiler_reset_unlocked
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldr	x20, [x0, #24]
	mov	x19, x0
	add	x29, sp, #16            // =16
	cbz	x20, .LBB194_2
.LBB194_1:                              // %while.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x20, #64]
	str	x8, [x19, #24]
	ldr	x0, [x20, #56]
	bl	free
	mov	x0, x20
	bl	free
	ldr	x20, [x19, #24]
	cbnz	x20, .LBB194_1
.LBB194_2:                              // %while.end
	str	wzr, [x19, #12]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end194:
	.size	halide_profiler_reset_unlocked, .Lfunc_end194-halide_profiler_reset_unlocked
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy // -- Begin function _ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy,@function
_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy: // @_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x2
	mov	w20, w1
	mov	x23, x0
	bl	halide_profiler_get_state
	ldr	x19, [x0, #24]
	mov	x22, x0
	cbnz	x19, .LBB195_8
.LBB195_1:                              // %for.end.critedge
	mov	w0, #96
	bl	malloc
	mov	x19, x0
	cbz	x0, .LBB195_11
// %bb.2:                               // %if.end7
	ldr	x8, [x22, #24]
	str	x23, [x19, #48]
	mov	w9, #72
	movi	v0.2d, #0000000000000000
	str	x8, [x19, #64]
	ldr	w8, [x22, #12]
	smull	x0, w20, w9
	str	xzr, [x19, #80]
	str	wzr, [x19, #88]
	stp	q0, q0, [x19]
	stp	w20, w8, [x19, #72]
	str	q0, [x19, #32]
	bl	malloc
	str	x0, [x19, #56]
	cbz	x0, .LBB195_10
// %bb.3:                               // %for.cond17.preheader
	cmp	w20, #1                 // =1
	b.lt	.LBB195_6
// %bb.4:                               // %for.body20.lr.ph
	mov	w8, w20
	add	x9, x0, #64             // =64
	movi	v0.2d, #0000000000000000
.LBB195_5:                              // %for.body20
                                        // =>This Inner Loop Header: Depth=1
	stur	xzr, [x9, #-64]
	ldr	x10, [x21], #8
	subs	x8, x8, #1              // =1
	str	wzr, [x9]
	stur	q0, [x9, #-56]
	stur	q0, [x9, #-40]
	stur	q0, [x9, #-24]
	stur	x10, [x9, #-8]
	add	x9, x9, #72             // =72
	b.ne	.LBB195_5
.LBB195_6:                              // %for.cond.cleanup19
	ldr	w8, [x22, #12]
	str	x19, [x22, #24]
	add	w8, w8, w20
	str	w8, [x22, #12]
	b	.LBB195_11
.LBB195_7:                              // %for.inc
                                        //   in Loop: Header=BB195_8 Depth=1
	ldr	x19, [x19, #64]
	cbz	x19, .LBB195_1
.LBB195_8:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x19, #48]
	cmp	x8, x23
	b.ne	.LBB195_7
// %bb.9:                               // %land.lhs.true
                                        //   in Loop: Header=BB195_8 Depth=1
	ldr	w8, [x19, #72]
	cmp	w8, w20
	b.ne	.LBB195_7
	b	.LBB195_11
.LBB195_10:                             // %if.then15
	mov	x0, x19
	bl	free
	mov	x19, xzr
.LBB195_11:                             // %cleanup62
	mov	x0, x19
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end195:
	.size	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy, .Lfunc_end195-_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi // -- Begin function _ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi,@function
_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi: // @_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
// %bb.0:                               // %entry
	ldr	x9, [x0, #24]
                                        // kill: def $w3 killed $w3 def $x3
	cbz	x9, .LBB196_8
// %bb.1:                               // %for.body.preheader
	mov	x10, xzr
	mov	x11, x9
	mov	x8, x11
	ldrsw	x11, [x11, #76]
	cmp	w11, w1
	b.le	.LBB196_4
.LBB196_2:                              // %if.end23
                                        // =>This Inner Loop Header: Depth=1
	ldr	x11, [x8, #64]
	mov	x10, x8
	cbz	x11, .LBB196_8
// %bb.3:                               // %for.body
                                        //   in Loop: Header=BB196_2 Depth=1
	mov	x8, x11
	ldrsw	x11, [x11, #76]
	cmp	w11, w1
	b.gt	.LBB196_2
.LBB196_4:                              // %land.lhs.true
	ldr	w12, [x8, #72]
	add	w12, w12, w11
	cmp	w12, w1
	b.le	.LBB196_2
// %bb.5:                               // %if.then
	cbz	x10, .LBB196_7
// %bb.6:                               // %if.then4
	ldr	x12, [x8, #64]
	str	x12, [x10, #64]
	str	x9, [x8, #64]
	str	x8, [x0, #24]
.LBB196_7:                              // %if.end
	ldr	x9, [x8, #56]
	mov	w10, #72
	mneg	x11, x11, x10
	sxtw	x13, w3
	smaddl	x9, w1, w10, x9
	add	x9, x9, x11
	ldr	x10, [x9]
	ldp	x11, x12, [x9, #40]
	add	x10, x10, x2
	add	x11, x11, x13
	add	x12, x12, #1            // =1
	str	x10, [x9]
	stp	x11, x12, [x9, #40]
	ldr	x9, [x8]
	ldr	w10, [x8, #84]
	ldp	x11, x12, [x8, #32]
	add	x9, x9, x2
	add	w10, w10, #1            // =1
	add	x11, x11, x13
	add	x12, x12, #1            // =1
	str	x9, [x8]
	str	w10, [x8, #84]
	stp	x11, x12, [x8, #32]
.LBB196_8:                              // %cleanup25
	ret
.Lfunc_end196:
	.size	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi, .Lfunc_end196-_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv // -- Begin function _ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv,@function
_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv: // @_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	bl	halide_profiler_get_state
	mov	x19, x0
	bl	halide_mutex_lock
.LBB197_1:                              // %entry
                                        // =>This Inner Loop Header: Depth=1
	ldr	w8, [x19, #16]
	cmn	w8, #2                  // =2
	b.eq	.LBB197_9
// %bb.2:                               // %while.body
                                        //   in Loop: Header=BB197_1 Depth=1
	mov	x0, xzr
	bl	halide_current_time_ns
	mov	x20, x0
	ldr	x8, [x19, #32]
	cbnz	x8, .LBB197_4
	b	.LBB197_5
.LBB197_3:                              // %if.end14
                                        //   in Loop: Header=BB197_1 Depth=1
	ldr	w20, [x19, #8]
	mov	x0, x19
	bl	halide_mutex_unlock
	mov	x0, xzr
	mov	w1, w20
	bl	halide_sleep_ms
	mov	x0, x19
	bl	halide_mutex_lock
	mov	x20, x21
	ldr	x8, [x19, #32]
	cbz	x8, .LBB197_5
.LBB197_4:                              // %if.then
                                        //   in Loop: Header=BB197_1 Depth=1
	add	x0, sp, #12             // =12
	add	x1, sp, #8              // =8
	blr	x8
	b	.LBB197_6
.LBB197_5:                              // %if.else
                                        //   in Loop: Header=BB197_1 Depth=1
	ldr	w8, [x19, #16]
	str	w8, [sp, #12]
	ldr	w8, [x19, #20]
	str	w8, [sp, #8]
.LBB197_6:                              // %if.end
                                        //   in Loop: Header=BB197_1 Depth=1
	mov	x0, xzr
	bl	halide_current_time_ns
	ldr	w1, [sp, #12]
	cmn	w1, #2                  // =2
	b.eq	.LBB197_1
// %bb.7:                               // %if.else10
                                        //   in Loop: Header=BB197_1 Depth=1
	mov	x21, x0
	tbnz	w1, #31, .LBB197_3
// %bb.8:                               // %if.then12
                                        //   in Loop: Header=BB197_1 Depth=1
	ldr	w3, [sp, #8]
	sub	x2, x21, x20
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal9bill_funcEP21halide_profiler_stateiyi
	b	.LBB197_3
.LBB197_9:                              // %while.end19
	mov	x0, x19
	bl	halide_mutex_unlock
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end197:
	.size	_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv, .Lfunc_end197-_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
                                        // -- End function
	.section	.text.halide_profiler_get_pipeline_state,"ax",@progbits
	.weak	halide_profiler_get_pipeline_state // -- Begin function halide_profiler_get_pipeline_state
	.p2align	2
	.type	halide_profiler_get_pipeline_state,@function
halide_profiler_get_pipeline_state:     // @halide_profiler_get_pipeline_state
// %bb.0:                               // %entry
	str	x21, [sp, #-48]!        // 8-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	mov	x21, x0
	bl	halide_profiler_get_state
	mov	x19, x0
	bl	halide_mutex_lock
	ldr	x20, [x19, #24]
	cbz	x20, .LBB198_3
.LBB198_1:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x20, #48]
	cmp	x8, x21
	b.eq	.LBB198_3
// %bb.2:                               // %for.inc
                                        //   in Loop: Header=BB198_1 Depth=1
	ldr	x20, [x20, #64]
	cbnz	x20, .LBB198_1
.LBB198_3:                              // %cleanup
	mov	x0, x19
	bl	halide_mutex_unlock
	mov	x0, x20
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldr	x21, [sp], #48          // 8-byte Folded Reload
	ret
.Lfunc_end198:
	.size	halide_profiler_get_pipeline_state, .Lfunc_end198-halide_profiler_get_pipeline_state
                                        // -- End function
	.section	.text.halide_profiler_pipeline_start,"ax",@progbits
	.weak	halide_profiler_pipeline_start // -- Begin function halide_profiler_pipeline_start
	.p2align	2
	.type	halide_profiler_pipeline_start,@function
halide_profiler_pipeline_start:         // @halide_profiler_pipeline_start
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x21, x3
	mov	w22, w2
	mov	x23, x1
	mov	x20, x0
	bl	halide_profiler_get_state
	mov	x19, x0
	bl	halide_mutex_lock
	ldr	x8, [x19, #40]
	cbnz	x8, .LBB199_2
// %bb.1:                               // %if.then
	mov	x0, x20
	bl	halide_start_clock
	adrp	x0, :got:_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal24sampling_profiler_threadEPv]
	mov	x1, xzr
	bl	halide_spawn_thread
	str	x0, [x19, #40]
.LBB199_2:                              // %if.end
	mov	x0, x23
	mov	w1, w22
	mov	x2, x21
	bl	_ZN6Halide7Runtime8Internal23find_or_create_pipelineEPKciPKy
	cbz	x0, .LBB199_4
// %bb.3:                               // %if.end9
	ldp	w20, w8, [x0, #76]
	add	w8, w8, #1              // =1
	str	w8, [x0, #80]
	b	.LBB199_5
.LBB199_4:                              // %if.then7
	mov	x0, x20
	bl	halide_error_out_of_memory
	mov	w20, w0
.LBB199_5:                              // %cleanup
	mov	x0, x19
	bl	halide_mutex_unlock
	mov	w0, w20
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end199:
	.size	halide_profiler_pipeline_start, .Lfunc_end199-halide_profiler_pipeline_start
                                        // -- End function
	.section	.text.halide_profiler_stack_peak_update,"ax",@progbits
	.weak	halide_profiler_stack_peak_update // -- Begin function halide_profiler_stack_peak_update
	.p2align	2
	.type	halide_profiler_stack_peak_update,@function
halide_profiler_stack_peak_update:      // @halide_profiler_stack_peak_update
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	mov	x19, x2
	mov	x20, x1
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	cbz	x1, .LBB200_12
// %bb.1:                               // %if.end
	ldr	w11, [x20, #72]
	cmp	w11, #1                 // =1
	b.lt	.LBB200_13
.LBB200_2:                              // %for.body.lr.ph
	mov	x8, xzr
	mov	w9, #72
	ldr	x10, [x19, x8, lsl #3]
	cbnz	x10, .LBB200_6
	b	.LBB200_4
.LBB200_3:                              // %for.inc.loopexit
	ldr	w11, [x20, #72]
.LBB200_4:                              // %for.inc
                                        // =>This Inner Loop Header: Depth=1
	add	x8, x8, #1              // =1
	cmp	x8, w11, sxtw
	b.ge	.LBB200_13
// %bb.5:                               // %for.body
                                        //   in Loop: Header=BB200_4 Depth=1
	ldr	x10, [x19, x8, lsl #3]
	cbz	x10, .LBB200_4
.LBB200_6:                              // %if.then3
	ldr	x11, [x20, #56]
	madd	x11, x8, x9, x11
	ldr	x12, [x11, #32]!
	cmp	x12, x10
	b.lo	.LBB200_10
	b	.LBB200_3
.LBB200_7:                              // %cmpxchg.nostore
                                        //   in Loop: Header=BB200_10 Depth=1
	clrex
.LBB200_8:                              // %cmpxchg.end
                                        //   in Loop: Header=BB200_10 Depth=1
	cmp	x12, x13
	mov	x12, x13
	b.eq	.LBB200_3
// %bb.9:                               // %while.cond.i
                                        //   in Loop: Header=BB200_10 Depth=1
	cmp	x12, x10
	b.hs	.LBB200_3
.LBB200_10:                             // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x13, [x11]
	cmp	x13, x12
	b.ne	.LBB200_7
// %bb.11:                              // %cmpxchg.trystore
                                        //   in Loop: Header=BB200_10 Depth=1
	stlxr	w14, x10, [x11]
	cbnz	w14, .LBB200_10
	b	.LBB200_8
.LBB200_12:                             // %if.then
	adrp	x1, .L.str.198
	add	x1, x1, :lo12:.L.str.198
	bl	halide_print
	bl	abort
	ldr	w11, [x20, #72]
	cmp	w11, #1                 // =1
	b.ge	.LBB200_2
.LBB200_13:                             // %for.cond.cleanup
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end200:
	.size	halide_profiler_stack_peak_update, .Lfunc_end200-halide_profiler_stack_peak_update
                                        // -- End function
	.section	.text.halide_profiler_memory_allocate,"ax",@progbits
	.weak	halide_profiler_memory_allocate // -- Begin function halide_profiler_memory_allocate
	.p2align	2
	.type	halide_profiler_memory_allocate,@function
halide_profiler_memory_allocate:        // @halide_profiler_memory_allocate
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x3, .LBB201_29
// %bb.1:                               // %if.end
	mov	x19, x3
	mov	w21, w2
	mov	x20, x1
	mov	x22, x0
	cbz	x1, .LBB201_30
// %bb.2:                               // %if.end3
	tbnz	w21, #31, .LBB201_31
.LBB201_3:                              // %if.end6
	ldr	w8, [x20, #72]
	cmp	w8, w21
	b.gt	.LBB201_5
.LBB201_4:                              // %if.then8
	adrp	x1, .L.str.3.201
	add	x1, x1, :lo12:.L.str.3.201
	mov	x0, x22
	bl	halide_print
	bl	abort
.LBB201_5:                              // %if.end9
	ldr	x8, [x20, #56]
	sxtw	x9, w21
	add	x10, x20, #88           // =88
.LBB201_6:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w11, [x10]
	add	w11, w11, #1            // =1
	stlxr	w12, w11, [x10]
	cbnz	w12, .LBB201_6
// %bb.7:                               // %atomicrmw.end
	add	x10, x20, #24           // =24
.LBB201_8:                              // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x11, [x10]
	add	x11, x11, x19
	stlxr	w12, x11, [x10]
	cbnz	w12, .LBB201_8
// %bb.9:                               // %atomicrmw.end1
	add	x11, x20, #8            // =8
.LBB201_10:                             // %atomicrmw.start6
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x10, [x11]
	add	x10, x10, x19
	stlxr	w12, x10, [x11]
	cbnz	w12, .LBB201_10
// %bb.11:                              // %atomicrmw.end5
	ldr	x11, [x20, #16]!
	cmp	x11, x10
	b.lo	.LBB201_15
	b	.LBB201_17
.LBB201_12:                             // %cmpxchg.nostore
                                        //   in Loop: Header=BB201_15 Depth=1
	clrex
.LBB201_13:                             // %cmpxchg.end
                                        //   in Loop: Header=BB201_15 Depth=1
	cmp	x11, x12
	mov	x11, x12
	b.eq	.LBB201_17
// %bb.14:                              // %while.cond.i
                                        //   in Loop: Header=BB201_15 Depth=1
	cmp	x11, x10
	b.hs	.LBB201_17
.LBB201_15:                             // %cmpxchg.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x12, [x20]
	cmp	x12, x11
	b.ne	.LBB201_12
// %bb.16:                              // %cmpxchg.trystore
                                        //   in Loop: Header=BB201_15 Depth=1
	stlxr	w13, x10, [x20]
	cbnz	w13, .LBB201_15
	b	.LBB201_13
.LBB201_17:                             // %_ZN12_GLOBAL__N_125sync_compare_max_and_swapIyEEvPT_S1_.exit
	mov	w10, #72
	madd	x10, x9, x10, x8
	add	x10, x10, #64           // =64
.LBB201_18:                             // %atomicrmw.start10
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w11, [x10]
	add	w11, w11, #1            // =1
	stlxr	w12, w11, [x10]
	cbnz	w12, .LBB201_18
// %bb.19:                              // %atomicrmw.end9
	mov	w10, #72
	madd	x10, x9, x10, x8
	add	x10, x10, #24           // =24
.LBB201_20:                             // %atomicrmw.start14
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x11, [x10]
	add	x11, x11, x19
	stlxr	w12, x11, [x10]
	cbnz	w12, .LBB201_20
// %bb.21:                              // %atomicrmw.end13
	mov	w10, #72
	madd	x10, x9, x10, x8
	add	x11, x10, #8            // =8
.LBB201_22:                             // %atomicrmw.start18
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x10, [x11]
	add	x10, x10, x19
	stlxr	w12, x10, [x11]
	cbnz	w12, .LBB201_22
// %bb.23:                              // %atomicrmw.end17
	mov	w11, #72
	madd	x8, x9, x11, x8
	ldr	x9, [x8, #16]!
	cmp	x9, x10
	b.lo	.LBB201_27
	b	.LBB201_29
.LBB201_24:                             // %cmpxchg.nostore23
                                        //   in Loop: Header=BB201_27 Depth=1
	clrex
.LBB201_25:                             // %cmpxchg.end21
                                        //   in Loop: Header=BB201_27 Depth=1
	cmp	x9, x11
	mov	x9, x11
	b.eq	.LBB201_29
// %bb.26:                              // %while.cond.i37
                                        //   in Loop: Header=BB201_27 Depth=1
	cmp	x9, x10
	b.hs	.LBB201_29
.LBB201_27:                             // %cmpxchg.start28
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x11, [x8]
	cmp	x11, x9
	b.ne	.LBB201_24
// %bb.28:                              // %cmpxchg.trystore26
                                        //   in Loop: Header=BB201_27 Depth=1
	stlxr	w12, x10, [x8]
	cbnz	w12, .LBB201_27
	b	.LBB201_25
.LBB201_29:                             // %return
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.LBB201_30:                             // %if.then2
	adrp	x1, .L.str.1.199
	add	x1, x1, :lo12:.L.str.1.199
	mov	x0, x22
	bl	halide_print
	bl	abort
	tbz	w21, #31, .LBB201_3
.LBB201_31:                             // %if.then5
	adrp	x1, .L.str.2.200
	add	x1, x1, :lo12:.L.str.2.200
	mov	x0, x22
	bl	halide_print
	bl	abort
	ldr	w8, [x20, #72]
	cmp	w8, w21
	b.le	.LBB201_4
	b	.LBB201_5
.Lfunc_end201:
	.size	halide_profiler_memory_allocate, .Lfunc_end201-halide_profiler_memory_allocate
                                        // -- End function
	.section	.text.halide_profiler_memory_free,"ax",@progbits
	.weak	halide_profiler_memory_free // -- Begin function halide_profiler_memory_free
	.p2align	2
	.type	halide_profiler_memory_free,@function
halide_profiler_memory_free:            // @halide_profiler_memory_free
// %bb.0:                               // %entry
	stp	x22, x21, [sp, #-48]!   // 16-byte Folded Spill
	stp	x20, x19, [sp, #16]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #32]     // 16-byte Folded Spill
	add	x29, sp, #32            // =32
	cbz	x3, .LBB202_9
// %bb.1:                               // %if.end
	mov	x19, x3
	mov	w21, w2
	mov	x20, x1
	mov	x22, x0
	cbz	x1, .LBB202_10
// %bb.2:                               // %if.end3
	tbnz	w21, #31, .LBB202_11
.LBB202_3:                              // %if.end6
	ldr	w8, [x20, #72]
	cmp	w8, w21
	b.gt	.LBB202_5
.LBB202_4:                              // %if.then8
	adrp	x1, .L.str.6.204
	add	x1, x1, :lo12:.L.str.6.204
	mov	x0, x22
	bl	halide_print
	bl	abort
.LBB202_5:                              // %if.end9
	ldr	x8, [x20, #56]
	sxtw	x9, w21
	add	x10, x20, #8            // =8
.LBB202_6:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x11, [x10]
	sub	x11, x11, x19
	stlxr	w12, x11, [x10]
	cbnz	w12, .LBB202_6
// %bb.7:                               // %atomicrmw.end
	mov	w10, #72
	madd	x8, x9, x10, x8
	add	x8, x8, #8              // =8
.LBB202_8:                              // %atomicrmw.start2
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	x9, [x8]
	sub	x9, x9, x19
	stlxr	w10, x9, [x8]
	cbnz	w10, .LBB202_8
.LBB202_9:                              // %return
	ldp	x29, x30, [sp, #32]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]     // 16-byte Folded Reload
	ldp	x22, x21, [sp], #48     // 16-byte Folded Reload
	ret
.LBB202_10:                             // %if.then2
	adrp	x1, .L.str.4.202
	add	x1, x1, :lo12:.L.str.4.202
	mov	x0, x22
	bl	halide_print
	bl	abort
	tbz	w21, #31, .LBB202_3
.LBB202_11:                             // %if.then5
	adrp	x1, .L.str.5.203
	add	x1, x1, :lo12:.L.str.5.203
	mov	x0, x22
	bl	halide_print
	bl	abort
	ldr	w8, [x20, #72]
	cmp	w8, w21
	b.le	.LBB202_4
	b	.LBB202_5
.Lfunc_end202:
	.size	halide_profiler_memory_free, .Lfunc_end202-halide_profiler_memory_free
                                        // -- End function
	.section	.text.halide_profiler_report,"ax",@progbits
	.weak	halide_profiler_report  // -- Begin function halide_profiler_report
	.p2align	2
	.type	halide_profiler_report,@function
halide_profiler_report:                 // @halide_profiler_report
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	mov	x19, x0
	bl	halide_profiler_get_state
	mov	x20, x0
	bl	halide_mutex_lock
	mov	x0, x19
	mov	x1, x20
	bl	halide_profiler_report_unlocked
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x20
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_mutex_unlock
.Lfunc_end203:
	.size	halide_profiler_report, .Lfunc_end203-halide_profiler_report
                                        // -- End function
	.section	.text.halide_profiler_reset,"ax",@progbits
	.weak	halide_profiler_reset   // -- Begin function halide_profiler_reset
	.p2align	2
	.type	halide_profiler_reset,@function
halide_profiler_reset:                  // @halide_profiler_reset
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	add	x29, sp, #16            // =16
	bl	halide_profiler_get_state
	mov	x19, x0
	bl	halide_mutex_lock
	mov	x0, x19
	bl	halide_profiler_reset_unlocked
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x0, x19
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	b	halide_mutex_unlock
.Lfunc_end204:
	.size	halide_profiler_reset, .Lfunc_end204-halide_profiler_reset
                                        // -- End function
	.section	.text.halide_profiler_pipeline_end,"ax",@progbits
	.weak	halide_profiler_pipeline_end // -- Begin function halide_profiler_pipeline_end
	.p2align	2
	.type	halide_profiler_pipeline_end,@function
halide_profiler_pipeline_end:           // @halide_profiler_pipeline_end
// %bb.0:                               // %entry
	mov	w8, #-1
	str	w8, [x1, #16]
	ret
.Lfunc_end205:
	.size	halide_profiler_pipeline_end, .Lfunc_end205-halide_profiler_pipeline_end
                                        // -- End function
	.section	.text.halide_msan_annotate_memory_is_initialized,"ax",@progbits
	.weak	halide_msan_annotate_memory_is_initialized // -- Begin function halide_msan_annotate_memory_is_initialized
	.p2align	2
	.type	halide_msan_annotate_memory_is_initialized,@function
halide_msan_annotate_memory_is_initialized: // @halide_msan_annotate_memory_is_initialized
// %bb.0:                               // %entry
	mov	w0, wzr
	ret
.Lfunc_end206:
	.size	halide_msan_annotate_memory_is_initialized, .Lfunc_end206-halide_msan_annotate_memory_is_initialized
                                        // -- End function
	.section	.text.halide_msan_annotate_buffer_is_initialized,"ax",@progbits
	.weak	halide_msan_annotate_buffer_is_initialized // -- Begin function halide_msan_annotate_buffer_is_initialized
	.p2align	2
	.type	halide_msan_annotate_buffer_is_initialized,@function
halide_msan_annotate_buffer_is_initialized: // @halide_msan_annotate_buffer_is_initialized
// %bb.0:                               // %entry
	mov	w0, wzr
	ret
.Lfunc_end207:
	.size	halide_msan_annotate_buffer_is_initialized, .Lfunc_end207-halide_msan_annotate_buffer_is_initialized
                                        // -- End function
	.section	.text.halide_msan_annotate_buffer_is_initialized_as_destructor,"ax",@progbits
	.weak	halide_msan_annotate_buffer_is_initialized_as_destructor // -- Begin function halide_msan_annotate_buffer_is_initialized_as_destructor
	.p2align	2
	.type	halide_msan_annotate_buffer_is_initialized_as_destructor,@function
halide_msan_annotate_buffer_is_initialized_as_destructor: // @halide_msan_annotate_buffer_is_initialized_as_destructor
// %bb.0:                               // %entry
	ret
.Lfunc_end208:
	.size	halide_msan_annotate_buffer_is_initialized_as_destructor, .Lfunc_end208-halide_msan_annotate_buffer_is_initialized_as_destructor
                                        // -- End function
	.section	.text.halide_default_can_use_target_features,"ax",@progbits
	.weak	halide_default_can_use_target_features // -- Begin function halide_default_can_use_target_features
	.p2align	2
	.type	halide_default_can_use_target_features,@function
halide_default_can_use_target_features: // @halide_default_can_use_target_features
// %bb.0:                               // %entry
	sub	sp, sp, #80             // =80
	str	x21, [sp, #32]          // 8-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	mov	w20, w0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE]
	add	x29, sp, #64            // =64
	mov	x19, x1
	bl	halide_mutex_lock
	adrp	x21, :got:_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE]
	ldrb	w8, [x21]
	cbnz	w8, .LBB209_2
// %bb.1:                               // %if.then
	mov	x8, sp
	bl	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
	adrp	x0, :got:_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE]
	mov	x1, sp
	mov	w2, #32
	bl	memcpy
	mov	w8, #1
	strb	w8, [x21]
.LBB209_2:                              // %if.end
	adrp	x0, :got:_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE]
	bl	halide_mutex_unlock
	cmp	w20, #2                 // =2
	b.eq	.LBB209_4
// %bb.3:                               // %if.then1
	adrp	x1, .L.str.209
	add	x1, x1, :lo12:.L.str.209
	mov	x0, xzr
	bl	halide_error
.LBB209_4:                              // %if.end2
	adrp	x8, :got:_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	ldr	x9, [x19]
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE]
	ldr	x10, [x8]
	ands	x9, x10, x9
	b.eq	.LBB209_6
// %bb.5:                               // %if.then7
	ldr	x10, [x8, #16]
	bics	xzr, x9, x10
	b.ne	.LBB209_9
.LBB209_6:                              // %for.inc
	ldr	x9, [x19, #8]
	ldr	x10, [x8, #8]
	ands	x9, x10, x9
	b.eq	.LBB209_8
// %bb.7:                               // %if.then7.1
	ldr	x8, [x8, #24]
	bics	xzr, x9, x8
	b.ne	.LBB209_9
.LBB209_8:                              // %for.inc.1
	mov	w0, #1
	b	.LBB209_10
.LBB209_9:
	mov	w0, wzr
.LBB209_10:                             // %cleanup15
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldr	x21, [sp, #32]          // 8-byte Folded Reload
	add	sp, sp, #80             // =80
	ret
.Lfunc_end209:
	.size	halide_default_can_use_target_features, .Lfunc_end209-halide_default_can_use_target_features
                                        // -- End function
	.section	.text.halide_set_custom_can_use_target_features,"ax",@progbits
	.weak	halide_set_custom_can_use_target_features // -- Begin function halide_set_custom_can_use_target_features
	.p2align	2
	.type	halide_set_custom_can_use_target_features,@function
halide_set_custom_can_use_target_features: // @halide_set_custom_can_use_target_features
// %bb.0:                               // %entry
	adrp	x9, :got:_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE]
	ldr	x8, [x9]
	str	x0, [x9]
	mov	x0, x8
	ret
.Lfunc_end210:
	.size	halide_set_custom_can_use_target_features, .Lfunc_end210-halide_set_custom_can_use_target_features
                                        // -- End function
	.section	.text.halide_can_use_target_features,"ax",@progbits
	.weak	halide_can_use_target_features // -- Begin function halide_can_use_target_features
	.p2align	2
	.type	halide_can_use_target_features,@function
halide_can_use_target_features:         // @halide_can_use_target_features
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE]
	ldr	x2, [x8]
	br	x2
.Lfunc_end211:
	.size	halide_can_use_target_features, .Lfunc_end211-halide_can_use_target_features
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv // -- Begin function _ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv,@function
_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv: // @_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
// %bb.0:                               // %entry
	movi	v0.2d, #0000000000000000
	stp	q0, q0, [x8]
	ret
.Lfunc_end212:
	.size	_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv, .Lfunc_end212-_ZN6Halide7Runtime8Internal23halide_get_cpu_featuresEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv // -- Begin function _ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv,@function
_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv: // @_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv
// %bb.0:                               // %entry
	ret
.Lfunc_end213:
	.size	_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv, .Lfunc_end213-_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv // -- Begin function _ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv,@function
_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv: // @_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv
// %bb.0:                               // %entry
	ret
.Lfunc_end214:
	.size	_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv, .Lfunc_end214-_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv
                                        // -- End function
	.section	.text.halide_opencl_device_malloc,"ax",@progbits
	.weak	halide_opencl_device_malloc // -- Begin function halide_opencl_device_malloc
	.p2align	2
	.type	halide_opencl_device_malloc,@function
halide_opencl_device_malloc:            // @halide_opencl_device_malloc
// %bb.0:                               // %entry
	sub	sp, sp, #112            // =112
	stp	x24, x23, [sp, #48]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #64]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #80]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #96]     // 16-byte Folded Spill
	str	x0, [sp, #16]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE]
	add	x8, sp, #16             // =16
	mov	x20, x1
	mov	x19, x0
	ldr	x9, [x9]
	add	x21, x8, #8             // =8
	add	x22, x8, #16            // =16
	add	x29, sp, #96            // =96
	stp	xzr, xzr, [sp, #24]
	str	wzr, [sp, #40]
	cbnz	x9, .LBB215_2
// %bb.1:                               // %if.then.i110
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv
.LBB215_2:                              // %if.end.i112
	mov	w3, #1
	mov	x0, x19
	mov	x1, x21
	mov	x2, x22
	bl	halide_acquire_cl_context
	ldr	x8, [sp, #24]
	str	w0, [sp, #40]
	cbz	x8, .LBB215_8
// %bb.3:                               // %if.end.i112
	ldr	x8, [sp, #32]
	mov	w21, w0
	cbz	x8, .LBB215_8
// %bb.4:                               // %_ZN6Halide7Runtime8Internal6OpenCL9ClContextC2EPv.exit
	cbnz	w21, .LBB215_41
.LBB215_5:                              // %if.end
	ldrsw	x8, [x20, #36]
	cmp	w8, #0                  // =0
	b.le	.LBB215_9
// %bb.6:                               // %for.body.lr.ph.i.i
	ldr	x9, [x20, #40]
	cmp	w8, #3                  // =3
	b.hs	.LBB215_10
// %bb.7:
	mov	x11, xzr
	mov	x10, xzr
	b	.LBB215_17
.LBB215_8:                              // %if.then10.i
	adrp	x1, .L.str.240
	add	x1, x1, :lo12:.L.str.240
	mov	x0, x19
	bl	halide_print
	bl	abort
	ldr	w21, [sp, #40]
	cbnz	w21, .LBB215_41
	b	.LBB215_5
.LBB215_9:                              // %_ZNK15halide_buffer_t3endEv.exit.thread.i
	ldrb	w11, [x20, #33]
	mov	x13, xzr
	mov	w8, #1
	b	.LBB215_35
.LBB215_10:                             // %vector.ph
	and	x11, x8, #0xfffffffffffffffe
	mov	x10, xzr
	mov	x12, xzr
	add	x13, x9, #24            // =24
	mov	x14, x11
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.ge	.LBB215_13
	b	.LBB215_14
.LBB215_11:                             // %pred.load.continue11
                                        //   in Loop: Header=BB215_14 Depth=1
	sub	w17, w17, #1            // =1
	sub	w18, w18, #1            // =1
	cmp	w16, #0                 // =0
	mul	w16, w17, w16
	mul	w17, w18, w15
	csel	w16, w16, wzr, gt
	cmp	w15, #0                 // =0
	csel	w15, w17, wzr, gt
	add	x10, x10, w16, sxtw
	subs	x14, x14, #2            // =2
	add	x12, x12, w15, sxtw
	add	x13, x13, #32           // =32
	b.eq	.LBB215_16
// %bb.12:                              // %vector.body
                                        //   in Loop: Header=BB215_14 Depth=1
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.lt	.LBB215_14
.LBB215_13:                             // %pred.load.if
	ldur	w17, [x13, #-20]
.LBB215_14:                             // %pred.load.continue
                                        // =>This Inner Loop Header: Depth=1
	cmp	w15, #1                 // =1
                                        // implicit-def: $w18
	b.lt	.LBB215_11
// %bb.15:                              // %pred.load.if10
                                        //   in Loop: Header=BB215_14 Depth=1
	ldur	w18, [x13, #-4]
	b	.LBB215_11
.LBB215_16:                             // %middle.block
	cmp	x11, x8
	add	x10, x12, x10
	b.eq	.LBB215_21
.LBB215_17:                             // %for.body.i.i.preheader
	sub	x12, x8, x11
	add	x11, x9, x11, lsl #4
	add	x11, x11, #8            // =8
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.ge	.LBB215_20
.LBB215_18:                             // %for.inc.i.i
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.eq	.LBB215_21
.LBB215_19:                             // %for.body.i.i
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.lt	.LBB215_18
.LBB215_20:                             // %if.then.i.i
	ldursw	x14, [x11, #-4]
	sub	x14, x14, #1            // =1
	madd	x10, x14, x13, x10
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.ne	.LBB215_19
.LBB215_21:                             // %for.body.lr.ph.i5.i
	ldrb	w11, [x20, #33]
	cmp	w8, #3                  // =3
	b.hs	.LBB215_23
// %bb.22:
	mov	x12, xzr
	mov	x13, xzr
	b	.LBB215_30
.LBB215_23:                             // %vector.ph17
	and	x12, x8, #0xfffffffffffffffe
	mov	x13, xzr
	mov	x14, xzr
	add	x15, x9, #24            // =24
	mov	x16, x12
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbz	w17, #31, .LBB215_26
	b	.LBB215_27
.LBB215_24:                             // %pred.load.continue31
	sub	w0, w0, #1              // =1
	sub	w1, w1, #1              // =1
	mul	w0, w0, w17
	mul	w1, w1, w18
	and	w17, w0, w17, asr #31
	and	w18, w1, w18, asr #31
	subs	x16, x16, #2            // =2
	add	x13, x13, w17, sxtw
	add	x14, x14, w18, sxtw
	add	x15, x15, #32           // =32
	b.eq	.LBB215_29
// %bb.25:                              // %vector.body13
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w0
	tbnz	w17, #31, .LBB215_27
.LBB215_26:                             // %pred.load.continue29
                                        // implicit-def: $w1
	tbz	w18, #31, .LBB215_24
	b	.LBB215_28
.LBB215_27:                             // %pred.load.if28
	ldur	w0, [x15, #-20]
                                        // implicit-def: $w1
	tbz	w18, #31, .LBB215_24
.LBB215_28:                             // %pred.load.if30
	ldur	w1, [x15, #-4]
	b	.LBB215_24
.LBB215_29:                             // %middle.block14
	cmp	x12, x8
	add	x13, x14, x13
	b.eq	.LBB215_34
.LBB215_30:                             // %for.body.i16.i.preheader
	add	x9, x9, x12, lsl #4
	sub	x8, x8, x12
	add	x9, x9, #8              // =8
	ldrsw	x12, [x9]
	tbnz	w12, #31, .LBB215_33
.LBB215_31:                             // %for.inc.i26.i
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	b.eq	.LBB215_34
.LBB215_32:                             // %for.body.i16.i
	ldrsw	x12, [x9]
	tbz	w12, #31, .LBB215_31
.LBB215_33:                             // %if.then.i22.i
	ldursw	x14, [x9, #-4]
	sub	x14, x14, #1            // =1
	madd	x13, x14, x12, x13
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	b.ne	.LBB215_32
.LBB215_34:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
	add	x8, x10, #1             // =1
.LBB215_35:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
	add	x9, x11, #7             // =7
	lsr	x9, x9, #3
	sub	x8, x8, x13
	mul	x22, x8, x9
	cbz	x22, .LBB215_42
// %bb.36:                              // %if.end8
	ldr	x8, [x20]
	cbz	x8, .LBB215_43
.LBB215_37:                             // %if.then9
	mov	x0, x19
	mov	x1, x20
	mov	x2, x22
	bl	_ZN6Halide7Runtime8Internal6OpenCL23validate_device_pointerEPvP15halide_buffer_tm
	tbnz	w0, #0, .LBB215_40
// %bb.38:                              // %if.then11
	adrp	x1, .L.str.124
	add	x1, x1, :lo12:.L.str.124
.LBB215_39:                             // %cleanup
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB215_40:                             // %cleanup
	mov	w21, wzr
.LBB215_41:                             // %cleanup63
	ldr	x0, [sp, #16]
	bl	halide_release_cl_context
	mov	w0, w21
	ldp	x29, x30, [sp, #96]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #112            // =112
	ret
.LBB215_42:                             // %if.then7
	adrp	x1, .L.str.123
	add	x1, x1, :lo12:.L.str.123
	mov	x0, x19
	bl	halide_print
	bl	abort
	ldr	x8, [x20]
	cbnz	x8, .LBB215_37
.LBB215_43:                             // %for.cond.preheader
	ldr	w8, [x20, #36]
	cmp	w8, #1                  // =1
	b.lt	.LBB215_48
// %bb.44:                              // %for.body.lr.ph
	adrp	x21, .L.str.125
	mov	x23, xzr
	mov	w24, #8
	add	x21, x21, :lo12:.L.str.125
	ldr	x9, [x20, #40]
	ldr	w9, [x9, x24]
	tbnz	w9, #31, .LBB215_47
.LBB215_45:                             // %for.inc
	add	x23, x23, #1            // =1
	cmp	x23, w8, sxtw
	add	x24, x24, #16           // =16
	b.ge	.LBB215_48
.LBB215_46:                             // %for.body
	ldr	x9, [x20, #40]
	ldr	w9, [x9, x24]
	tbz	w9, #31, .LBB215_45
.LBB215_47:                             // %if.then16
	mov	x0, x19
	mov	x1, x21
	bl	halide_print
	bl	abort
	ldr	w8, [x20, #36]
	add	x23, x23, #1            // =1
	cmp	x23, w8, sxtw
	add	x24, x24, #16           // =16
	b.lt	.LBB215_46
.LBB215_48:                             // %for.cond.cleanup
	mov	w0, #16
	bl	malloc
	cbz	x0, .LBB215_53
// %bb.49:                              // %if.end25
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL14clCreateBufferE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL14clCreateBufferE]
	mov	x21, x0
	ldr	x0, [sp, #24]
	add	x4, sp, #12             // =12
	ldr	x8, [x8]
	mov	w1, #1
	mov	x2, x22
	mov	x3, xzr
	blr	x8
	ldr	w8, [sp, #12]
	cbz	x0, .LBB215_54
// %bb.50:                              // %if.end25
	cbnz	w8, .LBB215_54
// %bb.51:                              // %if.else
	stp	xzr, x0, [x21]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE]
	stp	x21, x8, [x20]
	ldr	x8, [x8, #120]
	ldr	x8, [x8]
	blr	x8
	mov	x0, x19
	mov	x1, x20
	mov	x2, x22
	bl	_ZN6Halide7Runtime8Internal6OpenCL23validate_device_pointerEPvP15halide_buffer_tm
	tbnz	w0, #0, .LBB215_40
// %bb.52:                              // %if.then58
	adrp	x1, .L.str.132
	add	x1, x1, :lo12:.L.str.132
	b	.LBB215_39
.LBB215_53:
	mov	w21, #-6
	b	.LBB215_41
.LBB215_54:                             // %if.then33
	mov	w0, w8
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB215_58
// %bb.55:                              // %if.then.i131
	add	x22, x20, #1023         // =1023
	adrp	x2, .L.str.128
	add	x2, x2, :lo12:.L.str.128
	mov	x0, x20
	mov	x1, x22
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	mov	x23, x0
	ldr	w0, [sp, #12]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB215_59
.LBB215_56:                             // %if.else.i117
	mov	x2, x0
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x20, .LBB215_60
.LBB215_57:                             // %if.else.i
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB215_61
.LBB215_58:                             // %if.then33.split
	adrp	x2, .L.str.128
	add	x2, x2, :lo12:.L.str.128
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, x0
	mov	x22, xzr
	ldr	w0, [sp, #12]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB215_56
.LBB215_59:                             // %if.then.i116
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	cbnz	x20, .LBB215_57
.LBB215_60:                             // %if.then.i
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB215_61:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit
	bl	halide_free
	mov	x0, x21
	bl	free
	ldr	w21, [sp, #12]
	b	.LBB215_41
.Lfunc_end215:
	.size	halide_opencl_device_malloc, .Lfunc_end215-halide_opencl_device_malloc
                                        // -- End function
	.section	.text.halide_opencl_device_free,"ax",@progbits
	.weak	halide_opencl_device_free // -- Begin function halide_opencl_device_free
	.p2align	2
	.type	halide_opencl_device_free,@function
halide_opencl_device_free:              // @halide_opencl_device_free
// %bb.0:                               // %entry
	sub	sp, sp, #96             // =96
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	ldr	x8, [x1]
	str	x23, [sp, #32]          // 8-byte Folded Spill
	add	x29, sp, #80            // =80
	cbz	x8, .LBB216_8
// %bb.1:                               // %if.end
	ldp	x9, x20, [x8]
	mov	x19, x1
	mov	x21, x0
	cbz	x9, .LBB216_3
// %bb.2:                               // %if.then4
	adrp	x1, .L.str.90
	add	x1, x1, :lo12:.L.str.90
	mov	x0, x21
	bl	halide_print
	bl	abort
.LBB216_3:                              // %if.end5
	str	x21, [sp]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE]
	mov	x8, sp
	add	x22, x8, #8             // =8
	add	x23, x8, #16            // =16
	ldr	x9, [x9]
	stp	xzr, xzr, [sp, #8]
	str	wzr, [sp, #24]
	cbnz	x9, .LBB216_5
// %bb.4:                               // %if.then.i
	mov	x0, x21
	bl	_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv
.LBB216_5:                              // %if.end.i
	mov	w3, #1
	mov	x0, x21
	mov	x1, x22
	mov	x2, x23
	bl	halide_acquire_cl_context
	ldr	x8, [sp, #8]
	str	w0, [sp, #24]
	cbz	x8, .LBB216_9
// %bb.6:                               // %if.end.i
	ldr	x8, [sp, #16]
	mov	w22, w0
	cbz	x8, .LBB216_9
// %bb.7:                               // %_ZN6Halide7Runtime8Internal6OpenCL9ClContextC2EPv.exit
	cbnz	w22, .LBB216_13
	b	.LBB216_10
.LBB216_8:
	mov	w22, wzr
	b	.LBB216_14
.LBB216_9:                              // %if.then10.i
	adrp	x1, .L.str.240
	add	x1, x1, :lo12:.L.str.240
	mov	x0, x21
	bl	halide_print
	bl	abort
	ldr	w22, [sp, #24]
	cbnz	w22, .LBB216_13
.LBB216_10:                             // %if.end15
	mov	x0, x21
	mov	x1, x19
	mov	x2, xzr
	bl	_ZN6Halide7Runtime8Internal6OpenCL23validate_device_pointerEPvP15halide_buffer_tm
	tbnz	w0, #0, .LBB216_12
// %bb.11:                              // %if.then16
	adrp	x1, .L.str.94
	add	x1, x1, :lo12:.L.str.94
	mov	x0, x21
	bl	halide_print
	bl	abort
.LBB216_12:                             // %if.end17
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE]
	mov	x0, x20
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x19]
	mov	w22, w0
	mov	x0, x8
	bl	free
	ldr	x8, [x19, #8]
	str	xzr, [x19]
	ldr	x8, [x8, #120]
	ldr	x8, [x8, #8]
	blr	x8
	str	xzr, [x19, #8]
.LBB216_13:                             // %cleanup29
	ldr	x0, [sp]
	bl	halide_release_cl_context
.LBB216_14:                             // %return
	mov	w0, w22
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #32]          // 8-byte Folded Reload
	add	sp, sp, #96             // =96
	ret
.Lfunc_end216:
	.size	halide_opencl_device_free, .Lfunc_end216-halide_opencl_device_free
                                        // -- End function
	.section	.text.halide_opencl_device_sync,"ax",@progbits
	.weak	halide_opencl_device_sync // -- Begin function halide_opencl_device_sync
	.p2align	2
	.type	halide_opencl_device_sync,@function
halide_opencl_device_sync:              // @halide_opencl_device_sync
// %bb.0:                               // %entry
	sub	sp, sp, #96             // =96
	str	x23, [sp, #32]          // 8-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	str	x0, [sp]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE]
	mov	x8, sp
	mov	x19, x0
	add	x20, x8, #8             // =8
	ldr	x9, [x9]
	add	x21, x8, #16            // =16
	add	x29, sp, #80            // =80
	stp	xzr, xzr, [sp, #8]
	str	wzr, [sp, #24]
	cbnz	x9, .LBB217_2
// %bb.1:                               // %if.then.i20
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv
.LBB217_2:                              // %if.end.i22
	mov	w3, #1
	mov	x0, x19
	mov	x1, x20
	mov	x2, x21
	bl	halide_acquire_cl_context
	ldr	x8, [sp, #8]
	str	w0, [sp, #24]
	cbz	x8, .LBB217_4
// %bb.3:                               // %if.end.i22
	ldr	x8, [sp, #16]
	cbnz	x8, .LBB217_5
.LBB217_4:                              // %if.then10.i
	adrp	x1, .L.str.240
	add	x1, x1, :lo12:.L.str.240
	mov	x0, x19
	bl	halide_print
	bl	abort
	ldr	w0, [sp, #24]
.LBB217_5:                              // %_ZN6Halide7Runtime8Internal6OpenCL9ClContextC2EPv.exit
	cbz	w0, .LBB217_7
// %bb.6:                               // %if.then
	adrp	x1, .L.str.112
	add	x1, x1, :lo12:.L.str.112
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB217_7:                              // %if.end
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL8clFinishE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL8clFinishE]
	ldr	x0, [sp, #16]
	ldr	x8, [x8]
	blr	x8
	mov	w20, w0
	cbz	w0, .LBB217_16
// %bb.8:                               // %if.then4
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB217_12
// %bb.9:                               // %if.then.i27
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.113
	add	x2, x2, :lo12:.L.str.113
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	mov	x23, x0
	mov	w0, w20
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB217_13
.LBB217_10:                             // %if.else.i40
	mov	x2, x0
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB217_14
.LBB217_11:                             // %if.else.i
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB217_15
.LBB217_12:                             // %if.then4.split
	adrp	x2, .L.str.113
	add	x2, x2, :lo12:.L.str.113
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, x0
	mov	x22, xzr
	mov	w0, w20
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB217_10
.LBB217_13:                             // %if.then.i38
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	cbnz	x21, .LBB217_11
.LBB217_14:                             // %if.then.i
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB217_15:                             // %cleanup
	bl	halide_free
.LBB217_16:                             // %cleanup
	ldr	x0, [sp]
	bl	halide_release_cl_context
	mov	w0, w20
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #32]          // 8-byte Folded Reload
	add	sp, sp, #96             // =96
	ret
.Lfunc_end217:
	.size	halide_opencl_device_sync, .Lfunc_end217-halide_opencl_device_sync
                                        // -- End function
	.section	.text.halide_opencl_device_release,"ax",@progbits
	.weak	halide_opencl_device_release // -- Begin function halide_opencl_device_release
	.p2align	2
	.type	halide_opencl_device_release,@function
halide_opencl_device_release:           // @halide_opencl_device_release
// %bb.0:                               // %entry
	sub	sp, sp, #64             // =64
	add	x1, sp, #8              // =8
	mov	x2, sp
	mov	w3, wzr
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	mov	x19, x0
	bl	halide_acquire_cl_context
	cbnz	w0, .LBB218_18
// %bb.1:                               // %if.end
	ldr	x8, [sp, #8]
	cbz	x8, .LBB218_17
// %bb.2:                               // %if.then3
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL8clFinishE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL8clFinishE]
	ldr	x0, [sp]
	ldr	x8, [x8]
	blr	x8
	cbz	w0, .LBB218_4
// %bb.3:                               // %if.then6
	adrp	x1, .L.str.115
	add	x1, x1, :lo12:.L.str.115
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB218_4:                              // %if.end7
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL10state_listE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL10state_listE]
	ldr	x21, [x8]
	cbz	x21, .LBB218_11
// %bb.5:                               // %while.body.preheader
	adrp	x22, :got:_ZN6Halide7Runtime8Internal6OpenCL16clReleaseProgramE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL16clReleaseProgramE]
	adrp	x20, .L.str.117
	add	x20, x20, :lo12:.L.str.117
	ldr	x0, [x21]
	cbnz	x0, .LBB218_9
	b	.LBB218_7
.LBB218_6:                              // %if.end20
	str	xzr, [x21]
.LBB218_7:                              // %if.end22
                                        // =>This Inner Loop Header: Depth=1
	ldr	x21, [x21, #8]
	cbz	x21, .LBB218_11
// %bb.8:                               // %while.body
                                        //   in Loop: Header=BB218_7 Depth=1
	ldr	x0, [x21]
	cbz	x0, .LBB218_7
.LBB218_9:                              // %if.then10
	ldr	x8, [x22]
	blr	x8
	cbz	w0, .LBB218_6
// %bb.10:                              // %if.then19
	mov	x0, x19
	mov	x1, x20
	bl	halide_print
	bl	abort
	b	.LBB218_6
.LBB218_11:                             // %while.end
	adrp	x20, :got:_ZN6Halide7Runtime8Internal6OpenCL7contextE
	ldr	x8, [sp, #8]
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL7contextE]
	ldr	x9, [x20]
	cmp	x8, x9
	b.ne	.LBB218_17
// %bb.12:                              // %if.then24
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL21clReleaseCommandQueueE
	adrp	x21, :got:_ZN6Halide7Runtime8Internal6OpenCL13command_queueE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL21clReleaseCommandQueueE]
	ldr	x21, [x21, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL13command_queueE]
	ldr	x8, [x8]
	ldr	x0, [x21]
	blr	x8
	cbz	w0, .LBB218_14
// %bb.13:                              // %if.then31
	adrp	x1, .L.str.119
	add	x1, x1, :lo12:.L.str.119
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB218_14:                             // %if.end32
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL16clReleaseContextE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL16clReleaseContextE]
	ldr	x0, [x20]
	str	xzr, [x21]
	ldr	x8, [x8]
	blr	x8
	cbz	w0, .LBB218_16
// %bb.15:                              // %if.then39
	adrp	x1, .L.str.121
	add	x1, x1, :lo12:.L.str.121
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB218_16:                             // %if.end40
	str	xzr, [x20]
.LBB218_17:                             // %if.end42
	mov	x0, x19
	bl	halide_release_cl_context
	mov	w0, wzr
.LBB218_18:                             // %cleanup
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	add	sp, sp, #64             // =64
	ret
.Lfunc_end218:
	.size	halide_opencl_device_release, .Lfunc_end218-halide_opencl_device_release
                                        // -- End function
	.section	.text.halide_opencl_copy_to_host,"ax",@progbits
	.weak	halide_opencl_copy_to_host // -- Begin function halide_opencl_copy_to_host
	.p2align	2
	.type	halide_opencl_copy_to_host,@function
halide_opencl_copy_to_host:             // @halide_opencl_copy_to_host
// %bb.0:                               // %entry
	mov	x2, xzr
	mov	x3, x1
	b	halide_opencl_buffer_copy
.Lfunc_end219:
	.size	halide_opencl_copy_to_host, .Lfunc_end219-halide_opencl_copy_to_host
                                        // -- End function
	.section	.text.halide_opencl_copy_to_device,"ax",@progbits
	.weak	halide_opencl_copy_to_device // -- Begin function halide_opencl_copy_to_device
	.p2align	2
	.type	halide_opencl_copy_to_device,@function
halide_opencl_copy_to_device:           // @halide_opencl_copy_to_device
// %bb.0:                               // %entry
	adrp	x2, :got:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE
	ldr	x2, [x2, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE]
	mov	x3, x1
	b	halide_opencl_buffer_copy
.Lfunc_end220:
	.size	halide_opencl_copy_to_device, .Lfunc_end220-halide_opencl_copy_to_device
                                        // -- End function
	.section	.text.halide_opencl_device_and_host_malloc,"ax",@progbits
	.weak	halide_opencl_device_and_host_malloc // -- Begin function halide_opencl_device_and_host_malloc
	.p2align	2
	.type	halide_opencl_device_and_host_malloc,@function
halide_opencl_device_and_host_malloc:   // @halide_opencl_device_and_host_malloc
// %bb.0:                               // %entry
	adrp	x2, :got:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE
	ldr	x2, [x2, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE]
	b	halide_default_device_and_host_malloc
.Lfunc_end221:
	.size	halide_opencl_device_and_host_malloc, .Lfunc_end221-halide_opencl_device_and_host_malloc
                                        // -- End function
	.section	.text.halide_opencl_device_and_host_free,"ax",@progbits
	.weak	halide_opencl_device_and_host_free // -- Begin function halide_opencl_device_and_host_free
	.p2align	2
	.type	halide_opencl_device_and_host_free,@function
halide_opencl_device_and_host_free:     // @halide_opencl_device_and_host_free
// %bb.0:                               // %entry
	adrp	x2, :got:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE
	ldr	x2, [x2, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE]
	b	halide_default_device_and_host_free
.Lfunc_end222:
	.size	halide_opencl_device_and_host_free, .Lfunc_end222-halide_opencl_device_and_host_free
                                        // -- End function
	.section	.text.halide_opencl_buffer_copy,"ax",@progbits
	.weak	halide_opencl_buffer_copy // -- Begin function halide_opencl_buffer_copy
	.p2align	2
	.type	halide_opencl_buffer_copy,@function
halide_opencl_buffer_copy:              // @halide_opencl_buffer_copy
// %bb.0:                               // %entry
	str	x28, [sp, #-80]!        // 8-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	sub	sp, sp, #448            // =448
	adrp	x22, :got:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE]
	mov	x21, x3
	mov	x20, x2
	mov	x23, x1
	mov	x19, x0
	cbz	x2, .LBB223_3
// %bb.1:                               // %entry
	cmp	x20, x22
	b.eq	.LBB223_3
// %bb.2:                               // %if.then
	adrp	x1, .L.str.143
	add	x1, x1, :lo12:.L.str.143
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB223_3:                              // %if.end
	ldr	x8, [x23, #24]
	tbnz	w8, #1, .LBB223_6
// %bb.4:                               // %lor.lhs.false2
	ldr	x9, [x23, #16]
	cbz	x9, .LBB223_6
// %bb.5:                               // %if.end9
	ldr	x9, [x23, #8]
	cmp	x9, x22
	b.ne	.LBB223_12
	b	.LBB223_9
.LBB223_6:                              // %land.lhs.true
	ldr	x9, [x23, #8]
	cmp	x9, x22
	b.eq	.LBB223_9
// %bb.7:                               // %if.then5
	cmp	x20, x22
	b.eq	.LBB223_15
// %bb.8:                               // %if.then7
	adrp	x1, .L.str.144
	add	x1, x1, :lo12:.L.str.144
	mov	x0, x19
	bl	halide_print
	bl	abort
	mov	w23, #-42
	b	.LBB223_23
.LBB223_9:                              // %lor.lhs.false12
	ldr	x9, [x23]
	cbz	x9, .LBB223_12
// %bb.10:                              // %lor.rhs
	tbz	w8, #0, .LBB223_16
// %bb.11:                              // %lor.end
	ldr	x8, [x23, #16]
	cbz	x8, .LBB223_16
.LBB223_12:
	mov	w22, #1
	cbz	x20, .LBB223_17
.LBB223_13:                             // %lor.lhs.false25
	ldr	x8, [x21]
	cbnz	x8, .LBB223_17
// %bb.14:                              // %if.then28
	adrp	x1, .L.str.146
	add	x1, x1, :lo12:.L.str.146
	mov	x0, x19
	bl	halide_print
	bl	abort
	b	.LBB223_17
.LBB223_15:
	mov	w23, #-42
	b	.LBB223_23
.LBB223_16:                             // %lor.lhs.false19
	mov	w22, wzr
	cbnz	x20, .LBB223_13
.LBB223_17:                             // %if.end29
	cmp	x20, #0                 // =0
	cset	w3, eq
	add	x8, sp, #32             // =32
	mov	x0, x23
	mov	w1, w22
	mov	x2, x21
	bl	_ZN6Halide7Runtime8Internal16make_buffer_copyEPK15halide_buffer_tbS4_b
	str	x19, [sp]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE]
	mov	x8, sp
	add	x23, x8, #8             // =8
	add	x24, x8, #16            // =16
	ldr	x9, [x9]
	stp	xzr, xzr, [sp, #8]
	str	wzr, [sp, #24]
	cbnz	x9, .LBB223_19
// %bb.18:                              // %if.then.i
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv
.LBB223_19:                             // %if.end.i
	mov	w3, #1
	mov	x0, x19
	mov	x1, x23
	mov	x2, x24
	bl	halide_acquire_cl_context
	ldr	x8, [sp, #8]
	str	w0, [sp, #24]
	cbz	x8, .LBB223_24
// %bb.20:                              // %if.end.i
	ldr	x8, [sp, #16]
	mov	w23, w0
	cbz	x8, .LBB223_24
// %bb.21:                              // %_ZN6Halide7Runtime8Internal6OpenCL9ClContextC2EPv.exit
	cbz	w23, .LBB223_25
.LBB223_22:                             // %cleanup
	ldr	x0, [sp]
	bl	halide_release_cl_context
.LBB223_23:                             // %return
	mov	w0, w23
	add	sp, sp, #448            // =448
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldr	x28, [sp], #80          // 8-byte Folded Reload
	ret
.LBB223_24:                             // %if.then10.i
	adrp	x1, .L.str.240
	add	x1, x1, :lo12:.L.str.240
	mov	x0, x19
	bl	halide_print
	bl	abort
	ldr	w23, [sp, #24]
	cbnz	w23, .LBB223_22
.LBB223_25:                             // %if.end35
	ldr	x3, [sp, #48]
	ldr	w5, [x21, #36]
	cmp	x20, #0                 // =0
	cset	w7, eq
	mov	x1, sp
	add	x2, sp, #32             // =32
	mov	x0, x19
	mov	x4, xzr
	mov	w6, w22
	bl	opencl_do_multidimensional_copy
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL8clFinishE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL8clFinishE]
	mov	w23, w0
	ldr	x9, [x8]
	ldr	x8, [sp, #16]
	mov	x0, x8
	blr	x9
	b	.LBB223_22
.Lfunc_end223:
	.size	halide_opencl_buffer_copy, .Lfunc_end223-halide_opencl_buffer_copy
                                        // -- End function
	.section	.text.halide_opencl_device_crop,"ax",@progbits
	.weak	halide_opencl_device_crop // -- Begin function halide_opencl_device_crop
	.p2align	2
	.type	halide_opencl_device_crop,@function
halide_opencl_device_crop:              // @halide_opencl_device_crop
// %bb.0:                               // %entry
	ldrsw	x8, [x1, #36]
	mov	x3, x2
	cmp	w8, #1                  // =1
	b.lt	.LBB224_3
// %bb.1:                               // %for.body.lr.ph.i
	ldr	x9, [x3, #40]
	ldr	x10, [x1, #40]
	cmp	w8, #5                  // =5
	b.hs	.LBB224_4
// %bb.2:
	mov	x11, xzr
	mov	x12, xzr
	b	.LBB224_7
.LBB224_3:
	mov	x12, xzr
	b	.LBB224_9
.LBB224_4:                              // %vector.ph
	and	x11, x8, #0x3
	tst	x8, #0x3
	mov	w14, #4
	csel	x11, x14, x11, eq
	sub	x11, x8, x11
	add	x12, x10, #32           // =32
	add	x13, x9, #32            // =32
	movi	v0.2d, #0000000000000000
	mov	x14, x11
	movi	v1.2d, #0000000000000000
.LBB224_5:                              // %vector.body
                                        // =>This Inner Loop Header: Depth=1
	ldp	q2, q3, [x13, #-32]
	ldp	q4, q5, [x13], #64
	ldp	q6, q7, [x12, #-32]
	ldp	q16, q17, [x12], #64
	subs	x14, x14, #4            // =4
	sub	v3.4s, v3.4s, v7.4s
	sub	v2.4s, v2.4s, v6.4s
	sub	v5.4s, v5.4s, v17.4s
	sub	v4.4s, v4.4s, v16.4s
	zip2	v18.4s, v6.4s, v7.4s
	zip2	v19.4s, v16.4s, v17.4s
	zip1	v2.4s, v2.4s, v3.4s
	zip1	v3.4s, v4.4s, v5.4s
	mul	v2.2s, v2.2s, v18.2s
	mul	v3.2s, v3.2s, v19.2s
	saddw	v0.2d, v0.2d, v2.2s
	saddw	v1.2d, v1.2d, v3.2s
	b.ne	.LBB224_5
// %bb.6:                               // %middle.block
	add	v0.2d, v1.2d, v0.2d
	addp	d0, v0.2d
	fmov	x12, d0
.LBB224_7:                              // %for.body.i.preheader
	sub	x8, x8, x11
	lsl	x11, x11, #4
	add	x10, x10, x11
	add	x10, x10, #8            // =8
	add	x9, x9, x11
.LBB224_8:                              // %for.body.i
                                        // =>This Inner Loop Header: Depth=1
	ldrsw	x11, [x9], #16
	ldursw	x13, [x10, #-8]
	ldrsw	x14, [x10]
	subs	x8, x8, #1              // =1
	add	x10, x10, #16           // =16
	sub	x11, x11, x13
	madd	x12, x11, x14, x12
	b.ne	.LBB224_8
.LBB224_9:                              // %_ZN6Halide7Runtime8Internal28calc_device_crop_byte_offsetEPK15halide_buffer_tPS2_.exit
	ldrb	w8, [x1, #33]
	add	x8, x8, #7              // =7
	lsr	x8, x8, #3
	mul	x2, x8, x12
	b	opencl_device_crop_from_offset
.Lfunc_end224:
	.size	halide_opencl_device_crop, .Lfunc_end224-halide_opencl_device_crop
                                        // -- End function
	.section	.text.halide_opencl_device_slice,"ax",@progbits
	.weak	halide_opencl_device_slice // -- Begin function halide_opencl_device_slice
	.p2align	2
	.type	halide_opencl_device_slice,@function
halide_opencl_device_slice:             // @halide_opencl_device_slice
// %bb.0:                               // %entry
	ldr	x8, [x1, #40]
	ldrb	w10, [x1, #33]
                                        // kill: def $w3 killed $w3 def $x3
	sxtw	x11, w3
	mov	x3, x4
	add	x8, x8, w2, sxtw #4
	ldrsw	x9, [x8]
	ldrsw	x8, [x8, #8]
	add	x10, x10, #7            // =7
	sub	x9, x11, x9
	mul	x8, x9, x8
	lsr	x9, x10, #3
	mul	x2, x9, x8
	b	opencl_device_crop_from_offset
.Lfunc_end225:
	.size	halide_opencl_device_slice, .Lfunc_end225-halide_opencl_device_slice
                                        // -- End function
	.section	.text.halide_opencl_device_release_crop,"ax",@progbits
	.weak	halide_opencl_device_release_crop // -- Begin function halide_opencl_device_release_crop
	.p2align	2
	.type	halide_opencl_device_release_crop,@function
halide_opencl_device_release_crop:      // @halide_opencl_device_release_crop
// %bb.0:                               // %entry
	sub	sp, sp, #96             // =96
	str	x23, [sp, #32]          // 8-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	adrp	x10, :got:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE
	ldr	x8, [x1]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE]
	mov	x9, sp
	mov	x19, x1
	ldr	x21, [x8, #8]
	ldr	x10, [x10]
	mov	x20, x0
	add	x22, x9, #8             // =8
	add	x23, x9, #16            // =16
	add	x29, sp, #80            // =80
	stp	x0, xzr, [sp]
	str	xzr, [sp, #16]
	str	wzr, [sp, #24]
	cbnz	x10, .LBB226_2
// %bb.1:                               // %if.then.i
	mov	x0, x20
	bl	_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv
.LBB226_2:                              // %if.end.i
	mov	w3, #1
	mov	x0, x20
	mov	x1, x22
	mov	x2, x23
	bl	halide_acquire_cl_context
	ldr	x8, [sp, #8]
	str	w0, [sp, #24]
	cbz	x8, .LBB226_5
// %bb.3:                               // %if.end.i
	ldr	x8, [sp, #16]
	mov	w22, w0
	cbz	x8, .LBB226_5
// %bb.4:                               // %_ZN6Halide7Runtime8Internal6OpenCL9ClContextC2EPv.exit
	cbnz	w22, .LBB226_9
	b	.LBB226_6
.LBB226_5:                              // %if.then10.i
	adrp	x1, .L.str.240
	add	x1, x1, :lo12:.L.str.240
	mov	x0, x20
	bl	halide_print
	bl	abort
	ldr	w22, [sp, #24]
	cbnz	w22, .LBB226_9
.LBB226_6:                              // %if.end
	mov	x0, x20
	mov	x1, x19
	mov	x2, xzr
	bl	_ZN6Halide7Runtime8Internal6OpenCL23validate_device_pointerEPvP15halide_buffer_tm
	tbnz	w0, #0, .LBB226_8
// %bb.7:                               // %if.then11
	adrp	x1, .L.str.179
	add	x1, x1, :lo12:.L.str.179
	mov	x0, x20
	bl	halide_print
	bl	abort
.LBB226_8:                              // %if.end12
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE]
	mov	x0, x21
	ldr	x8, [x8]
	blr	x8
	ldr	x8, [x19]
	mov	w22, w0
	mov	x0, x8
	bl	free
.LBB226_9:                              // %cleanup22
	ldr	x0, [sp]
	bl	halide_release_cl_context
	mov	w0, w22
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldr	x23, [sp, #32]          // 8-byte Folded Reload
	add	sp, sp, #96             // =96
	ret
.Lfunc_end226:
	.size	halide_opencl_device_release_crop, .Lfunc_end226-halide_opencl_device_release_crop
                                        // -- End function
	.section	.text.halide_opencl_wrap_cl_mem,"ax",@progbits
	.weak	halide_opencl_wrap_cl_mem // -- Begin function halide_opencl_wrap_cl_mem
	.p2align	2
	.type	halide_opencl_wrap_cl_mem,@function
halide_opencl_wrap_cl_mem:              // @halide_opencl_wrap_cl_mem
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldr	x8, [x1]
	mov	x20, x2
	mov	x19, x1
	add	x29, sp, #16            // =16
	cbz	x8, .LBB227_3
// %bb.1:                               // %if.end
	adrp	x1, .L.str.173
	add	x1, x1, :lo12:.L.str.173
	bl	halide_print
	bl	abort
	ldr	x8, [x19]
	cbz	x8, .LBB227_3
// %bb.2:
	mov	w0, #-2
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB227_3:                              // %if.end4
	mov	w0, #16
	bl	malloc
	cbz	x0, .LBB227_5
// %bb.4:                               // %if.end7
	stp	xzr, x20, [x0]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE]
	stp	x0, x8, [x19]
	ldr	x8, [x8, #120]
	ldr	x8, [x8]
	blr	x8
	mov	w0, wzr
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB227_5:
	mov	w0, #-11
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.Lfunc_end227:
	.size	halide_opencl_wrap_cl_mem, .Lfunc_end227-halide_opencl_wrap_cl_mem
                                        // -- End function
	.section	.text.halide_opencl_detach_cl_mem,"ax",@progbits
	.weak	halide_opencl_detach_cl_mem // -- Begin function halide_opencl_detach_cl_mem
	.p2align	2
	.type	halide_opencl_detach_cl_mem,@function
halide_opencl_detach_cl_mem:            // @halide_opencl_detach_cl_mem
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldr	x8, [x1]
	add	x29, sp, #16            // =16
	cbz	x8, .LBB228_4
// %bb.1:                               // %if.end
	adrp	x10, :got:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE
	ldr	x9, [x1, #8]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE]
	mov	x19, x1
	cmp	x9, x10
	b.eq	.LBB228_3
// %bb.2:                               // %if.then2
	adrp	x1, .L.str.174
	add	x1, x1, :lo12:.L.str.174
	bl	halide_print
	bl	abort
	ldr	x8, [x19]
.LBB228_3:                              // %if.end3
	mov	x0, x8
	bl	free
	ldr	x8, [x19, #8]
	str	xzr, [x19]
	ldr	x8, [x8, #120]
	ldr	x8, [x8, #8]
	blr	x8
	str	xzr, [x19, #8]
.LBB228_4:                              // %return
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	w0, wzr
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end228:
	.size	halide_opencl_detach_cl_mem, .Lfunc_end228-halide_opencl_detach_cl_mem
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv // -- Begin function _ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv,@function
_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv: // @_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	adrp	x23, :got:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE]
	mov	x19, x0
	add	x29, sp, #48            // =48
	ldr	x8, [x23]
	cbz	x8, .LBB229_2
// %bb.1:                               // %if.then
	adrp	x1, .L.str.9.230
	add	x1, x1, :lo12:.L.str.9.230
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB229_2:                              // %if.end
	adrp	x1, .L.str.10.231
	add	x1, x1, :lo12:.L.str.10.231
	mov	x0, x19
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_10
// %bb.3:                               // %if.then.i94
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_5
// %bb.4:                               // %if.then.i.i96
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_6
.LBB229_5:                              // %if.then.i94.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_6:                              // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i99
	adrp	x2, .L.str.10.231
	add	x2, x2, :lo12:.L.str.10.231
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_8
// %bb.7:                               // %if.else.i25.i106
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_9
.LBB229_8:                              // %if.then.i24.i102
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_9:                              // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFijPP15_cl_platform_idPjEEET_PvPKc.exit
	bl	halide_free
.LBB229_10:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFijPP15_cl_platform_idPjEEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL16clGetPlatformIDsE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL16clGetPlatformIDsE]
	adrp	x1, .L.str.11.233
	add	x1, x1, :lo12:.L.str.11.233
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_18
// %bb.11:                              // %if.then.i112
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_13
// %bb.12:                              // %if.then.i.i114
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_14
.LBB229_13:                             // %if.then.i112.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_14:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i117
	adrp	x2, .L.str.11.233
	add	x2, x2, :lo12:.L.str.11.233
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_16
// %bb.15:                              // %if.else.i25.i124
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_17
.LBB229_16:                             // %if.then.i24.i120
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_17:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP15_cl_platform_idjmPvPmEEET_S6_PKc.exit
	bl	halide_free
.LBB229_18:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP15_cl_platform_idjmPvPmEEET_S6_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL17clGetPlatformInfoE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL17clGetPlatformInfoE]
	adrp	x1, .L.str.12.234
	add	x1, x1, :lo12:.L.str.12.234
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_26
// %bb.19:                              // %if.then.i130
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_21
// %bb.20:                              // %if.then.i.i132
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_22
.LBB229_21:                             // %if.then.i130.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_22:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i135
	adrp	x2, .L.str.12.234
	add	x2, x2, :lo12:.L.str.12.234
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_24
// %bb.23:                              // %if.else.i25.i142
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_25
.LBB229_24:                             // %if.then.i24.i138
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_25:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP15_cl_platform_idyjPP13_cl_device_idPjEEET_PvPKc.exit
	bl	halide_free
.LBB229_26:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP15_cl_platform_idyjPP13_cl_device_idPjEEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL14clGetDeviceIDsE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL14clGetDeviceIDsE]
	adrp	x1, .L.str.13.235
	add	x1, x1, :lo12:.L.str.13.235
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_34
// %bb.27:                              // %if.then.i148
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_29
// %bb.28:                              // %if.then.i.i150
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_30
.LBB229_29:                             // %if.then.i148.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_30:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i153
	adrp	x2, .L.str.13.235
	add	x2, x2, :lo12:.L.str.13.235
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_32
// %bb.31:                              // %if.else.i25.i160
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_33
.LBB229_32:                             // %if.then.i24.i156
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_33:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP13_cl_device_idjmPvPmEEET_S6_PKc.exit
	bl	halide_free
.LBB229_34:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP13_cl_device_idjmPvPmEEET_S6_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL15clGetDeviceInfoE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clGetDeviceInfoE]
	adrp	x1, .L.str.14.236
	add	x1, x1, :lo12:.L.str.14.236
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_42
// %bb.35:                              // %if.then.i166
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_37
// %bb.36:                              // %if.then.i.i168
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_38
.LBB229_37:                             // %if.then.i166.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_38:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i171
	adrp	x2, .L.str.14.236
	add	x2, x2, :lo12:.L.str.14.236
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_40
// %bb.39:                              // %if.else.i25.i178
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_41
.LBB229_40:                             // %if.then.i24.i174
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_41:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP11_cl_contextPKxjPKP13_cl_device_idPFvPKcPKvmPvESG_PiEEET_SG_SD_.exit
	bl	halide_free
.LBB229_42:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP11_cl_contextPKxjPKP13_cl_device_idPFvPKcPKvmPvESG_PiEEET_SG_SD_.exit
	adrp	x1, .L.str.15.237
	add	x1, x1, :lo12:.L.str.15.237
	mov	x0, x19
	str	x20, [x23]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_50
// %bb.43:                              // %if.then.i184
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_45
// %bb.44:                              // %if.then.i.i186
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_46
.LBB229_45:                             // %if.then.i184.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_46:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i189
	adrp	x2, .L.str.15.237
	add	x2, x2, :lo12:.L.str.15.237
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_48
// %bb.47:                              // %if.else.i25.i196
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_49
.LBB229_48:                             // %if.then.i24.i192
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_49:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP11_cl_contextPKxyPFvPKcPKvmPvESC_PiEEET_SC_S9_.exit
	bl	halide_free
.LBB229_50:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP11_cl_contextPKxyPFvPKcPKvmPvESC_PiEEET_SC_S9_.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL23clCreateContextFromTypeE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23clCreateContextFromTypeE]
	adrp	x1, .L.str.16.238
	add	x1, x1, :lo12:.L.str.16.238
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_58
// %bb.51:                              // %if.then.i202
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_53
// %bb.52:                              // %if.then.i.i204
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_54
.LBB229_53:                             // %if.then.i202.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_54:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i207
	adrp	x2, .L.str.16.238
	add	x2, x2, :lo12:.L.str.16.238
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_56
// %bb.55:                              // %if.else.i25.i214
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_57
.LBB229_56:                             // %if.then.i24.i210
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_57:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_contextEEET_PvPKc.exit
	bl	halide_free
.LBB229_58:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_contextEEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL15clRetainContextE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clRetainContextE]
	adrp	x1, .L.str.17.239
	add	x1, x1, :lo12:.L.str.17.239
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_66
// %bb.59:                              // %if.then.i220
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_61
// %bb.60:                              // %if.then.i.i222
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_62
.LBB229_61:                             // %if.then.i220.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_62:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i225
	adrp	x2, .L.str.17.239
	add	x2, x2, :lo12:.L.str.17.239
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_64
// %bb.63:                              // %if.else.i25.i232
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_65
.LBB229_64:                             // %if.then.i24.i228
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_65:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_contextEEET_PvPKc.exit234
	bl	halide_free
.LBB229_66:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_contextEEET_PvPKc.exit234
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL16clReleaseContextE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL16clReleaseContextE]
	adrp	x1, .L.str.18.240
	add	x1, x1, :lo12:.L.str.18.240
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_74
// %bb.67:                              // %if.then.i239
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_69
// %bb.68:                              // %if.then.i.i241
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_70
.LBB229_69:                             // %if.then.i239.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_70:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i244
	adrp	x2, .L.str.18.240
	add	x2, x2, :lo12:.L.str.18.240
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_72
// %bb.71:                              // %if.else.i25.i251
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_73
.LBB229_72:                             // %if.then.i24.i247
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_73:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_contextjmPvPmEEET_S6_PKc.exit
	bl	halide_free
.LBB229_74:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_contextjmPvPmEEET_S6_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL16clGetContextInfoE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL16clGetContextInfoE]
	adrp	x1, .L.str.19.241
	add	x1, x1, :lo12:.L.str.19.241
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_82
// %bb.75:                              // %if.then.i257
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_77
// %bb.76:                              // %if.then.i.i259
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_78
.LBB229_77:                             // %if.then.i257.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_78:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i262
	adrp	x2, .L.str.19.241
	add	x2, x2, :lo12:.L.str.19.241
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_80
// %bb.79:                              // %if.else.i25.i269
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_81
.LBB229_80:                             // %if.then.i24.i265
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_81:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP17_cl_command_queueP11_cl_contextP13_cl_device_idyPiEEET_PvPKc.exit
	bl	halide_free
.LBB229_82:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP17_cl_command_queueP11_cl_contextP13_cl_device_idyPiEEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL20clCreateCommandQueueE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL20clCreateCommandQueueE]
	adrp	x1, .L.str.20.242
	add	x1, x1, :lo12:.L.str.20.242
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_90
// %bb.83:                              // %if.then.i275
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_85
// %bb.84:                              // %if.then.i.i277
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_86
.LBB229_85:                             // %if.then.i275.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_86:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i280
	adrp	x2, .L.str.20.242
	add	x2, x2, :lo12:.L.str.20.242
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_88
// %bb.87:                              // %if.else.i25.i287
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_89
.LBB229_88:                             // %if.then.i24.i283
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_89:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueEEET_PvPKc.exit
	bl	halide_free
.LBB229_90:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueEEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL20clRetainCommandQueueE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL20clRetainCommandQueueE]
	adrp	x1, .L.str.21.243
	add	x1, x1, :lo12:.L.str.21.243
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_98
// %bb.91:                              // %if.then.i293
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_93
// %bb.92:                              // %if.then.i.i295
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_94
.LBB229_93:                             // %if.then.i293.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_94:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i298
	adrp	x2, .L.str.21.243
	add	x2, x2, :lo12:.L.str.21.243
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_96
// %bb.95:                              // %if.else.i25.i305
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_97
.LBB229_96:                             // %if.then.i24.i301
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_97:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueEEET_PvPKc.exit307
	bl	halide_free
.LBB229_98:                             // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueEEET_PvPKc.exit307
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL21clReleaseCommandQueueE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL21clReleaseCommandQueueE]
	adrp	x1, .L.str.22.244
	add	x1, x1, :lo12:.L.str.22.244
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_106
// %bb.99:                              // %if.then.i312
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_101
// %bb.100:                             // %if.then.i.i314
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_102
.LBB229_101:                            // %if.then.i312.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_102:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i317
	adrp	x2, .L.str.22.244
	add	x2, x2, :lo12:.L.str.22.244
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_104
// %bb.103:                             // %if.else.i25.i324
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_105
.LBB229_104:                            // %if.then.i24.i320
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_105:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queuejmPvPmEEET_S6_PKc.exit
	bl	halide_free
.LBB229_106:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queuejmPvPmEEET_S6_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL21clGetCommandQueueInfoE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL21clGetCommandQueueInfoE]
	adrp	x1, .L.str.23.245
	add	x1, x1, :lo12:.L.str.23.245
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_114
// %bb.107:                             // %if.then.i330
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_109
// %bb.108:                             // %if.then.i.i332
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_110
.LBB229_109:                            // %if.then.i330.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_110:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i335
	adrp	x2, .L.str.23.245
	add	x2, x2, :lo12:.L.str.23.245
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_112
// %bb.111:                             // %if.else.i25.i342
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_113
.LBB229_112:                            // %if.then.i24.i338
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_113:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP7_cl_memP11_cl_contextymPvPiEEET_S8_PKc.exit
	bl	halide_free
.LBB229_114:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP7_cl_memP11_cl_contextymPvPiEEET_S8_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL14clCreateBufferE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL14clCreateBufferE]
	adrp	x1, .L.str.24.246
	add	x1, x1, :lo12:.L.str.24.246
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_122
// %bb.115:                             // %if.then.i348
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_117
// %bb.116:                             // %if.then.i.i350
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_118
.LBB229_117:                            // %if.then.i348.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_118:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i353
	adrp	x2, .L.str.24.246
	add	x2, x2, :lo12:.L.str.24.246
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_120
// %bb.119:                             // %if.else.i25.i360
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_121
.LBB229_120:                            // %if.then.i24.i356
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_121:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP7_cl_memS5_yjPKvPiEEET_PvPKc.exit
	bl	halide_free
.LBB229_122:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP7_cl_memS5_yjPKvPiEEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL17clCreateSubBufferE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL17clCreateSubBufferE]
	adrp	x1, .L.str.25.247
	add	x1, x1, :lo12:.L.str.25.247
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_130
// %bb.123:                             // %if.then.i366
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_125
// %bb.124:                             // %if.then.i.i368
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_126
.LBB229_125:                            // %if.then.i366.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_126:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i371
	adrp	x2, .L.str.25.247
	add	x2, x2, :lo12:.L.str.25.247
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_128
// %bb.127:                             // %if.else.i25.i378
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_129
.LBB229_128:                            // %if.then.i24.i374
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_129:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP7_cl_memEEET_PvPKc.exit
	bl	halide_free
.LBB229_130:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP7_cl_memEEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL17clRetainMemObjectE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL17clRetainMemObjectE]
	adrp	x1, .L.str.26.248
	add	x1, x1, :lo12:.L.str.26.248
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_138
// %bb.131:                             // %if.then.i384
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_133
// %bb.132:                             // %if.then.i.i386
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_134
.LBB229_133:                            // %if.then.i384.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_134:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i389
	adrp	x2, .L.str.26.248
	add	x2, x2, :lo12:.L.str.26.248
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_136
// %bb.135:                             // %if.else.i25.i396
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_137
.LBB229_136:                            // %if.then.i24.i392
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_137:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP7_cl_memEEET_PvPKc.exit398
	bl	halide_free
.LBB229_138:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP7_cl_memEEET_PvPKc.exit398
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE]
	adrp	x1, .L.str.27.249
	add	x1, x1, :lo12:.L.str.27.249
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_146
// %bb.139:                             // %if.then.i403
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_141
// %bb.140:                             // %if.then.i.i405
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_142
.LBB229_141:                            // %if.then.i403.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_142:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i408
	adrp	x2, .L.str.27.249
	add	x2, x2, :lo12:.L.str.27.249
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_144
// %bb.143:                             // %if.else.i25.i415
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_145
.LBB229_144:                            // %if.then.i24.i411
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_145:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_contextyjjP16_cl_image_formatPjEEET_PvPKc.exit
	bl	halide_free
.LBB229_146:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_contextyjjP16_cl_image_formatPjEEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL26clGetSupportedImageFormatsE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL26clGetSupportedImageFormatsE]
	adrp	x1, .L.str.28.250
	add	x1, x1, :lo12:.L.str.28.250
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_154
// %bb.147:                             // %if.then.i421
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_149
// %bb.148:                             // %if.then.i.i423
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_150
.LBB229_149:                            // %if.then.i421.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_150:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i426
	adrp	x2, .L.str.28.250
	add	x2, x2, :lo12:.L.str.28.250
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_152
// %bb.151:                             // %if.else.i25.i433
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_153
.LBB229_152:                            // %if.then.i24.i429
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_153:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP7_cl_memjmPvPmEEET_S6_PKc.exit
	bl	halide_free
.LBB229_154:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP7_cl_memjmPvPmEEET_S6_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL18clGetMemObjectInfoE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL18clGetMemObjectInfoE]
	adrp	x1, .L.str.29.251
	add	x1, x1, :lo12:.L.str.29.251
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_162
// %bb.155:                             // %if.then.i439
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_157
// %bb.156:                             // %if.then.i.i441
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_158
.LBB229_157:                            // %if.then.i439.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_158:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i444
	adrp	x2, .L.str.29.251
	add	x2, x2, :lo12:.L.str.29.251
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_160
// %bb.159:                             // %if.else.i25.i451
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_161
.LBB229_160:                            // %if.then.i24.i447
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_161:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP7_cl_memjmPvPmEEET_S6_PKc.exit453
	bl	halide_free
.LBB229_162:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP7_cl_memjmPvPmEEET_S6_PKc.exit453
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL14clGetImageInfoE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL14clGetImageInfoE]
	adrp	x1, .L.str.30.252
	add	x1, x1, :lo12:.L.str.30.252
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_170
// %bb.163:                             // %if.then.i458
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_165
// %bb.164:                             // %if.then.i.i460
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_166
.LBB229_165:                            // %if.then.i458.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_166:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i463
	adrp	x2, .L.str.30.252
	add	x2, x2, :lo12:.L.str.30.252
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_168
// %bb.167:                             // %if.else.i25.i470
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_169
.LBB229_168:                            // %if.then.i24.i466
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_169:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP7_cl_memPFvS5_PvES6_EEET_S6_PKc.exit
	bl	halide_free
.LBB229_170:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP7_cl_memPFvS5_PvES6_EEET_S6_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL32clSetMemObjectDestructorCallbackE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL32clSetMemObjectDestructorCallbackE]
	adrp	x1, .L.str.31.253
	add	x1, x1, :lo12:.L.str.31.253
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_178
// %bb.171:                             // %if.then.i476
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_173
// %bb.172:                             // %if.then.i.i478
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_174
.LBB229_173:                            // %if.then.i476.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_174:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i481
	adrp	x2, .L.str.31.253
	add	x2, x2, :lo12:.L.str.31.253
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_176
// %bb.175:                             // %if.else.i25.i488
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_177
.LBB229_176:                            // %if.then.i24.i484
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_177:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP11_cl_programP11_cl_contextjPPKcPKmPiEEET_PvS9_.exit
	bl	halide_free
.LBB229_178:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP11_cl_programP11_cl_contextjPPKcPKmPiEEET_PvS9_.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL25clCreateProgramWithSourceE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL25clCreateProgramWithSourceE]
	adrp	x1, .L.str.32.254
	add	x1, x1, :lo12:.L.str.32.254
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_186
// %bb.179:                             // %if.then.i494
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_181
// %bb.180:                             // %if.then.i.i496
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_182
.LBB229_181:                            // %if.then.i494.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_182:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i499
	adrp	x2, .L.str.32.254
	add	x2, x2, :lo12:.L.str.32.254
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_184
// %bb.183:                             // %if.else.i25.i506
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_185
.LBB229_184:                            // %if.then.i24.i502
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_185:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_programEEET_PvPKc.exit
	bl	halide_free
.LBB229_186:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_programEEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL15clRetainProgramE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clRetainProgramE]
	adrp	x1, .L.str.33.255
	add	x1, x1, :lo12:.L.str.33.255
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_194
// %bb.187:                             // %if.then.i512
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_189
// %bb.188:                             // %if.then.i.i514
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_190
.LBB229_189:                            // %if.then.i512.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_190:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i517
	adrp	x2, .L.str.33.255
	add	x2, x2, :lo12:.L.str.33.255
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_192
// %bb.191:                             // %if.else.i25.i524
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_193
.LBB229_192:                            // %if.then.i24.i520
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_193:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_programEEET_PvPKc.exit526
	bl	halide_free
.LBB229_194:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_programEEET_PvPKc.exit526
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL16clReleaseProgramE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL16clReleaseProgramE]
	adrp	x1, .L.str.34.256
	add	x1, x1, :lo12:.L.str.34.256
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_202
// %bb.195:                             // %if.then.i531
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_197
// %bb.196:                             // %if.then.i.i533
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_198
.LBB229_197:                            // %if.then.i531.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_198:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i536
	adrp	x2, .L.str.34.256
	add	x2, x2, :lo12:.L.str.34.256
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_200
// %bb.199:                             // %if.else.i25.i543
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_201
.LBB229_200:                            // %if.then.i24.i539
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_201:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_programjPKP13_cl_device_idPKcPFvS5_PvESC_EEET_SC_SB_.exit
	bl	halide_free
.LBB229_202:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_programjPKP13_cl_device_idPKcPFvS5_PvESC_EEET_SC_SB_.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL14clBuildProgramE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL14clBuildProgramE]
	adrp	x1, .L.str.35.257
	add	x1, x1, :lo12:.L.str.35.257
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_210
// %bb.203:                             // %if.then.i549
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_205
// %bb.204:                             // %if.then.i.i551
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_206
.LBB229_205:                            // %if.then.i549.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_206:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i554
	adrp	x2, .L.str.35.257
	add	x2, x2, :lo12:.L.str.35.257
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_208
// %bb.207:                             // %if.else.i25.i561
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_209
.LBB229_208:                            // %if.then.i24.i557
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_209:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_programP13_cl_device_idjmPvPmEEET_S8_PKc.exit
	bl	halide_free
.LBB229_210:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP11_cl_programP13_cl_device_idjmPvPmEEET_S8_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL21clGetProgramBuildInfoE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL21clGetProgramBuildInfoE]
	adrp	x1, .L.str.36.258
	add	x1, x1, :lo12:.L.str.36.258
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_218
// %bb.211:                             // %if.then.i567
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_213
// %bb.212:                             // %if.then.i.i569
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_214
.LBB229_213:                            // %if.then.i567.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_214:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i572
	adrp	x2, .L.str.36.258
	add	x2, x2, :lo12:.L.str.36.258
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_216
// %bb.215:                             // %if.else.i25.i579
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_217
.LBB229_216:                            // %if.then.i24.i575
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_217:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP10_cl_kernelP11_cl_programPKcPiEEET_PvS9_.exit
	bl	halide_free
.LBB229_218:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFP10_cl_kernelP11_cl_programPKcPiEEET_PvS9_.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL14clCreateKernelE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL14clCreateKernelE]
	adrp	x1, .L.str.37.259
	add	x1, x1, :lo12:.L.str.37.259
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_226
// %bb.219:                             // %if.then.i585
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_221
// %bb.220:                             // %if.then.i.i587
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_222
.LBB229_221:                            // %if.then.i585.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_222:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i590
	adrp	x2, .L.str.37.259
	add	x2, x2, :lo12:.L.str.37.259
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_224
// %bb.223:                             // %if.else.i25.i597
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_225
.LBB229_224:                            // %if.then.i24.i593
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_225:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP10_cl_kernelEEET_PvPKc.exit
	bl	halide_free
.LBB229_226:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP10_cl_kernelEEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL14clRetainKernelE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL14clRetainKernelE]
	adrp	x1, .L.str.38.260
	add	x1, x1, :lo12:.L.str.38.260
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_234
// %bb.227:                             // %if.then.i603
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_229
// %bb.228:                             // %if.then.i.i605
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_230
.LBB229_229:                            // %if.then.i603.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_230:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i608
	adrp	x2, .L.str.38.260
	add	x2, x2, :lo12:.L.str.38.260
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_232
// %bb.231:                             // %if.else.i25.i615
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_233
.LBB229_232:                            // %if.then.i24.i611
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_233:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP10_cl_kernelEEET_PvPKc.exit617
	bl	halide_free
.LBB229_234:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP10_cl_kernelEEET_PvPKc.exit617
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL15clReleaseKernelE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clReleaseKernelE]
	adrp	x1, .L.str.39.261
	add	x1, x1, :lo12:.L.str.39.261
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_242
// %bb.235:                             // %if.then.i622
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_237
// %bb.236:                             // %if.then.i.i624
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_238
.LBB229_237:                            // %if.then.i622.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_238:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i627
	adrp	x2, .L.str.39.261
	add	x2, x2, :lo12:.L.str.39.261
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_240
// %bb.239:                             // %if.else.i25.i634
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_241
.LBB229_240:                            // %if.then.i24.i630
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_241:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP10_cl_kerneljmPKvEEET_PvPKc.exit
	bl	halide_free
.LBB229_242:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP10_cl_kerneljmPKvEEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL14clSetKernelArgE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL14clSetKernelArgE]
	adrp	x1, .L.str.40.262
	add	x1, x1, :lo12:.L.str.40.262
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_250
// %bb.243:                             // %if.then.i640
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_245
// %bb.244:                             // %if.then.i.i642
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_246
.LBB229_245:                            // %if.then.i640.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_246:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i645
	adrp	x2, .L.str.40.262
	add	x2, x2, :lo12:.L.str.40.262
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_248
// %bb.247:                             // %if.else.i25.i652
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_249
.LBB229_248:                            // %if.then.i24.i648
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_249:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueEEET_PvPKc.exit654
	bl	halide_free
.LBB229_250:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueEEET_PvPKc.exit654
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL7clFlushE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL7clFlushE]
	adrp	x1, .L.str.41.263
	add	x1, x1, :lo12:.L.str.41.263
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_258
// %bb.251:                             // %if.then.i659
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_253
// %bb.252:                             // %if.then.i.i661
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_254
.LBB229_253:                            // %if.then.i659.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_254:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i664
	adrp	x2, .L.str.41.263
	add	x2, x2, :lo12:.L.str.41.263
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_256
// %bb.255:                             // %if.else.i25.i671
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_257
.LBB229_256:                            // %if.then.i24.i667
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_257:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueEEET_PvPKc.exit673
	bl	halide_free
.LBB229_258:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueEEET_PvPKc.exit673
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL8clFinishE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL8clFinishE]
	adrp	x1, .L.str.42.264
	add	x1, x1, :lo12:.L.str.42.264
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_266
// %bb.259:                             // %if.then.i678
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_261
// %bb.260:                             // %if.then.i.i680
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_262
.LBB229_261:                            // %if.then.i678.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_262:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i683
	adrp	x2, .L.str.42.264
	add	x2, x2, :lo12:.L.str.42.264
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_264
// %bb.263:                             // %if.else.i25.i690
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_265
.LBB229_264:                            // %if.then.i24.i686
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_265:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memjmmPvjPKP9_cl_eventPSA_EEET_S8_PKc.exit
	bl	halide_free
.LBB229_266:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memjmmPvjPKP9_cl_eventPSA_EEET_S8_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueReadBufferE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueReadBufferE]
	adrp	x1, .L.str.43.265
	add	x1, x1, :lo12:.L.str.43.265
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_274
// %bb.267:                             // %if.then.i696
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_269
// %bb.268:                             // %if.then.i.i698
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_270
.LBB229_269:                            // %if.then.i696.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_270:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i701
	adrp	x2, .L.str.43.265
	add	x2, x2, :lo12:.L.str.43.265
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_272
// %bb.271:                             // %if.else.i25.i708
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_273
.LBB229_272:                            // %if.then.i24.i704
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_273:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memjPKmS9_S9_mmmmPvjPKP9_cl_eventPSC_EEET_SA_PKc.exit
	bl	halide_free
.LBB229_274:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memjPKmS9_S9_mmmmPvjPKP9_cl_eventPSC_EEET_SA_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueReadBufferRectE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueReadBufferRectE]
	adrp	x1, .L.str.44.266
	add	x1, x1, :lo12:.L.str.44.266
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_282
// %bb.275:                             // %if.then.i714
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_277
// %bb.276:                             // %if.then.i.i716
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_278
.LBB229_277:                            // %if.then.i714.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_278:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i719
	adrp	x2, .L.str.44.266
	add	x2, x2, :lo12:.L.str.44.266
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_280
// %bb.279:                             // %if.else.i25.i726
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_281
.LBB229_280:                            // %if.then.i24.i722
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_281:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memjmmPKvjPKP9_cl_eventPSB_EEET_PvPKc.exit
	bl	halide_free
.LBB229_282:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memjmmPKvjPKP9_cl_eventPSB_EEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL20clEnqueueWriteBufferE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL20clEnqueueWriteBufferE]
	adrp	x1, .L.str.45.267
	add	x1, x1, :lo12:.L.str.45.267
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_290
// %bb.283:                             // %if.then.i732
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_285
// %bb.284:                             // %if.then.i.i734
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_286
.LBB229_285:                            // %if.then.i732.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_286:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i737
	adrp	x2, .L.str.45.267
	add	x2, x2, :lo12:.L.str.45.267
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_288
// %bb.287:                             // %if.else.i25.i744
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_289
.LBB229_288:                            // %if.then.i24.i740
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_289:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memjPKmS9_S9_mmmmPKvjPKP9_cl_eventPSD_EEET_PvPKc.exit
	bl	halide_free
.LBB229_290:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memjPKmS9_S9_mmmmPKvjPKP9_cl_eventPSD_EEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL24clEnqueueWriteBufferRectE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL24clEnqueueWriteBufferRectE]
	adrp	x1, .L.str.46.268
	add	x1, x1, :lo12:.L.str.46.268
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_298
// %bb.291:                             // %if.then.i750
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_293
// %bb.292:                             // %if.then.i.i752
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_294
.LBB229_293:                            // %if.then.i750.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_294:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i755
	adrp	x2, .L.str.46.268
	add	x2, x2, :lo12:.L.str.46.268
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_296
// %bb.295:                             // %if.else.i25.i762
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_297
.LBB229_296:                            // %if.then.i24.i758
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_297:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memS7_mmmjPKP9_cl_eventPS9_EEET_PvPKc.exit
	bl	halide_free
.LBB229_298:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memS7_mmmjPKP9_cl_eventPS9_EEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueCopyBufferE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueCopyBufferE]
	adrp	x1, .L.str.47.269
	add	x1, x1, :lo12:.L.str.47.269
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_306
// %bb.299:                             // %if.then.i768
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_301
// %bb.300:                             // %if.then.i.i770
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_302
.LBB229_301:                            // %if.then.i768.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_302:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i773
	adrp	x2, .L.str.47.269
	add	x2, x2, :lo12:.L.str.47.269
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_304
// %bb.303:                             // %if.else.i25.i780
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_305
.LBB229_304:                            // %if.then.i24.i776
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_305:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memjPKmS9_mmPvjPKP9_cl_eventPSC_EEET_SA_PKc.exit
	bl	halide_free
.LBB229_306:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memjPKmS9_mmPvjPKP9_cl_eventPSC_EEET_SA_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueReadImageE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueReadImageE]
	adrp	x1, .L.str.48.270
	add	x1, x1, :lo12:.L.str.48.270
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_314
// %bb.307:                             // %if.then.i786
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_309
// %bb.308:                             // %if.then.i.i788
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_310
.LBB229_309:                            // %if.then.i786.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_310:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i791
	adrp	x2, .L.str.48.270
	add	x2, x2, :lo12:.L.str.48.270
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_312
// %bb.311:                             // %if.else.i25.i798
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_313
.LBB229_312:                            // %if.then.i24.i794
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_313:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memjPKmS9_mmPKvjPKP9_cl_eventPSD_EEET_PvPKc.exit
	bl	halide_free
.LBB229_314:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memjPKmS9_mmPKvjPKP9_cl_eventPSD_EEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueWriteImageE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueWriteImageE]
	adrp	x1, .L.str.49.271
	add	x1, x1, :lo12:.L.str.49.271
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_322
// %bb.315:                             // %if.then.i804
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_317
// %bb.316:                             // %if.then.i.i806
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_318
.LBB229_317:                            // %if.then.i804.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_318:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i809
	adrp	x2, .L.str.49.271
	add	x2, x2, :lo12:.L.str.49.271
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_320
// %bb.319:                             // %if.else.i25.i816
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_321
.LBB229_320:                            // %if.then.i24.i812
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_321:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFPvP17_cl_command_queueP7_cl_memjymmjPKP9_cl_eventPSA_PiEEET_S4_PKc.exit
	bl	halide_free
.LBB229_322:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFPvP17_cl_command_queueP7_cl_memjymmjPKP9_cl_eventPSA_PiEEET_S4_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueMapBufferE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueMapBufferE]
	adrp	x1, .L.str.50.272
	add	x1, x1, :lo12:.L.str.50.272
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_330
// %bb.323:                             // %if.then.i822
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_325
// %bb.324:                             // %if.then.i.i824
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_326
.LBB229_325:                            // %if.then.i822.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_326:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i827
	adrp	x2, .L.str.50.272
	add	x2, x2, :lo12:.L.str.50.272
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_328
// %bb.327:                             // %if.else.i25.i834
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_329
.LBB229_328:                            // %if.then.i24.i830
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_329:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFPvP17_cl_command_queueP7_cl_memjyPKmSA_PmSB_jPKP9_cl_eventPSD_PiEEET_S4_PKc.exit
	bl	halide_free
.LBB229_330:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFPvP17_cl_command_queueP7_cl_memjyPKmSA_PmSB_jPKP9_cl_eventPSD_PiEEET_S4_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL17clEnqueueMapImageE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL17clEnqueueMapImageE]
	adrp	x1, .L.str.51.273
	add	x1, x1, :lo12:.L.str.51.273
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_338
// %bb.331:                             // %if.then.i840
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_333
// %bb.332:                             // %if.then.i.i842
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_334
.LBB229_333:                            // %if.then.i840.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_334:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i845
	adrp	x2, .L.str.51.273
	add	x2, x2, :lo12:.L.str.51.273
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_336
// %bb.335:                             // %if.else.i25.i852
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_337
.LBB229_336:                            // %if.then.i24.i848
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_337:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memPvjPKP9_cl_eventPSA_EEET_S8_PKc.exit
	bl	halide_free
.LBB229_338:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP7_cl_memPvjPKP9_cl_eventPSA_EEET_S8_PKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueUnmapMemObjectE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueUnmapMemObjectE]
	adrp	x1, .L.str.52.274
	add	x1, x1, :lo12:.L.str.52.274
	mov	x0, x19
	str	x20, [x8]
	bl	halide_opencl_get_symbol
	mov	x20, x0
	cbnz	x0, .LBB229_346
// %bb.339:                             // %if.then.i
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB229_341
// %bb.340:                             // %if.then.i.i
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	b	.LBB229_342
.LBB229_341:                            // %if.then.i.split
	adrp	x2, .L.str.241
	add	x2, x2, :lo12:.L.str.241
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
.LBB229_342:                            // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit.i
	adrp	x2, .L.str.52.274
	add	x2, x2, :lo12:.L.str.52.274
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB229_344
// %bb.343:                             // %if.else.i25.i
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB229_345
.LBB229_344:                            // %if.then.i24.i
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB229_345:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP10_cl_kerneljPKmS9_S9_jPKP9_cl_eventPSB_EEET_PvPKc.exit
	bl	halide_free
.LBB229_346:                            // %_ZN6Halide7Runtime8Internal6OpenCL13get_cl_symbolIPFiP17_cl_command_queueP10_cl_kerneljPKmS9_S9_jPKP9_cl_eventPSB_EEET_PvPKc.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL22clEnqueueNDRangeKernelE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL22clEnqueueNDRangeKernelE]
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	str	x20, [x8]
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end229:
	.size	_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv, .Lfunc_end229-_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv
                                        // -- End function
	.section	.text.halide_acquire_cl_context,"ax",@progbits
	.weak	halide_acquire_cl_context // -- Begin function halide_acquire_cl_context
	.p2align	2
	.type	halide_acquire_cl_context,@function
halide_acquire_cl_context:              // @halide_acquire_cl_context
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	mov	w22, w3
	mov	x19, x2
	mov	x20, x1
	mov	x21, x0
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	add	x29, sp, #48            // =48
	cbz	x1, .LBB230_8
// %bb.1:                               // %if.end
	cbz	x19, .LBB230_9
.LBB230_2:                              // %atomicrmw.start.preheader
	adrp	x23, :got:_ZN6Halide7Runtime8Internal6OpenCL11thread_lockE
	ldr	x23, [x23, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL11thread_lockE]
	mov	w8, #1
.LBB230_3:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w9, [x23]
	stlxr	w10, w8, [x23]
	orr	w9, w10, w9
	cbnz	w9, .LBB230_3
// %bb.4:                               // %if.end9
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL7contextE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL7contextE]
	ldr	x8, [x8]
	cbnz	x8, .LBB230_11
// %bb.5:                               // %if.end9
	cbz	w22, .LBB230_11
// %bb.6:                               // %if.then12
	adrp	x22, :got:_ZN6Halide7Runtime8Internal6OpenCL7contextE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL7contextE]
	adrp	x2, :got:_ZN6Halide7Runtime8Internal6OpenCL13command_queueE
	ldr	x2, [x2, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL13command_queueE]
	mov	x0, x21
	mov	x1, x22
	bl	_ZN6Halide7Runtime8Internal6OpenCL21create_opencl_contextEPvPP11_cl_contextPP17_cl_command_queue
	cbz	w0, .LBB230_10
// %bb.7:                               // %if.then14
	stlr	wzr, [x23]
	b	.LBB230_12
.LBB230_8:                              // %if.then
	adrp	x1, .L.str.55.219
	add	x1, x1, :lo12:.L.str.55.219
	mov	x0, x21
	bl	halide_print
	bl	abort
	cbnz	x19, .LBB230_2
.LBB230_9:                              // %if.then2
	adrp	x1, .L.str.56.220
	add	x1, x1, :lo12:.L.str.56.220
	mov	x0, x21
	bl	halide_print
	bl	abort
	b	.LBB230_2
.LBB230_10:                             // %if.then12.if.end16_crit_edge
	ldr	x8, [x22]
.LBB230_11:                             // %if.end16
	adrp	x9, :got:_ZN6Halide7Runtime8Internal6OpenCL13command_queueE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL13command_queueE]
	str	x8, [x20]
	mov	w0, wzr
	ldr	x8, [x9]
	str	x8, [x19]
.LBB230_12:                             // %return
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end230:
	.size	halide_acquire_cl_context, .Lfunc_end230-halide_acquire_cl_context
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal6OpenCL23validate_device_pointerEPvP15halide_buffer_tm,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal6OpenCL23validate_device_pointerEPvP15halide_buffer_tm // -- Begin function _ZN6Halide7Runtime8Internal6OpenCL23validate_device_pointerEPvP15halide_buffer_tm
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal6OpenCL23validate_device_pointerEPvP15halide_buffer_tm,@function
_ZN6Halide7Runtime8Internal6OpenCL23validate_device_pointerEPvP15halide_buffer_tm: // @_ZN6Halide7Runtime8Internal6OpenCL23validate_device_pointerEPvP15halide_buffer_tm
// %bb.0:                               // %entry
	str	x23, [sp, #-64]!        // 8-byte Folded Spill
	stp	x22, x21, [sp, #16]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #32]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #48]     // 16-byte Folded Spill
	ldr	x9, [x1]
	add	x29, sp, #48            // =48
	cbz	x9, .LBB231_9
// %bb.1:                               // %if.end
	adrp	x22, :got:_ZN6Halide7Runtime8Internal6OpenCL18clGetMemObjectInfoE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL18clGetMemObjectInfoE]
	mov	x20, x2
	mov	x19, x0
	ldr	x8, [x22]
	cbnz	x8, .LBB231_3
// %bb.2:                               // %if.then1
	mov	x0, x19
	mov	x21, x1
	bl	_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv
	ldr	x9, [x21]
	ldr	x8, [x22]
.LBB231_3:                              // %if.end2
	ldp	x23, x22, [x9]
	add	x3, sp, #8              // =8
	mov	w1, #4354
	mov	w2, #8
	mov	x0, x22
	mov	x4, xzr
	blr	x8
	cbz	w0, .LBB231_6
// %bb.4:                               // %if.then7
	mov	w21, w0
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB231_10
// %bb.5:                               // %if.then.i
	add	x23, x20, #1023         // =1023
	adrp	x2, .L.str.60.214
	add	x2, x2, :lo12:.L.str.60.214
	mov	x0, x20
	mov	x1, x23
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	b	.LBB231_11
.LBB231_6:                              // %if.end13
	cbz	x20, .LBB231_9
// %bb.7:                               // %if.then24
	ldr	x8, [sp, #8]
	add	x9, x23, x20
	cmp	x8, x9
	b.hs	.LBB231_9
// %bb.8:                               // %if.then26
	adrp	x1, .L.str.66.216
	add	x1, x1, :lo12:.L.str.66.216
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB231_9:                              // %cleanup
	mov	w0, #1
	b	.LBB231_17
.LBB231_10:                             // %if.then7.split
	adrp	x2, .L.str.60.214
	add	x2, x2, :lo12:.L.str.60.214
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, xzr
.LBB231_11:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EEC2EPvPc.exit
	mov	x1, x23
	mov	x2, x22
	bl	halide_pointer_to_string
	adrp	x2, .L.str.61.215
	add	x2, x2, :lo12:.L.str.61.215
	mov	x1, x23
	bl	halide_string_to_string
	mov	x22, x0
	mov	w0, w21
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB231_14
// %bb.12:                              // %if.else.i61
	mov	x2, x0
	mov	x0, x22
	mov	x1, x23
	bl	halide_string_to_string
	cbz	x20, .LBB231_15
.LBB231_13:                             // %if.else.i65
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB231_16
.LBB231_14:                             // %if.then.i59
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x22
	mov	x1, x23
	bl	halide_string_to_string
	cbnz	x20, .LBB231_13
.LBB231_15:                             // %if.then.i64
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB231_16:                             // %cleanup
	bl	halide_free
	mov	w0, wzr
.LBB231_17:                             // %return
	ldp	x29, x30, [sp, #48]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]     // 16-byte Folded Reload
	ldr	x23, [sp], #64          // 8-byte Folded Reload
	ret
.Lfunc_end231:
	.size	_ZN6Halide7Runtime8Internal6OpenCL23validate_device_pointerEPvP15halide_buffer_tm, .Lfunc_end231-_ZN6Halide7Runtime8Internal6OpenCL23validate_device_pointerEPvP15halide_buffer_tm
                                        // -- End function
	.section	.text.halide_release_cl_context,"ax",@progbits
	.weak	halide_release_cl_context // -- Begin function halide_release_cl_context
	.p2align	2
	.type	halide_release_cl_context,@function
halide_release_cl_context:              // @halide_release_cl_context
// %bb.0:                               // %entry
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL11thread_lockE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL11thread_lockE]
	mov	w0, wzr
	stlr	wzr, [x8]
	ret
.Lfunc_end232:
	.size	halide_release_cl_context, .Lfunc_end232-halide_release_cl_context
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi // -- Begin function _ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi,@function
_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi: // @_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
// %bb.0:                               // %entry
	add	w8, w0, #68             // =68
	cmp	w8, #68                 // =68
	b.hi	.LBB233_2
// %bb.1:                               // %switch.lookup
	adrp	x9, .Lswitch.table._ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	add	x9, x9, :lo12:.Lswitch.table._ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	ldr	x0, [x9, w8, sxtw #3]
	ret
.LBB233_2:                              // %return
	adrp	x0, .L.str.239
	add	x0, x0, :lo12:.L.str.239
	ret
.Lfunc_end233:
	.size	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi, .Lfunc_end233-_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
                                        // -- End function
	.section	.text._ZN6Halide7Runtime8Internal6OpenCL21create_opencl_contextEPvPP11_cl_contextPP17_cl_command_queue,"ax",@progbits
	.weak	_ZN6Halide7Runtime8Internal6OpenCL21create_opencl_contextEPvPP11_cl_contextPP17_cl_command_queue // -- Begin function _ZN6Halide7Runtime8Internal6OpenCL21create_opencl_contextEPvPP11_cl_contextPP17_cl_command_queue
	.p2align	2
	.type	_ZN6Halide7Runtime8Internal6OpenCL21create_opencl_contextEPvPP11_cl_contextPP17_cl_command_queue,@function
_ZN6Halide7Runtime8Internal6OpenCL21create_opencl_contextEPvPP11_cl_contextPP17_cl_command_queue: // @_ZN6Halide7Runtime8Internal6OpenCL21create_opencl_contextEPvPP11_cl_contextPP17_cl_command_queue
// %bb.0:                               // %entry
	sub	sp, sp, #448            // =448
	stp	x22, x21, [sp, #400]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #416]    // 16-byte Folded Spill
	mov	x20, x2
	mov	x21, x1
	mov	x19, x0
	stp	x28, x27, [sp, #352]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #368]    // 16-byte Folded Spill
	stp	x24, x23, [sp, #384]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #432]    // 16-byte Folded Spill
	add	x29, sp, #432           // =432
	cbz	x1, .LBB234_2
// %bb.1:                               // %land.lhs.true
	ldr	x8, [x21]
	cbz	x8, .LBB234_3
.LBB234_2:                              // %if.then
	adrp	x1, .L.str.68.221
	add	x1, x1, :lo12:.L.str.68.221
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB234_3:                              // %if.end
	cbz	x20, .LBB234_5
// %bb.4:                               // %land.lhs.true5
	ldr	x8, [x20]
	cbz	x8, .LBB234_6
.LBB234_5:                              // %if.then7
	adrp	x1, .L.str.69.222
	add	x1, x1, :lo12:.L.str.69.222
	mov	x0, x19
	bl	halide_print
	bl	abort
.LBB234_6:                              // %if.end8
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL16clGetPlatformIDsE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL16clGetPlatformIDsE]
	sub	x1, x29, #128           // =128
	sub	x2, x29, #132           // =132
	mov	w0, #4
	ldr	x8, [x8]
	stur	wzr, [x29, #-132]
	blr	x8
	stur	w0, [x29, #-92]
	cbz	w0, .LBB234_10
// %bb.7:                               // %if.then10
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB234_17
// %bb.8:                               // %if.then.i272
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.70.223
	add	x2, x2, :lo12:.L.str.70.223
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	mov	x22, x0
	ldur	w0, [x29, #-92]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB234_18
.LBB234_9:                              // %if.else.i284
	mov	x2, x0
	b	.LBB234_19
.LBB234_10:                             // %if.end17
	mov	x0, x19
	bl	halide_opencl_get_platform_name
	ldur	w8, [x29, #-132]
	cbz	x0, .LBB234_22
// %bb.11:                              // %for.cond.preheader
	cbz	w8, .LBB234_28
// %bb.12:                              // %for.body.lr.ph
	adrp	x24, :got:_ZN6Halide7Runtime8Internal6OpenCL17clGetPlatformInfoE
	ldr	x24, [x24, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL17clGetPlatformInfoE]
	mov	x22, x0
	mov	x23, xzr
	sub	x25, x29, #128          // =128
	b	.LBB234_14
.LBB234_13:                             // %for.inc
                                        //   in Loop: Header=BB234_14 Depth=1
	ldur	w8, [x29, #-132]
	add	x23, x23, #1            // =1
	cmp	x23, x8
	b.hs	.LBB234_28
.LBB234_14:                             // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x24]
	ldr	x0, [x25, x23, lsl #3]
	add	x3, sp, #40             // =40
	mov	w1, #2306
	mov	w2, #256
	mov	x4, xzr
	blr	x8
	stur	w0, [x29, #-92]
	cbnz	w0, .LBB234_13
// %bb.15:                              // %if.end26
                                        //   in Loop: Header=BB234_14 Depth=1
	add	x0, sp, #40             // =40
	mov	x1, x22
	bl	strstr
	cbz	x0, .LBB234_13
// %bb.16:                              // %cleanup
	sub	x8, x29, #128           // =128
	ldr	x22, [x8, x23, lsl #3]
	cbnz	x22, .LBB234_24
	b	.LBB234_28
.LBB234_17:                             // %if.then10.split
	adrp	x2, .L.str.70.223
	add	x2, x2, :lo12:.L.str.70.223
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, x0
	mov	x21, xzr
	ldur	w0, [x29, #-92]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB234_9
.LBB234_18:                             // %if.then.i282
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
.LBB234_19:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	mov	x0, x22
	mov	x1, x21
	bl	halide_string_to_string
	adrp	x2, .L.str.71.224
	add	x2, x2, :lo12:.L.str.71.224
	mov	x1, x21
	bl	halide_string_to_string
	ldursw	x2, [x29, #-92]
	mov	w3, #1
	mov	x1, x21
	bl	halide_int64_to_string
	cbz	x20, .LBB234_53
.LBB234_20:                             // %if.else.i
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
.LBB234_21:                             // %cleanup180.sink.split
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB234_54
.LBB234_22:                             // %if.else
	cbz	w8, .LBB234_28
// %bb.23:
	ldur	x22, [x29, #-128]
	cbz	x22, .LBB234_28
.LBB234_24:                             // %if.end51
	mov	x0, x19
	bl	halide_opencl_get_device_type
	cbz	x0, .LBB234_33
// %bb.25:                              // %land.lhs.true54
	ldrb	w8, [x0]
	mov	x24, x0
	cbz	w8, .LBB234_33
// %bb.26:                              // %if.then56
	adrp	x1, .L.str.74.226
	add	x1, x1, :lo12:.L.str.74.226
	mov	x0, x24
	bl	strstr
	cmp	x0, #0                  // =0
	adrp	x1, .L.str.75.227
	cset	w23, ne
	add	x1, x1, :lo12:.L.str.75.227
	mov	x0, x24
	lsl	x25, x23, #1
	bl	strstr
	mov	w8, #4
	adrp	x1, .L.str.76
	bfi	x8, x23, #1, #1
	cmp	x0, #0                  // =0
	add	x1, x1, :lo12:.L.str.76
	mov	x0, x24
	csel	x23, x25, x8, eq
	bl	strstr
	cbz	x0, .LBB234_32
// %bb.27:
	orr	x23, x23, #0x8
	b	.LBB234_34
.LBB234_28:                             // %if.then48
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	cbz	x0, .LBB234_30
// %bb.29:                              // %if.else.i348
	adrp	x2, .L.str.73.225
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.73.225
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB234_31
.LBB234_30:                             // %if.then.i342
	adrp	x2, .L.str.73.225
	add	x2, x2, :lo12:.L.str.73.225
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB234_31:                             // %cleanup190
	bl	halide_free
	mov	w0, #-32
	b	.LBB234_55
.LBB234_32:                             // %if.end71
	cbnz	x23, .LBB234_34
.LBB234_33:                             // %if.end71.thread
	mov	w23, #-1
.LBB234_34:                             // %if.end71.thread597
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL14clGetDeviceIDsE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL14clGetDeviceIDsE]
	add	x3, sp, #40             // =40
	add	x4, sp, #36             // =36
	mov	w2, #4
	ldr	x8, [x8]
	mov	x0, x22
	mov	x1, x23
	str	wzr, [sp, #36]
	blr	x8
	stur	w0, [x29, #-92]
	cbz	w0, .LBB234_38
// %bb.35:                              // %if.then78
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB234_50
// %bb.36:                              // %if.then.i362
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.77
	add	x2, x2, :lo12:.L.str.77
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	mov	x22, x0
	ldur	w0, [x29, #-92]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB234_51
.LBB234_37:                             // %if.else.i379
	mov	x2, x0
	b	.LBB234_52
.LBB234_38:                             // %if.end83
	mov	x0, x19
	bl	halide_get_gpu_device
	ldr	w8, [sp, #36]
	mov	w9, #-1
	cmp	w8, #1                  // =1
	ccmp	w0, w9, #0, eq
	csel	w23, wzr, w0, eq
	cmp	w8, #1                  // =1
	b.eq	.LBB234_45
// %bb.39:                              // %if.end83
	cmn	w0, #1                  // =1
	b.ne	.LBB234_45
// %bb.40:                              // %for.cond95.preheader
	cbz	w8, .LBB234_56
// %bb.41:                              // %for.body98.lr.ph
	adrp	x27, :got:_ZN6Halide7Runtime8Internal6OpenCL15clGetDeviceInfoE
	ldr	x27, [x27, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clGetDeviceInfoE]
	mov	x24, xzr
	mov	w25, wzr
	mov	w23, #-1
	add	x26, sp, #40            // =40
	b	.LBB234_43
.LBB234_42:                             // %cleanup118
                                        //   in Loop: Header=BB234_43 Depth=1
	ldr	w8, [sp, #36]
	add	x24, x24, #1            // =1
	cmp	x24, x8
	b.hs	.LBB234_45
.LBB234_43:                             // %for.body98
                                        // =>This Inner Loop Header: Depth=1
	ldr	x0, [x26, x24, lsl #3]
	ldr	x8, [x27]
	mov	x3, sp
	mov	w1, #4098
	mov	w2, #4
	mov	x4, xzr
	str	wzr, [sp]
	blr	x8
	stur	w0, [x29, #-92]
	cbnz	w0, .LBB234_42
// %bb.44:                              // %if.end108
                                        //   in Loop: Header=BB234_43 Depth=1
	ldr	w8, [sp]
	cmp	w8, w25
	csel	w23, w23, w24, lo
	csel	w25, w25, w8, lo
	b	.LBB234_42
.LBB234_45:                             // %if.end131
	tbnz	w23, #31, .LBB234_57
// %bb.46:                              // %if.end131
	cmp	w23, w8
	b.ge	.LBB234_57
// %bb.47:                              // %if.end138
	add	x8, sp, #40             // =40
	adrp	x10, :got:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE
	ldr	x8, [x8, w23, sxtw #3]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE]
	mov	w9, #4228
	stp	x9, x22, [sp]
	mov	x0, sp
	ldr	x9, [x10]
	add	x2, sp, #24             // =24
	sub	x5, x29, #92            // =92
	mov	w1, #1
	mov	x3, xzr
	mov	x4, xzr
	stp	xzr, x8, [sp, #16]
	blr	x9
	str	x0, [x21]
	ldur	w8, [x29, #-92]
	cbz	w8, .LBB234_61
// %bb.48:                              // %if.then148
	mov	w0, w8
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB234_64
// %bb.49:                              // %if.then.i478
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.86
	add	x2, x2, :lo12:.L.str.86
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	mov	x22, x0
	ldur	w0, [x29, #-92]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB234_65
	b	.LBB234_66
.LBB234_50:                             // %if.then78.split
	adrp	x2, .L.str.77
	add	x2, x2, :lo12:.L.str.77
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, x0
	mov	x21, xzr
	ldur	w0, [x29, #-92]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB234_37
.LBB234_51:                             // %if.then.i377
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
.LBB234_52:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit382
	mov	x0, x22
	mov	x1, x21
	bl	halide_string_to_string
	cbnz	x20, .LBB234_20
.LBB234_53:                             // %if.then.i298
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB234_54:                             // %cleanup190
	bl	halide_free
	ldur	w0, [x29, #-92]
.LBB234_55:                             // %cleanup190
	ldp	x29, x30, [sp, #432]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #416]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #400]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #384]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #368]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #352]    // 16-byte Folded Reload
	add	sp, sp, #448            // =448
	ret
.LBB234_56:
	mov	w23, #-1
.LBB234_57:                             // %if.then134
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	cbz	x0, .LBB234_59
// %bb.58:                              // %if.else.i449
	add	x21, x0, #1023          // =1023
	adrp	x2, .L.str.84
	add	x2, x2, :lo12:.L.str.84
	mov	x1, x21
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sxtw	x2, w23
	mov	w3, #1
	mov	x1, x21
	bl	halide_int64_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB234_60
.LBB234_59:                             // %if.then.i443
	adrp	x2, .L.str.84
	add	x2, x2, :lo12:.L.str.84
	mov	x1, xzr
	bl	halide_string_to_string
	sxtw	x2, w23
	mov	w3, #1
	mov	x1, xzr
	bl	halide_int64_to_string
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB234_60:                             // %cleanup183
	bl	halide_free
	mov	w0, #-1
	b	.LBB234_55
.LBB234_61:                             // %if.else158
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL20clCreateCommandQueueE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL20clCreateCommandQueueE]
	ldr	x1, [sp, #24]
	sub	x3, x29, #92            // =92
	mov	x2, xzr
	ldr	x8, [x8]
	blr	x8
	str	x0, [x20]
	ldur	w0, [x29, #-92]
	cbz	w0, .LBB234_55
// %bb.62:                              // %if.then167
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB234_68
// %bb.63:                              // %if.then.i412
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.89
	add	x2, x2, :lo12:.L.str.89
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	mov	x22, x0
	ldur	w0, [x29, #-92]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB234_69
	b	.LBB234_70
.LBB234_64:                             // %if.then148.split
	adrp	x2, .L.str.86
	add	x2, x2, :lo12:.L.str.86
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, x0
	mov	x21, xzr
	ldur	w0, [x29, #-92]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB234_66
.LBB234_65:                             // %if.else.i495
	mov	x2, x0
	b	.LBB234_67
.LBB234_66:                             // %if.then.i493
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
.LBB234_67:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit498
	mov	x0, x22
	mov	x1, x21
	bl	halide_string_to_string
	adrp	x2, .L.str.87
	add	x2, x2, :lo12:.L.str.87
	mov	x1, x21
	bl	halide_string_to_string
	ldursw	x2, [x29, #-92]
	mov	w3, #1
	mov	x1, x21
	bl	halide_int64_to_string
	cbnz	x20, .LBB234_20
	b	.LBB234_71
.LBB234_68:                             // %if.then167.split
	adrp	x2, .L.str.89
	add	x2, x2, :lo12:.L.str.89
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, x0
	mov	x21, xzr
	ldur	w0, [x29, #-92]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB234_70
.LBB234_69:                             // %if.else.i316
	mov	x2, x0
	mov	x0, x22
	mov	x1, x21
	bl	halide_string_to_string
	cbnz	x20, .LBB234_20
	b	.LBB234_71
.LBB234_70:                             // %if.then.i314
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x22
	mov	x1, x21
	bl	halide_string_to_string
	cbnz	x20, .LBB234_20
.LBB234_71:                             // %if.then.i458
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	b	.LBB234_21
.Lfunc_end234:
	.size	_ZN6Halide7Runtime8Internal6OpenCL21create_opencl_contextEPvPP11_cl_contextPP17_cl_command_queue, .Lfunc_end234-_ZN6Halide7Runtime8Internal6OpenCL21create_opencl_contextEPvPP11_cl_contextPP17_cl_command_queue
                                        // -- End function
	.section	.text.halide_opencl_get_platform_name,"ax",@progbits
	.weak	halide_opencl_get_platform_name // -- Begin function halide_opencl_get_platform_name
	.p2align	2
	.type	halide_opencl_get_platform_name,@function
halide_opencl_get_platform_name:        // @halide_opencl_get_platform_name
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x19, :got:_ZN6Halide7Runtime8Internal6OpenCL18platform_name_lockE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL18platform_name_lockE]
	mov	w8, #1
	add	x29, sp, #16            // =16
.LBB235_1:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w9, [x19]
	stlxr	w10, w8, [x19]
	orr	w9, w10, w9
	cbnz	w9, .LBB235_1
// %bb.2:                               // %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL25platform_name_initializedE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL25platform_name_initializedE]
	ldrb	w8, [x8]
	cbnz	w8, .LBB235_4
// %bb.3:                               // %if.then
	adrp	x0, .L.str.53.229
	add	x0, x0, :lo12:.L.str.53.229
	bl	getenv
	bl	halide_opencl_set_platform_name
.LBB235_4:                              // %if.end
	adrp	x0, :got:_ZN6Halide7Runtime8Internal6OpenCL13platform_nameE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL13platform_nameE]
	stlr	wzr, [x19]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end235:
	.size	halide_opencl_get_platform_name, .Lfunc_end235-halide_opencl_get_platform_name
                                        // -- End function
	.section	.text.halide_opencl_get_device_type,"ax",@progbits
	.weak	halide_opencl_get_device_type // -- Begin function halide_opencl_get_device_type
	.p2align	2
	.type	halide_opencl_get_device_type,@function
halide_opencl_get_device_type:          // @halide_opencl_get_device_type
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x19, :got:_ZN6Halide7Runtime8Internal6OpenCL16device_type_lockE
	ldr	x19, [x19, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL16device_type_lockE]
	mov	w8, #1
	add	x29, sp, #16            // =16
.LBB236_1:                              // %atomicrmw.start
                                        // =>This Inner Loop Header: Depth=1
	ldaxr	w9, [x19]
	stlxr	w10, w8, [x19]
	orr	w9, w10, w9
	cbnz	w9, .LBB236_1
// %bb.2:                               // %_ZN6Halide7Runtime8Internal14ScopedSpinLockC2EPVi.exit
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL23device_type_initializedE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23device_type_initializedE]
	ldrb	w8, [x8]
	cbnz	w8, .LBB236_4
// %bb.3:                               // %if.then
	adrp	x0, .L.str.54.228
	add	x0, x0, :lo12:.L.str.54.228
	bl	getenv
	bl	halide_opencl_set_device_type
.LBB236_4:                              // %if.end
	adrp	x0, :got:_ZN6Halide7Runtime8Internal6OpenCL11device_typeE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL11device_typeE]
	stlr	wzr, [x19]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end236:
	.size	halide_opencl_get_device_type, .Lfunc_end236-halide_opencl_get_device_type
                                        // -- End function
	.section	.text.halide_opencl_set_device_type,"ax",@progbits
	.weak	halide_opencl_set_device_type // -- Begin function halide_opencl_set_device_type
	.p2align	2
	.type	halide_opencl_set_device_type,@function
halide_opencl_set_device_type:          // @halide_opencl_set_device_type
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	x29, sp
	cbz	x0, .LBB237_2
// %bb.1:                               // %if.then
	mov	x1, x0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal6OpenCL11device_typeE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL11device_typeE]
	mov	w2, #255
	bl	strncpy
	b	.LBB237_3
.LBB237_2:                              // %if.else
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL11device_typeE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL11device_typeE]
	strb	wzr, [x8]
.LBB237_3:                              // %if.end
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL23device_type_initializedE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23device_type_initializedE]
	mov	w9, #1
	strb	w9, [x8]
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end237:
	.size	halide_opencl_set_device_type, .Lfunc_end237-halide_opencl_set_device_type
                                        // -- End function
	.section	.text.halide_opencl_set_platform_name,"ax",@progbits
	.weak	halide_opencl_set_platform_name // -- Begin function halide_opencl_set_platform_name
	.p2align	2
	.type	halide_opencl_set_platform_name,@function
halide_opencl_set_platform_name:        // @halide_opencl_set_platform_name
// %bb.0:                               // %entry
	stp	x29, x30, [sp, #-16]!   // 16-byte Folded Spill
	mov	x29, sp
	cbz	x0, .LBB238_2
// %bb.1:                               // %if.then
	mov	x1, x0
	adrp	x0, :got:_ZN6Halide7Runtime8Internal6OpenCL13platform_nameE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL13platform_nameE]
	mov	w2, #255
	bl	strncpy
	b	.LBB238_3
.LBB238_2:                              // %if.else
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL13platform_nameE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL13platform_nameE]
	strb	wzr, [x8]
.LBB238_3:                              // %if.end
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL25platform_name_initializedE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL25platform_name_initializedE]
	mov	w9, #1
	strb	w9, [x8]
	ldp	x29, x30, [sp], #16     // 16-byte Folded Reload
	ret
.Lfunc_end238:
	.size	halide_opencl_set_platform_name, .Lfunc_end238-halide_opencl_set_platform_name
                                        // -- End function
	.section	.text.halide_opencl_get_symbol,"ax",@progbits
	.weak	halide_opencl_get_symbol // -- Begin function halide_opencl_get_symbol
	.p2align	2
	.type	halide_opencl_get_symbol,@function
halide_opencl_get_symbol:               // @halide_opencl_get_symbol
// %bb.0:                               // %entry
	stp	x20, x19, [sp, #-32]!   // 16-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	adrp	x20, :got:_ZN6Halide7Runtime8Internal6OpenCL10lib_openclE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL10lib_openclE]
	add	x29, sp, #16            // =16
	mov	x19, x1
	ldr	x0, [x20]
	bl	halide_get_library_symbol
	cbz	x0, .LBB239_2
// %bb.1:                               // %cleanup10
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	ret
.LBB239_2:                              // %for.body.peel
	adrp	x0, .L.str.4.275
	add	x0, x0, :lo12:.L.str.4.275
	bl	halide_load_library
	str	x0, [x20]
	cbz	x0, .LBB239_4
// %bb.3:                               // %cleanup
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x1, x19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_get_library_symbol
.LBB239_4:                              // %for.body
	adrp	x0, .L.str.5.276
	add	x0, x0, :lo12:.L.str.5.276
	bl	halide_load_library
	str	x0, [x20]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	mov	x1, x19
	ldp	x20, x19, [sp], #32     // 16-byte Folded Reload
	b	halide_get_library_symbol
.Lfunc_end239:
	.size	halide_opencl_get_symbol, .Lfunc_end239-halide_opencl_get_symbol
                                        // -- End function
	.section	.text.opencl_device_crop_from_offset,"ax",@progbits
	.weak	opencl_device_crop_from_offset // -- Begin function opencl_device_crop_from_offset
	.p2align	2
	.type	opencl_device_crop_from_offset,@function
opencl_device_crop_from_offset:         // @opencl_device_crop_from_offset
// %bb.0:                               // %entry
	sub	sp, sp, #96             // =96
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	str	x0, [sp]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE]
	mov	x8, sp
	mov	x20, x3
	mov	x21, x2
	ldr	x9, [x9]
	mov	x22, x1
	mov	x19, x0
	add	x23, x8, #8             // =8
	add	x24, x8, #16            // =16
	add	x29, sp, #80            // =80
	stp	xzr, xzr, [sp, #8]
	str	wzr, [sp, #24]
	cbnz	x9, .LBB240_2
// %bb.1:                               // %if.then.i
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv
.LBB240_2:                              // %if.end.i
	mov	w3, #1
	mov	x0, x19
	mov	x1, x23
	mov	x2, x24
	bl	halide_acquire_cl_context
	ldr	x8, [sp, #8]
	str	w0, [sp, #24]
	cbz	x8, .LBB240_5
// %bb.3:                               // %if.end.i
	ldr	x8, [sp, #16]
	mov	w23, w0
	cbz	x8, .LBB240_5
// %bb.4:                               // %_ZN6Halide7Runtime8Internal6OpenCL9ClContextC2EPv.exit
	cbnz	w23, .LBB240_12
	b	.LBB240_6
.LBB240_5:                              // %if.then10.i
	adrp	x1, .L.str.240
	add	x1, x1, :lo12:.L.str.240
	mov	x0, x19
	bl	halide_print
	bl	abort
	ldr	w23, [sp, #24]
	cbnz	w23, .LBB240_12
.LBB240_6:                              // %if.end
	ldr	x8, [x22, #8]
	mov	w0, #16
	str	x8, [x20, #8]
	bl	malloc
	cbz	x0, .LBB240_8
// %bb.7:                               // %if.end6
	adrp	x9, :got:_ZN6Halide7Runtime8Internal6OpenCL17clRetainMemObjectE
	ldr	x8, [x22]
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL17clRetainMemObjectE]
	mov	x24, x0
	ldr	x0, [x8, #8]
	ldr	x9, [x9]
	blr	x9
	ldr	x8, [x22]
	mov	w23, wzr
	ldr	x9, [x8, #8]
	str	x9, [x24, #8]
	ldr	x8, [x8]
	add	x8, x8, x21
	str	x8, [x24]
	str	x24, [x20]
	b	.LBB240_12
.LBB240_8:                              // %if.then4
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	cbz	x0, .LBB240_10
// %bb.9:                               // %if.else.i37
	adrp	x2, .L.str.177
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.177
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB240_11
.LBB240_10:                             // %if.then.i36
	adrp	x2, .L.str.177
	add	x2, x2, :lo12:.L.str.177
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB240_11:                             // %cleanup15
	bl	halide_free
	mov	w23, #-11
.LBB240_12:                             // %cleanup15
	ldr	x0, [sp]
	bl	halide_release_cl_context
	mov	w0, w23
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	add	sp, sp, #96             // =96
	ret
.Lfunc_end240:
	.size	opencl_device_crop_from_offset, .Lfunc_end240-opencl_device_crop_from_offset
                                        // -- End function
	.section	.text.opencl_do_multidimensional_copy,"ax",@progbits
	.weak	opencl_do_multidimensional_copy // -- Begin function opencl_do_multidimensional_copy
	.p2align	2
	.type	opencl_do_multidimensional_copy,@function
opencl_do_multidimensional_copy:        // @opencl_do_multidimensional_copy
// %bb.0:                               // %entry
	sub	sp, sp, #144            // =144
	stp	x26, x25, [sp, #64]     // 16-byte Folded Spill
                                        // kill: def $w5 killed $w5 def $x5
	cmp	w5, #17                 // =17
	mov	x25, x0
	stp	x28, x27, [sp, #48]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #80]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #96]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #112]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #128]    // 16-byte Folded Spill
	add	x29, sp, #128           // =128
	stp	w6, w7, [sp, #40]       // 8-byte Folded Spill
	stp	x3, x4, [sp, #24]       // 16-byte Folded Spill
	str	x1, [sp, #16]           // 8-byte Folded Spill
	b.lt	.LBB241_3
// %bb.1:                               // %if.then
	mov	w1, #1024
	mov	x0, x25
	bl	halide_malloc
	cbz	x0, .LBB241_9
// %bb.2:                               // %if.else.i197
	adrp	x2, .L.str.133
	add	x1, x0, #1023           // =1023
	add	x2, x2, :lo12:.L.str.133
	mov	x20, x0
	strb	wzr, [x0, #1023]
	bl	halide_string_to_string
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x25
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x25
	mov	x1, x20
	bl	halide_error
	mov	x0, x25
	mov	x1, x20
	b	.LBB241_10
.LBB241_3:                              // %if.else
	cbz	w5, .LBB241_12
// %bb.4:                               // %for.cond.preheader
	sxtw	x8, w5
	sub	x27, x8, #1             // =1
	add	x8, x2, x27, lsl #3
	mov	x28, x8
	ldr	w9, [x28, #24]!
	cmp	w9, #1                  // =1
	b.lt	.LBB241_8
// %bb.5:                               // %for.body.lr.ph
	mov	w19, wzr
	mov	x21, xzr
	mov	x22, xzr
	add	x23, x8, #152           // =152
	add	x24, x8, #280           // =280
.LBB241_6:                              // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldp	x1, x8, [sp, #16]       // 16-byte Folded Reload
	ldp	w6, w7, [sp, #40]       // 8-byte Folded Reload
	mov	x0, x25
	mov	w5, w27
	add	x3, x22, x8
	ldr	x8, [sp, #32]           // 8-byte Folded Reload
	mov	x26, x2
	add	x4, x21, x8
	bl	opencl_do_multidimensional_copy
	cbnz	w0, .LBB241_15
// %bb.7:                               // %for.inc
                                        //   in Loop: Header=BB241_6 Depth=1
	ldr	x8, [x23]
	ldr	w9, [x28]
	ldr	x10, [x24]
	add	w19, w19, #1            // =1
	add	x22, x8, x22
	cmp	w19, w9
	add	x21, x10, x21
	mov	x2, x26
	b.lt	.LBB241_6
.LBB241_8:
	mov	w20, wzr
	b	.LBB241_11
.LBB241_9:                              // %if.then.i196
	adrp	x2, .L.str.133
	add	x2, x2, :lo12:.L.str.133
	mov	x1, xzr
	bl	halide_string_to_string
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x25
	bl	halide_error
	mov	x0, x25
	mov	x1, xzr
.LBB241_10:                             // %return
	bl	halide_free
	mov	w20, #-1
.LBB241_11:                             // %return
	mov	w0, w20
	ldp	x29, x30, [sp, #128]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]     // 16-byte Folded Reload
	ldp	x28, x27, [sp, #48]     // 16-byte Folded Reload
	add	sp, sp, #144            // =144
	ret
.LBB241_12:                             // %if.then3
	ldr	w8, [sp, #44]           // 4-byte Folded Reload
	cbz	w8, .LBB241_16
// %bb.13:                              // %if.then3
	ldr	w8, [sp, #40]           // 4-byte Folded Reload
	tbnz	w8, #0, .LBB241_16
// %bb.14:                              // %if.then23
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueReadBufferE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueReadBufferE]
	ldr	x10, [sp, #16]          // 8-byte Folded Reload
	ldr	x4, [x2, #408]
	mov	w6, wzr
	ldr	x8, [x8]
	ldr	x0, [x10, #16]
	ldp	x9, x10, [x2]
	mov	w2, wzr
	mov	x7, xzr
	ldp	x11, x1, [x9]
	ldr	x9, [sp, #24]           // 8-byte Folded Reload
	str	xzr, [sp]
	add	x3, x11, x9
	ldr	x9, [sp, #32]           // 8-byte Folded Reload
	add	x5, x10, x9
	blr	x8
	mov	w20, w0
	cbnz	w0, .LBB241_22
	b	.LBB241_11
.LBB241_15:
	mov	w20, w0
	b	.LBB241_11
.LBB241_16:                             // %if.else30
	ldr	w8, [sp, #40]           // 4-byte Folded Reload
	cbz	w8, .LBB241_19
// %bb.17:                              // %if.else30
	ldr	w8, [sp, #44]           // 4-byte Folded Reload
	tbnz	w8, #0, .LBB241_19
// %bb.18:                              // %if.then34
	adrp	x10, :got:_ZN6Halide7Runtime8Internal6OpenCL20clEnqueueWriteBufferE
	ldp	x8, x9, [x2]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL20clEnqueueWriteBufferE]
	ldr	x11, [sp, #16]          // 8-byte Folded Reload
	ldr	x4, [x2, #408]
	mov	w2, wzr
	ldr	x10, [x10]
	ldr	x0, [x11, #16]
	ldp	x11, x1, [x9]
	ldr	x9, [sp, #32]           // 8-byte Folded Reload
	mov	w6, wzr
	mov	x7, xzr
	str	xzr, [sp]
	add	x3, x11, x9
	ldr	x9, [sp, #24]           // 8-byte Folded Reload
	add	x5, x8, x9
	blr	x10
	mov	w20, w0
	cbnz	w0, .LBB241_22
	b	.LBB241_11
.LBB241_19:                             // %if.else45
	ldr	w8, [sp, #40]           // 4-byte Folded Reload
	tbnz	w8, #0, .LBB241_29
// %bb.20:                              // %if.else45
	ldr	w8, [sp, #44]           // 4-byte Folded Reload
	tbnz	w8, #0, .LBB241_29
// %bb.21:                              // %if.then49
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueCopyBufferE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueCopyBufferE]
	ldr	x9, [sp, #16]           // 8-byte Folded Reload
	ldr	x5, [x2, #408]
	mov	w6, wzr
	ldr	x8, [x8]
	ldr	x0, [x9, #16]
	ldp	x9, x10, [x2]
	mov	x7, xzr
	ldp	x11, x1, [x9]
	ldp	x9, x2, [x10]
	ldr	x10, [sp, #24]          // 8-byte Folded Reload
	str	xzr, [sp]
	add	x3, x11, x10
	ldr	x10, [sp, #32]          // 8-byte Folded Reload
	add	x4, x9, x10
	blr	x8
	mov	w20, w0
	cbz	w0, .LBB241_11
.LBB241_22:                             // %if.then80
	mov	w1, #1024
	mov	x0, x25
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB241_26
// %bb.23:                              // %if.then.i235
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.142
	add	x2, x2, :lo12:.L.str.142
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	mov	x23, x0
	mov	w0, w20
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB241_27
.LBB241_24:                             // %if.else.i219
	mov	x2, x0
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB241_28
.LBB241_25:                             // %if.else.i208
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x25
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x25
	mov	x1, x21
	bl	halide_error
	mov	x0, x25
	mov	x1, x21
	bl	halide_free
	b	.LBB241_11
.LBB241_26:                             // %if.then80.split
	adrp	x2, .L.str.142
	add	x2, x2, :lo12:.L.str.142
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, x0
	mov	x22, xzr
	mov	w0, w20
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB241_24
.LBB241_27:                             // %if.then.i217
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	cbnz	x21, .LBB241_25
.LBB241_28:                             // %if.then.i202
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x25
	bl	halide_error
	mov	x0, x25
	mov	x1, xzr
	bl	halide_free
	b	.LBB241_11
.LBB241_29:                             // %if.else63
	ldp	x9, x8, [x2]
	ldr	x10, [sp, #32]          // 8-byte Folded Reload
	add	x0, x8, x10
	ldr	x8, [sp, #24]           // 8-byte Folded Reload
	add	x1, x9, x8
	cmp	x0, x1
	b.eq	.LBB241_8
// %bb.30:                              // %if.then69
	ldr	x2, [x2, #408]
	bl	memcpy
	b	.LBB241_8
.Lfunc_end241:
	.size	opencl_do_multidimensional_copy, .Lfunc_end241-opencl_do_multidimensional_copy
                                        // -- End function
	.section	.text.halide_opencl_cleanup,"ax",@progbits
	.weak	halide_opencl_cleanup   // -- Begin function halide_opencl_cleanup
	.p2align	2
	.type	halide_opencl_cleanup,@function
halide_opencl_cleanup:                  // @halide_opencl_cleanup
// %bb.0:                               // %entry
	mov	x0, xzr
	b	halide_opencl_device_release
.Lfunc_end242:
	.size	halide_opencl_cleanup, .Lfunc_end242-halide_opencl_cleanup
                                        // -- End function
	.section	.text.halide_opencl_initialize_kernels,"ax",@progbits
	.weak	halide_opencl_initialize_kernels // -- Begin function halide_opencl_initialize_kernels
	.p2align	2
	.type	halide_opencl_initialize_kernels,@function
halide_opencl_initialize_kernels:       // @halide_opencl_initialize_kernels
// %bb.0:                               // %entry
	str	x28, [sp, #-80]!        // 8-byte Folded Spill
	stp	x24, x23, [sp, #16]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #32]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #48]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #64]     // 16-byte Folded Spill
	add	x29, sp, #64            // =64
	sub	sp, sp, #2, lsl #12     // =8192
	sub	sp, sp, #64             // =64
	stur	x0, [x29, #-96]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE]
	sub	x8, x29, #96            // =96
	mov	w20, w3
	mov	x23, x2
	ldr	x9, [x9]
	mov	x22, x1
	mov	x19, x0
	add	x21, x8, #8             // =8
	add	x24, x8, #16            // =16
	stp	xzr, xzr, [x29, #-88]
	stur	wzr, [x29, #-72]
	cbnz	x9, .LBB243_2
// %bb.1:                               // %if.then.i161
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv
.LBB243_2:                              // %if.end.i163
	mov	w3, #1
	mov	x0, x19
	mov	x1, x21
	mov	x2, x24
	bl	halide_acquire_cl_context
	ldur	x8, [x29, #-88]
	stur	w0, [x29, #-72]
	cbz	x8, .LBB243_14
// %bb.3:                               // %if.end.i163
	ldur	x8, [x29, #-80]
	mov	w24, w0
	cbz	x8, .LBB243_14
// %bb.4:                               // %_ZN6Halide7Runtime8Internal6OpenCL9ClContextC2EPv.exit
	cbnz	w24, .LBB243_30
.LBB243_5:                              // %if.end
	ldr	x8, [x22]
	cbnz	x8, .LBB243_7
// %bb.6:                               // %if.end11
	mov	w0, #16
	bl	malloc
	str	x0, [x22]
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL10state_listE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL10state_listE]
	ldr	x9, [x8]
	str	x0, [x8]
	stp	xzr, x9, [x0]
	ldr	x8, [x22]
	cbz	x8, .LBB243_18
.LBB243_7:                              // %land.lhs.true
	cmp	w20, #2                 // =2
	b.lt	.LBB243_29
// %bb.8:                               // %land.lhs.true
	ldr	x8, [x8]
	cbnz	x8, .LBB243_29
.LBB243_9:                              // %if.then17
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL16clGetContextInfoE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL16clGetContextInfoE]
	ldur	x0, [x29, #-88]
	sub	x3, x29, #104           // =104
	mov	w1, #4225
	ldr	x8, [x8]
	mov	w2, #8
	mov	x4, xzr
	stur	wzr, [x29, #-52]
	blr	x8
	stur	w0, [x29, #-52]
	cbz	w0, .LBB243_15
// %bb.10:                              // %if.then20
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB243_19
// %bb.11:                              // %if.then.i172
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.100
	add	x2, x2, :lo12:.L.str.100
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	mov	x22, x0
	ldur	w0, [x29, #-52]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB243_20
.LBB243_12:                             // %if.else.i188
	mov	x2, x0
	mov	x0, x22
	mov	x1, x21
	bl	halide_string_to_string
	cbz	x20, .LBB243_21
.LBB243_13:                             // %if.else.i199
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB243_22
.LBB243_14:                             // %if.then10.i
	adrp	x1, .L.str.240
	add	x1, x1, :lo12:.L.str.240
	mov	x0, x19
	bl	halide_print
	bl	abort
	ldur	w24, [x29, #-72]
	cbnz	w24, .LBB243_30
	b	.LBB243_5
.LBB243_15:                             // %if.end25
	adrp	x20, :got:_ZN6Halide7Runtime8Internal6OpenCL15clGetDeviceInfoE
	ldur	x0, [x29, #-104]
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clGetDeviceInfoE]
	sub	x3, x29, #120           // =120
	mov	w1, #4128
	mov	w2, #8
	ldr	x8, [x20]
	mov	x4, xzr
	stp	xzr, x0, [x29, #-120]
	blr	x8
	stur	w0, [x29, #-52]
	cbz	w0, .LBB243_23
// %bb.16:                              // %if.then28
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB243_31
// %bb.17:                              // %if.then.i213
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.101
	add	x2, x2, :lo12:.L.str.101
	b	.LBB243_26
.LBB243_18:                             // %land.lhs.true15
	cmp	w20, #2                 // =2
	b.ge	.LBB243_9
	b	.LBB243_29
.LBB243_19:                             // %if.then20.split
	adrp	x2, .L.str.100
	add	x2, x2, :lo12:.L.str.100
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, x0
	mov	x21, xzr
	ldur	w0, [x29, #-52]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB243_12
.LBB243_20:                             // %if.then.i186
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x22
	mov	x1, x21
	bl	halide_string_to_string
	cbnz	x20, .LBB243_13
.LBB243_21:                             // %if.then.i193
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB243_22:                             // %cleanup101.thread
	bl	halide_free
	ldur	w24, [x29, #-52]
	b	.LBB243_30
.LBB243_23:                             // %if.end33
	ldr	x8, [x20]
	ldur	x0, [x29, #-104]
	sub	x3, x29, #56            // =56
	mov	w1, #4129
	mov	w2, #4
	mov	x4, xzr
	stur	wzr, [x29, #-56]
	blr	x8
	mov	w21, w0
	stur	w0, [x29, #-52]
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	w21, .LBB243_32
// %bb.24:                              // %if.then36
	cbz	x20, .LBB243_34
// %bb.25:                              // %if.then.i257
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.102
	add	x2, x2, :lo12:.L.str.102
.LBB243_26:                             // %if.then.i213
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	mov	x22, x0
	ldur	w0, [x29, #-52]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB243_36
.LBB243_27:                             // %if.else.i230
	mov	x2, x0
	mov	x0, x22
	mov	x1, x21
	bl	halide_string_to_string
	cbz	x20, .LBB243_37
.LBB243_28:                             // %if.else.i243
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	bl	halide_free
	ldur	w24, [x29, #-52]
	mov	w22, #1
	cbnz	w22, .LBB243_30
.LBB243_29:                             // %if.end103
	mov	w24, wzr
.LBB243_30:                             // %cleanup105
	ldur	x0, [x29, #-96]
	bl	halide_release_cl_context
	mov	w0, w24
	add	sp, sp, #2, lsl #12     // =8192
	add	sp, sp, #64             // =64
	ldp	x29, x30, [sp, #64]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]     // 16-byte Folded Reload
	ldr	x28, [sp], #80          // 8-byte Folded Reload
	ret
.LBB243_31:                             // %if.then28.split
	adrp	x2, .L.str.101
	add	x2, x2, :lo12:.L.str.101
	b	.LBB243_35
.LBB243_32:                             // %if.end41
	cbz	x20, .LBB243_38
// %bb.33:                              // %if.then.i301
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.103
	add	x2, x2, :lo12:.L.str.103
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	b	.LBB243_39
.LBB243_34:                             // %if.then36.split
	adrp	x2, .L.str.102
	add	x2, x2, :lo12:.L.str.102
	mov	x0, xzr
.LBB243_35:                             // %if.then28.split
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, x0
	mov	x21, xzr
	ldur	w0, [x29, #-52]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB243_27
.LBB243_36:                             // %if.then.i228
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x22
	mov	x1, x21
	bl	halide_string_to_string
	cbnz	x20, .LBB243_28
.LBB243_37:                             // %if.then.i237
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
	bl	halide_free
	ldur	w24, [x29, #-52]
	mov	w22, #1
	cbnz	w22, .LBB243_30
	b	.LBB243_29
.LBB243_38:                             // %if.end41.split
	adrp	x2, .L.str.103
	add	x2, x2, :lo12:.L.str.103
	mov	x0, xzr
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x21, xzr
.LBB243_39:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EEC2EPvPc.exit
	ldur	x2, [x29, #-120]
	mov	w3, #1
	mov	x1, x21
	bl	halide_uint64_to_string
	adrp	x2, .L.str.104
	add	x2, x2, :lo12:.L.str.104
	mov	x1, x21
	bl	halide_string_to_string
	ldur	w2, [x29, #-56]
	mov	w3, #1
	mov	x1, x21
	bl	halide_uint64_to_string
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL25clCreateProgramWithSourceE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL25clCreateProgramWithSourceE]
	mov	x21, x0
	ldur	x0, [x29, #-88]
	sub	x2, x29, #128           // =128
	ldr	x8, [x8]
	sub	x4, x29, #52            // =52
	mov	w1, #1
	mov	x3, xzr
	stur	x23, [x29, #-128]
	blr	x8
	ldur	w8, [x29, #-52]
	cbz	w8, .LBB243_43
// %bb.40:                              // %if.then53
	mov	w0, w8
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x22, x0
	cbz	x0, .LBB243_45
// %bb.41:                              // %if.then.i331
	add	x23, x22, #1023         // =1023
	adrp	x2, .L.str.106
	add	x2, x2, :lo12:.L.str.106
	mov	x0, x22
	mov	x1, x23
	strb	wzr, [x22, #1023]
	bl	halide_string_to_string
	mov	x24, x0
	ldur	w0, [x29, #-52]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB243_46
.LBB243_42:                             // %if.else.i348
	mov	x2, x0
	mov	x0, x24
	mov	x1, x23
	bl	halide_string_to_string
	cbnz	x22, .LBB243_62
	b	.LBB243_47
.LBB243_43:                             // %if.else
	ldr	x8, [x22]
	mov	x23, x0
	str	x0, [x8]
	cbz	x20, .LBB243_49
// %bb.44:                              // %if.then.i383
	sub	x8, x21, x20
	add	x22, x8, #1             // =1
	mov	x0, x19
	mov	x1, x20
	mov	x2, x22
	bl	halide_msan_annotate_memory_is_initialized
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL14clBuildProgramE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL14clBuildProgramE]
	mov	x0, x19
	mov	x1, x20
	mov	x2, x22
	ldr	x24, [x8]
	bl	halide_msan_annotate_memory_is_initialized
	mov	x3, x20
	b	.LBB243_50
.LBB243_45:                             // %if.then53.split
	adrp	x2, .L.str.106
	add	x2, x2, :lo12:.L.str.106
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x24, x0
	mov	x23, xzr
	ldur	w0, [x29, #-52]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB243_42
.LBB243_46:                             // %if.then.i346
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x24
	mov	x1, x23
	bl	halide_string_to_string
	cbnz	x22, .LBB243_62
.LBB243_47:                             // %if.then.i355
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
	bl	halide_free
	ldur	w24, [x29, #-52]
	mov	w22, #1
	cbnz	x20, .LBB243_64
.LBB243_48:                             // %if.then.i
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
	bl	halide_free
	cbnz	w22, .LBB243_30
	b	.LBB243_29
.LBB243_49:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE3strEv.exit.thread
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL14clBuildProgramE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL14clBuildProgramE]
	adrp	x3, .L.str.242
	add	x3, x3, :lo12:.L.str.242
	ldr	x24, [x8]
.LBB243_50:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi2ELy1024EE3strEv.exit385
	sub	x2, x29, #112           // =112
	mov	w1, #1
	mov	x0, x23
	mov	x4, xzr
	mov	x5, xzr
	blr	x24
	stur	w0, [x29, #-52]
	cbz	w0, .LBB243_54
// %bb.51:                              // %if.then77
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL21clGetProgramBuildInfoE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL21clGetProgramBuildInfoE]
	ldur	x1, [x29, #-104]
	mov	x4, sp
	mov	w2, #4483
	ldr	x8, [x8]
	mov	w3, #8192
	mov	x0, x23
	mov	x5, xzr
	blr	x8
	mov	w23, w0
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x22, x0
	cbz	w23, .LBB243_55
// %bb.52:                              // %if.else90
	cbz	x22, .LBB243_58
// %bb.53:                              // %if.else.i147
	adrp	x2, .L.str.110
	add	x1, x22, #1023          // =1023
	add	x2, x2, :lo12:.L.str.110
	mov	x0, x22
	strb	wzr, [x22, #1023]
	bl	halide_string_to_string
	b	.LBB243_62
.LBB243_54:
	mov	w22, wzr
                                        // implicit-def: $w24
	cbnz	x20, .LBB243_64
	b	.LBB243_48
.LBB243_55:                             // %if.then81
	cbz	x22, .LBB243_59
// %bb.56:                              // %if.then.i394
	add	x23, x22, #1023         // =1023
	adrp	x2, .L.str.108
	add	x2, x2, :lo12:.L.str.108
	mov	x0, x22
	mov	x1, x23
	strb	wzr, [x22, #1023]
	bl	halide_string_to_string
	mov	x24, x0
	ldur	w0, [x29, #-52]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB243_60
.LBB243_57:                             // %if.else.i411
	mov	x2, x0
	b	.LBB243_61
.LBB243_58:                             // %if.then.i141
	adrp	x2, .L.str.110
	add	x2, x2, :lo12:.L.str.110
	mov	x0, xzr
	mov	x1, xzr
	bl	halide_string_to_string
	b	.LBB243_65
.LBB243_59:                             // %if.then81.split
	adrp	x2, .L.str.108
	add	x2, x2, :lo12:.L.str.108
	mov	x0, xzr
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x24, x0
	mov	x23, xzr
	ldur	w0, [x29, #-52]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB243_57
.LBB243_60:                             // %if.then.i409
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
.LBB243_61:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit414
	mov	x0, x24
	mov	x1, x23
	bl	halide_string_to_string
	adrp	x2, .L.str.109
	add	x2, x2, :lo12:.L.str.109
	mov	x1, x23
	bl	halide_string_to_string
	mov	x2, sp
	mov	x1, x23
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x23
	bl	halide_string_to_string
	cbz	x22, .LBB243_65
.LBB243_62:                             // %if.end93
	sub	x8, x0, x22
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x22
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x22
.LBB243_63:                             // %if.end93
	bl	halide_error
	mov	x0, x19
	mov	x1, x22
	bl	halide_free
	ldur	w24, [x29, #-52]
	mov	w22, #1
	cbz	x20, .LBB243_48
.LBB243_64:                             // %if.else.i
	sub	x8, x21, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_free
	cbnz	w22, .LBB243_30
	b	.LBB243_29
.LBB243_65:                             // %if.then.i436
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	b	.LBB243_63
.Lfunc_end243:
	.size	halide_opencl_initialize_kernels, .Lfunc_end243-halide_opencl_initialize_kernels
                                        // -- End function
	.section	.text.halide_opencl_run,"ax",@progbits
	.weak	halide_opencl_run       // -- Begin function halide_opencl_run
	.p2align	2
	.type	halide_opencl_run,@function
halide_opencl_run:                      // @halide_opencl_run
// %bb.0:                               // %entry
	sub	sp, sp, #240            // =240
	stp	x28, x27, [sp, #144]    // 16-byte Folded Spill
	stp	x26, x25, [sp, #160]    // 16-byte Folded Spill
	stp	x24, x23, [sp, #176]    // 16-byte Folded Spill
	stp	x22, x21, [sp, #192]    // 16-byte Folded Spill
	stp	x20, x19, [sp, #208]    // 16-byte Folded Spill
	stp	x29, x30, [sp, #224]    // 16-byte Folded Spill
	str	x0, [sp, #104]
	adrp	x9, :got:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE
	ldr	x9, [x9, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE]
	add	x8, sp, #104            // =104
	mov	w23, w7
	mov	w25, w6
	ldr	x9, [x9]
	mov	w22, w5
	mov	w24, w4
	mov	w26, w3
	mov	x20, x2
	mov	x21, x1
	mov	x19, x0
	add	x27, x8, #8             // =8
	add	x28, x8, #16            // =16
	add	x29, sp, #224           // =224
	stp	xzr, xzr, [sp, #112]
	str	wzr, [sp, #128]
	cbnz	x9, .LBB244_2
// %bb.1:                               // %if.then.i408
	mov	x0, x19
	bl	_ZN6Halide7Runtime8Internal6OpenCL14load_libopenclEPv
.LBB244_2:                              // %if.end.i410
	mov	w3, #1
	mov	x0, x19
	mov	x1, x27
	mov	x2, x28
	bl	halide_acquire_cl_context
	ldr	x8, [sp, #112]
	str	w0, [sp, #128]
	cbz	x8, .LBB244_11
// %bb.3:                               // %if.end.i410
	ldr	x8, [sp, #120]
	mov	w27, w0
	cbz	x8, .LBB244_11
// %bb.4:                               // %_ZN6Halide7Runtime8Internal6OpenCL9ClContextC2EPv.exit
	cbnz	w27, .LBB244_98
.LBB244_5:                              // %if.end
	cbz	x21, .LBB244_12
// %bb.6:                               // %if.end25
	ldr	x21, [x21]
	cbz	x21, .LBB244_13
.LBB244_7:                              // %if.end29
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL14clCreateKernelE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL14clCreateKernelE]
	sub	x2, x29, #84            // =84
	mov	x0, x21
	mov	x1, x20
	ldr	x8, [x8]
	blr	x8
	ldur	w8, [x29, #-84]
	cbz	w8, .LBB244_14
// %bb.8:                               // %if.then35
	mov	w0, w8
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB244_22
// %bb.9:                               // %if.then.i434
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.159
	add	x2, x2, :lo12:.L.str.159
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	cbz	x20, .LBB244_23
.LBB244_10:                             // %if.else.i451
	mov	x1, x22
	mov	x2, x20
	b	.LBB244_24
.LBB244_11:                             // %if.then10.i
	adrp	x1, .L.str.240
	add	x1, x1, :lo12:.L.str.240
	mov	x0, x19
	bl	halide_print
	bl	abort
	ldr	w27, [sp, #128]
	cbnz	w27, .LBB244_98
	b	.LBB244_5
.LBB244_12:                             // %if.then24
	adrp	x1, .L.str.156
	add	x1, x1, :lo12:.L.str.156
	mov	x0, x19
	bl	halide_print
	bl	abort
	ldr	x21, [x21]
	cbnz	x21, .LBB244_7
.LBB244_13:                             // %if.then28
	adrp	x1, .L.str.157
	add	x1, x1, :lo12:.L.str.157
	mov	x0, x19
	bl	halide_print
	bl	abort
	b	.LBB244_7
.LBB244_14:                             // %if.end47
	ldr	w8, [x29, #16]
	ldr	x28, [x29, #32]
	sxtw	x9, w25
	sxtw	x11, w23
	smull	x10, w25, w26
	smull	x12, w23, w24
	stp	x9, x11, [sp, #56]
	sxtw	x9, w8
	smull	x8, w8, w22
	stp	x10, x12, [sp, #80]
	str	x8, [sp, #96]
	str	x9, [sp, #72]
	adrp	x27, :got:_ZN6Halide7Runtime8Internal6OpenCL14clSetKernelArgE
	ldr	x2, [x28]
	ldr	x27, [x27, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL14clSetKernelArgE]
	mov	x21, x0
	cbz	x2, .LBB244_29
// %bb.15:                              // %while.body.preheader
	ldp	x20, x23, [x29, #40]
	mov	x8, xzr
	mov	w9, wzr
	ldrb	w10, [x23, x8]
	cbnz	w10, .LBB244_18
.LBB244_16:                             // %if.end70
	add	x10, x28, x8, lsl #3
	ldr	x10, [x10, #8]
	add	x8, x8, #1              // =1
	cbz	x10, .LBB244_19
.LBB244_17:                             // %while.body
	ldrb	w10, [x23, x8]
	cbz	w10, .LBB244_16
.LBB244_18:                             // %land.lhs.true
	ldr	x10, [x20, x8, lsl #3]
	ldr	x10, [x10]
	ldr	x10, [x10]
	cmp	x10, #0                 // =0
	cinc	w9, w9, ne
	add	x10, x28, x8, lsl #3
	ldr	x10, [x10, #8]
	add	x8, x8, #1              // =1
	cbnz	x10, .LBB244_17
.LBB244_19:                             // %while.end
	cmp	w9, #1                  // =1
	b.lt	.LBB244_31
// %bb.20:                              // %if.then72
	sbfiz	x22, x9, #3, #32
	mov	x0, x22
	bl	malloc
	cbz	x0, .LBB244_88
// %bb.21:                              // %if.end78
	mov	w1, wzr
	mov	x2, x22
	mov	x24, x0
	bl	memset
	ldr	x2, [x28]
	mov	x25, x24
	str	x24, [sp, #16]          // 8-byte Folded Spill
	cbnz	x2, .LBB244_32
	b	.LBB244_30
.LBB244_22:                             // %if.then35.split
	adrp	x2, .L.str.159
	add	x2, x2, :lo12:.L.str.159
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, xzr
	cbnz	x20, .LBB244_10
.LBB244_23:                             // %if.then.i449
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x1, x22
.LBB244_24:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit454
	bl	halide_string_to_string
	adrp	x2, .L.str.160
	add	x2, x2, :lo12:.L.str.160
	mov	x1, x22
	bl	halide_string_to_string
	ldur	w8, [x29, #-84]
	mov	x20, x0
	mov	w0, w8
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB244_26
// %bb.25:                              // %if.else.i467
	mov	x2, x0
	b	.LBB244_27
.LBB244_26:                             // %if.then.i465
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
.LBB244_27:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit470
	mov	x0, x20
	mov	x1, x22
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB244_96
// %bb.28:                              // %if.else.i486
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	b	.LBB244_97
.LBB244_29:
	mov	x25, xzr
	str	xzr, [sp, #16]          // 8-byte Folded Spill
.LBB244_30:
	mov	w22, wzr
	mov	w26, wzr
	b	.LBB244_73
.LBB244_31:
	str	xzr, [sp, #16]          // 8-byte Folded Spill
	mov	x25, xzr
	cbz	x2, .LBB244_30
.LBB244_32:                             // %while.body87.lr.ph
	mov	x22, xzr
	mov	w26, wzr
.LBB244_33:                             // %while.body87
                                        // =>This Loop Header: Depth=1
                                        //     Child Loop BB244_46 Depth 2
	ldr	x24, [x20, x22, lsl #3]
	str	wzr, [sp, #52]
	ldrb	w8, [x23, x22]
	cbz	w8, .LBB244_40
// %bb.34:                              // %if.then111
                                        //   in Loop: Header=BB244_33 Depth=1
	cmp	x2, #8                  // =8
	b.eq	.LBB244_36
// %bb.35:                              // %if.then115
                                        //   in Loop: Header=BB244_33 Depth=1
	adrp	x1, .L.str.164
	mov	x0, x19
	add	x1, x1, :lo12:.L.str.164
	bl	halide_print
	bl	abort
.LBB244_36:                             // %if.end116
                                        //   in Loop: Header=BB244_33 Depth=1
	ldr	x8, [x24]
	ldr	x0, [x8, #8]
	str	x0, [sp, #40]
	ldr	x8, [x8]
	cbz	x8, .LBB244_68
// %bb.37:                              // %if.then123
                                        //   in Loop: Header=BB244_33 Depth=1
	str	x8, [sp, #24]
	ldrsw	x8, [x24, #36]
	cmp	w8, #0                  // =0
	b.le	.LBB244_41
// %bb.38:                              // %for.body.lr.ph.i.i
                                        //   in Loop: Header=BB244_33 Depth=1
	ldr	x9, [x24, #40]
	cmp	w8, #3                  // =3
	b.hs	.LBB244_42
// %bb.39:                              //   in Loop: Header=BB244_33 Depth=1
	mov	x11, xzr
	mov	x10, xzr
	b	.LBB244_49
.LBB244_40:                             // %if.else138
                                        //   in Loop: Header=BB244_33 Depth=1
	ldr	x8, [x27]
	mov	x0, x21
	mov	w1, w22
	mov	x3, x24
	b	.LBB244_70
.LBB244_41:                             // %_ZNK15halide_buffer_t3endEv.exit.thread.i
                                        //   in Loop: Header=BB244_33 Depth=1
	ldrb	w11, [x24, #33]
	mov	x12, xzr
	mov	w8, #1
	b	.LBB244_67
.LBB244_42:                             // %vector.ph37
                                        //   in Loop: Header=BB244_33 Depth=1
	and	x11, x8, #0xfffffffffffffffe
	mov	x10, xzr
	mov	x12, xzr
	add	x13, x9, #24            // =24
	mov	x14, x11
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.ge	.LBB244_45
	b	.LBB244_46
.LBB244_43:                             // %pred.load.continue51
                                        //   in Loop: Header=BB244_46 Depth=2
	sub	w17, w17, #1            // =1
	sub	w18, w18, #1            // =1
	cmp	w16, #0                 // =0
	mul	w16, w17, w16
	mul	w17, w18, w15
	csel	w16, w16, wzr, gt
	cmp	w15, #0                 // =0
	csel	w15, w17, wzr, gt
	add	x10, x10, w16, sxtw
	subs	x14, x14, #2            // =2
	add	x12, x12, w15, sxtw
	add	x13, x13, #32           // =32
	b.eq	.LBB244_48
// %bb.44:                              // %vector.body33
                                        //   in Loop: Header=BB244_46 Depth=2
	ldur	w16, [x13, #-16]
	ldr	w15, [x13]
                                        // implicit-def: $w17
	cmp	w16, #1                 // =1
	b.lt	.LBB244_46
.LBB244_45:                             // %pred.load.if48
                                        //   in Loop: Header=BB244_33 Depth=1
	ldur	w17, [x13, #-20]
.LBB244_46:                             // %pred.load.continue49
                                        //   Parent Loop BB244_33 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	cmp	w15, #1                 // =1
                                        // implicit-def: $w18
	b.lt	.LBB244_43
// %bb.47:                              // %pred.load.if50
                                        //   in Loop: Header=BB244_46 Depth=2
	ldur	w18, [x13, #-4]
	b	.LBB244_43
.LBB244_48:                             // %middle.block34
                                        //   in Loop: Header=BB244_33 Depth=1
	cmp	x11, x8
	add	x10, x12, x10
	b.eq	.LBB244_53
.LBB244_49:                             // %for.body.i.i.preheader
                                        //   in Loop: Header=BB244_33 Depth=1
	sub	x12, x8, x11
	add	x11, x9, x11, lsl #4
	add	x11, x11, #8            // =8
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.ge	.LBB244_52
.LBB244_50:                             // %for.inc.i.i
                                        //   in Loop: Header=BB244_33 Depth=1
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.eq	.LBB244_53
.LBB244_51:                             // %for.body.i.i
                                        //   in Loop: Header=BB244_33 Depth=1
	ldrsw	x13, [x11]
	cmp	w13, #1                 // =1
	b.lt	.LBB244_50
.LBB244_52:                             // %if.then.i.i
                                        //   in Loop: Header=BB244_33 Depth=1
	ldursw	x14, [x11, #-4]
	sub	x14, x14, #1            // =1
	madd	x10, x14, x13, x10
	subs	x12, x12, #1            // =1
	add	x11, x11, #16           // =16
	b.ne	.LBB244_51
.LBB244_53:                             // %for.body.lr.ph.i5.i
                                        //   in Loop: Header=BB244_33 Depth=1
	ldrb	w11, [x24, #33]
	cmp	w8, #3                  // =3
	b.hs	.LBB244_55
// %bb.54:                              //   in Loop: Header=BB244_33 Depth=1
	mov	x13, xzr
	mov	x12, xzr
	b	.LBB244_62
.LBB244_55:                             // %vector.ph
                                        //   in Loop: Header=BB244_33 Depth=1
	and	x13, x8, #0xfffffffffffffffe
	mov	x12, xzr
	mov	x14, xzr
	add	x15, x9, #24            // =24
	mov	x16, x13
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w1
	tbz	w17, #31, .LBB244_58
	b	.LBB244_59
.LBB244_56:                             // %pred.load.continue31
                                        //   in Loop: Header=BB244_33 Depth=1
	sub	w1, w1, #1              // =1
	sub	w2, w2, #1              // =1
	mul	w1, w1, w17
	mul	w2, w2, w18
	and	w17, w1, w17, asr #31
	and	w18, w2, w18, asr #31
	subs	x16, x16, #2            // =2
	add	x12, x12, w17, sxtw
	add	x14, x14, w18, sxtw
	add	x15, x15, #32           // =32
	b.eq	.LBB244_61
// %bb.57:                              // %vector.body
                                        //   in Loop: Header=BB244_33 Depth=1
	ldur	w17, [x15, #-16]
	ldr	w18, [x15]
                                        // implicit-def: $w1
	tbnz	w17, #31, .LBB244_59
.LBB244_58:                             // %pred.load.continue
                                        //   in Loop: Header=BB244_33 Depth=1
                                        // implicit-def: $w2
	tbz	w18, #31, .LBB244_56
	b	.LBB244_60
.LBB244_59:                             // %pred.load.if
                                        //   in Loop: Header=BB244_33 Depth=1
	ldur	w1, [x15, #-20]
                                        // implicit-def: $w2
	tbz	w18, #31, .LBB244_56
.LBB244_60:                             // %pred.load.if30
                                        //   in Loop: Header=BB244_33 Depth=1
	ldur	w2, [x15, #-4]
	b	.LBB244_56
.LBB244_61:                             // %middle.block
                                        //   in Loop: Header=BB244_33 Depth=1
	cmp	x13, x8
	add	x12, x14, x12
	b.eq	.LBB244_66
.LBB244_62:                             // %for.body.i16.i.preheader
                                        //   in Loop: Header=BB244_33 Depth=1
	add	x9, x9, x13, lsl #4
	sub	x8, x8, x13
	add	x9, x9, #8              // =8
	ldrsw	x13, [x9]
	tbnz	w13, #31, .LBB244_65
.LBB244_63:                             // %for.inc.i26.i
                                        //   in Loop: Header=BB244_33 Depth=1
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	b.eq	.LBB244_66
.LBB244_64:                             // %for.body.i16.i
                                        //   in Loop: Header=BB244_33 Depth=1
	ldrsw	x13, [x9]
	tbz	w13, #31, .LBB244_63
.LBB244_65:                             // %if.then.i22.i
                                        //   in Loop: Header=BB244_33 Depth=1
	ldursw	x14, [x9, #-4]
	sub	x14, x14, #1            // =1
	madd	x12, x14, x13, x12
	subs	x8, x8, #1              // =1
	add	x9, x9, #16             // =16
	b.ne	.LBB244_64
.LBB244_66:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit.loopexit
                                        //   in Loop: Header=BB244_33 Depth=1
	add	x8, x10, #1             // =1
.LBB244_67:                             // %_ZNK15halide_buffer_t13size_in_bytesEv.exit
                                        //   in Loop: Header=BB244_33 Depth=1
	adrp	x10, :got:_ZN6Halide7Runtime8Internal6OpenCL17clCreateSubBufferE
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL17clCreateSubBufferE]
	add	x9, x11, #7             // =7
	lsr	x9, x9, #3
	sub	x8, x8, x12
	ldr	x10, [x10]
	mul	x8, x8, x9
	add	x3, sp, #24             // =24
	add	x4, sp, #52             // =52
	mov	w1, #1
	mov	w2, #4640
	str	x8, [sp, #32]
	blr	x10
	add	w8, w26, #1             // =1
	str	x0, [sp, #40]
	str	x0, [x25, w26, sxtw #3]
	mov	w26, w8
.LBB244_68:                             // %if.end129
                                        //   in Loop: Header=BB244_33 Depth=1
	ldr	w0, [sp, #52]
	cbnz	w0, .LBB244_71
// %bb.69:                              // %if.then131
                                        //   in Loop: Header=BB244_33 Depth=1
	ldr	x8, [x27]
	add	x3, sp, #40             // =40
	mov	w2, #8
	mov	x0, x21
	mov	w1, w22
.LBB244_70:                             // %if.end142
                                        //   in Loop: Header=BB244_33 Depth=1
	blr	x8
	str	w0, [sp, #52]
.LBB244_71:                             // %if.end142
                                        //   in Loop: Header=BB244_33 Depth=1
	cbnz	w0, .LBB244_86
// %bb.72:                              // %cleanup
                                        //   in Loop: Header=BB244_33 Depth=1
	add	x22, x22, #1            // =1
	ldr	x2, [x28, x22, lsl #3]
	cbnz	x2, .LBB244_33
.LBB244_73:                             // %while.end157
	ldr	w8, [x29, #24]
	ldr	x9, [x27]
	mov	x0, x21
	mov	w1, w22
	cmp	w8, #1                  // =1
	csinc	w2, w8, wzr, gt
	mov	x3, xzr
	blr	x9
	stur	w0, [x29, #-84]
	cbz	w0, .LBB244_77
// %bb.74:                              // %if.then168
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB244_83
// %bb.75:                              // %if.then.i402
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.168
	add	x2, x2, :lo12:.L.str.168
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	mov	x22, x0
	ldur	w0, [x29, #-84]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB244_84
.LBB244_76:                             // %if.else.i384
	mov	x2, x0
	mov	x0, x22
	mov	x1, x21
	bl	halide_string_to_string
	cbnz	x20, .LBB244_85
	b	.LBB244_96
.LBB244_77:                             // %if.end173
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL22clEnqueueNDRangeKernelE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL22clEnqueueNDRangeKernelE]
	ldr	x0, [sp, #120]
	add	x4, sp, #80             // =80
	add	x5, sp, #56             // =56
	ldr	x8, [x8]
	mov	w2, #3
	mov	x1, x21
	mov	x3, xzr
	mov	w6, wzr
	mov	x7, xzr
	str	xzr, [sp]
	blr	x8
	stur	w0, [x29, #-84]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cmp	w26, #1                 // =1
	b.lt	.LBB244_80
// %bb.78:                              // %for.body198.preheader
	adrp	x22, :got:_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE
	ldr	x22, [x22, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE]
	mov	w20, w26
.LBB244_79:                             // %for.body198
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x22]
	ldr	x0, [x25], #8
	blr	x8
	subs	x20, x20, #1            // =1
	b.ne	.LBB244_79
.LBB244_80:                             // %for.cond.cleanup197
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	bl	free
	ldur	w8, [x29, #-84]
	cbz	w8, .LBB244_89
// %bb.81:                              // %if.then207
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x20, x0
	cbz	x0, .LBB244_90
// %bb.82:                              // %if.then.i360
	add	x21, x20, #1023         // =1023
	adrp	x2, .L.str.170
	add	x2, x2, :lo12:.L.str.170
	mov	x0, x20
	mov	x1, x21
	strb	wzr, [x20, #1023]
	bl	halide_string_to_string
	mov	x22, x0
	ldur	w0, [x29, #-84]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB244_91
	b	.LBB244_94
.LBB244_83:                             // %if.then168.split
	adrp	x2, .L.str.168
	add	x2, x2, :lo12:.L.str.168
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, x0
	mov	x21, xzr
	ldur	w0, [x29, #-84]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB244_76
.LBB244_84:                             // %if.then.i382
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x22
	mov	x1, x21
	bl	halide_string_to_string
	cbz	x20, .LBB244_96
.LBB244_85:                             // %if.else.i372
	sub	x8, x0, x20
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x20
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x20
	bl	halide_error
	mov	x0, x19
	mov	x1, x20
	b	.LBB244_97
.LBB244_86:                             // %if.then144
	mov	w1, #1024
	mov	x0, x19
	bl	halide_malloc
	mov	x21, x0
	cbz	x0, .LBB244_92
// %bb.87:                              // %if.then.i517
	add	x22, x21, #1023         // =1023
	adrp	x2, .L.str.166
	add	x2, x2, :lo12:.L.str.166
	mov	x0, x21
	mov	x1, x22
	strb	wzr, [x21, #1023]
	bl	halide_string_to_string
	mov	x23, x0
	ldr	w0, [sp, #52]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbnz	x0, .LBB244_93
	b	.LBB244_99
.LBB244_88:
	mov	w27, #-11
	b	.LBB244_98
.LBB244_89:                             // %if.end213
	adrp	x8, :got:_ZN6Halide7Runtime8Internal6OpenCL15clReleaseKernelE
	ldr	x8, [x8, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL15clReleaseKernelE]
	mov	x0, x21
	ldr	x8, [x8]
	blr	x8
	mov	w27, wzr
	b	.LBB244_98
.LBB244_90:                             // %if.then207.split
	adrp	x2, .L.str.170
	add	x2, x2, :lo12:.L.str.170
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x22, x0
	mov	x21, xzr
	ldur	w0, [x29, #-84]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB244_94
.LBB244_91:                             // %if.else.i346
	mov	x2, x0
	b	.LBB244_95
.LBB244_92:                             // %if.then144.split
	adrp	x2, .L.str.166
	add	x2, x2, :lo12:.L.str.166
	mov	x1, xzr
	bl	halide_string_to_string
	mov	x23, x0
	mov	x22, xzr
	ldr	w0, [sp, #52]
	bl	_ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	cbz	x0, .LBB244_99
.LBB244_93:                             // %if.else.i498
	mov	x2, x0
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	cbnz	x21, .LBB244_100
	b	.LBB244_101
.LBB244_94:                             // %if.then.i344
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
.LBB244_95:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EElsEPKc.exit
	mov	x0, x22
	mov	x1, x21
	bl	halide_string_to_string
	adrp	x2, .L.str.3.232
	add	x2, x2, :lo12:.L.str.3.232
	mov	x1, x21
	bl	halide_string_to_string
	cbnz	x20, .LBB244_85
.LBB244_96:                             // %if.then.i480
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
.LBB244_97:                             // %_ZN6Halide7Runtime8Internal12_GLOBAL__N_17PrinterILi1ELy1024EED2Ev.exit491
	bl	halide_free
	ldur	w27, [x29, #-84]
.LBB244_98:                             // %cleanup231
	ldr	x0, [sp, #104]
	bl	halide_release_cl_context
	mov	w0, w27
	ldp	x29, x30, [sp, #224]    // 16-byte Folded Reload
	ldp	x20, x19, [sp, #208]    // 16-byte Folded Reload
	ldp	x22, x21, [sp, #192]    // 16-byte Folded Reload
	ldp	x24, x23, [sp, #176]    // 16-byte Folded Reload
	ldp	x26, x25, [sp, #160]    // 16-byte Folded Reload
	ldp	x28, x27, [sp, #144]    // 16-byte Folded Reload
	add	sp, sp, #240            // =240
	ret
.LBB244_99:                             // %if.then.i496
	adrp	x2, .L.str.243
	add	x2, x2, :lo12:.L.str.243
	mov	x0, x23
	mov	x1, x22
	bl	halide_string_to_string
	cbz	x21, .LBB244_101
.LBB244_100:                            // %if.else.i420
	sub	x8, x0, x21
	add	x2, x8, #1              // =1
	mov	x0, x19
	mov	x1, x21
	bl	halide_msan_annotate_memory_is_initialized
	mov	x0, x19
	mov	x1, x21
	bl	halide_error
	mov	x0, x19
	mov	x1, x21
	bl	halide_free
	cmp	w26, #1                 // =1
	b.ge	.LBB244_102
	b	.LBB244_104
.LBB244_101:                            // %if.then.i414
	adrp	x1, .L.str.242
	add	x1, x1, :lo12:.L.str.242
	mov	x0, x19
	bl	halide_error
	mov	x0, x19
	mov	x1, xzr
	bl	halide_free
	cmp	w26, #1                 // =1
	b.lt	.LBB244_104
.LBB244_102:                            // %for.body.preheader
	adrp	x20, :got:_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE
	ldr	x20, [x20, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE]
	mov	w19, w26
.LBB244_103:                            // %for.body
                                        // =>This Inner Loop Header: Depth=1
	ldr	x8, [x20]
	ldr	x0, [x25], #8
	blr	x8
	subs	x19, x19, #1            // =1
	b.ne	.LBB244_103
.LBB244_104:                            // %cleanup.thread
	ldr	x0, [sp, #16]           // 8-byte Folded Reload
	bl	free
	ldr	w27, [sp, #52]
	b	.LBB244_98
.Lfunc_end244:
	.size	halide_opencl_run, .Lfunc_end244-halide_opencl_run
                                        // -- End function
	.section	.text.halide_opencl_get_cl_mem,"ax",@progbits
	.weak	halide_opencl_get_cl_mem // -- Begin function halide_opencl_get_cl_mem
	.p2align	2
	.type	halide_opencl_get_cl_mem,@function
halide_opencl_get_cl_mem:               // @halide_opencl_get_cl_mem
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldr	x8, [x1]
	add	x29, sp, #16            // =16
	cbz	x8, .LBB245_4
// %bb.1:                               // %if.end
	adrp	x10, :got:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE
	ldr	x9, [x1, #8]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE]
	mov	x19, x1
	cmp	x9, x10
	b.eq	.LBB245_3
// %bb.2:                               // %if.then2
	adrp	x1, .L.str.175
	add	x1, x1, :lo12:.L.str.175
	bl	halide_print
	bl	abort
	ldr	x8, [x19]
.LBB245_3:                              // %if.end3
	ldr	x0, [x8, #8]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.LBB245_4:
	mov	x0, xzr
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end245:
	.size	halide_opencl_get_cl_mem, .Lfunc_end245-halide_opencl_get_cl_mem
                                        // -- End function
	.section	.text.halide_opencl_get_crop_offset,"ax",@progbits
	.weak	halide_opencl_get_crop_offset // -- Begin function halide_opencl_get_crop_offset
	.p2align	2
	.type	halide_opencl_get_crop_offset,@function
halide_opencl_get_crop_offset:          // @halide_opencl_get_crop_offset
// %bb.0:                               // %entry
	str	x19, [sp, #-32]!        // 8-byte Folded Spill
	stp	x29, x30, [sp, #16]     // 16-byte Folded Spill
	ldr	x8, [x1]
	add	x29, sp, #16            // =16
	cbz	x8, .LBB246_4
// %bb.1:                               // %if.end
	adrp	x10, :got:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE
	ldr	x9, [x1, #8]
	ldr	x10, [x10, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE]
	mov	x19, x1
	cmp	x9, x10
	b.eq	.LBB246_3
// %bb.2:                               // %if.then2
	adrp	x1, .L.str.176
	add	x1, x1, :lo12:.L.str.176
	bl	halide_print
	bl	abort
	ldr	x8, [x19]
.LBB246_3:                              // %if.end3
	ldr	x0, [x8]
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.LBB246_4:
	mov	x0, xzr
	ldp	x29, x30, [sp, #16]     // 16-byte Folded Reload
	ldr	x19, [sp], #32          // 8-byte Folded Reload
	ret
.Lfunc_end246:
	.size	halide_opencl_get_crop_offset, .Lfunc_end246-halide_opencl_get_crop_offset
                                        // -- End function
	.section	.text.halide_opencl_device_interface,"ax",@progbits
	.weak	halide_opencl_device_interface // -- Begin function halide_opencl_device_interface
	.p2align	2
	.type	halide_opencl_device_interface,@function
halide_opencl_device_interface:         // @halide_opencl_device_interface
// %bb.0:                               // %entry
	adrp	x0, :got:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE
	ldr	x0, [x0, :got_lo12:_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE]
	ret
.Lfunc_end247:
	.size	halide_opencl_device_interface, .Lfunc_end247-halide_opencl_device_interface
                                        // -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               // -- Begin function halide_blur
.LCPI248_0:
	.word	1                       // 0x1
	.word	0                       // 0x0
	.section	.text.halide_blur,"ax",@progbits
	.globl	halide_blur
	.p2align	2
	.type	halide_blur,@function
halide_blur:                            // @halide_blur
// %bb.0:                               // %entry
	stp	x28, x27, [sp, #-96]!   // 16-byte Folded Spill
	stp	x26, x25, [sp, #16]     // 16-byte Folded Spill
	stp	x24, x23, [sp, #32]     // 16-byte Folded Spill
	stp	x22, x21, [sp, #48]     // 16-byte Folded Spill
	stp	x20, x19, [sp, #64]     // 16-byte Folded Spill
	stp	x29, x30, [sp, #80]     // 16-byte Folded Spill
	sub	sp, sp, #3, lsl #12     // =12288
	sub	sp, sp, #2352           // =2352
	mov	x19, x1
	adrp	x1, module_state_halide_blur_opencl
	adrp	x2, .Lhalide_halide_blur_opencl_kernel_src
	mov	x21, x0
	add	x1, x1, :lo12:module_state_halide_blur_opencl
	add	x2, x2, :lo12:.Lhalide_halide_blur_opencl_kernel_src
	mov	w3, #42341
	mov	x0, xzr
	bl	halide_opencl_initialize_kernels
	cbnz	w0, .LBB248_21
// %bb.1:                               // %"assert succeeded35"
	cbz	x21, .LBB248_22
// %bb.2:                               // %"assert succeeded"
	cbz	x19, .LBB248_23
// %bb.3:                               // %"assert succeeded2"
	add	x0, sp, #3, lsl #12     // =12288
	add	x1, x19, #32            // =32
	add	x0, x0, #2348           // =2348
	mov	w2, #4
	bl	memcpy
	ldr	x8, [x19, #40]
	ldr	w26, [sp, #14636]
	ldr	w23, [x19, #36]
	add	x0, sp, #3, lsl #12     // =12288
	ldp	w27, w20, [x8]
	ldr	w24, [x8, #8]
	ldr	w29, [x8, #24]
	ldp	w22, w28, [x8, #16]
                                        // kill: def $w28 killed $w28 def $x28
	add	x1, x21, #32            // =32
	add	x0, x0, #2348           // =2348
	mov	w2, #4
	sxtw	x28, w28
	bl	memcpy
	sub	w9, w20, #1             // =1
	sub	w12, w28, #1            // =1
	asr	w17, w9, #1
	and	w18, w12, #0xfffffff8
	orr	w12, w17, #0x1f
	cmp	w17, w12
	csel	w12, w17, w12, lt
	sub	w8, w20, #2             // =2
	lsl	w0, w12, #1
	cmp	w0, w8
	ldr	x13, [x21, #40]
	mov	w10, #31
	csel	w15, w0, w8, lt
	cmp	w17, #31                // =31
	csel	w10, w17, w10, lt
	add	w11, w20, #60           // =60
	lsl	w10, w10, #1
	cmp	w10, w11
	ldr	w2, [sp, #14636]
	ldr	w3, [x21, #36]
	mov	w14, #8
	ldr	x16, [x19, #16]
	ldp	w9, w4, [x13]
	ldr	w5, [x13, #8]
	csel	w11, w10, w11, lt
	subs	w10, w28, #8            // =8
	ldp	w12, w7, [x13, #16]
	ldr	w25, [x13, #24]
	csel	w6, w28, w14, lt
	cmp	w18, w10
	add	w13, w0, #2             // =2
	csel	w14, w18, w10, lt
	cmp	w13, w20
	csel	w13, w13, w20, lt
	cbnz	x16, .LBB248_5
// %bb.4:                               // %_halide_buffer_is_bounds_query.exit
	ldr	x16, [x19]
	cbz	x16, .LBB248_8
.LBB248_5:                              // %after_bb
	ldr	x16, [x21, #16]
	cbnz	x16, .LBB248_9
.LBB248_6:                              // %_halide_buffer_is_bounds_query.exit73
	ldr	x16, [x21]
	cbnz	x16, .LBB248_9
// %bb.7:                               // %true_bb3
	adrp	x1, .LCPI248_0
	ldr	d0, [x1, :lo12:.LCPI248_0]
	add	w17, w27, w11
	sub	w18, w13, w11
	mov	x1, #4097
	sub	w17, w17, #62           // =62
	add	w18, w18, #64           // =64
	movk	x1, #1, lsl #16
	stp	w17, w18, [sp, #176]
	str	d0, [sp, #184]
	ldr	x16, [x21, #40]
	movk	x1, #2, lsl #32
	ldr	q0, [sp, #176]
	cmp	w28, #8                 // =8
	str	x1, [x21, #32]
	mov	w1, #8
	add	w0, w22, w6
	csel	w1, w28, w1, gt
	sub	w0, w0, #8              // =8
	add	w1, w1, #2              // =2
	stp	xzr, xzr, [x21, #8]
	str	xzr, [x21]
	stp	w18, wzr, [sp, #200]
	stp	w0, w1, [sp, #192]
	str	q0, [x16]
	ldr	x16, [x21, #40]
	ldr	q0, [sp, #192]
	str	q0, [x16, #16]
	str	xzr, [x21, #24]
	ldr	x16, [x19, #16]
	cbnz	x16, .LBB248_10
	b	.LBB248_13
.LBB248_8:                              // %true_bb
	adrp	x1, .LCPI248_0
	ldr	d0, [x1, :lo12:.LCPI248_0]
	sub	w16, w15, w11
	add	w18, w27, w11
	sub	w18, w18, #62           // =62
	add	w16, w16, #64           // =64
	mov	x1, #4097
	stp	w18, w16, [sp, #144]
	str	d0, [sp, #152]
	ldr	x17, [x19, #40]
	movk	x1, #1, lsl #16
	ldr	q0, [sp, #144]
	movk	x1, #2, lsl #32
	add	w0, w22, w6
	str	x1, [x19, #32]
	sub	w1, w14, w6
	sub	w0, w0, #8              // =8
	add	w1, w1, #16             // =16
	stp	xzr, xzr, [x19, #8]
	str	xzr, [x19]
	stp	w0, w1, [sp, #160]
	stp	w16, wzr, [sp, #168]
	str	q0, [x17]
	ldr	x16, [x19, #40]
	ldr	q0, [sp, #160]
	str	q0, [x16, #16]
	str	xzr, [x19, #24]
	ldr	x16, [x21, #16]
	cbz	x16, .LBB248_6
.LBB248_9:                              // %after_bb5
	ldr	x16, [x19, #16]
	cbz	x16, .LBB248_13
.LBB248_10:
	mov	w16, wzr
	ldr	x17, [x21, #16]
	cbz	x17, .LBB248_14
.LBB248_11:
	mov	w17, wzr
	orr	w16, w16, w17
	tbz	w16, #0, .LBB248_15
.LBB248_12:
	mov	w0, wzr
	b	.LBB248_21
.LBB248_13:                             // %land.rhs.i98
	ldr	x16, [x19]
	cmp	x16, #0                 // =0
	cset	w16, eq
	ldr	x17, [x21, #16]
	cbnz	x17, .LBB248_11
.LBB248_14:                             // %land.rhs.i104
	ldr	x17, [x21]
	cmp	x17, #0                 // =0
	cset	w17, eq
	orr	w16, w16, w17
	tbnz	w16, #0, .LBB248_12
.LBB248_15:                             // %true_bb6
	sxtw	x16, w4
	str	x4, [sp, #120]          // 8-byte Folded Spill
	mov	w4, #4097
	stp	w5, w8, [sp, #132]      // 8-byte Folded Spill
	cmp	w28, #8                 // =8
	movk	w4, #1, lsl #16
	add	w8, w15, w27
	add	w15, w14, w22
	mov	w14, w26
	str	w6, [sp, #100]          // 4-byte Folded Spill
	sxtw	x17, w7
	cset	w6, lt
	stp	w14, w8, [sp, #92]      // 8-byte Folded Spill
	cmp	w14, w4
	mov	w14, w23
	stp	x29, x20, [sp, #104]    // 16-byte Folded Spill
	mov	w10, w24
	sxtw	x24, w20
	lsr	x0, x20, #26
	add	w26, w28, w22
	add	w20, w13, w27
	str	w15, [sp, #88]          // 4-byte Folded Spill
	add	w30, w15, #8            // =8
	add	w1, w17, w12
	mov	w15, w3
	mov	w3, w22
	mov	w22, w12
	cset	w12, ne
	cmp	w14, #2                 // =2
	mov	w13, w2
	cset	w2, ne
	cmp	w13, w4
	cset	w4, ne
	cmp	w15, #2                 // =2
	mov	x29, x7
	add	w7, w8, #2              // =2
	add	w18, w24, w27
	and	x23, x0, #0x20
	bfi	x12, x2, #1, #1
	cset	w2, ne
	cmp	w11, #62                // =62
	orr	x12, x12, x23
	cset	w23, lt
	cmp	w7, w18
	mov	w5, w9
	cset	w7, gt
	cmp	w30, w26
	add	w8, w20, #2             // =2
	add	w0, w16, w9
	orr	w7, w23, w7
	cset	w30, gt
	subs	w23, w27, w5
	orr	w6, w6, w30
	cset	w30, lt
	cmp	w8, w0
	add	w9, w26, #2             // =2
	cset	w8, gt
	cmp	w22, w3
	orr	w8, w30, w8
	cset	w30, gt
	cmp	w9, w1
	cset	w9, gt
	cmp	w10, #1                 // =1
	orr	w9, w30, w9
	cset	w30, ne
	bfi	x12, x30, #11, #1
	bfi	x12, x4, #2, #1
	orr	x12, x12, x2, lsl #3
	orr	x12, x12, x6, lsl #6
	ldr	x6, [sp, #120]          // 8-byte Folded Reload
	ldr	w4, [sp, #132]          // 4-byte Folded Reload
	orr	x12, x12, x7, lsl #4
	str	w22, [sp, #140]         // 4-byte Folded Spill
	lsr	x2, x6, #23
	and	x2, x2, #0x100
	cmp	w4, #1                  // =1
	orr	x12, x12, x2
	cset	w2, ne
	orr	x12, x12, x2, lsl #12
	orr	x8, x12, x8, lsl #7
	lsr	x12, x29, #21
	and	x12, x12, #0x400
	orr	x8, x8, x12
	orr	x8, x8, x9, lsl #9
	orr	x8, x8, #0x8000000000000000
	rbit	x8, x8
	clz	x4, x8
	cmp	w4, #12                 // =12
	str	w3, [sp, #128]          // 4-byte Folded Spill
	b.ls	.LBB248_25
// %bb.16:                              // %no_errors_bb
	ldr	x22, [sp, #104]         // 8-byte Folded Reload
	cmp	x24, #0                 // =0
	sxtw	x11, w25
	cneg	x9, x24, mi
	sxtw	x10, w22
	mul	x12, x11, x17
	lsr	x11, x9, #31
	mul	x10, x10, x28
	cmp	x11, #0                 // =0
	cset	w14, ne
	cmp	x10, #0                 // =0
	cneg	x10, x10, mi
	lsr	x11, x10, #31
	mul	x2, x28, x24
	mov	w13, #2147483647
	cmp	x11, #0                 // =0
	cset	w15, ne
	cmp	x2, x13
	mul	x8, x17, x16
	cset	w17, gt
	cmp	x16, #0                 // =0
	cneg	x11, x16, mi
	lsr	x16, x11, #31
	bfi	x14, x17, #2, #1
	cmp	x16, #0                 // =0
	bfi	x14, x15, #1, #1
	cset	w15, ne
	cmp	x12, #0                 // =0
	cneg	x12, x12, mi
	lsr	x16, x12, #31
	cmp	x16, #0                 // =0
	cset	w16, ne
	cmp	x8, x13
	cset	w13, gt
	bfi	x14, x15, #3, #1
	bfi	x14, x13, #5, #1
	orr	x13, x14, x16, lsl #4
	orr	x13, x13, #0x8000000000000000
	rbit	x13, x13
	clz	x13, x13
	cmp	w13, #5                 // =5
	b.ls	.LBB248_27
// %bb.17:                              // %"produce blur_y"
	bl	halide_opencl_device_interface
	mov	x2, x0
	mov	x0, xzr
	mov	x1, x19
	bl	halide_copy_to_device
	ldr	x20, [sp, #112]         // 8-byte Folded Reload
	cbnz	w0, .LBB248_21
// %bb.18:                              // %"assert succeeded29"
	bl	halide_opencl_device_interface
	mov	x2, x0
	mov	x0, xzr
	mov	x1, x21
	bl	halide_copy_to_device
	cbnz	w0, .LBB248_21
// %bb.19:                              // %"assert succeeded31"
	lsl	w7, w25, #1
	str	w7, [sp, #14536]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2252           // =2252
	str	x7, [sp, #224]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2248           // =2248
	str	x7, [sp, #216]
	mov	w7, #4
	dup	v0.2d, x7
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2260           // =2260
	str	x7, [sp, #240]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2256           // =2256
	str	x7, [sp, #232]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2268           // =2268
	str	x7, [sp, #256]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2264           // =2264
	str	x7, [sp, #248]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2276           // =2276
	str	x7, [sp, #272]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2272           // =2272
	str	x7, [sp, #264]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2284           // =2284
	str	x7, [sp, #288]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2280           // =2280
	str	x7, [sp, #280]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2292           // =2292
	str	x7, [sp, #304]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2288           // =2288
	str	x7, [sp, #296]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2300           // =2300
	str	x7, [sp, #320]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2296           // =2296
	str	x7, [sp, #312]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2308           // =2308
	str	x7, [sp, #336]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2304           // =2304
	str	x7, [sp, #328]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2316           // =2316
	str	x7, [sp, #352]
	add	x7, sp, #3, lsl #12     // =12288
	ldr	w1, [sp, #128]          // 4-byte Folded Reload
	add	x7, x7, #2312           // =2312
	str	x7, [sp, #344]
	add	x7, sp, #3, lsl #12     // =12288
	add	x7, x7, #2324           // =2324
	str	x7, [sp, #368]
	add	x7, sp, #3, lsl #12     // =12288
	mneg	w8, w1, w22
	ldp	w0, w6, [sp, #136]      // 8-byte Folded Reload
	add	x7, x7, #2320           // =2320
	str	x7, [sp, #360]
	str	w8, [sp, #14612]
	add	x8, sp, #3, lsl #12     // =12288
	asr	w7, w20, #6
	mul	w14, w1, w22
	add	x18, sp, #3, lsl #12    // =12288
	add	x8, x8, #2332           // =2332
	str	w7, [sp, #14620]
	asr	w7, w28, #3
	sub	w9, w26, #8             // =8
	sub	w10, w26, #7            // =7
	sub	w11, w26, #6            // =6
	sub	w12, w26, #5            // =5
	sub	w13, w26, #4            // =4
	sub	w15, w26, #3            // =3
	sub	w16, w26, #2            // =2
	sub	w17, w26, #1            // =1
	add	x18, x18, #2244         // =2244
	neg	w14, w14
	str	x8, [sp, #384]
	add	x8, sp, #3, lsl #12     // =12288
	str	w7, [sp, #14624]
	add	x7, sp, #3, lsl #12     // =12288
	str	w0, [sp, #14604]
	str	w1, [sp, #14632]
	str	x18, [sp, #208]
	madd	w18, w17, w22, w14
	madd	w0, w16, w22, w14
	madd	w1, w15, w22, w14
	madd	w2, w13, w22, w14
	madd	w3, w12, w22, w14
	madd	w4, w11, w22, w14
	madd	w5, w10, w22, w14
	madd	w14, w9, w22, w14
	mul	w6, w6, w25
	madd	w9, w25, w9, w23
	add	x8, x8, #2328           // =2328
	add	x7, x7, #2340           // =2340
	str	x8, [sp, #376]
	add	x8, sp, #3, lsl #12     // =12288
	movi	v1.2d, #0000000000000000
	str	x7, [sp, #400]
	add	x7, sp, #3, lsl #12     // =12288
	sub	w9, w9, w6
	madd	w10, w25, w10, w23
	add	x8, x8, #1392           // =1392
	add	x7, x7, #2336           // =2336
	str	q1, [sp, #13680]
	movi	v1.2d, #0000000000000000
	mov	w20, #1
	str	w9, [sp, #14600]
	adrp	x9, module_state_halide_blur_opencl
	madd	w17, w25, w17, w23
	madd	w16, w25, w16, w23
	madd	w15, w25, w15, w23
	madd	w13, w25, w13, w23
	madd	w12, w25, w12, w23
	madd	w11, w25, w11, w23
	str	x7, [sp, #392]
	add	x7, sp, #3, lsl #12     // =12288
	str	d1, [sp, #13696]
	strh	wzr, [x8, #24]
	strb	w20, [x8, #26]
	strb	w20, [x8, #27]
	strb	wzr, [x8, #28]
	sub	w8, w23, w6
	sub	w10, w10, w6
	str	w1, [sp, #14556]
	ldr	x1, [x9, :lo12:module_state_halide_blur_opencl]
	add	x7, x7, #2344           // =2344
	sub	w17, w17, w6
	sub	w16, w16, w6
	sub	w15, w15, w6
	sub	w13, w13, w6
	sub	w12, w12, w6
	sub	w11, w11, w6
	sub	w6, w24, #63            // =63
	str	w8, [sp, #14616]
	str	w10, [sp, #14592]
	add	w8, w28, #7             // =7
	add	w10, w24, #63           // =63
	str	x7, [sp, #408]
	mov	w7, #8
	asr	w6, w6, #1
	str	w2, [sp, #14564]
	str	w3, [sp, #14572]
	str	w4, [sp, #14580]
	asr	w4, w8, #3
	asr	w3, w10, #6
	add	x8, sp, #3, lsl #12     // =12288
	add	x10, sp, #1, lsl #12    // =4096
	adrp	x2, .Lentry_name
	dup	v1.2d, x7
	str	w6, [sp, #14608]
	str	w0, [sp, #14548]
	str	w5, [sp, #14588]
	add	x8, x8, #1392           // =1392
	add	x9, sp, #208            // =208
	add	x10, x10, #2848         // =2848
	add	x2, x2, :lo12:.Lentry_name
	mov	w5, #1
	mov	w6, #32
	mov	w7, #1
	mov	x0, xzr
	str	w22, [sp, #14532]
	stp	x19, x21, [sp, #416]
	str	w25, [sp, #14628]
	str	w18, [sp, #14540]
	str	w17, [sp, #14544]
	str	w16, [sp, #14552]
	str	w15, [sp, #14560]
	str	w13, [sp, #14568]
	str	w12, [sp, #14576]
	str	w11, [sp, #14584]
	str	w14, [sp, #14596]
	str	xzr, [sp, #432]
	str	q0, [sp, #6960]
	str	q0, [sp, #6944]
	str	q0, [sp, #6992]
	str	q0, [sp, #6976]
	str	q0, [sp, #7024]
	str	q0, [sp, #7008]
	str	q0, [sp, #7056]
	str	q0, [sp, #7040]
	str	q0, [sp, #7088]
	str	q0, [sp, #7072]
	str	q0, [sp, #7120]
	str	q0, [sp, #7104]
	str	q1, [sp, #7152]
	str	q0, [sp, #7136]
	str	xzr, [sp, #7168]
	str	wzr, [sp, #64]
	str	wzr, [sp, #56]
	str	xzr, [sp, #48]
	str	wzr, [sp, #40]
	str	wzr, [sp, #8]
	stp	x9, x8, [sp, #24]
	str	x10, [sp, #16]
	str	w20, [sp]
	bl	halide_opencl_run
	cbnz	w0, .LBB248_21
// %bb.20:                              // %"assert succeeded33"
	ldr	x8, [x19, #24]
	orr	x8, x8, #0x2
	str	x8, [x19, #24]
.LBB248_21:                             // %destructor_block
	add	sp, sp, #3, lsl #12     // =12288
	add	sp, sp, #2352           // =2352
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	ret
.LBB248_22:                             // %"assert failed"
	adrp	x1, .Lstr
	add	x1, x1, :lo12:.Lstr
	b	.LBB248_24
.LBB248_23:                             // %"assert failed1"
	adrp	x1, .Lstr.278
	add	x1, x1, :lo12:.Lstr.278
.LBB248_24:                             // %"assert failed"
	mov	x0, xzr
	add	sp, sp, #3, lsl #12     // =12288
	add	sp, sp, #2352           // =2352
	ldp	x29, x30, [sp, #80]     // 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]     // 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]     // 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]     // 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]     // 16-byte Folded Reload
	ldp	x28, x27, [sp], #96     // 16-byte Folded Reload
	b	halide_error_buffer_argument_is_null
.LBB248_25:                             // %true_bb6
	ldp	w24, w16, [sp, #88]     // 8-byte Folded Reload
	ldr	w23, [sp, #96]          // 4-byte Folded Reload
	adrp	x8, .LJTI248_0
	add	x8, x8, :lo12:.LJTI248_0
	adr	x9, .LBB248_26
	ldrb	w12, [x8, x4]
	add	x9, x9, x12, lsl #2
	br	x9
.LBB248_26:                             // %assert_failed
	adrp	x1, .Lstr.279
	mov	w3, #4097
	add	x1, x1, :lo12:.Lstr.279
	movk	w3, #1, lsl #16
	mov	x0, xzr
	mov	w2, w16
	bl	halide_error_bad_type
	b	.LBB248_21
.LBB248_27:                             // %no_errors_bb
	adrp	x14, .LJTI248_1
	add	x14, x14, :lo12:.LJTI248_1
	adr	x15, .LBB248_28
	ldrb	w16, [x14, x13]
	add	x15, x15, x16, lsl #2
	br	x15
.LBB248_28:                             // %assert_failed22
	adrp	x1, .Lstr.278
	add	x1, x1, :lo12:.Lstr.278
	mov	w3, #2147483647
	mov	x0, xzr
	mov	x2, x9
	bl	halide_error_buffer_allocation_too_large
	b	.LBB248_21
.LBB248_29:                             // %assert_failed23
	adrp	x1, .Lstr.278
	add	x1, x1, :lo12:.Lstr.278
	mov	w3, #2147483647
	mov	x0, xzr
	mov	x2, x10
	bl	halide_error_buffer_allocation_too_large
	b	.LBB248_21
.LBB248_30:                             // %assert_failed24
	adrp	x1, .Lstr.278
	add	x1, x1, :lo12:.Lstr.278
	mov	w3, #2147483647
	mov	x0, xzr
	bl	halide_error_buffer_extents_too_large
	b	.LBB248_21
.LBB248_31:                             // %assert_failed25
	adrp	x1, .Lstr
	add	x1, x1, :lo12:.Lstr
	mov	w3, #2147483647
	mov	x0, xzr
	mov	x2, x11
	bl	halide_error_buffer_allocation_too_large
	b	.LBB248_21
.LBB248_32:                             // %assert_failed26
	adrp	x1, .Lstr
	add	x1, x1, :lo12:.Lstr
	mov	w3, #2147483647
	mov	x0, xzr
	mov	x2, x12
	bl	halide_error_buffer_allocation_too_large
	b	.LBB248_21
.LBB248_33:                             // %assert_failed27
	adrp	x1, .Lstr
	add	x1, x1, :lo12:.Lstr
	mov	w3, #2147483647
	mov	x0, xzr
	mov	x2, x8
	bl	halide_error_buffer_extents_too_large
	b	.LBB248_21
.LBB248_34:                             // %assert_failed9
	adrp	x1, .Lstr.279
	add	x1, x1, :lo12:.Lstr.279
	mov	w3, #2
	mov	x0, xzr
	mov	w2, w14
	bl	halide_error_bad_dimensions
	b	.LBB248_21
.LBB248_35:                             // %assert_failed10
	adrp	x1, .Lstr.280
	mov	w3, #4097
	add	x1, x1, :lo12:.Lstr.280
	movk	w3, #1, lsl #16
	mov	x0, xzr
	mov	w2, w13
	bl	halide_error_bad_type
	b	.LBB248_21
.LBB248_36:                             // %assert_failed11
	adrp	x1, .Lstr.280
	add	x1, x1, :lo12:.Lstr.280
	mov	w3, #2
	mov	x0, xzr
	mov	w2, w15
	bl	halide_error_bad_dimensions
	b	.LBB248_21
.LBB248_37:                             // %assert_failed12
	add	w8, w27, w11
	adrp	x1, .Lstr.279
	add	w4, w23, #1             // =1
	sub	w3, w8, #62             // =62
	sub	w6, w18, #1             // =1
	add	x1, x1, :lo12:.Lstr.279
	mov	x0, xzr
	mov	w2, wzr
	mov	w5, w27
	bl	halide_error_access_out_of_bounds
	b	.LBB248_21
.LBB248_38:                             // %assert_failed13
	adrp	x1, .Lstr.279
	add	x1, x1, :lo12:.Lstr.279
	mov	x0, xzr
	mov	w2, wzr
	ldr	x3, [sp, #112]          // 8-byte Folded Reload
                                        // kill: def $w3 killed $w3 killed $x3
	bl	halide_error_buffer_extents_negative
	b	.LBB248_21
.LBB248_39:                             // %assert_failed14
	ldr	w8, [sp, #100]          // 4-byte Folded Reload
	adrp	x1, .Lstr.279
	mov	w5, w3
	add	w4, w24, #7             // =7
	add	w8, w3, w8
	sub	w3, w8, #8              // =8
	sub	w6, w26, #1             // =1
	add	x1, x1, :lo12:.Lstr.279
	mov	w2, #1
	mov	x0, xzr
	bl	halide_error_access_out_of_bounds
	b	.LBB248_21
.LBB248_40:                             // %assert_failed15
	adrp	x1, .Lstr.280
	add	w4, w20, #1             // =1
	sub	w6, w0, #1              // =1
	add	x1, x1, :lo12:.Lstr.280
	mov	x0, xzr
	mov	w2, wzr
	mov	w3, w27
	bl	halide_error_access_out_of_bounds
	b	.LBB248_21
.LBB248_41:                             // %assert_failed16
	mov	x21, x6
	adrp	x1, .Lstr.280
	add	x1, x1, :lo12:.Lstr.280
	mov	x0, xzr
	mov	w2, wzr
	mov	w3, w21
	bl	halide_error_buffer_extents_negative
	b	.LBB248_21
.LBB248_42:                             // %assert_failed17
	ldr	w5, [sp, #140]          // 4-byte Folded Reload
	sub	w6, w1, #1              // =1
	adrp	x1, .Lstr.280
	add	w4, w26, #1             // =1
	add	x1, x1, :lo12:.Lstr.280
	mov	w2, #1
	mov	x0, xzr
	bl	halide_error_access_out_of_bounds
	b	.LBB248_21
.LBB248_43:                             // %assert_failed18
	adrp	x1, .Lstr.280
	add	x1, x1, :lo12:.Lstr.280
	mov	w2, #1
	mov	x0, xzr
	mov	w3, w29
	bl	halide_error_buffer_extents_negative
	b	.LBB248_21
.LBB248_44:                             // %assert_failed19
	adrp	x1, .Lstr.281
	adrp	x3, .Lstr.282
	add	x1, x1, :lo12:.Lstr.281
	add	x3, x3, :lo12:.Lstr.282
	mov	w4, #1
	mov	x0, xzr
	mov	w2, w10
	mov	w22, w10
	bl	halide_error_constraint_violated
	b	.LBB248_21
.LBB248_45:                             // %assert_failed20
	ldr	w2, [sp, #132]          // 4-byte Folded Reload
	adrp	x1, .Lstr.283
	adrp	x3, .Lstr.282
	add	x1, x1, :lo12:.Lstr.283
	add	x3, x3, :lo12:.Lstr.282
	mov	w4, #1
	mov	x0, xzr
	bl	halide_error_constraint_violated
	b	.LBB248_21
.Lfunc_end248:
	.size	halide_blur, .Lfunc_end248-halide_blur
	.section	.rodata.halide_blur,"a",@progbits
.LJTI248_0:
	.byte	(.LBB248_26-.LBB248_26)>>2
	.byte	(.LBB248_34-.LBB248_26)>>2
	.byte	(.LBB248_35-.LBB248_26)>>2
	.byte	(.LBB248_36-.LBB248_26)>>2
	.byte	(.LBB248_37-.LBB248_26)>>2
	.byte	(.LBB248_38-.LBB248_26)>>2
	.byte	(.LBB248_39-.LBB248_26)>>2
	.byte	(.LBB248_40-.LBB248_26)>>2
	.byte	(.LBB248_41-.LBB248_26)>>2
	.byte	(.LBB248_42-.LBB248_26)>>2
	.byte	(.LBB248_43-.LBB248_26)>>2
	.byte	(.LBB248_44-.LBB248_26)>>2
	.byte	(.LBB248_45-.LBB248_26)>>2
.LJTI248_1:
	.byte	(.LBB248_28-.LBB248_28)>>2
	.byte	(.LBB248_29-.LBB248_28)>>2
	.byte	(.LBB248_30-.LBB248_28)>>2
	.byte	(.LBB248_31-.LBB248_28)>>2
	.byte	(.LBB248_32-.LBB248_28)>>2
	.byte	(.LBB248_33-.LBB248_28)>>2
                                        // -- End function
	.section	.text.halide_blur_argv,"ax",@progbits
	.globl	halide_blur_argv        // -- Begin function halide_blur_argv
	.p2align	2
	.type	halide_blur_argv,@function
halide_blur_argv:                       // @halide_blur_argv
// %bb.0:                               // %entry
	ldp	x8, x1, [x0]
	mov	x0, x8
	b	halide_blur
.Lfunc_end249:
	.size	halide_blur_argv, .Lfunc_end249-halide_blur_argv
                                        // -- End function
	.section	.text.halide_blur_metadata,"ax",@progbits
	.globl	halide_blur_metadata    // -- Begin function halide_blur_metadata
	.p2align	2
	.type	halide_blur_metadata,@function
halide_blur_metadata:                   // @halide_blur_metadata
// %bb.0:                               // %entry
	adrp	x0, .Lhalide_blur_metadata_storage
	add	x0, x0, :lo12:.Lhalide_blur_metadata_storage
	ret
.Lfunc_end250:
	.size	halide_blur_metadata, .Lfunc_end250-halide_blur_metadata
                                        // -- End function
	.type	_ZN6Halide7Runtime8Internal13custom_mallocE,@object // @_ZN6Halide7Runtime8Internal13custom_mallocE
	.data
	.weak	_ZN6Halide7Runtime8Internal13custom_mallocE
	.p2align	3
_ZN6Halide7Runtime8Internal13custom_mallocE:
	.xword	halide_default_malloc
	.size	_ZN6Halide7Runtime8Internal13custom_mallocE, 8

	.type	_ZN6Halide7Runtime8Internal11custom_freeE,@object // @_ZN6Halide7Runtime8Internal11custom_freeE
	.weak	_ZN6Halide7Runtime8Internal11custom_freeE
	.p2align	3
_ZN6Halide7Runtime8Internal11custom_freeE:
	.xword	halide_default_free
	.size	_ZN6Halide7Runtime8Internal11custom_freeE, 8

	.type	_ZN6Halide7Runtime8Internal13error_handlerE,@object // @_ZN6Halide7Runtime8Internal13error_handlerE
	.weak	_ZN6Halide7Runtime8Internal13error_handlerE
	.p2align	3
_ZN6Halide7Runtime8Internal13error_handlerE:
	.xword	halide_default_error
	.size	_ZN6Halide7Runtime8Internal13error_handlerE, 8

	.type	.L.str,@object          // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Error: "
	.size	.L.str, 8

	.type	_ZN6Halide7Runtime8Internal12custom_printE,@object // @_ZN6Halide7Runtime8Internal12custom_printE
	.data
	.weak	_ZN6Halide7Runtime8Internal12custom_printE
	.p2align	3
_ZN6Halide7Runtime8Internal12custom_printE:
	.xword	halide_default_print
	.size	_ZN6Halide7Runtime8Internal12custom_printE, 8

	.type	halide_reference_clock_inited,@object // @halide_reference_clock_inited
	.bss
	.weak	halide_reference_clock_inited
halide_reference_clock_inited:
	.byte	0                       // 0x0
	.size	halide_reference_clock_inited, 1

	.type	halide_reference_clock,@object // @halide_reference_clock
	.weak	halide_reference_clock
	.p2align	3
halide_reference_clock:
	.zero	16
	.size	halide_reference_clock, 16

	.type	.L.str.5,@object        // @.str.5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.5:
	.asciz	"halide"
	.size	.L.str.5, 7

	.type	.L.str.1,@object        // @.str.1
.L.str.1:
	.asciz	"%s"
	.size	.L.str.1, 3

	.type	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE,@object // @_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
	.bss
	.weak	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE
_ZN6Halide7Runtime8Internal15Synchronization13table_storageE:
	.zero	24576
	.size	_ZN6Halide7Runtime8Internal15Synchronization13table_storageE, 24576

	.type	_ZN6Halide7Runtime8Internal10work_queueE,@object // @_ZN6Halide7Runtime8Internal10work_queueE
	.weak	_ZN6Halide7Runtime8Internal10work_queueE
	.p2align	3
_ZN6Halide7Runtime8Internal10work_queueE:
	.zero	8
	.word	0                       // 0x0
	.word	0                       // 0x0
	.xword	0
	.word	0                       // 0x0
	.word	0                       // 0x0
	.word	0                       // 0x0
	.zero	4
	.zero	8
	.zero	8
	.zero	8
	.word	0                       // 0x0
	.word	0                       // 0x0
	.zero	2048
	.byte	0                       // 0x0
	.byte	0                       // 0x0
	.zero	2
	.word	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal10work_queueE, 2128

	.type	_ZN6Halide7Runtime8Internal14custom_do_taskE,@object // @_ZN6Halide7Runtime8Internal14custom_do_taskE
	.data
	.weak	_ZN6Halide7Runtime8Internal14custom_do_taskE
	.p2align	3
_ZN6Halide7Runtime8Internal14custom_do_taskE:
	.xword	halide_default_do_task
	.size	_ZN6Halide7Runtime8Internal14custom_do_taskE, 8

	.type	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE,@object // @_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.weak	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE
	.p2align	3
_ZN6Halide7Runtime8Internal19custom_do_loop_taskE:
	.xword	halide_default_do_loop_task
	.size	_ZN6Halide7Runtime8Internal19custom_do_loop_taskE, 8

	.type	_ZN6Halide7Runtime8Internal17custom_do_par_forE,@object // @_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.weak	_ZN6Halide7Runtime8Internal17custom_do_par_forE
	.p2align	3
_ZN6Halide7Runtime8Internal17custom_do_par_forE:
	.xword	halide_default_do_par_for
	.size	_ZN6Halide7Runtime8Internal17custom_do_par_forE, 8

	.type	.L.str.6,@object        // @.str.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6:
	.asciz	"/home/jason/code/Halide/src/runtime/synchronization_common.h:381 Assert failed: next != NULL\n"
	.size	.L.str.6, 94

	.type	.L.str.6.7,@object      // @.str.6.7
.L.str.6.7:
	.asciz	"/home/jason/code/Halide/src/runtime/synchronization_common.h:1096 Assert failed: val & 0x1\n"
	.size	.L.str.6.7, 92

	.type	.L.str.7,@object        // @.str.7
.L.str.7:
	.asciz	"/home/jason/code/Halide/src/runtime/thread_pool_common.h:151 Assert failed: bytes == limit && \"Logic error in thread pool work queue initialization.\\n\"\n"
	.size	.L.str.7, 153

	.type	.L.str.3,@object        // @.str.3
.L.str.3:
	.asciz	"/home/jason/code/Halide/src/runtime/thread_pool_common.h:498 Assert failed: (min_threads <= ((task_parent->task.min_threads * task_parent->active_workers) - task_parent->threads_reserved)) && \"Logic error: thread over commit.\\n\"\n"
	.size	.L.str.3, 230

	.type	.L.str.1.8,@object      // @.str.1.8
.L.str.1.8:
	.asciz	"HL_NUM_THREADS"
	.size	.L.str.1.8, 15

	.type	.L.str.2,@object        // @.str.2
.L.str.2:
	.asciz	"HL_NUMTHREADS"
	.size	.L.str.2, 14

	.type	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE,@object // @_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.data
	.weak	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE
	.p2align	3
_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE:
	.xword	halide_default_do_parallel_tasks
	.size	_ZN6Halide7Runtime8Internal24custom_do_parallel_tasksE, 8

	.type	_ZN6Halide7Runtime8Internal21custom_semaphore_initE,@object // @_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.weak	_ZN6Halide7Runtime8Internal21custom_semaphore_initE
	.p2align	3
_ZN6Halide7Runtime8Internal21custom_semaphore_initE:
	.xword	halide_default_semaphore_init
	.size	_ZN6Halide7Runtime8Internal21custom_semaphore_initE, 8

	.type	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE,@object // @_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.weak	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE
	.p2align	3
_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE:
	.xword	halide_default_semaphore_try_acquire
	.size	_ZN6Halide7Runtime8Internal28custom_semaphore_try_acquireE, 8

	.type	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE,@object // @_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.weak	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE
	.p2align	3
_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE:
	.xword	halide_default_semaphore_release
	.size	_ZN6Halide7Runtime8Internal24custom_semaphore_releaseE, 8

	.section	.fini_array,"aw",@fini_array
	.p2align	3
	.xword	halide_thread_pool_cleanup
	.xword	halide_trace_cleanup
	.xword	halide_cache_cleanup
	.xword	halide_profiler_shutdown
	.xword	halide_opencl_cleanup
	.type	.L.str.4,@object        // @.str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4:
	.asciz	"halide_set_num_threads: must be >= 0."
	.size	.L.str.4, 38

	.type	_ZN6Halide7Runtime8Internal17custom_get_symbolE,@object // @_ZN6Halide7Runtime8Internal17custom_get_symbolE
	.data
	.weak	_ZN6Halide7Runtime8Internal17custom_get_symbolE
	.p2align	3
_ZN6Halide7Runtime8Internal17custom_get_symbolE:
	.xword	halide_default_get_symbol
	.size	_ZN6Halide7Runtime8Internal17custom_get_symbolE, 8

	.type	_ZN6Halide7Runtime8Internal19custom_load_libraryE,@object // @_ZN6Halide7Runtime8Internal19custom_load_libraryE
	.weak	_ZN6Halide7Runtime8Internal19custom_load_libraryE
	.p2align	3
_ZN6Halide7Runtime8Internal19custom_load_libraryE:
	.xword	halide_default_load_library
	.size	_ZN6Halide7Runtime8Internal19custom_load_libraryE, 8

	.type	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE,@object // @_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	.weak	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE
	.p2align	3
_ZN6Halide7Runtime8Internal25custom_get_library_symbolE:
	.xword	halide_default_get_library_symbol
	.size	_ZN6Halide7Runtime8Internal25custom_get_library_symbolE, 8

	.type	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE,@object // @_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	.bss
	.weak	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE
	.p2align	2
_ZN6Halide7Runtime8Internal17halide_gpu_deviceE:
	.word	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal17halide_gpu_deviceE, 4

	.type	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE,@object // @_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
	.weak	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE
	.p2align	2
_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE:
	.word	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal22halide_gpu_device_lockE, 4

	.type	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE,@object // @_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
	.weak	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE
_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE:
	.byte	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal29halide_gpu_device_initializedE, 1

	.type	.L.str.10,@object       // @.str.10
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.10:
	.asciz	"HL_GPU_DEVICE"
	.size	.L.str.10, 14

	.type	_ZN6Halide7Runtime8Internal19halide_trace_bufferE,@object // @_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	.bss
	.weak	_ZN6Halide7Runtime8Internal19halide_trace_bufferE
	.p2align	3
_ZN6Halide7Runtime8Internal19halide_trace_bufferE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal19halide_trace_bufferE, 8

	.type	_ZN6Halide7Runtime8Internal17halide_trace_fileE,@object // @_ZN6Halide7Runtime8Internal17halide_trace_fileE
	.data
	.weak	_ZN6Halide7Runtime8Internal17halide_trace_fileE
	.p2align	2
_ZN6Halide7Runtime8Internal17halide_trace_fileE:
	.word	4294967295              // 0xffffffff
	.size	_ZN6Halide7Runtime8Internal17halide_trace_fileE, 4

	.type	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE,@object // @_ZN6Halide7Runtime8Internal22halide_trace_file_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE
	.p2align	2
_ZN6Halide7Runtime8Internal22halide_trace_file_lockE:
	.word	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal22halide_trace_file_lockE, 4

	.type	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE,@object // @_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE
	.weak	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE
_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE:
	.byte	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal29halide_trace_file_initializedE, 1

	.type	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE,@object // @_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE
	.weak	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE
	.p2align	3
_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal35halide_trace_file_internally_openedE, 8

	.type	_ZN6Halide7Runtime8Internal19halide_custom_traceE,@object // @_ZN6Halide7Runtime8Internal19halide_custom_traceE
	.data
	.weak	_ZN6Halide7Runtime8Internal19halide_custom_traceE
	.p2align	3
_ZN6Halide7Runtime8Internal19halide_custom_traceE:
	.xword	halide_default_trace
	.size	_ZN6Halide7Runtime8Internal19halide_custom_traceE, 8

	.type	_ZZ20halide_default_traceE3ids,@object // @_ZZ20halide_default_traceE3ids
	.p2align	2
_ZZ20halide_default_traceE3ids:
	.word	1                       // 0x1
	.size	_ZZ20halide_default_traceE3ids, 4

	.type	.L.str.32,@object       // @.str.32
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.32:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:115 Assert failed: success && \"Could not write to trace file\"\n"
	.size	.L.str.32, 111

	.type	.L.str.31,@object       // @.str.31
.L.str.31:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:86 Assert failed: size <= buffer_size\n"
	.size	.L.str.31, 87

	.type	.L.str.2.13,@object     // @.str.2.13
.L.str.2.13:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:215 Assert failed: print_bits <= 64 && \"Tracing bad type\"\n"
	.size	.L.str.2.13, 107

	.type	.L__const.halide_default_trace.event_types,@object // @__const.halide_default_trace.event_types
	.section	.data.rel.ro,"aw",@progbits
	.p2align	3
.L__const.halide_default_trace.event_types:
	.xword	.L.str.3.14
	.xword	.L.str.4.15
	.xword	.L.str.5.16
	.xword	.L.str.6.17
	.xword	.L.str.7.18
	.xword	.L.str.8
	.xword	.L.str.9
	.xword	.L.str.10.19
	.xword	.L.str.11.20
	.xword	.L.str.12
	.xword	.L.str.13
	.size	.L__const.halide_default_trace.event_types, 88

	.type	.L.str.17,@object       // @.str.17
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.17:
	.asciz	"<"
	.size	.L.str.17, 2

	.type	.L.str.20,@object       // @.str.20
.L.str.20:
	.asciz	">)"
	.size	.L.str.20, 3

	.type	.L.str.18,@object       // @.str.18
.L.str.18:
	.asciz	">, <"
	.size	.L.str.18, 5

	.type	.L.str.22,@object       // @.str.22
.L.str.22:
	.asciz	" = <"
	.size	.L.str.22, 5

	.type	.L.str.23,@object       // @.str.23
.L.str.23:
	.asciz	" = "
	.size	.L.str.23, 4

	.type	.L.str.24,@object       // @.str.24
.L.str.24:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:284 Assert failed: print_bits >= 16 && \"Tracing a bad type\"\n"
	.size	.L.str.24, 109

	.type	.L.str.25,@object       // @.str.25
.L.str.25:
	.asciz	">"
	.size	.L.str.25, 2

	.type	.L.str.26,@object       // @.str.26
.L.str.26:
	.asciz	" tag = \""
	.size	.L.str.26, 9

	.type	.L.str.27,@object       // @.str.27
.L.str.27:
	.asciz	"\""
	.size	.L.str.27, 2

	.type	.L.str.3.14,@object     // @.str.3.14
.L.str.3.14:
	.asciz	"Load"
	.size	.L.str.3.14, 5

	.type	.L.str.4.15,@object     // @.str.4.15
.L.str.4.15:
	.asciz	"Store"
	.size	.L.str.4.15, 6

	.type	.L.str.5.16,@object     // @.str.5.16
.L.str.5.16:
	.asciz	"Begin realization"
	.size	.L.str.5.16, 18

	.type	.L.str.6.17,@object     // @.str.6.17
.L.str.6.17:
	.asciz	"End realization"
	.size	.L.str.6.17, 16

	.type	.L.str.7.18,@object     // @.str.7.18
.L.str.7.18:
	.asciz	"Produce"
	.size	.L.str.7.18, 8

	.type	.L.str.8,@object        // @.str.8
.L.str.8:
	.asciz	"End produce"
	.size	.L.str.8, 12

	.type	.L.str.9,@object        // @.str.9
.L.str.9:
	.asciz	"Consume"
	.size	.L.str.9, 8

	.type	.L.str.10.19,@object    // @.str.10.19
.L.str.10.19:
	.asciz	"End consume"
	.size	.L.str.10.19, 12

	.type	.L.str.11.20,@object    // @.str.11.20
.L.str.11.20:
	.asciz	"Begin pipeline"
	.size	.L.str.11.20, 15

	.type	.L.str.12,@object       // @.str.12
.L.str.12:
	.asciz	"End pipeline"
	.size	.L.str.12, 13

	.type	.L.str.13,@object       // @.str.13
.L.str.13:
	.asciz	"Tag"
	.size	.L.str.13, 4

	.type	.L.str.28,@object       // @.str.28
.L.str.28:
	.asciz	"HL_TRACE_FILE"
	.size	.L.str.28, 14

	.type	.L.str.29,@object       // @.str.29
.L.str.29:
	.asciz	"ab"
	.size	.L.str.29, 3

	.type	.L.str.30,@object       // @.str.30
.L.str.30:
	.asciz	"/home/jason/code/Halide/src/runtime/tracing.cpp:345 Assert failed: file && \"Failed to open trace file\\n\"\n"
	.size	.L.str.30, 106

	.type	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE,@object // @_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE
	.data
	.weak	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE
	.p2align	1
_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE:
	.hword	3                       // 0x3
	.hword	3                       // 0x3
	.hword	1                       // 0x1
	.hword	2                       // 0x2
	.hword	1                       // 0x1
	.hword	2                       // 0x2
	.hword	1                       // 0x1
	.hword	2                       // 0x2
	.hword	1                       // 0x1
	.hword	2                       // 0x2
	.size	_ZN6Halide7Runtime8Internal30pixel_type_to_tiff_sample_typeE, 20

	.type	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE,@object // @_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE
	.weak	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE
_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE:
	.ascii	"\007\006\t\b\013\n\r\f\017\016"
	.size	_ZN6Halide7Runtime8Internal31pixel_type_to_matlab_class_codeE, 10

	.type	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE,@object // @_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE
	.weak	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE
_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE:
	.ascii	"\007\t\002\001\004\003\006\005\r\f"
	.size	_ZN6Halide7Runtime8Internal30pixel_type_to_matlab_type_codeE, 10

	.type	.L.str.35,@object       // @.str.35
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.35:
	.asciz	"Bounds query buffer passed to halide_debug_to_file"
	.size	.L.str.35, 51

	.type	.L.str.1.36,@object     // @.str.1.36
.L.str.1.36:
	.asciz	"Can't debug_to_file a Func with more than four dimensions\n"
	.size	.L.str.1.36, 59

	.type	.L.str.2.37,@object     // @.str.2.37
.L.str.2.37:
	.asciz	"wb"
	.size	.L.str.2.37, 3

	.type	.L.str.3.38,@object     // @.str.3.38
.L.str.3.38:
	.asciz	".tiff"
	.size	.L.str.3.38, 6

	.type	.L.str.4.39,@object     // @.str.4.39
.L.str.4.39:
	.asciz	".tif"
	.size	.L.str.4.39, 5

	.type	.L.str.5.40,@object     // @.str.5.40
.L.str.5.40:
	.asciz	".mat"
	.size	.L.str.5.40, 5

	.type	.L__const.halide_debug_to_file.header,@object // @__const.halide_debug_to_file.header
	.section	.rodata,"a",@progbits
.L__const.halide_debug_to_file.header:
	.asciz	"MATLAB 5.0 MAT-file, produced by Halide                                                                                     \000\001IM"
	.size	.L__const.halide_debug_to_file.header, 129

	.type	.L.str.6.41,@object     // @.str.6.41
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6.41:
	.asciz	"Can't debug_to_file to a .mat file greater than 4GB\n"
	.size	.L.str.6.41, 53

	.type	.L.str.7.42,@object     // @.str.7.42
.L.str.7.42:
	.asciz	"Unexpectedly large final_padding_bytes"
	.size	.L.str.7.42, 39

	.type	_ZN6Halide7Runtime8Internal16memoization_lockE,@object // @_ZN6Halide7Runtime8Internal16memoization_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal16memoization_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal16memoization_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal16memoization_lockE, 8

	.type	_ZN6Halide7Runtime8Internal13cache_entriesE,@object // @_ZN6Halide7Runtime8Internal13cache_entriesE
	.weak	_ZN6Halide7Runtime8Internal13cache_entriesE
	.p2align	3
_ZN6Halide7Runtime8Internal13cache_entriesE:
	.zero	2048
	.size	_ZN6Halide7Runtime8Internal13cache_entriesE, 2048

	.type	_ZN6Halide7Runtime8Internal18most_recently_usedE,@object // @_ZN6Halide7Runtime8Internal18most_recently_usedE
	.weak	_ZN6Halide7Runtime8Internal18most_recently_usedE
	.p2align	3
_ZN6Halide7Runtime8Internal18most_recently_usedE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal18most_recently_usedE, 8

	.type	_ZN6Halide7Runtime8Internal19least_recently_usedE,@object // @_ZN6Halide7Runtime8Internal19least_recently_usedE
	.weak	_ZN6Halide7Runtime8Internal19least_recently_usedE
	.p2align	3
_ZN6Halide7Runtime8Internal19least_recently_usedE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal19least_recently_usedE, 8

	.type	_ZN6Halide7Runtime8Internal14max_cache_sizeE,@object // @_ZN6Halide7Runtime8Internal14max_cache_sizeE
	.data
	.weak	_ZN6Halide7Runtime8Internal14max_cache_sizeE
	.p2align	3
_ZN6Halide7Runtime8Internal14max_cache_sizeE:
	.xword	1048576                 // 0x100000
	.size	_ZN6Halide7Runtime8Internal14max_cache_sizeE, 8

	.type	_ZN6Halide7Runtime8Internal18current_cache_sizeE,@object // @_ZN6Halide7Runtime8Internal18current_cache_sizeE
	.bss
	.weak	_ZN6Halide7Runtime8Internal18current_cache_sizeE
	.p2align	3
_ZN6Halide7Runtime8Internal18current_cache_sizeE:
	.xword	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal18current_cache_sizeE, 8

	.type	.L.str.4.44,@object     // @.str.4.44
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4.44:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:273 Assert failed: prev_hash_entry != NULL\n"
	.size	.L.str.4.44, 90

	.type	.L.str.5.45,@object     // @.str.5.45
.L.str.5.45:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:360 Assert failed: entry->more_recent != NULL\n"
	.size	.L.str.5.45, 93

	.type	.L.str.6.46,@object     // @.str.6.46
.L.str.6.46:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:364 Assert failed: least_recently_used == entry\n"
	.size	.L.str.6.46, 95

	.type	.L.str.7.47,@object     // @.str.7.47
.L.str.7.47:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:367 Assert failed: entry->more_recent != NULL\n"
	.size	.L.str.7.47, 93

	.type	.L.str.9.48,@object     // @.str.9.48
.L.str.9.48:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:458 Assert failed: no_host_pointers_equal\n"
	.size	.L.str.9.48, 89

	.type	.L.str.12.49,@object    // @.str.12.49
.L.str.12.49:
	.asciz	"/home/jason/code/Halide/src/runtime/cache.cpp:536 Assert failed: entry->in_use_count > 0\n"
	.size	.L.str.12.49, 90

	.type	.L.str.58,@object       // @.str.58
.L.str.58:
	.asciz	"-nan"
	.size	.L.str.58, 5

	.type	.L.str.1.59,@object     // @.str.1.59
.L.str.1.59:
	.asciz	"nan"
	.size	.L.str.1.59, 4

	.type	.L.str.2.60,@object     // @.str.2.60
.L.str.2.60:
	.asciz	"-inf"
	.size	.L.str.2.60, 5

	.type	.L.str.3.61,@object     // @.str.3.61
.L.str.3.61:
	.asciz	"inf"
	.size	.L.str.3.61, 4

	.type	.L.str.4.62,@object     // @.str.4.62
.L.str.4.62:
	.asciz	"-0.000000e+00"
	.size	.L.str.4.62, 14

	.type	.L.str.5.63,@object     // @.str.5.63
.L.str.5.63:
	.asciz	"0.000000e+00"
	.size	.L.str.5.63, 13

	.type	.L.str.6.64,@object     // @.str.6.64
.L.str.6.64:
	.asciz	"-0.000000"
	.size	.L.str.6.64, 10

	.type	.L.str.7.65,@object     // @.str.7.65
.L.str.7.65:
	.asciz	"0.000000"
	.size	.L.str.7.65, 9

	.type	.L.str.8.66,@object     // @.str.8.66
.L.str.8.66:
	.asciz	"-"
	.size	.L.str.8.66, 2

	.type	.L.str.10.68,@object    // @.str.10.68
.L.str.10.68:
	.asciz	"e+"
	.size	.L.str.10.68, 3

	.type	.L.str.11.69,@object    // @.str.11.69
.L.str.11.69:
	.asciz	"e-"
	.size	.L.str.11.69, 3

	.type	.L.str.12.72,@object    // @.str.12.72
.L.str.12.72:
	.asciz	"0123456789abcdef"
	.size	.L.str.12.72, 17

	.type	.L.str.17.73,@object    // @.str.17.73
.L.str.17.73:
	.asciz	"bad_type_code"
	.size	.L.str.17.73, 14

	.type	.L.str.16.74,@object    // @.str.16.74
.L.str.16.74:
	.asciz	"handle"
	.size	.L.str.16.74, 7

	.type	.L.str.15.75,@object    // @.str.15.75
.L.str.15.75:
	.asciz	"float"
	.size	.L.str.15.75, 6

	.type	.L.str.14.76,@object    // @.str.14.76
.L.str.14.76:
	.asciz	"uint"
	.size	.L.str.14.76, 5

	.type	.L.str.13.77,@object    // @.str.13.77
.L.str.13.77:
	.asciz	"int"
	.size	.L.str.13.77, 4

	.type	.L.str.18.78,@object    // @.str.18.78
.L.str.18.78:
	.asciz	"x"
	.size	.L.str.18.78, 2

	.type	.L.str.19.79,@object    // @.str.19.79
.L.str.19.79:
	.asciz	"NULL"
	.size	.L.str.19.79, 5

	.type	.L.str.20.80,@object    // @.str.20.80
.L.str.20.80:
	.asciz	"buffer("
	.size	.L.str.20.80, 8

	.type	.L.str.22.83,@object    // @.str.22.83
.L.str.22.83:
	.asciz	", {"
	.size	.L.str.22.83, 4

	.type	.L.str.23.84,@object    // @.str.23.84
.L.str.23.84:
	.asciz	"}"
	.size	.L.str.23.84, 2

	.type	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE,@object // @_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
	.bss
	.weak	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE
_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE:
	.byte	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal36halide_reuse_device_allocations_flagE, 1

	.type	_ZN6Halide7Runtime8Internal21allocation_pools_lockE,@object // @_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	.weak	_ZN6Halide7Runtime8Internal21allocation_pools_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal21allocation_pools_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal21allocation_pools_lockE, 8

	.type	_ZN6Halide7Runtime8Internal23device_allocation_poolsE,@object // @_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.weak	_ZN6Halide7Runtime8Internal23device_allocation_poolsE
	.p2align	3
_ZN6Halide7Runtime8Internal23device_allocation_poolsE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal23device_allocation_poolsE, 8

	.type	_ZN6Halide7Runtime8Internal17device_copy_mutexE,@object // @_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.weak	_ZN6Halide7Runtime8Internal17device_copy_mutexE
	.p2align	3
_ZN6Halide7Runtime8Internal17device_copy_mutexE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal17device_copy_mutexE, 8

	.type	.L.str.9.89,@object     // @.str.9.89
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.9.89:
	.asciz	"halide_copy_to_host"
	.size	.L.str.9.89, 20

	.type	.L.str.10.90,@object    // @.str.10.90
.L.str.10.90:
	.asciz	"halide_copy_to_device"
	.size	.L.str.10.90, 22

	.type	.L.str.12.91,@object    // @.str.12.91
.L.str.12.91:
	.asciz	"halide_copy_to_device does not support switching interfaces\n"
	.size	.L.str.12.91, 61

	.type	.L.str.18.92,@object    // @.str.18.92
.L.str.18.92:
	.asciz	"halide_device_malloc"
	.size	.L.str.18.92, 21

	.type	.L.str.20.93,@object    // @.str.20.93
.L.str.20.93:
	.asciz	"halide_device_malloc doesn't support switching interfaces\n"
	.size	.L.str.20.93, 59

	.type	.L.str.17.94,@object    // @.str.17.94
.L.str.17.94:
	.asciz	"halide_device_sync"
	.size	.L.str.17.94, 19

	.type	.L.str.21.97,@object    // @.str.21.97
.L.str.21.97:
	.asciz	"halide_device_free"
	.size	.L.str.21.97, 19

	.type	.L.str.22.98,@object    // @.str.22.98
.L.str.22.98:
	.asciz	"/home/jason/code/Halide/src/runtime/device_interface.cpp:247 Assert failed: buf->device == 0\n"
	.size	.L.str.22.98, 94

	.type	.L.str.23.99,@object    // @.str.23.99
.L.str.23.99:
	.asciz	"halide_device_and_host_malloc"
	.size	.L.str.23.99, 30

	.type	.L.str.25.100,@object   // @.str.25.100
.L.str.25.100:
	.asciz	"halide_device_and_host_malloc doesn't support switching interfaces\n"
	.size	.L.str.25.100, 68

	.type	.L.str.26.101,@object   // @.str.26.101
.L.str.26.101:
	.asciz	"allocating host and device memory failed\n"
	.size	.L.str.26.101, 42

	.type	.L.str.27.102,@object   // @.str.27.102
.L.str.27.102:
	.asciz	"halide_device_and_host_free"
	.size	.L.str.27.102, 28

	.type	.L.str.28.103,@object   // @.str.28.103
.L.str.28.103:
	.asciz	"/home/jason/code/Halide/src/runtime/device_interface.cpp:312 Assert failed: buf->device == 0\n"
	.size	.L.str.28.103, 94

	.type	.L.str.29.104,@object   // @.str.29.104
.L.str.29.104:
	.asciz	"halide_default_device_and_host_malloc"
	.size	.L.str.29.104, 38

	.type	.L.str.30.105,@object   // @.str.30.105
.L.str.30.105:
	.asciz	"halide_default_device_and_host_free"
	.size	.L.str.30.105, 36

	.type	.L.str.31.106,@object   // @.str.31.106
.L.str.31.106:
	.asciz	"halide_device_wrap_native"
	.size	.L.str.31.106, 26

	.type	.L.str.32.107,@object   // @.str.32.107
.L.str.32.107:
	.asciz	"halide_device_wrap_native doesn't support switching interfaces\n"
	.size	.L.str.32.107, 64

	.type	.L.str.33.108,@object   // @.str.33.108
.L.str.33.108:
	.asciz	"halide_device_detach_native"
	.size	.L.str.33.108, 28

	.type	.L.str.34.109,@object   // @.str.34.109
.L.str.34.109:
	.asciz	"/home/jason/code/Halide/src/runtime/device_interface.cpp:399 Assert failed: buf->device == 0\n"
	.size	.L.str.34.109, 94

	.type	.L.str.35.110,@object   // @.str.35.110
.L.str.35.110:
	.asciz	"halide_default_device_wrap_native"
	.size	.L.str.35.110, 34

	.type	.L.str.36,@object       // @.str.36
.L.str.36:
	.asciz	"halide_default_device_detach_native"
	.size	.L.str.36, 36

	.type	.L.str.42,@object       // @.str.42
.L.str.42:
	.asciz	"halide_buffer_copy does not support switching device interfaces"
	.size	.L.str.42, 64

	.type	.L.str.58.111,@object   // @.str.58.111
.L.str.58.111:
	.asciz	"device_interface does not support cropping\n"
	.size	.L.str.58.111, 44

	.type	.L.str.59,@object       // @.str.59
.L.str.59:
	.asciz	"device_interface does not support slicing\n"
	.size	.L.str.59, 43

	.type	.L.str.60,@object       // @.str.60
.L.str.60:
	.asciz	"destination buffer already has a device allocation\n"
	.size	.L.str.60, 52

	.type	.L.str.61,@object       // @.str.61
.L.str.61:
	.asciz	"src and dst must have identical dimensionality\n"
	.size	.L.str.61, 48

	.type	.L.str.64,@object       // @.str.64
.L.str.64:
	.asciz	"dst must have exactly one fewer dimension than src\n"
	.size	.L.str.64, 52

	.type	.L.str.114,@object      // @.str.114
.L.str.114:
	.asciz	"Bounds inference call to external stage "
	.size	.L.str.114, 41

	.type	.L.str.1.115,@object    // @.str.1.115
.L.str.1.115:
	.asciz	" returned non-zero value: "
	.size	.L.str.1.115, 27

	.type	.L.str.2.116,@object    // @.str.2.116
.L.str.2.116:
	.asciz	"Call to external stage "
	.size	.L.str.2.116, 24

	.type	.L.str.3.117,@object    // @.str.3.117
.L.str.3.117:
	.asciz	"Bounds given for "
	.size	.L.str.3.117, 18

	.type	.L.str.4.118,@object    // @.str.4.118
.L.str.4.118:
	.asciz	" in "
	.size	.L.str.4.118, 5

	.type	.L.str.5.119,@object    // @.str.5.119
.L.str.5.119:
	.asciz	" (from "
	.size	.L.str.5.119, 8

	.type	.L.str.6.120,@object    // @.str.6.120
.L.str.6.120:
	.asciz	" to "
	.size	.L.str.6.120, 5

	.type	.L.str.7.121,@object    // @.str.7.121
.L.str.7.121:
	.asciz	") do not cover required region (from "
	.size	.L.str.7.121, 38

	.type	.L.str.9.123,@object    // @.str.9.123
.L.str.9.123:
	.asciz	" has type "
	.size	.L.str.9.123, 11

	.type	.L.str.10.124,@object   // @.str.10.124
.L.str.10.124:
	.asciz	" but type of the buffer passed in is "
	.size	.L.str.10.124, 38

	.type	.L.str.11.125,@object   // @.str.11.125
.L.str.11.125:
	.asciz	" requires a buffer of exactly "
	.size	.L.str.11.125, 31

	.type	.L.str.12.126,@object   // @.str.12.126
.L.str.12.126:
	.asciz	" dimensions, but the buffer passed in has "
	.size	.L.str.12.126, 43

	.type	.L.str.13.127,@object   // @.str.13.127
.L.str.13.127:
	.asciz	" dimensions"
	.size	.L.str.13.127, 12

	.type	.L.str.14.128,@object   // @.str.14.128
.L.str.14.128:
	.asciz	" is accessed at "
	.size	.L.str.14.128, 17

	.type	.L.str.15.129,@object   // @.str.15.129
.L.str.15.129:
	.asciz	", which is before the min ("
	.size	.L.str.15.129, 28

	.type	.L.str.16.130,@object   // @.str.16.130
.L.str.16.130:
	.asciz	") in dimension "
	.size	.L.str.16.130, 16

	.type	.L.str.17.131,@object   // @.str.17.131
.L.str.17.131:
	.asciz	", which is beyond the max ("
	.size	.L.str.17.131, 28

	.type	.L.str.18.132,@object   // @.str.18.132
.L.str.18.132:
	.asciz	"Total allocation for buffer "
	.size	.L.str.18.132, 29

	.type	.L.str.19.133,@object   // @.str.19.133
.L.str.19.133:
	.asciz	" is "
	.size	.L.str.19.133, 5

	.type	.L.str.20.134,@object   // @.str.20.134
.L.str.20.134:
	.asciz	", which exceeds the maximum size of "
	.size	.L.str.20.134, 37

	.type	.L.str.21.135,@object   // @.str.21.135
.L.str.21.135:
	.asciz	"The extents for buffer "
	.size	.L.str.21.135, 24

	.type	.L.str.22.136,@object   // @.str.22.136
.L.str.22.136:
	.asciz	" dimension "
	.size	.L.str.22.136, 12

	.type	.L.str.23.137,@object   // @.str.23.137
.L.str.23.137:
	.asciz	" is negative ("
	.size	.L.str.23.137, 15

	.type	.L.str.24.138,@object   // @.str.24.138
.L.str.24.138:
	.asciz	"Product of extents for buffer "
	.size	.L.str.24.138, 31

	.type	.L.str.25.139,@object   // @.str.25.139
.L.str.25.139:
	.asciz	"Applying the constraints on "
	.size	.L.str.25.139, 29

	.type	.L.str.26.140,@object   // @.str.26.140
.L.str.26.140:
	.asciz	" to the required region made it smaller in dimension "
	.size	.L.str.26.140, 54

	.type	.L.str.27.141,@object   // @.str.27.141
.L.str.27.141:
	.asciz	". "
	.size	.L.str.27.141, 3

	.type	.L.str.28.142,@object   // @.str.28.142
.L.str.28.142:
	.asciz	"Required size: "
	.size	.L.str.28.142, 16

	.type	.L.str.29.143,@object   // @.str.29.143
.L.str.29.143:
	.asciz	"Constrained size: "
	.size	.L.str.29.143, 19

	.type	.L.str.30.144,@object   // @.str.30.144
.L.str.30.144:
	.asciz	"."
	.size	.L.str.30.144, 2

	.type	.L.str.31.145,@object   // @.str.31.145
.L.str.31.145:
	.asciz	"Constraint violated: "
	.size	.L.str.31.145, 22

	.type	.L.str.32.146,@object   // @.str.32.146
.L.str.32.146:
	.asciz	" ("
	.size	.L.str.32.146, 3

	.type	.L.str.33.147,@object   // @.str.33.147
.L.str.33.147:
	.asciz	") == "
	.size	.L.str.33.147, 6

	.type	.L.str.34.148,@object   // @.str.34.148
.L.str.34.148:
	.asciz	"Parameter "
	.size	.L.str.34.148, 11

	.type	.L.str.35.149,@object   // @.str.35.149
.L.str.35.149:
	.asciz	" but must be at least "
	.size	.L.str.35.149, 23

	.type	.L.str.36.150,@object   // @.str.36.150
.L.str.36.150:
	.asciz	" but must be at most "
	.size	.L.str.36.150, 22

	.type	.L.str.37,@object       // @.str.37
.L.str.37:
	.asciz	"Out of memory (halide_malloc returned NULL)"
	.size	.L.str.37, 44

	.type	.L.str.38,@object       // @.str.38
.L.str.38:
	.asciz	"Buffer argument "
	.size	.L.str.38, 17

	.type	.L.str.39,@object       // @.str.39
.L.str.39:
	.asciz	" is NULL"
	.size	.L.str.39, 9

	.type	.L.str.40,@object       // @.str.40
.L.str.40:
	.asciz	"Failed to dump function "
	.size	.L.str.40, 25

	.type	.L.str.41,@object       // @.str.41
.L.str.41:
	.asciz	" to file "
	.size	.L.str.41, 10

	.type	.L.str.42.151,@object   // @.str.42.151
.L.str.42.151:
	.asciz	" with error "
	.size	.L.str.42.151, 13

	.type	.L.str.43,@object       // @.str.43
.L.str.43:
	.asciz	"Failed to upgrade buffer_t to halide_buffer_t for "
	.size	.L.str.43, 51

	.type	.L.str.45,@object       // @.str.45
.L.str.45:
	.asciz	"Failed to downgrade halide_buffer_t to buffer_t for "
	.size	.L.str.45, 53

	.type	.L.str.46,@object       // @.str.46
.L.str.46:
	.asciz	"The host pointer of "
	.size	.L.str.46, 21

	.type	.L.str.47,@object       // @.str.47
.L.str.47:
	.asciz	" is not aligned to a "
	.size	.L.str.47, 22

	.type	.L.str.48,@object       // @.str.48
.L.str.48:
	.asciz	" bytes boundary."
	.size	.L.str.48, 17

	.type	.L.str.49,@object       // @.str.49
.L.str.49:
	.asciz	" is null, but the pipeline will access it on the host."
	.size	.L.str.49, 55

	.type	.L.str.50,@object       // @.str.50
.L.str.50:
	.asciz	"The folded storage dimension "
	.size	.L.str.50, 30

	.type	.L.str.51,@object       // @.str.51
.L.str.51:
	.asciz	" of "
	.size	.L.str.51, 5

	.type	.L.str.52,@object       // @.str.52
.L.str.52:
	.asciz	" was accessed out of order by loop "
	.size	.L.str.52, 36

	.type	.L.str.53,@object       // @.str.53
.L.str.53:
	.asciz	"Cannot fold dimension "
	.size	.L.str.53, 23

	.type	.L.str.54,@object       // @.str.54
.L.str.54:
	.asciz	" because an extern stage accesses ["
	.size	.L.str.54, 36

	.type	.L.str.55,@object       // @.str.55
.L.str.55:
	.asciz	", "
	.size	.L.str.55, 3

	.type	.L.str.56,@object       // @.str.56
.L.str.56:
	.asciz	"],"
	.size	.L.str.56, 3

	.type	.L.str.57,@object       // @.str.57
.L.str.57:
	.asciz	" which is outside the range currently valid: ["
	.size	.L.str.57, 47

	.type	.L.str.58.152,@object   // @.str.58.152
.L.str.58.152:
	.asciz	"]."
	.size	.L.str.58.152, 3

	.type	.L.str.59.153,@object   // @.str.59.153
.L.str.59.153:
	.asciz	" which wraps around the boundary of the fold, "
	.size	.L.str.59.153, 47

	.type	.L.str.60.154,@object   // @.str.60.154
.L.str.60.154:
	.asciz	"which occurs at multiples of "
	.size	.L.str.60.154, 30

	.type	.L.str.61.155,@object   // @.str.61.155
.L.str.61.155:
	.asciz	"The fold factor ("
	.size	.L.str.61.155, 18

	.type	.L.str.62,@object       // @.str.62
.L.str.62:
	.asciz	") of dimension "
	.size	.L.str.62, 16

	.type	.L.str.63,@object       // @.str.63
.L.str.63:
	.asciz	" is too small to store the required region accessed by loop "
	.size	.L.str.63, 61

	.type	.L.str.64.156,@object   // @.str.64.156
.L.str.64.156:
	.asciz	")."
	.size	.L.str.64.156, 3

	.type	.L.str.65,@object       // @.str.65
.L.str.65:
	.asciz	"Requirement Failed: ("
	.size	.L.str.65, 22

	.type	.L.str.67,@object       // @.str.67
.L.str.67:
	.asciz	"A schedule specialized with specialize_fail() was chosen: "
	.size	.L.str.67, 59

	.type	.L.str.68,@object       // @.str.68
.L.str.68:
	.asciz	"Buffer has a non-zero device but no device interface.\n"
	.size	.L.str.68, 55

	.type	.L.str.69,@object       // @.str.69
.L.str.69:
	.asciz	"Buffer has a non-null devie_interface but device is 0.\n"
	.size	.L.str.69, 56

	.type	.L.str.70,@object       // @.str.70
.L.str.70:
	.asciz	"Buffer has both host and device dirty bits set.\n"
	.size	.L.str.70, 49

	.type	.L.str.71,@object       // @.str.71
.L.str.71:
	.asciz	"Buffer pointer passed to "
	.size	.L.str.71, 26

	.type	.L.str.72,@object       // @.str.72
.L.str.72:
	.asciz	" is null.\n"
	.size	.L.str.72, 11

	.type	.L.str.73,@object       // @.str.73
.L.str.73:
	.asciz	"Integer division or modulo by zero.\n"
	.size	.L.str.73, 37

	.type	.L.str.165,@object      // @.str.165
.L.str.165:
	.zero	1
	.size	.L.str.165, 1

	.type	.L.str.1.166,@object    // @.str.1.166
.L.str.1.166:
	.asciz	"elem_size of buffer was not in [1, 2, 4, 8]"
	.size	.L.str.1.166, 44

	.type	.L.str.2.167,@object    // @.str.2.167
.L.str.2.167:
	.asciz	"buffer has incorrect elem_size ("
	.size	.L.str.2.167, 33

	.type	.L.str.3.168,@object    // @.str.3.168
.L.str.3.168:
	.asciz	") "
	.size	.L.str.3.168, 3

	.type	.L.str.4.169,@object    // @.str.4.169
.L.str.4.169:
	.asciz	"for expected type ("
	.size	.L.str.4.169, 20

	.type	.L.str.5.170,@object    // @.str.5.170
.L.str.5.170:
	.asciz	")"
	.size	.L.str.5.170, 2

	.type	.L.str.6.172,@object    // @.str.6.172
.L.str.6.172:
	.asciz	"Internal error: buffer host mismatch in halide_upgrade_buffer_t."
	.size	.L.str.6.172, 65

	.type	.L.str.7.173,@object    // @.str.7.173
.L.str.7.173:
	.asciz	"buffer has more than four dimensions"
	.size	.L.str.7.173, 37

	.type	.L.str.8.177,@object    // @.str.8.177
.L.str.8.177:
	.asciz	" total time: "
	.size	.L.str.8.177, 14

	.type	.L.str.9.178,@object    // @.str.9.178
.L.str.9.178:
	.asciz	" ms"
	.size	.L.str.9.178, 4

	.type	.L.str.10.179,@object   // @.str.10.179
.L.str.10.179:
	.asciz	"  samples: "
	.size	.L.str.10.179, 12

	.type	.L.str.11.180,@object   // @.str.11.180
.L.str.11.180:
	.asciz	"  runs: "
	.size	.L.str.11.180, 9

	.type	.L.str.12.181,@object   // @.str.12.181
.L.str.12.181:
	.asciz	"  time/run: "
	.size	.L.str.12.181, 13

	.type	.L.str.13.182,@object   // @.str.13.182
.L.str.13.182:
	.asciz	" ms\n"
	.size	.L.str.13.182, 5

	.type	.L.str.14.183,@object   // @.str.14.183
.L.str.14.183:
	.asciz	" average threads used: "
	.size	.L.str.14.183, 24

	.type	.L.str.15.184,@object   // @.str.15.184
.L.str.15.184:
	.asciz	" heap allocations: "
	.size	.L.str.15.184, 20

	.type	.L.str.16.185,@object   // @.str.16.185
.L.str.16.185:
	.asciz	"  peak heap usage: "
	.size	.L.str.16.185, 20

	.type	.L.str.17.186,@object   // @.str.17.186
.L.str.17.186:
	.asciz	" bytes\n"
	.size	.L.str.17.186, 8

	.type	.L.str.18.187,@object   // @.str.18.187
.L.str.18.187:
	.asciz	"  "
	.size	.L.str.18.187, 3

	.type	.L.str.19.188,@object   // @.str.19.188
.L.str.19.188:
	.asciz	": "
	.size	.L.str.19.188, 3

	.type	.L.str.21.190,@object   // @.str.21.190
.L.str.21.190:
	.asciz	"ms"
	.size	.L.str.21.190, 3

	.type	.L.str.22.191,@object   // @.str.22.191
.L.str.22.191:
	.asciz	"("
	.size	.L.str.22.191, 2

	.type	.L.str.23.192,@object   // @.str.23.192
.L.str.23.192:
	.asciz	"%)"
	.size	.L.str.23.192, 3

	.type	.L.str.24.193,@object   // @.str.24.193
.L.str.24.193:
	.asciz	"threads: "
	.size	.L.str.24.193, 10

	.type	.L.str.25.194,@object   // @.str.25.194
.L.str.25.194:
	.asciz	" peak: "
	.size	.L.str.25.194, 8

	.type	.L.str.26.195,@object   // @.str.26.195
.L.str.26.195:
	.asciz	" num: "
	.size	.L.str.26.195, 7

	.type	.L.str.27.196,@object   // @.str.27.196
.L.str.27.196:
	.asciz	" avg: "
	.size	.L.str.27.196, 7

	.type	.L.str.28.197,@object   // @.str.28.197
.L.str.28.197:
	.asciz	" stack: "
	.size	.L.str.28.197, 9

	.type	_ZZ25halide_profiler_get_stateE1s,@object // @_ZZ25halide_profiler_get_stateE1s
	.data
	.p2align	3
_ZZ25halide_profiler_get_stateE1s:
	.zero	8
	.word	1                       // 0x1
	.word	0                       // 0x0
	.word	0                       // 0x0
	.word	0                       // 0x0
	.xword	0
	.xword	0
	.xword	0
	.size	_ZZ25halide_profiler_get_stateE1s, 48

	.type	.L.str.198,@object      // @.str.198
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.198:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:201 Assert failed: p_stats != NULL\n"
	.size	.L.str.198, 85

	.type	.L.str.1.199,@object    // @.str.1.199
.L.str.1.199:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:228 Assert failed: p_stats != NULL\n"
	.size	.L.str.1.199, 85

	.type	.L.str.2.200,@object    // @.str.2.200
.L.str.2.200:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:229 Assert failed: func_id >= 0\n"
	.size	.L.str.2.200, 82

	.type	.L.str.3.201,@object    // @.str.3.201
.L.str.3.201:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:230 Assert failed: func_id < p_stats->num_funcs\n"
	.size	.L.str.3.201, 98

	.type	.L.str.4.202,@object    // @.str.4.202
.L.str.4.202:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:264 Assert failed: p_stats != NULL\n"
	.size	.L.str.4.202, 85

	.type	.L.str.5.203,@object    // @.str.5.203
.L.str.5.203:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:265 Assert failed: func_id >= 0\n"
	.size	.L.str.5.203, 82

	.type	.L.str.6.204,@object    // @.str.6.204
.L.str.6.204:
	.asciz	"/home/jason/code/Halide/src/runtime/profiler.cpp:266 Assert failed: func_id < p_stats->num_funcs\n"
	.size	.L.str.6.204, 98

	.type	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE,@object // @_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.data
	.weak	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE
	.p2align	3
_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE:
	.xword	halide_default_can_use_target_features
	.size	_ZN6Halide7Runtime8Internal30custom_can_use_target_featuresE, 8

	.type	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE,@object // @_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.bss
	.weak	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE
	.p2align	3
_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE:
	.zero	8
	.size	_ZN6Halide7Runtime8Internal36halide_cpu_features_initialized_lockE, 8

	.type	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE,@object // @_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
	.weak	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE
_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE:
	.byte	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal31halide_cpu_features_initializedE, 1

	.type	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE,@object // @_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.weak	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE
	.p2align	3
_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE:
	.zero	32
	.size	_ZN6Halide7Runtime8Internal27halide_cpu_features_storageE, 32

	.type	.L.str.209,@object      // @.str.209
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.209:
	.asciz	"Internal error: wrong structure size passed to halide_can_use_target_features()\n"
	.size	.L.str.209, 81

	.type	_ZN6Halide7Runtime8Internal6OpenCL16clGetPlatformIDsE,@object // @_ZN6Halide7Runtime8Internal6OpenCL16clGetPlatformIDsE
	.bss
	.weak	_ZN6Halide7Runtime8Internal6OpenCL16clGetPlatformIDsE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL16clGetPlatformIDsE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL16clGetPlatformIDsE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL17clGetPlatformInfoE,@object // @_ZN6Halide7Runtime8Internal6OpenCL17clGetPlatformInfoE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL17clGetPlatformInfoE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL17clGetPlatformInfoE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL17clGetPlatformInfoE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL14clGetDeviceIDsE,@object // @_ZN6Halide7Runtime8Internal6OpenCL14clGetDeviceIDsE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL14clGetDeviceIDsE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL14clGetDeviceIDsE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL14clGetDeviceIDsE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL15clGetDeviceInfoE,@object // @_ZN6Halide7Runtime8Internal6OpenCL15clGetDeviceInfoE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL15clGetDeviceInfoE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL15clGetDeviceInfoE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL15clGetDeviceInfoE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE,@object // @_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL15clCreateContextE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL23clCreateContextFromTypeE,@object // @_ZN6Halide7Runtime8Internal6OpenCL23clCreateContextFromTypeE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL23clCreateContextFromTypeE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL23clCreateContextFromTypeE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL23clCreateContextFromTypeE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL15clRetainContextE,@object // @_ZN6Halide7Runtime8Internal6OpenCL15clRetainContextE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL15clRetainContextE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL15clRetainContextE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL15clRetainContextE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL16clReleaseContextE,@object // @_ZN6Halide7Runtime8Internal6OpenCL16clReleaseContextE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL16clReleaseContextE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL16clReleaseContextE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL16clReleaseContextE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL16clGetContextInfoE,@object // @_ZN6Halide7Runtime8Internal6OpenCL16clGetContextInfoE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL16clGetContextInfoE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL16clGetContextInfoE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL16clGetContextInfoE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL20clCreateCommandQueueE,@object // @_ZN6Halide7Runtime8Internal6OpenCL20clCreateCommandQueueE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL20clCreateCommandQueueE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL20clCreateCommandQueueE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL20clCreateCommandQueueE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL20clRetainCommandQueueE,@object // @_ZN6Halide7Runtime8Internal6OpenCL20clRetainCommandQueueE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL20clRetainCommandQueueE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL20clRetainCommandQueueE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL20clRetainCommandQueueE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL21clReleaseCommandQueueE,@object // @_ZN6Halide7Runtime8Internal6OpenCL21clReleaseCommandQueueE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL21clReleaseCommandQueueE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL21clReleaseCommandQueueE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL21clReleaseCommandQueueE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL21clGetCommandQueueInfoE,@object // @_ZN6Halide7Runtime8Internal6OpenCL21clGetCommandQueueInfoE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL21clGetCommandQueueInfoE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL21clGetCommandQueueInfoE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL21clGetCommandQueueInfoE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL14clCreateBufferE,@object // @_ZN6Halide7Runtime8Internal6OpenCL14clCreateBufferE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL14clCreateBufferE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL14clCreateBufferE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL14clCreateBufferE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL17clCreateSubBufferE,@object // @_ZN6Halide7Runtime8Internal6OpenCL17clCreateSubBufferE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL17clCreateSubBufferE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL17clCreateSubBufferE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL17clCreateSubBufferE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL17clRetainMemObjectE,@object // @_ZN6Halide7Runtime8Internal6OpenCL17clRetainMemObjectE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL17clRetainMemObjectE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL17clRetainMemObjectE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL17clRetainMemObjectE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE,@object // @_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL18clReleaseMemObjectE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL26clGetSupportedImageFormatsE,@object // @_ZN6Halide7Runtime8Internal6OpenCL26clGetSupportedImageFormatsE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL26clGetSupportedImageFormatsE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL26clGetSupportedImageFormatsE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL26clGetSupportedImageFormatsE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL18clGetMemObjectInfoE,@object // @_ZN6Halide7Runtime8Internal6OpenCL18clGetMemObjectInfoE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL18clGetMemObjectInfoE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL18clGetMemObjectInfoE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL18clGetMemObjectInfoE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL14clGetImageInfoE,@object // @_ZN6Halide7Runtime8Internal6OpenCL14clGetImageInfoE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL14clGetImageInfoE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL14clGetImageInfoE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL14clGetImageInfoE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL32clSetMemObjectDestructorCallbackE,@object // @_ZN6Halide7Runtime8Internal6OpenCL32clSetMemObjectDestructorCallbackE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL32clSetMemObjectDestructorCallbackE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL32clSetMemObjectDestructorCallbackE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL32clSetMemObjectDestructorCallbackE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL25clCreateProgramWithSourceE,@object // @_ZN6Halide7Runtime8Internal6OpenCL25clCreateProgramWithSourceE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL25clCreateProgramWithSourceE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL25clCreateProgramWithSourceE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL25clCreateProgramWithSourceE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL15clRetainProgramE,@object // @_ZN6Halide7Runtime8Internal6OpenCL15clRetainProgramE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL15clRetainProgramE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL15clRetainProgramE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL15clRetainProgramE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL16clReleaseProgramE,@object // @_ZN6Halide7Runtime8Internal6OpenCL16clReleaseProgramE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL16clReleaseProgramE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL16clReleaseProgramE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL16clReleaseProgramE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL14clBuildProgramE,@object // @_ZN6Halide7Runtime8Internal6OpenCL14clBuildProgramE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL14clBuildProgramE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL14clBuildProgramE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL14clBuildProgramE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL21clGetProgramBuildInfoE,@object // @_ZN6Halide7Runtime8Internal6OpenCL21clGetProgramBuildInfoE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL21clGetProgramBuildInfoE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL21clGetProgramBuildInfoE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL21clGetProgramBuildInfoE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL14clCreateKernelE,@object // @_ZN6Halide7Runtime8Internal6OpenCL14clCreateKernelE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL14clCreateKernelE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL14clCreateKernelE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL14clCreateKernelE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL14clRetainKernelE,@object // @_ZN6Halide7Runtime8Internal6OpenCL14clRetainKernelE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL14clRetainKernelE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL14clRetainKernelE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL14clRetainKernelE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL15clReleaseKernelE,@object // @_ZN6Halide7Runtime8Internal6OpenCL15clReleaseKernelE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL15clReleaseKernelE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL15clReleaseKernelE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL15clReleaseKernelE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL14clSetKernelArgE,@object // @_ZN6Halide7Runtime8Internal6OpenCL14clSetKernelArgE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL14clSetKernelArgE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL14clSetKernelArgE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL14clSetKernelArgE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL7clFlushE,@object // @_ZN6Halide7Runtime8Internal6OpenCL7clFlushE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL7clFlushE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL7clFlushE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL7clFlushE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL8clFinishE,@object // @_ZN6Halide7Runtime8Internal6OpenCL8clFinishE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL8clFinishE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL8clFinishE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL8clFinishE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueReadBufferE,@object // @_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueReadBufferE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueReadBufferE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueReadBufferE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueReadBufferE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueReadBufferRectE,@object // @_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueReadBufferRectE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueReadBufferRectE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueReadBufferRectE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueReadBufferRectE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL20clEnqueueWriteBufferE,@object // @_ZN6Halide7Runtime8Internal6OpenCL20clEnqueueWriteBufferE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL20clEnqueueWriteBufferE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL20clEnqueueWriteBufferE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL20clEnqueueWriteBufferE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL24clEnqueueWriteBufferRectE,@object // @_ZN6Halide7Runtime8Internal6OpenCL24clEnqueueWriteBufferRectE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL24clEnqueueWriteBufferRectE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL24clEnqueueWriteBufferRectE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL24clEnqueueWriteBufferRectE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueCopyBufferE,@object // @_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueCopyBufferE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueCopyBufferE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueCopyBufferE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueCopyBufferE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueReadImageE,@object // @_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueReadImageE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueReadImageE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueReadImageE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueReadImageE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueWriteImageE,@object // @_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueWriteImageE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueWriteImageE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueWriteImageE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL19clEnqueueWriteImageE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueMapBufferE,@object // @_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueMapBufferE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueMapBufferE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueMapBufferE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL18clEnqueueMapBufferE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL17clEnqueueMapImageE,@object // @_ZN6Halide7Runtime8Internal6OpenCL17clEnqueueMapImageE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL17clEnqueueMapImageE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL17clEnqueueMapImageE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL17clEnqueueMapImageE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueUnmapMemObjectE,@object // @_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueUnmapMemObjectE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueUnmapMemObjectE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueUnmapMemObjectE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL23clEnqueueUnmapMemObjectE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL22clEnqueueNDRangeKernelE,@object // @_ZN6Halide7Runtime8Internal6OpenCL22clEnqueueNDRangeKernelE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL22clEnqueueNDRangeKernelE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL22clEnqueueNDRangeKernelE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL22clEnqueueNDRangeKernelE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL10lib_openclE,@object // @_ZN6Halide7Runtime8Internal6OpenCL10lib_openclE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL10lib_openclE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL10lib_openclE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL10lib_openclE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL7contextE,@object // @_ZN6Halide7Runtime8Internal6OpenCL7contextE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL7contextE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL7contextE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL7contextE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL13command_queueE,@object // @_ZN6Halide7Runtime8Internal6OpenCL13command_queueE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL13command_queueE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL13command_queueE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL13command_queueE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL11thread_lockE,@object // @_ZN6Halide7Runtime8Internal6OpenCL11thread_lockE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL11thread_lockE
	.p2align	2
_ZN6Halide7Runtime8Internal6OpenCL11thread_lockE:
	.word	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal6OpenCL11thread_lockE, 4

	.type	_ZN6Halide7Runtime8Internal6OpenCL13platform_nameE,@object // @_ZN6Halide7Runtime8Internal6OpenCL13platform_nameE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL13platform_nameE
_ZN6Halide7Runtime8Internal6OpenCL13platform_nameE:
	.zero	256
	.size	_ZN6Halide7Runtime8Internal6OpenCL13platform_nameE, 256

	.type	_ZN6Halide7Runtime8Internal6OpenCL18platform_name_lockE,@object // @_ZN6Halide7Runtime8Internal6OpenCL18platform_name_lockE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL18platform_name_lockE
	.p2align	2
_ZN6Halide7Runtime8Internal6OpenCL18platform_name_lockE:
	.word	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal6OpenCL18platform_name_lockE, 4

	.type	_ZN6Halide7Runtime8Internal6OpenCL25platform_name_initializedE,@object // @_ZN6Halide7Runtime8Internal6OpenCL25platform_name_initializedE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL25platform_name_initializedE
_ZN6Halide7Runtime8Internal6OpenCL25platform_name_initializedE:
	.byte	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal6OpenCL25platform_name_initializedE, 1

	.type	_ZN6Halide7Runtime8Internal6OpenCL11device_typeE,@object // @_ZN6Halide7Runtime8Internal6OpenCL11device_typeE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL11device_typeE
_ZN6Halide7Runtime8Internal6OpenCL11device_typeE:
	.zero	256
	.size	_ZN6Halide7Runtime8Internal6OpenCL11device_typeE, 256

	.type	_ZN6Halide7Runtime8Internal6OpenCL16device_type_lockE,@object // @_ZN6Halide7Runtime8Internal6OpenCL16device_type_lockE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL16device_type_lockE
	.p2align	2
_ZN6Halide7Runtime8Internal6OpenCL16device_type_lockE:
	.word	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal6OpenCL16device_type_lockE, 4

	.type	_ZN6Halide7Runtime8Internal6OpenCL23device_type_initializedE,@object // @_ZN6Halide7Runtime8Internal6OpenCL23device_type_initializedE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL23device_type_initializedE
_ZN6Halide7Runtime8Internal6OpenCL23device_type_initializedE:
	.byte	0                       // 0x0
	.size	_ZN6Halide7Runtime8Internal6OpenCL23device_type_initializedE, 1

	.type	_ZN6Halide7Runtime8Internal6OpenCL10state_listE,@object // @_ZN6Halide7Runtime8Internal6OpenCL10state_listE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL10state_listE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL10state_listE:
	.xword	0
	.size	_ZN6Halide7Runtime8Internal6OpenCL10state_listE, 8

	.type	_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE,@object // @_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE
	.data
	.weak	_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE:
	.xword	halide_device_malloc
	.xword	halide_device_free
	.xword	halide_device_sync
	.xword	halide_device_release
	.xword	halide_copy_to_host
	.xword	halide_copy_to_device
	.xword	halide_device_and_host_malloc
	.xword	halide_device_and_host_free
	.xword	halide_buffer_copy
	.xword	halide_device_crop
	.xword	halide_device_slice
	.xword	halide_device_release_crop
	.xword	halide_device_wrap_native
	.xword	halide_device_detach_native
	.xword	0
	.xword	_ZN6Halide7Runtime8Internal6OpenCL28opencl_device_interface_implE
	.size	_ZN6Halide7Runtime8Internal6OpenCL23opencl_device_interfaceE, 128

	.type	_ZN6Halide7Runtime8Internal6OpenCL28opencl_device_interface_implE,@object // @_ZN6Halide7Runtime8Internal6OpenCL28opencl_device_interface_implE
	.weak	_ZN6Halide7Runtime8Internal6OpenCL28opencl_device_interface_implE
	.p2align	3
_ZN6Halide7Runtime8Internal6OpenCL28opencl_device_interface_implE:
	.xword	_ZN6Halide7Runtime8Internal21halide_use_jit_moduleEv
	.xword	_ZN6Halide7Runtime8Internal25halide_release_jit_moduleEv
	.xword	halide_opencl_device_malloc
	.xword	halide_opencl_device_free
	.xword	halide_opencl_device_sync
	.xword	halide_opencl_device_release
	.xword	halide_opencl_copy_to_host
	.xword	halide_opencl_copy_to_device
	.xword	halide_opencl_device_and_host_malloc
	.xword	halide_opencl_device_and_host_free
	.xword	halide_opencl_buffer_copy
	.xword	halide_opencl_device_crop
	.xword	halide_opencl_device_slice
	.xword	halide_opencl_device_release_crop
	.xword	halide_opencl_wrap_cl_mem
	.xword	halide_opencl_detach_cl_mem
	.size	_ZN6Halide7Runtime8Internal6OpenCL28opencl_device_interface_implE, 128

	.type	.L.str.174,@object      // @.str.174
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.174:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:1118 Assert failed: buf->device_interface == &opencl_device_interface\n"
	.size	.L.str.174, 118

	.type	.L.str.173,@object      // @.str.173
.L.str.173:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:1089 Assert failed: buf->device == 0\n"
	.size	.L.str.173, 85

	.type	.L.str.240,@object      // @.str.240
.L.str.240:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:199 Assert failed: context != NULL && cmd_queue != NULL\n"
	.size	.L.str.240, 104

	.type	.L.str.179,@object      // @.str.179
.L.str.179:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:1207 Assert failed: validate_device_pointer(user_context, buf)\n"
	.size	.L.str.179, 111

	.type	.L.str.60.214,@object   // @.str.60.214
.L.str.60.214:
	.asciz	"CL: Bad device pointer "
	.size	.L.str.60.214, 24

	.type	.L.str.61.215,@object   // @.str.61.215
.L.str.61.215:
	.asciz	": clGetMemObjectInfo returned "
	.size	.L.str.61.215, 31

	.type	.L.str.243,@object      // @.str.243
.L.str.243:
	.asciz	"<NULL>"
	.size	.L.str.243, 7

	.type	.L.str.242,@object      // @.str.242
.L.str.242:
	.asciz	"Printer buffer allocation failed.\n"
	.size	.L.str.242, 35

	.type	.L.str.66.216,@object   // @.str.66.216
.L.str.66.216:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:257 Assert failed: real_size >= (size + offset) && \"Validating pointer with insufficient size\"\n"
	.size	.L.str.66.216, 143

	.type	.L.str.239,@object      // @.str.239
.L.str.239:
	.asciz	"<Unknown error>"
	.size	.L.str.239, 16

	.type	.L.str.238,@object      // @.str.238
.L.str.238:
	.asciz	"CL_INVALID_DEVICE_PARTITION_COUNT"
	.size	.L.str.238, 34

	.type	.L.str.237,@object      // @.str.237
.L.str.237:
	.asciz	"CL_INVALID_LINKER_OPTIONS"
	.size	.L.str.237, 26

	.type	.L.str.236,@object      // @.str.236
.L.str.236:
	.asciz	"CL_INVALID_COMPILER_OPTIONS"
	.size	.L.str.236, 28

	.type	.L.str.235,@object      // @.str.235
.L.str.235:
	.asciz	"CL_INVALID_IMAGE_DESCRIPTOR"
	.size	.L.str.235, 28

	.type	.L.str.234,@object      // @.str.234
.L.str.234:
	.asciz	"CL_INVALID_PROPERTY"
	.size	.L.str.234, 20

	.type	.L.str.233,@object      // @.str.233
.L.str.233:
	.asciz	"CL_INVALID_GLOBAL_WORK_SIZE"
	.size	.L.str.233, 28

	.type	.L.str.232,@object      // @.str.232
.L.str.232:
	.asciz	"CL_INVALID_MIP_LEVEL"
	.size	.L.str.232, 21

	.type	.L.str.231,@object      // @.str.231
.L.str.231:
	.asciz	"CL_INVALID_BUFFER_SIZE"
	.size	.L.str.231, 23

	.type	.L.str.230,@object      // @.str.230
.L.str.230:
	.asciz	"CL_INVALID_GL_OBJECT"
	.size	.L.str.230, 21

	.type	.L.str.229,@object      // @.str.229
.L.str.229:
	.asciz	"CL_INVALID_OPERATION"
	.size	.L.str.229, 21

	.type	.L.str.228,@object      // @.str.228
.L.str.228:
	.asciz	"CL_INVALID_EVENT"
	.size	.L.str.228, 17

	.type	.L.str.227,@object      // @.str.227
.L.str.227:
	.asciz	"CL_INVALID_EVENT_WAIT_LIST"
	.size	.L.str.227, 27

	.type	.L.str.226,@object      // @.str.226
.L.str.226:
	.asciz	"CL_INVALID_GLOBAL_OFFSET"
	.size	.L.str.226, 25

	.type	.L.str.225,@object      // @.str.225
.L.str.225:
	.asciz	"CL_INVALID_WORK_ITEM_SIZE"
	.size	.L.str.225, 26

	.type	.L.str.224,@object      // @.str.224
.L.str.224:
	.asciz	"CL_INVALID_WORK_GROUP_SIZE"
	.size	.L.str.224, 27

	.type	.L.str.223,@object      // @.str.223
.L.str.223:
	.asciz	"CL_INVALID_WORK_DIMENSION"
	.size	.L.str.223, 26

	.type	.L.str.222,@object      // @.str.222
.L.str.222:
	.asciz	"CL_INVALID_KERNEL_ARGS"
	.size	.L.str.222, 23

	.type	.L.str.221,@object      // @.str.221
.L.str.221:
	.asciz	"CL_INVALID_ARG_SIZE"
	.size	.L.str.221, 20

	.type	.L.str.220,@object      // @.str.220
.L.str.220:
	.asciz	"CL_INVALID_ARG_VALUE"
	.size	.L.str.220, 21

	.type	.L.str.219,@object      // @.str.219
.L.str.219:
	.asciz	"CL_INVALID_ARG_INDEX"
	.size	.L.str.219, 21

	.type	.L.str.218,@object      // @.str.218
.L.str.218:
	.asciz	"CL_INVALID_KERNEL"
	.size	.L.str.218, 18

	.type	.L.str.217,@object      // @.str.217
.L.str.217:
	.asciz	"CL_INVALID_KERNEL_DEFINITION"
	.size	.L.str.217, 29

	.type	.L.str.216,@object      // @.str.216
.L.str.216:
	.asciz	"CL_INVALID_KERNEL_NAME"
	.size	.L.str.216, 23

	.type	.L.str.215,@object      // @.str.215
.L.str.215:
	.asciz	"CL_INVALID_PROGRAM_EXECUTABLE"
	.size	.L.str.215, 30

	.type	.L.str.214,@object      // @.str.214
.L.str.214:
	.asciz	"CL_INVALID_PROGRAM"
	.size	.L.str.214, 19

	.type	.L.str.213,@object      // @.str.213
.L.str.213:
	.asciz	"CL_INVALID_BUILD_OPTIONS"
	.size	.L.str.213, 25

	.type	.L.str.212,@object      // @.str.212
.L.str.212:
	.asciz	"CL_INVALID_BINARY"
	.size	.L.str.212, 18

	.type	.L.str.211,@object      // @.str.211
.L.str.211:
	.asciz	"CL_INVALID_SAMPLER"
	.size	.L.str.211, 19

	.type	.L.str.210,@object      // @.str.210
.L.str.210:
	.asciz	"CL_INVALID_IMAGE_SIZE"
	.size	.L.str.210, 22

	.type	.L.str.209.217,@object  // @.str.209.217
.L.str.209.217:
	.asciz	"CL_INVALID_IMAGE_FORMAT_DESCRIPTOR"
	.size	.L.str.209.217, 35

	.type	.L.str.208,@object      // @.str.208
.L.str.208:
	.asciz	"CL_INVALID_MEM_OBJECT"
	.size	.L.str.208, 22

	.type	.L.str.207,@object      // @.str.207
.L.str.207:
	.asciz	"CL_INVALID_HOST_PTR"
	.size	.L.str.207, 20

	.type	.L.str.206,@object      // @.str.206
.L.str.206:
	.asciz	"CL_INVALID_COMMAND_QUEUE"
	.size	.L.str.206, 25

	.type	.L.str.205,@object      // @.str.205
.L.str.205:
	.asciz	"CL_INVALID_QUEUE_PROPERTIES"
	.size	.L.str.205, 28

	.type	.L.str.204,@object      // @.str.204
.L.str.204:
	.asciz	"CL_INVALID_CONTEXT"
	.size	.L.str.204, 19

	.type	.L.str.203,@object      // @.str.203
.L.str.203:
	.asciz	"CL_INVALID_DEVICE"
	.size	.L.str.203, 18

	.type	.L.str.202,@object      // @.str.202
.L.str.202:
	.asciz	"CL_INVALID_PLATFORM"
	.size	.L.str.202, 20

	.type	.L.str.201,@object      // @.str.201
.L.str.201:
	.asciz	"CL_INVALID_DEVICE_TYPE"
	.size	.L.str.201, 23

	.type	.L.str.200,@object      // @.str.200
.L.str.200:
	.asciz	"CL_INVALID_VALUE"
	.size	.L.str.200, 17

	.type	.L.str.199,@object      // @.str.199
.L.str.199:
	.asciz	"CL_KERNEL_ARG_INFO_NOT_AVAILABLE"
	.size	.L.str.199, 33

	.type	.L.str.198.218,@object  // @.str.198.218
.L.str.198.218:
	.asciz	"CL_DEVICE_PARTITION_FAILED"
	.size	.L.str.198.218, 27

	.type	.L.str.197,@object      // @.str.197
.L.str.197:
	.asciz	"CL_LINK_PROGRAM_FAILURE"
	.size	.L.str.197, 24

	.type	.L.str.196,@object      // @.str.196
.L.str.196:
	.asciz	"CL_LINKER_NOT_AVAILABLE"
	.size	.L.str.196, 24

	.type	.L.str.195,@object      // @.str.195
.L.str.195:
	.asciz	"CL_COMPILE_PROGRAM_FAILURE"
	.size	.L.str.195, 27

	.type	.L.str.194,@object      // @.str.194
.L.str.194:
	.asciz	"CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST"
	.size	.L.str.194, 45

	.type	.L.str.193,@object      // @.str.193
.L.str.193:
	.asciz	"CL_MISALIGNED_SUB_BUFFER_OFFSET"
	.size	.L.str.193, 32

	.type	.L.str.192,@object      // @.str.192
.L.str.192:
	.asciz	"CL_MAP_FAILURE"
	.size	.L.str.192, 15

	.type	.L.str.191,@object      // @.str.191
.L.str.191:
	.asciz	"CL_BUILD_PROGRAM_FAILURE"
	.size	.L.str.191, 25

	.type	.L.str.190,@object      // @.str.190
.L.str.190:
	.asciz	"CL_IMAGE_FORMAT_NOT_SUPPORTED"
	.size	.L.str.190, 30

	.type	.L.str.189,@object      // @.str.189
.L.str.189:
	.asciz	"CL_IMAGE_FORMAT_MISMATCH"
	.size	.L.str.189, 25

	.type	.L.str.188,@object      // @.str.188
.L.str.188:
	.asciz	"CL_MEM_COPY_OVERLAP"
	.size	.L.str.188, 20

	.type	.L.str.187,@object      // @.str.187
.L.str.187:
	.asciz	"CL_PROFILING_INFO_NOT_AVAILABLE"
	.size	.L.str.187, 32

	.type	.L.str.186,@object      // @.str.186
.L.str.186:
	.asciz	"CL_OUT_OF_HOST_MEMORY"
	.size	.L.str.186, 22

	.type	.L.str.185,@object      // @.str.185
.L.str.185:
	.asciz	"CL_OUT_OF_RESOURCES"
	.size	.L.str.185, 20

	.type	.L.str.184,@object      // @.str.184
.L.str.184:
	.asciz	"CL_MEM_OBJECT_ALLOCATION_FAILURE"
	.size	.L.str.184, 33

	.type	.L.str.183,@object      // @.str.183
.L.str.183:
	.asciz	"CL_COMPILER_NOT_AVAILABLE"
	.size	.L.str.183, 26

	.type	.L.str.182,@object      // @.str.182
.L.str.182:
	.asciz	"CL_DEVICE_NOT_AVAILABLE"
	.size	.L.str.182, 24

	.type	.L.str.181,@object      // @.str.181
.L.str.181:
	.asciz	"CL_DEVICE_NOT_FOUND"
	.size	.L.str.181, 20

	.type	.L.str.180,@object      // @.str.180
.L.str.180:
	.asciz	"CL_SUCCESS"
	.size	.L.str.180, 11

	.type	.L.str.55.219,@object   // @.str.55.219
.L.str.55.219:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:145 Assert failed: ctx != NULL\n"
	.size	.L.str.55.219, 79

	.type	.L.str.56.220,@object   // @.str.56.220
.L.str.56.220:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:146 Assert failed: q != NULL\n"
	.size	.L.str.56.220, 77

	.type	.L.str.68.221,@object   // @.str.68.221
.L.str.68.221:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:268 Assert failed: ctx != NULL && *ctx == NULL\n"
	.size	.L.str.68.221, 95

	.type	.L.str.69.222,@object   // @.str.69.222
.L.str.69.222:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:269 Assert failed: q != NULL && *q == NULL\n"
	.size	.L.str.69.222, 91

	.type	.L.str.70.223,@object   // @.str.70.223
.L.str.70.223:
	.asciz	"CL: clGetPlatformIDs failed: "
	.size	.L.str.70.223, 30

	.type	.L.str.71.224,@object   // @.str.71.224
.L.str.71.224:
	.asciz	" "
	.size	.L.str.71.224, 2

	.type	.L.str.73.225,@object   // @.str.73.225
.L.str.73.225:
	.asciz	"CL: Failed to find platform\n"
	.size	.L.str.73.225, 29

	.type	.L.str.74.226,@object   // @.str.74.226
.L.str.74.226:
	.asciz	"cpu"
	.size	.L.str.74.226, 4

	.type	.L.str.75.227,@object   // @.str.75.227
.L.str.75.227:
	.asciz	"gpu"
	.size	.L.str.75.227, 4

	.type	.L.str.76,@object       // @.str.76
.L.str.76:
	.asciz	"acc"
	.size	.L.str.76, 4

	.type	.L.str.77,@object       // @.str.77
.L.str.77:
	.asciz	"CL: clGetDeviceIDs failed: "
	.size	.L.str.77, 28

	.type	.L.str.84,@object       // @.str.84
.L.str.84:
	.asciz	"CL: Failed to get device: "
	.size	.L.str.84, 27

	.type	.L.str.86,@object       // @.str.86
.L.str.86:
	.asciz	"CL: clCreateContext failed: "
	.size	.L.str.86, 29

	.type	.L.str.87,@object       // @.str.87
.L.str.87:
	.asciz	":"
	.size	.L.str.87, 2

	.type	.L.str.89,@object       // @.str.89
.L.str.89:
	.asciz	"CL: clCreateCommandQueue failed: "
	.size	.L.str.89, 34

	.type	.L.str.54.228,@object   // @.str.54.228
.L.str.54.228:
	.asciz	"HL_OCL_DEVICE_TYPE"
	.size	.L.str.54.228, 19

	.type	.L.str.53.229,@object   // @.str.53.229
.L.str.53.229:
	.asciz	"HL_OCL_PLATFORM_NAME"
	.size	.L.str.53.229, 21

	.type	.L.str.9.230,@object    // @.str.9.230
.L.str.9.230:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:62 Assert failed: clCreateContext == NULL\n"
	.size	.L.str.9.230, 90

	.type	.L.str.10.231,@object   // @.str.10.231
.L.str.10.231:
	.asciz	"clGetPlatformIDs"
	.size	.L.str.10.231, 17

	.type	.L.str.241,@object      // @.str.241
.L.str.241:
	.asciz	"OpenCL API not found: "
	.size	.L.str.241, 23

	.type	.L.str.3.232,@object    // @.str.3.232
.L.str.3.232:
	.asciz	"\n"
	.size	.L.str.3.232, 2

	.type	.L.str.11.233,@object   // @.str.11.233
.L.str.11.233:
	.asciz	"clGetPlatformInfo"
	.size	.L.str.11.233, 18

	.type	.L.str.12.234,@object   // @.str.12.234
.L.str.12.234:
	.asciz	"clGetDeviceIDs"
	.size	.L.str.12.234, 15

	.type	.L.str.13.235,@object   // @.str.13.235
.L.str.13.235:
	.asciz	"clGetDeviceInfo"
	.size	.L.str.13.235, 16

	.type	.L.str.14.236,@object   // @.str.14.236
.L.str.14.236:
	.asciz	"clCreateContext"
	.size	.L.str.14.236, 16

	.type	.L.str.15.237,@object   // @.str.15.237
.L.str.15.237:
	.asciz	"clCreateContextFromType"
	.size	.L.str.15.237, 24

	.type	.L.str.16.238,@object   // @.str.16.238
.L.str.16.238:
	.asciz	"clRetainContext"
	.size	.L.str.16.238, 16

	.type	.L.str.17.239,@object   // @.str.17.239
.L.str.17.239:
	.asciz	"clReleaseContext"
	.size	.L.str.17.239, 17

	.type	.L.str.18.240,@object   // @.str.18.240
.L.str.18.240:
	.asciz	"clGetContextInfo"
	.size	.L.str.18.240, 17

	.type	.L.str.19.241,@object   // @.str.19.241
.L.str.19.241:
	.asciz	"clCreateCommandQueue"
	.size	.L.str.19.241, 21

	.type	.L.str.20.242,@object   // @.str.20.242
.L.str.20.242:
	.asciz	"clRetainCommandQueue"
	.size	.L.str.20.242, 21

	.type	.L.str.21.243,@object   // @.str.21.243
.L.str.21.243:
	.asciz	"clReleaseCommandQueue"
	.size	.L.str.21.243, 22

	.type	.L.str.22.244,@object   // @.str.22.244
.L.str.22.244:
	.asciz	"clGetCommandQueueInfo"
	.size	.L.str.22.244, 22

	.type	.L.str.23.245,@object   // @.str.23.245
.L.str.23.245:
	.asciz	"clCreateBuffer"
	.size	.L.str.23.245, 15

	.type	.L.str.24.246,@object   // @.str.24.246
.L.str.24.246:
	.asciz	"clCreateSubBuffer"
	.size	.L.str.24.246, 18

	.type	.L.str.25.247,@object   // @.str.25.247
.L.str.25.247:
	.asciz	"clRetainMemObject"
	.size	.L.str.25.247, 18

	.type	.L.str.26.248,@object   // @.str.26.248
.L.str.26.248:
	.asciz	"clReleaseMemObject"
	.size	.L.str.26.248, 19

	.type	.L.str.27.249,@object   // @.str.27.249
.L.str.27.249:
	.asciz	"clGetSupportedImageFormats"
	.size	.L.str.27.249, 27

	.type	.L.str.28.250,@object   // @.str.28.250
.L.str.28.250:
	.asciz	"clGetMemObjectInfo"
	.size	.L.str.28.250, 19

	.type	.L.str.29.251,@object   // @.str.29.251
.L.str.29.251:
	.asciz	"clGetImageInfo"
	.size	.L.str.29.251, 15

	.type	.L.str.30.252,@object   // @.str.30.252
.L.str.30.252:
	.asciz	"clSetMemObjectDestructorCallback"
	.size	.L.str.30.252, 33

	.type	.L.str.31.253,@object   // @.str.31.253
.L.str.31.253:
	.asciz	"clCreateProgramWithSource"
	.size	.L.str.31.253, 26

	.type	.L.str.32.254,@object   // @.str.32.254
.L.str.32.254:
	.asciz	"clRetainProgram"
	.size	.L.str.32.254, 16

	.type	.L.str.33.255,@object   // @.str.33.255
.L.str.33.255:
	.asciz	"clReleaseProgram"
	.size	.L.str.33.255, 17

	.type	.L.str.34.256,@object   // @.str.34.256
.L.str.34.256:
	.asciz	"clBuildProgram"
	.size	.L.str.34.256, 15

	.type	.L.str.35.257,@object   // @.str.35.257
.L.str.35.257:
	.asciz	"clGetProgramBuildInfo"
	.size	.L.str.35.257, 22

	.type	.L.str.36.258,@object   // @.str.36.258
.L.str.36.258:
	.asciz	"clCreateKernel"
	.size	.L.str.36.258, 15

	.type	.L.str.37.259,@object   // @.str.37.259
.L.str.37.259:
	.asciz	"clRetainKernel"
	.size	.L.str.37.259, 15

	.type	.L.str.38.260,@object   // @.str.38.260
.L.str.38.260:
	.asciz	"clReleaseKernel"
	.size	.L.str.38.260, 16

	.type	.L.str.39.261,@object   // @.str.39.261
.L.str.39.261:
	.asciz	"clSetKernelArg"
	.size	.L.str.39.261, 15

	.type	.L.str.40.262,@object   // @.str.40.262
.L.str.40.262:
	.asciz	"clFlush"
	.size	.L.str.40.262, 8

	.type	.L.str.41.263,@object   // @.str.41.263
.L.str.41.263:
	.asciz	"clFinish"
	.size	.L.str.41.263, 9

	.type	.L.str.42.264,@object   // @.str.42.264
.L.str.42.264:
	.asciz	"clEnqueueReadBuffer"
	.size	.L.str.42.264, 20

	.type	.L.str.43.265,@object   // @.str.43.265
.L.str.43.265:
	.asciz	"clEnqueueReadBufferRect"
	.size	.L.str.43.265, 24

	.type	.L.str.44.266,@object   // @.str.44.266
.L.str.44.266:
	.asciz	"clEnqueueWriteBuffer"
	.size	.L.str.44.266, 21

	.type	.L.str.45.267,@object   // @.str.45.267
.L.str.45.267:
	.asciz	"clEnqueueWriteBufferRect"
	.size	.L.str.45.267, 25

	.type	.L.str.46.268,@object   // @.str.46.268
.L.str.46.268:
	.asciz	"clEnqueueCopyBuffer"
	.size	.L.str.46.268, 20

	.type	.L.str.47.269,@object   // @.str.47.269
.L.str.47.269:
	.asciz	"clEnqueueReadImage"
	.size	.L.str.47.269, 19

	.type	.L.str.48.270,@object   // @.str.48.270
.L.str.48.270:
	.asciz	"clEnqueueWriteImage"
	.size	.L.str.48.270, 20

	.type	.L.str.49.271,@object   // @.str.49.271
.L.str.49.271:
	.asciz	"clEnqueueMapBuffer"
	.size	.L.str.49.271, 19

	.type	.L.str.50.272,@object   // @.str.50.272
.L.str.50.272:
	.asciz	"clEnqueueMapImage"
	.size	.L.str.50.272, 18

	.type	.L.str.51.273,@object   // @.str.51.273
.L.str.51.273:
	.asciz	"clEnqueueUnmapMemObject"
	.size	.L.str.51.273, 24

	.type	.L.str.52.274,@object   // @.str.52.274
.L.str.52.274:
	.asciz	"clEnqueueNDRangeKernel"
	.size	.L.str.52.274, 23

	.type	.L.str.4.275,@object    // @.str.4.275
.L.str.4.275:
	.asciz	"libOpenCL.so"
	.size	.L.str.4.275, 13

	.type	.L.str.5.276,@object    // @.str.5.276
.L.str.5.276:
	.asciz	"/System/Library/Frameworks/OpenCL.framework/OpenCL"
	.size	.L.str.5.276, 51

	.type	.L.str.177,@object      // @.str.177
.L.str.177:
	.asciz	"CL: malloc failed making device handle for crop.\n"
	.size	.L.str.177, 50

	.type	.L.str.143,@object      // @.str.143
.L.str.143:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:848 Assert failed: dst_device_interface == NULL || dst_device_interface == &opencl_device_interface\n"
	.size	.L.str.143, 148

	.type	.L.str.144,@object      // @.str.144
.L.str.144:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:852 Assert failed: dst_device_interface == &opencl_device_interface\n"
	.size	.L.str.144, 116

	.type	.L.str.146,@object      // @.str.146
.L.str.146:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:863 Assert failed: to_host || dst->device\n"
	.size	.L.str.146, 90

	.type	.L.str.133,@object      // @.str.133
.L.str.133:
	.asciz	"Buffer has too many dimensions to copy to/from GPU\n"
	.size	.L.str.133, 52

	.type	.L.str.142,@object      // @.str.142
.L.str.142:
	.asciz	"CL: buffer copy failed: "
	.size	.L.str.142, 25

	.type	.L.str.115,@object      // @.str.115
.L.str.115:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:684 Assert failed: err == CL_SUCCESS\n"
	.size	.L.str.115, 85

	.type	.L.str.117,@object      // @.str.117
.L.str.117:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:696 Assert failed: err == CL_SUCCESS\n"
	.size	.L.str.117, 85

	.type	.L.str.119,@object      // @.str.119
.L.str.119:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:706 Assert failed: err == CL_SUCCESS\n"
	.size	.L.str.119, 85

	.type	.L.str.121,@object      // @.str.121
.L.str.121:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:711 Assert failed: err == CL_SUCCESS\n"
	.size	.L.str.121, 85

	.type	.L.str.112,@object      // @.str.112
.L.str.112:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:647 Assert failed: ctx.error == CL_SUCCESS\n"
	.size	.L.str.112, 91

	.type	.L.str.113,@object      // @.str.113
.L.str.113:
	.asciz	"CL: clFinish failed: "
	.size	.L.str.113, 22

	.type	.L.str.90,@object       // @.str.90
.L.str.90:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:491 Assert failed: (((device_handle *)buf->device)->offset == 0) && \"halide_opencl_device_free on buffer obtained from halide_device_crop\"\n"
	.size	.L.str.90, 187

	.type	.L.str.94,@object       // @.str.94
.L.str.94:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:506 Assert failed: validate_device_pointer(user_context, buf)\n"
	.size	.L.str.94, 110

	.type	.L.str.123,@object      // @.str.123
.L.str.123:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:732 Assert failed: size != 0\n"
	.size	.L.str.123, 77

	.type	.L.str.124,@object      // @.str.124
.L.str.124:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:734 Assert failed: validate_device_pointer(user_context, buf, size)\n"
	.size	.L.str.124, 116

	.type	.L.str.125,@object      // @.str.125
.L.str.125:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:739 Assert failed: buf->dim[i].stride >= 0\n"
	.size	.L.str.125, 91

	.type	.L.str.128,@object      // @.str.128
.L.str.128:
	.asciz	"CL: clCreateBuffer failed: "
	.size	.L.str.128, 28

	.type	.L.str.132,@object      // @.str.132
.L.str.132:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:777 Assert failed: validate_device_pointer(user_context, buf, size)\n"
	.size	.L.str.132, 116

	.type	.L.str.100,@object      // @.str.100
.L.str.100:
	.asciz	"CL: clGetContextInfo(CL_CONTEXT_DEVICES) failed: "
	.size	.L.str.100, 50

	.type	.L.str.101,@object      // @.str.101
.L.str.101:
	.asciz	"CL: clGetDeviceInfo (CL_DEVICE_MAX_CONSTANT_BUFFER_SIZE) failed: "
	.size	.L.str.101, 66

	.type	.L.str.102,@object      // @.str.102
.L.str.102:
	.asciz	"CL: clGetDeviceInfo (CL_DEVICE_MAX_CONSTANT_ARGS) failed: "
	.size	.L.str.102, 59

	.type	.L.str.103,@object      // @.str.103
.L.str.103:
	.asciz	"-D MAX_CONSTANT_BUFFER_SIZE="
	.size	.L.str.103, 29

	.type	.L.str.104,@object      // @.str.104
.L.str.104:
	.asciz	" -D MAX_CONSTANT_ARGS="
	.size	.L.str.104, 23

	.type	.L.str.106,@object      // @.str.106
.L.str.106:
	.asciz	"CL: clCreateProgramWithSource failed: "
	.size	.L.str.106, 39

	.type	.L.str.108,@object      // @.str.108
.L.str.108:
	.asciz	"CL: clBuildProgram failed: "
	.size	.L.str.108, 28

	.type	.L.str.109,@object      // @.str.109
.L.str.109:
	.asciz	"\nBuild Log:\n"
	.size	.L.str.109, 13

	.type	.L.str.110,@object      // @.str.110
.L.str.110:
	.asciz	"clGetProgramBuildInfo failed"
	.size	.L.str.110, 29

	.type	.L.str.156,@object      // @.str.156
.L.str.156:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:944 Assert failed: state_ptr\n"
	.size	.L.str.156, 77

	.type	.L.str.157,@object      // @.str.157
.L.str.157:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:947 Assert failed: program\n"
	.size	.L.str.157, 75

	.type	.L.str.159,@object      // @.str.159
.L.str.159:
	.asciz	"CL: clCreateKernel "
	.size	.L.str.159, 20

	.type	.L.str.160,@object      // @.str.160
.L.str.160:
	.asciz	" failed: "
	.size	.L.str.160, 10

	.type	.L.str.164,@object      // @.str.164
.L.str.164:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:998 Assert failed: arg_sizes[i] == sizeof(uint64_t)\n"
	.size	.L.str.164, 100

	.type	.L.str.166,@object      // @.str.166
.L.str.166:
	.asciz	"CL: clSetKernelArg failed: "
	.size	.L.str.166, 28

	.type	.L.str.168,@object      // @.str.168
.L.str.168:
	.asciz	"CL: clSetKernelArg failed "
	.size	.L.str.168, 27

	.type	.L.str.170,@object      // @.str.170
.L.str.170:
	.asciz	"CL: clEnqueueNDRangeKernel failed: "
	.size	.L.str.170, 36

	.type	.L.str.175,@object      // @.str.175
.L.str.175:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:1130 Assert failed: buf->device_interface == &opencl_device_interface\n"
	.size	.L.str.175, 118

	.type	.L.str.176,@object      // @.str.176
.L.str.176:
	.asciz	"/home/jason/code/Halide/src/runtime/opencl.cpp:1138 Assert failed: buf->device_interface == &opencl_device_interface\n"
	.size	.L.str.176, 118

	.type	.Lstr,@object           // @str
	.section	.rodata,"a",@progbits
	.p2align	5
.Lstr:
	.asciz	"input"
	.size	.Lstr, 6

	.type	.Lstr.278,@object       // @str.278
	.p2align	5
.Lstr.278:
	.asciz	"blur_y"
	.size	.Lstr.278, 7

	.type	.Lstr.279,@object       // @str.279
	.p2align	5
.Lstr.279:
	.asciz	"Output buffer blur_y"
	.size	.Lstr.279, 21

	.type	.Lstr.280,@object       // @str.280
	.p2align	5
.Lstr.280:
	.asciz	"Input buffer input"
	.size	.Lstr.280, 19

	.type	.Lstr.281,@object       // @str.281
	.p2align	5
.Lstr.281:
	.asciz	"blur_y.stride.0"
	.size	.Lstr.281, 16

	.type	.Lstr.282,@object       // @str.282
	.p2align	5
.Lstr.282:
	.asciz	"1"
	.size	.Lstr.282, 2

	.type	.Lstr.283,@object       // @str.283
	.p2align	5
.Lstr.283:
	.asciz	"input.stride.0"
	.size	.Lstr.283, 15

	.type	.Lentry_name,@object    // @entry_name
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lentry_name:
	.asciz	"kernel_blur_y_s0_y_y_y___block_id_y"
	.size	.Lentry_name, 36

	.type	module_state_halide_blur_opencl,@object // @module_state_halide_blur_opencl
	.local	module_state_halide_blur_opencl
	.comm	module_state_halide_blur_opencl,8,8
	.type	.Lhalide_halide_blur_opencl_kernel_src,@object // @halide_halide_blur_opencl_kernel_src
	.section	.rodata,"a",@progbits
	.p2align	5
.Lhalide_halide_blur_opencl_kernel_src:
	.asciz	"/*OpenCL C arm-64-android-opencl*/\n#pragma OPENCL FP_CONTRACT ON\ninline float float_from_bits(unsigned int x) {return as_float(x);}\ninline float nan_f32() { return NAN; }\ninline float neg_inf_f32() { return -INFINITY; }\ninline float inf_f32() { return INFINITY; }\n#define sqrt_f32 sqrt \n#define sin_f32 sin \n#define cos_f32 cos \n#define exp_f32 exp \n#define log_f32 log \n#define abs_f32 fabs \n#define floor_f32 floor \n#define ceil_f32 ceil \n#define round_f32 round \n#define trunc_f32 trunc \n#define pow_f32 pow\n#define asin_f32 asin \n#define acos_f32 acos \n#define tan_f32 tan \n#define atan_f32 atan \n#define atan2_f32 atan2\n#define sinh_f32 sinh \n#define asinh_f32 asinh \n#define cosh_f32 cosh \n#define acosh_f32 acosh \n#define tanh_f32 tanh \n#define atanh_f32 atanh \n#define fast_inverse_f32 native_recip \n#define fast_inverse_sqrt_f32 native_rsqrt \n#define __address_space___shared __local\n\n\n// ll suffix in OpenCL is reserver for 128-bit integers.\n#if defined __OPENCL_VERSION__\n#define ADD_INT64_T_SUFFIX(x) x##l\n#define ADD_UINT64_T_SUFFIX(x) x##ul\n// HLSL doesn't have any suffixes.\n#elif defined HLSL_VERSION\n#define ADD_INT64_T_SUFFIX(x) x\n#define ADD_UINT64_T_SUFFIX(x) x\n#else\n#define ADD_INT64_T_SUFFIX(x) x##ll\n#define ADD_UINT64_T_SUFFIX(x) x##ull\n#endif\n__kernel void _at_least_one_kernel(int x) { }\n// Address spaces for kernel_blur_y_s0_y_y_y___block_id_y\n#define __address_space__blur_y __global\n#define __address_space__input __global\n__kernel void kernel_blur_y_s0_y_y_y___block_id_y(\n const int _blur_y_stride_1,\n const int _t146,\n const int _t145,\n const int _t144,\n const int _t143,\n const int _t142,\n const int _t141,\n const int _t140,\n const int _t139,\n const int _t138,\n const int _t137,\n const int _t136,\n const int _t135,\n const int _t134,\n const int _t133,\n const int _t132,\n const int _t131,\n const int _t130,\n const int _t129,\n const int _t128,\n const int _t120,\n const int _t114,\n const int _t113,\n const int _t112,\n const int _input_stride_1,\n const int _blur_y_min_1,\n __address_space__blur_y ushort *restrict _blur_y,\n __address_space__input const ushort *restrict _input,\n __address_space___shared int16* __shared)\n{\n int _blur_y_s0_y_y_y___block_id_y = get_group_id(1);\n int _blur_y_s0_x_x_x___block_id_x = get_group_id(0);\n int ___thread_id_y = get_local_id(1);\n int ___thread_id_x = get_local_id(0);\n bool _0 = _blur_y_s0_y_y_y___block_id_y < _t112;\n if (_0)\n {\n  bool _1 = _blur_y_s0_x_x_x___block_id_x < _t113;\n  if (_1)\n  {\n   int _2 = _blur_y_s0_x_x_x___block_id_x * 32;\n   int _3 = _2 + ___thread_id_x;\n   int _4 = _3 * 2;\n   int _5 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _6 = _5 + _blur_y_min_1;\n   int _7 = _6 * _input_stride_1;\n   int _8 = _7 + _t114;\n   int _9 = _4 + _8;\n   int _10 = _input_stride_1 + _9;\n   int _11 = _10 + 1;\n   ushort2 _12 = vload2(0, (__address_space__input ushort*)_input + _11);\n   int _13 = _10 + 2;\n   ushort2 _14 = vload2(0, (__address_space__input ushort*)_input + _13);\n   ushort2 _15 = vload2(0, (__address_space__input ushort*)_input + _10);\n   ushort2 _16 = _14 + _15;\n   ushort2 _17 = _12 + _16;\n   ushort _18 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _19 = _18;\n   ushort2 _20 = _17 / _19;\n   int _21 = _t146 + _9;\n   int _22 = _21 + 1;\n   ushort2 _23 = vload2(0, (__address_space__input ushort*)_input + _22);\n   int _24 = _21 + 2;\n   ushort2 _25 = vload2(0, (__address_space__input ushort*)_input + _24);\n   ushort2 _26 = vload2(0, (__address_space__input ushort*)_input + _21);\n   ushort2 _27 = _25 + _26;\n   ushort2 _28 = _23 + _27;\n   ushort2 _29 = _28 / _19;\n   int _30 = _9 + 1;\n   ushort2 _31 = vload2(0, (__address_space__input ushort*)_input + _30);\n   int _32 = _9 + 2;\n   ushort2 _33 = vload2(0, (__address_space__input ushort*)_input + _32);\n   ushort2 _34 = vload2(0, (__address_space__input ushort*)_input + _9);\n   ushort2 _35 = _33 + _34;\n   ushort2 _36 = _31 + _35;\n   ushort2 _37 = _36 / _19;\n   ushort2 _38 = _29 + _37;\n   ushort2 _39 = _20 + _38;\n   ushort2 _40 = _39 / _19;\n   int _41 = _6 * _blur_y_stride_1;\n   int _42 = _41 + _t120;\n   int _43 = _4 + _42;\n   vstore2(_40,0, (__address_space__blur_y ushort*)_blur_y + _43);\n   int _44 = _blur_y_s0_x_x_x___block_id_x * 32;\n   int _45 = _44 + ___thread_id_x;\n   int _46 = _45 * 2;\n   int _47 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _48 = _47 + _blur_y_min_1;\n   int _49 = _48 + 1;\n   int _50 = _49 * _input_stride_1;\n   int _51 = _50 + _t114;\n   int _52 = _46 + _51;\n   int _53 = _input_stride_1 + _52;\n   int _54 = _53 + 1;\n   ushort2 _55 = vload2(0, (__address_space__input ushort*)_input + _54);\n   int _56 = _53 + 2;\n   ushort2 _57 = vload2(0, (__address_space__input ushort*)_input + _56);\n   ushort2 _58 = vload2(0, (__address_space__input ushort*)_input + _53);\n   ushort2 _59 = _57 + _58;\n   ushort2 _60 = _55 + _59;\n   ushort _61 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _62 = _61;\n   ushort2 _63 = _60 / _62;\n   int _64 = _t146 + _52;\n   int _65 = _64 + 1;\n   ushort2 _66 = vload2(0, (__address_space__input ushort*)_input + _65);\n   int _67 = _64 + 2;\n   ushort2 _68 = vload2(0, (__address_space__input ushort*)_input + _67);\n   ushort2 _69 = vload2(0, (__address_space__input ushort*)_input + _64);\n   ushort2 _70 = _68 + _69;\n   ushort2 _71 = _66 + _70;\n   ushort2 _72 = _71 / _62;\n   int _73 = _52 + 1;\n   ushort2 _74 = vload2(0, (__address_space__input ushort*)_input + _73);\n   int _75 = _52 + 2;\n   ushort2 _76 = vload2(0, (__address_space__input ushort*)_input + _75);\n   ushort2 _77 = vload2(0, (__address_space__input ushort*)_input + _52);\n   ushort2 _78 = _76 + _77;\n   ushort2 _79 = _74 + _78;\n   ushort2 _80 = _79 / _62;\n   ushort2 _81 = _72 + _80;\n   ushort2 _82 = _63 + _81;\n   ushort2 _83 = _82 / _62;\n   int _84 = _49 * _blur_y_stride_1;\n   int _85 = _84 + _t120;\n   int _86 = _46 + _85;\n   vstore2(_83,0, (__address_space__blur_y ushort*)_blur_y + _86);\n   int _87 = _blur_y_s0_x_x_x___block_id_x * 32;\n   int _88 = _87 + ___thread_id_x;\n   int _89 = _88 * 2;\n   int _90 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _91 = _90 + _blur_y_min_1;\n   int _92 = _91 + 2;\n   int _93 = _92 * _input_stride_1;\n   int _94 = _93 + _t114;\n   int _95 = _89 + _94;\n   int _96 = _input_stride_1 + _95;\n   int _97 = _96 + 1;\n   ushort2 _98 = vload2(0, (__address_space__input ushort*)_input + _97);\n   int _99 = _96 + 2;\n   ushort2 _100 = vload2(0, (__address_space__input ushort*)_input + _99);\n   ushort2 _101 = vload2(0, (__address_space__input ushort*)_input + _96);\n   ushort2 _102 = _100 + _101;\n   ushort2 _103 = _98 + _102;\n   ushort _104 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _105 = _104;\n   ushort2 _106 = _103 / _105;\n   int _107 = _t146 + _95;\n   int _108 = _107 + 1;\n   ushort2 _109 = vload2(0, (__address_space__input ushort*)_input + _108);\n   int _110 = _107 + 2;\n   ushort2 _111 = vload2(0, (__address_space__input ushort*)_input + _110);\n   ushort2 _112 = vload2(0, (__address_space__input ushort*)_input + _107);\n   ushort2 _113 = _111 + _112;\n   ushort2 _114 = _109 + _113;\n   ushort2 _115 = _114 / _105;\n   int _116 = _95 + 1;\n   ushort2 _117 = vload2(0, (__address_space__input ushort*)_input + _116);\n   int _118 = _95 + 2;\n   ushort2 _119 = vload2(0, (__address_space__input ushort*)_input + _118);\n   ushort2 _120 = vload2(0, (__address_space__input ushort*)_input + _95);\n   ushort2 _121 = _119 + _120;\n   ushort2 _122 = _117 + _121;\n   ushort2 _123 = _122 / _105;\n   ushort2 _124 = _115 + _123;\n   ushort2 _125 = _106 + _124;\n   ushort2 _126 = _125 / _105;\n   int _127 = _92 * _blur_y_stride_1;\n   int _128 = _127 + _t120;\n   int _129 = _89 + _128;\n   vstore2(_126,0, (__address_space__blur_y ushort*)_blur_y + _129);\n   int _130 = _blur_y_s0_x_x_x___block_id_x * 32;\n   int _131 = _130 + ___thread_id_x;\n   int _132 = _131 * 2;\n   int _133 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _134 = _133 + _blur_y_min_1;\n   int _135 = _134 + 3;\n   int _136 = _135 * _input_stride_1;\n   int _137 = _136 + _t114;\n   int _138 = _132 + _137;\n   int _139 = _input_stride_1 + _138;\n   int _140 = _139 + 1;\n   ushort2 _141 = vload2(0, (__address_space__input ushort*)_input + _140);\n   int _142 = _139 + 2;\n   ushort2 _143 = vload2(0, (__address_space__input ushort*)_input + _142);\n   ushort2 _144 = vload2(0, (__address_space__input ushort*)_input + _139);\n   ushort2 _145 = _143 + _144;\n   ushort2 _146 = _141 + _145;\n   ushort _147 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _148 = _147;\n   ushort2 _149 = _146 / _148;\n   int _150 = _t146 + _138;\n   int _151 = _150 + 1;\n   ushort2 _152 = vload2(0, (__address_space__input ushort*)_input + _151);\n   int _153 = _150 + 2;\n   ushort2 _154 = vload2(0, (__address_space__input ushort*)_input + _153);\n   ushort2 _155 = vload2(0, (__address_space__input ushort*)_input + _150);\n   ushort2 _156 = _154 + _155;\n   ushort2 _157 = _152 + _156;\n   ushort2 _158 = _157 / _148;\n   int _159 = _138 + 1;\n   ushort2 _160 = vload2(0, (__address_space__input ushort*)_input + _159);\n   int _161 = _138 + 2;\n   ushort2 _162 = vload2(0, (__address_space__input ushort*)_input + _161);\n   ushort2 _163 = vload2(0, (__address_space__input ushort*)_input + _138);\n   ushort2 _164 = _162 + _163;\n   ushort2 _165 = _160 + _164;\n   ushort2 _166 = _165 / _148;\n   ushort2 _167 = _158 + _166;\n   ushort2 _168 = _149 + _167;\n   ushort2 _169 = _168 / _148;\n   int _170 = _135 * _blur_y_stride_1;\n   int _171 = _170 + _t120;\n   int _172 = _132 + _171;\n   vstore2(_169,0, (__address_space__blur_y ushort*)_blur_y + _172);\n   int _173 = _blur_y_s0_x_x_x___block_id_x * 32;\n   int _174 = _173 + ___thread_id_x;\n   int _175 = _174 * 2;\n   int _176 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _177 = _176 + _blur_y_min_1;\n   int _178 = _177 + 4;\n   int _179 = _178 * _input_stride_1;\n   int _180 = _179 + _t114;\n   int _181 = _175 + _180;\n   int _182 = _input_stride_1 + _181;\n   int _183 = _182 + 1;\n   ushort2 _184 = vload2(0, (__address_space__input ushort*)_input + _183);\n   int _185 = _182 + 2;\n   ushort2 _186 = vload2(0, (__address_space__input ushort*)_input + _185);\n   ushort2 _187 = vload2(0, (__address_space__input ushort*)_input + _182);\n   ushort2 _188 = _186 + _187;\n   ushort2 _189 = _184 + _188;\n   ushort _190 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _191 = _190;\n   ushort2 _192 = _189 / _191;\n   int _193 = _t146 + _181;\n   int _194 = _193 + 1;\n   ushort2 _195 = vload2(0, (__address_space__input ushort*)_input + _194);\n   int _196 = _193 + 2;\n   ushort2 _197 = vload2(0, (__address_space__input ushort*)_input + _196);\n   ushort2 _198 = vload2(0, (__address_space__input ushort*)_input + _193);\n   ushort2 _199 = _197 + _198;\n   ushort2 _200 = _195 + _199;\n   ushort2 _201 = _200 / _191;\n   int _202 = _181 + 1;\n   ushort2 _203 = vload2(0, (__address_space__input ushort*)_input + _202);\n   int _204 = _181 + 2;\n   ushort2 _205 = vload2(0, (__address_space__input ushort*)_input + _204);\n   ushort2 _206 = vload2(0, (__address_space__input ushort*)_input + _181);\n   ushort2 _207 = _205 + _206;\n   ushort2 _208 = _203 + _207;\n   ushort2 _209 = _208 / _191;\n   ushort2 _210 = _201 + _209;\n   ushort2 _211 = _192 + _210;\n   ushort2 _212 = _211 / _191;\n   int _213 = _178 * _blur_y_stride_1;\n   int _214 = _213 + _t120;\n   int _215 = _175 + _214;\n   vstore2(_212,0, (__address_space__blur_y ushort*)_blur_y + _215);\n   int _216 = _blur_y_s0_x_x_x___block_id_x * 32;\n   int _217 = _216 + ___thread_id_x;\n   int _218 = _217 * 2;\n   int _219 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _220 = _219 + _blur_y_min_1;\n   int _221 = _220 + 5;\n   int _222 = _221 * _input_stride_1;\n   int _223 = _222 + _t114;\n   int _224 = _218 + _223;\n   int _225 = _input_stride_1 + _224;\n   int _226 = _225 + 1;\n   ushort2 _227 = vload2(0, (__address_space__input ushort*)_input + _226);\n   int _228 = _225 + 2;\n   ushort2 _229 = vload2(0, (__address_space__input ushort*)_input + _228);\n   ushort2 _230 = vload2(0, (__address_space__input ushort*)_input + _225);\n   ushort2 _231 = _229 + _230;\n   ushort2 _232 = _227 + _231;\n   ushort _233 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _234 = _233;\n   ushort2 _235 = _232 / _234;\n   int _236 = _t146 + _224;\n   int _237 = _236 + 1;\n   ushort2 _238 = vload2(0, (__address_space__input ushort*)_input + _237);\n   int _239 = _236 + 2;\n   ushort2 _240 = vload2(0, (__address_space__input ushort*)_input + _239);\n   ushort2 _241 = vload2(0, (__address_space__input ushort*)_input + _236);\n   ushort2 _242 = _240 + _241;\n   ushort2 _243 = _238 + _242;\n   ushort2 _244 = _243 / _234;\n   int _245 = _224 + 1;\n   ushort2 _246 = vload2(0, (__address_space__input ushort*)_input + _245);\n   int _247 = _224 + 2;\n   ushort2 _248 = vload2(0, (__address_space__input ushort*)_input + _247);\n   ushort2 _249 = vload2(0, (__address_space__input ushort*)_input + _224);\n   ushort2 _250 = _248 + _249;\n   ushort2 _251 = _246 + _250;\n   ushort2 _252 = _251 / _234;\n   ushort2 _253 = _244 + _252;\n   ushort2 _254 = _235 + _253;\n   ushort2 _255 = _254 / _234;\n   int _256 = _221 * _blur_y_stride_1;\n   int _257 = _256 + _t120;\n   int _258 = _218 + _257;\n   vstore2(_255,0, (__address_space__blur_y ushort*)_blur_y + _258);\n   int _259 = _blur_y_s0_x_x_x___block_id_x * 32;\n   int _260 = _259 + ___thread_id_x;\n   int _261 = _260 * 2;\n   int _262 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _263 = _262 + _blur_y_min_1;\n   int _264 = _263 + 6;\n   int _265 = _264 * _input_stride_1;\n   int _266 = _265 + _t114;\n   int _267 = _261 + _266;\n   int _268 = _input_stride_1 + _267;\n   int _269 = _268 + 1;\n   ushort2 _270 = vload2(0, (__address_space__input ushort*)_input + _269);\n   int _271 = _268 + 2;\n   ushort2 _272 = vload2(0, (__address_space__input ushort*)_input + _271);\n   ushort2 _273 = vload2(0, (__address_space__input ushort*)_input + _268);\n   ushort2 _274 = _272 + _273;\n   ushort2 _275 = _270 + _274;\n   ushort _276 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _277 = _276;\n   ushort2 _278 = _275 / _277;\n   int _279 = _t146 + _267;\n   int _280 = _279 + 1;\n   ushort2 _281 = vload2(0, (__address_space__input ushort*)_input + _280);\n   int _282 = _279 + 2;\n   ushort2 _283 = vload2(0, (__address_space__input ushort*)_input + _282);\n   ushort2 _284 = vload2(0, (__address_space__input ushort*)_input + _279);\n   ushort2 _285 = _283 + _284;\n   ushort2 _286 = _281 + _285;\n   ushort2 _287 = _286 / _277;\n   int _288 = _267 + 1;\n   ushort2 _289 = vload2(0, (__address_space__input ushort*)_input + _288);\n   int _290 = _267 + 2;\n   ushort2 _291 = vload2(0, (__address_space__input ushort*)_input + _290);\n   ushort2 _292 = vload2(0, (__address_space__input ushort*)_input + _267);\n   ushort2 _293 = _291 + _292;\n   ushort2 _294 = _289 + _293;\n   ushort2 _295 = _294 / _277;\n   ushort2 _296 = _287 + _295;\n   ushort2 _297 = _278 + _296;\n   ushort2 _298 = _297 / _277;\n   int _299 = _264 * _blur_y_stride_1;\n   int _300 = _299 + _t120;\n   int _301 = _261 + _300;\n   vstore2(_298,0, (__address_space__blur_y ushort*)_blur_y + _301);\n   int _302 = _blur_y_s0_x_x_x___block_id_x * 32;\n   int _303 = _302 + ___thread_id_x;\n   int _304 = _303 * 2;\n   int _305 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _306 = _305 + _blur_y_min_1;\n   int _307 = _306 + 7;\n   int _308 = _307 * _input_stride_1;\n   int _309 = _308 + _t114;\n   int _310 = _304 + _309;\n   int _311 = _input_stride_1 + _310;\n   int _312 = _311 + 1;\n   ushort2 _313 = vload2(0, (__address_space__input ushort*)_input + _312);\n   int _314 = _311 + 2;\n   ushort2 _315 = vload2(0, (__address_space__input ushort*)_input + _314);\n   ushort2 _316 = vload2(0, (__address_space__input ushort*)_input + _311);\n   ushort2 _317 = _315 + _316;\n   ushort2 _318 = _313 + _317;\n   ushort _319 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _320 = _319;\n   ushort2 _321 = _318 / _320;\n   int _322 = _t146 + _310;\n   int _323 = _322 + 1;\n   ushort2 _324 = vload2(0, (__address_space__input ushort*)_input + _323);\n   int _325 = _322 + 2;\n   ushort2 _326 = vload2(0, (__address_space__input ushort*)_input + _325);\n   ushort2 _327 = vload2(0, (__address_space__input ushort*)_input + _322);\n   ushort2 _328 = _326 + _327;\n   ushort2 _329 = _324 + _328;\n   ushort2 _330 = _329 / _320;\n   int _331 = _310 + 1;\n   ushort2 _332 = vload2(0, (__address_space__input ushort*)_input + _331);\n   int _333 = _310 + 2;\n   ushort2 _334 = vload2(0, (__address_space__input ushort*)_input + _333);\n   ushort2 _335 = vload2(0, (__address_space__input ushort*)_input + _310);\n   ushort2 _336 = _334 + _335;\n   ushort2 _337 = _332 + _336;\n   ushort2 _338 = _337 / _320;\n   ushort2 _339 = _330 + _338;\n   ushort2 _340 = _321 + _339;\n   ushort2 _341 = _340 / _320;\n   int _342 = _307 * _blur_y_stride_1;\n   int _343 = _342 + _t120;\n   int _344 = _304 + _343;\n   vstore2(_341,0, (__address_space__blur_y ushort*)_blur_y + _344);\n  } // if _1\n  else\n  {\n   int _345 = _blur_y_s0_x_x_x___block_id_x * 32;\n   int _346 = min(_345, _t128);\n   int _347 = ___thread_id_x + _346;\n   int _348 = _347 * 2;\n   int _349 = min(_348, _t129);\n   int _350 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _351 = _350 + _blur_y_min_1;\n   int _352 = _351 * _input_stride_1;\n   int _353 = _352 + _t114;\n   int _354 = _353 + _349;\n   int _355 = _354 + _input_stride_1;\n   int _356 = _355 + 1;\n   ushort2 _357 = vload2(0, (__address_space__input ushort*)_input + _356);\n   int _358 = _355 + 2;\n   ushort2 _359 = vload2(0, (__address_space__input ushort*)_input + _358);\n   ushort2 _360 = vload2(0, (__address_space__input ushort*)_input + _355);\n   ushort2 _361 = _359 + _360;\n   ushort2 _362 = _357 + _361;\n   ushort _363 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _364 = _363;\n   ushort2 _365 = _362 / _364;\n   int _366 = _354 + _t146;\n   int _367 = _366 + 1;\n   ushort2 _368 = vload2(0, (__address_space__input ushort*)_input + _367);\n   int _369 = _366 + 2;\n   ushort2 _370 = vload2(0, (__address_space__input ushort*)_input + _369);\n   ushort2 _371 = vload2(0, (__address_space__input ushort*)_input + _366);\n   ushort2 _372 = _370 + _371;\n   ushort2 _373 = _368 + _372;\n   ushort2 _374 = _373 / _364;\n   int _375 = _354 + 1;\n   ushort2 _376 = vload2(0, (__address_space__input ushort*)_input + _375);\n   int _377 = _354 + 2;\n   ushort2 _378 = vload2(0, (__address_space__input ushort*)_input + _377);\n   ushort2 _379 = vload2(0, (__address_space__input ushort*)_input + _354);\n   ushort2 _380 = _378 + _379;\n   ushort2 _381 = _376 + _380;\n   ushort2 _382 = _381 / _364;\n   ushort2 _383 = _374 + _382;\n   ushort2 _384 = _365 + _383;\n   ushort2 _385 = _384 / _364;\n   int _386 = _351 * _blur_y_stride_1;\n   int _387 = _386 + _t120;\n   int _388 = _387 + _349;\n   vstore2(_385,0, (__address_space__blur_y ushort*)_blur_y + _388);\n   int _389 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _390 = _389 + _blur_y_min_1;\n   int _391 = _390 + 1;\n   int _392 = _391 * _input_stride_1;\n   int _393 = _392 + _t114;\n   int _394 = _393 + _349;\n   int _395 = _394 + _input_stride_1;\n   int _396 = _395 + 1;\n   ushort2 _397 = vload2(0, (__address_space__input ushort*)_input + _396);\n   int _398 = _395 + 2;\n   ushort2 _399 = vload2(0, (__address_space__input ushort*)_input + _398);\n   ushort2 _400 = vload2(0, (__address_space__input ushort*)_input + _395);\n   ushort2 _401 = _399 + _400;\n   ushort2 _402 = _397 + _401;\n   ushort _403 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _404 = _403;\n   ushort2 _405 = _402 / _404;\n   int _406 = _394 + _t146;\n   int _407 = _406 + 1;\n   ushort2 _408 = vload2(0, (__address_space__input ushort*)_input + _407);\n   int _409 = _406 + 2;\n   ushort2 _410 = vload2(0, (__address_space__input ushort*)_input + _409);\n   ushort2 _411 = vload2(0, (__address_space__input ushort*)_input + _406);\n   ushort2 _412 = _410 + _411;\n   ushort2 _413 = _408 + _412;\n   ushort2 _414 = _413 / _404;\n   int _415 = _394 + 1;\n   ushort2 _416 = vload2(0, (__address_space__input ushort*)_input + _415);\n   int _417 = _394 + 2;\n   ushort2 _418 = vload2(0, (__address_space__input ushort*)_input + _417);\n   ushort2 _419 = vload2(0, (__address_space__input ushort*)_input + _394);\n   ushort2 _420 = _418 + _419;\n   ushort2 _421 = _416 + _420;\n   ushort2 _422 = _421 / _404;\n   ushort2 _423 = _414 + _422;\n   ushort2 _424 = _405 + _423;\n   ushort2 _425 = _424 / _404;\n   int _426 = _391 * _blur_y_stride_1;\n   int _427 = _426 + _t120;\n   int _428 = _427 + _349;\n   vstore2(_425,0, (__address_space__blur_y ushort*)_blur_y + _428);\n   int _429 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _430 = _429 + _blur_y_min_1;\n   int _431 = _430 + 2;\n   int _432 = _431 * _input_stride_1;\n   int _433 = _432 + _t114;\n   int _434 = _433 + _349;\n   int _435 = _434 + _input_stride_1;\n   int _436 = _435 + 1;\n   ushort2 _437 = vload2(0, (__address_space__input ushort*)_input + _436);\n   int _438 = _435 + 2;\n   ushort2 _439 = vload2(0, (__address_space__input ushort*)_input + _438);\n   ushort2 _440 = vload2(0, (__address_space__input ushort*)_input + _435);\n   ushort2 _441 = _439 + _440;\n   ushort2 _442 = _437 + _441;\n   ushort _443 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _444 = _443;\n   ushort2 _445 = _442 / _444;\n   int _446 = _434 + _t146;\n   int _447 = _446 + 1;\n   ushort2 _448 = vload2(0, (__address_space__input ushort*)_input + _447);\n   int _449 = _446 + 2;\n   ushort2 _450 = vload2(0, (__address_space__input ushort*)_input + _449);\n   ushort2 _451 = vload2(0, (__address_space__input ushort*)_input + _446);\n   ushort2 _452 = _450 + _451;\n   ushort2 _453 = _448 + _452;\n   ushort2 _454 = _453 / _444;\n   int _455 = _434 + 1;\n   ushort2 _456 = vload2(0, (__address_space__input ushort*)_input + _455);\n   int _457 = _434 + 2;\n   ushort2 _458 = vload2(0, (__address_space__input ushort*)_input + _457);\n   ushort2 _459 = vload2(0, (__address_space__input ushort*)_input + _434);\n   ushort2 _460 = _458 + _459;\n   ushort2 _461 = _456 + _460;\n   ushort2 _462 = _461 / _444;\n   ushort2 _463 = _454 + _462;\n   ushort2 _464 = _445 + _463;\n   ushort2 _465 = _464 / _444;\n   int _466 = _431 * _blur_y_stride_1;\n   int _467 = _466 + _t120;\n   int _468 = _467 + _349;\n   vstore2(_465,0, (__address_space__blur_y ushort*)_blur_y + _468);\n   int _469 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _470 = _469 + _blur_y_min_1;\n   int _471 = _470 + 3;\n   int _472 = _471 * _input_stride_1;\n   int _473 = _472 + _t114;\n   int _474 = _473 + _349;\n   int _475 = _474 + _input_stride_1;\n   int _476 = _475 + 1;\n   ushort2 _477 = vload2(0, (__address_space__input ushort*)_input + _476);\n   int _478 = _475 + 2;\n   ushort2 _479 = vload2(0, (__address_space__input ushort*)_input + _478);\n   ushort2 _480 = vload2(0, (__address_space__input ushort*)_input + _475);\n   ushort2 _481 = _479 + _480;\n   ushort2 _482 = _477 + _481;\n   ushort _483 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _484 = _483;\n   ushort2 _485 = _482 / _484;\n   int _486 = _474 + _t146;\n   int _487 = _486 + 1;\n   ushort2 _488 = vload2(0, (__address_space__input ushort*)_input + _487);\n   int _489 = _486 + 2;\n   ushort2 _490 = vload2(0, (__address_space__input ushort*)_input + _489);\n   ushort2 _491 = vload2(0, (__address_space__input ushort*)_input + _486);\n   ushort2 _492 = _490 + _491;\n   ushort2 _493 = _488 + _492;\n   ushort2 _494 = _493 / _484;\n   int _495 = _474 + 1;\n   ushort2 _496 = vload2(0, (__address_space__input ushort*)_input + _495);\n   int _497 = _474 + 2;\n   ushort2 _498 = vload2(0, (__address_space__input ushort*)_input + _497);\n   ushort2 _499 = vload2(0, (__address_space__input ushort*)_input + _474);\n   ushort2 _500 = _498 + _499;\n   ushort2 _501 = _496 + _500;\n   ushort2 _502 = _501 / _484;\n   ushort2 _503 = _494 + _502;\n   ushort2 _504 = _485 + _503;\n   ushort2 _505 = _504 / _484;\n   int _506 = _471 * _blur_y_stride_1;\n   int _507 = _506 + _t120;\n   int _508 = _507 + _349;\n   vstore2(_505,0, (__address_space__blur_y ushort*)_blur_y + _508);\n   int _509 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _510 = _509 + _blur_y_min_1;\n   int _511 = _510 + 4;\n   int _512 = _511 * _input_stride_1;\n   int _513 = _512 + _t114;\n   int _514 = _513 + _349;\n   int _515 = _514 + _input_stride_1;\n   int _516 = _515 + 1;\n   ushort2 _517 = vload2(0, (__address_space__input ushort*)_input + _516);\n   int _518 = _515 + 2;\n   ushort2 _519 = vload2(0, (__address_space__input ushort*)_input + _518);\n   ushort2 _520 = vload2(0, (__address_space__input ushort*)_input + _515);\n   ushort2 _521 = _519 + _520;\n   ushort2 _522 = _517 + _521;\n   ushort _523 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _524 = _523;\n   ushort2 _525 = _522 / _524;\n   int _526 = _514 + _t146;\n   int _527 = _526 + 1;\n   ushort2 _528 = vload2(0, (__address_space__input ushort*)_input + _527);\n   int _529 = _526 + 2;\n   ushort2 _530 = vload2(0, (__address_space__input ushort*)_input + _529);\n   ushort2 _531 = vload2(0, (__address_space__input ushort*)_input + _526);\n   ushort2 _532 = _530 + _531;\n   ushort2 _533 = _528 + _532;\n   ushort2 _534 = _533 / _524;\n   int _535 = _514 + 1;\n   ushort2 _536 = vload2(0, (__address_space__input ushort*)_input + _535);\n   int _537 = _514 + 2;\n   ushort2 _538 = vload2(0, (__address_space__input ushort*)_input + _537);\n   ushort2 _539 = vload2(0, (__address_space__input ushort*)_input + _514);\n   ushort2 _540 = _538 + _539;\n   ushort2 _541 = _536 + _540;\n   ushort2 _542 = _541 / _524;\n   ushort2 _543 = _534 + _542;\n   ushort2 _544 = _525 + _543;\n   ushort2 _545 = _544 / _524;\n   int _546 = _511 * _blur_y_stride_1;\n   int _547 = _546 + _t120;\n   int _548 = _547 + _349;\n   vstore2(_545,0, (__address_space__blur_y ushort*)_blur_y + _548);\n   int _549 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _550 = _549 + _blur_y_min_1;\n   int _551 = _550 + 5;\n   int _552 = _551 * _input_stride_1;\n   int _553 = _552 + _t114;\n   int _554 = _553 + _349;\n   int _555 = _554 + _input_stride_1;\n   int _556 = _555 + 1;\n   ushort2 _557 = vload2(0, (__address_space__input ushort*)_input + _556);\n   int _558 = _555 + 2;\n   ushort2 _559 = vload2(0, (__address_space__input ushort*)_input + _558);\n   ushort2 _560 = vload2(0, (__address_space__input ushort*)_input + _555);\n   ushort2 _561 = _559 + _560;\n   ushort2 _562 = _557 + _561;\n   ushort _563 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _564 = _563;\n   ushort2 _565 = _562 / _564;\n   int _566 = _554 + _t146;\n   int _567 = _566 + 1;\n   ushort2 _568 = vload2(0, (__address_space__input ushort*)_input + _567);\n   int _569 = _566 + 2;\n   ushort2 _570 = vload2(0, (__address_space__input ushort*)_input + _569);\n   ushort2 _571 = vload2(0, (__address_space__input ushort*)_input + _566);\n   ushort2 _572 = _570 + _571;\n   ushort2 _573 = _568 + _572;\n   ushort2 _574 = _573 / _564;\n   int _575 = _554 + 1;\n   ushort2 _576 = vload2(0, (__address_space__input ushort*)_input + _575);\n   int _577 = _554 + 2;\n   ushort2 _578 = vload2(0, (__address_space__input ushort*)_input + _577);\n   ushort2 _579 = vload2(0, (__address_space__input ushort*)_input + _554);\n   ushort2 _580 = _578 + _579;\n   ushort2 _581 = _576 + _580;\n   ushort2 _582 = _581 / _564;\n   ushort2 _583 = _574 + _582;\n   ushort2 _584 = _565 + _583;\n   ushort2 _585 = _584 / _564;\n   int _586 = _551 * _blur_y_stride_1;\n   int _587 = _586 + _t120;\n   int _588 = _587 + _349;\n   vstore2(_585,0, (__address_space__blur_y ushort*)_blur_y + _588);\n   int _589 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _590 = _589 + _blur_y_min_1;\n   int _591 = _590 + 6;\n   int _592 = _591 * _input_stride_1;\n   int _593 = _592 + _t114;\n   int _594 = _593 + _349;\n   int _595 = _594 + _input_stride_1;\n   int _596 = _595 + 1;\n   ushort2 _597 = vload2(0, (__address_space__input ushort*)_input + _596);\n   int _598 = _595 + 2;\n   ushort2 _599 = vload2(0, (__address_space__input ushort*)_input + _598);\n   ushort2 _600 = vload2(0, (__address_space__input ushort*)_input + _595);\n   ushort2 _601 = _599 + _600;\n   ushort2 _602 = _597 + _601;\n   ushort _603 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _604 = _603;\n   ushort2 _605 = _602 / _604;\n   int _606 = _594 + _t146;\n   int _607 = _606 + 1;\n   ushort2 _608 = vload2(0, (__address_space__input ushort*)_input + _607);\n   int _609 = _606 + 2;\n   ushort2 _610 = vload2(0, (__address_space__input ushort*)_input + _609);\n   ushort2 _611 = vload2(0, (__address_space__input ushort*)_input + _606);\n   ushort2 _612 = _610 + _611;\n   ushort2 _613 = _608 + _612;\n   ushort2 _614 = _613 / _604;\n   int _615 = _594 + 1;\n   ushort2 _616 = vload2(0, (__address_space__input ushort*)_input + _615);\n   int _617 = _594 + 2;\n   ushort2 _618 = vload2(0, (__address_space__input ushort*)_input + _617);\n   ushort2 _619 = vload2(0, (__address_space__input ushort*)_input + _594);\n   ushort2 _620 = _618 + _619;\n   ushort2 _621 = _616 + _620;\n   ushort2 _622 = _621 / _604;\n   ushort2 _623 = _614 + _622;\n   ushort2 _624 = _605 + _623;\n   ushort2 _625 = _624 / _604;\n   int _626 = _591 * _blur_y_stride_1;\n   int _627 = _626 + _t120;\n   int _628 = _627 + _349;\n   vstore2(_625,0, (__address_space__blur_y ushort*)_blur_y + _628);\n   int _629 = _blur_y_s0_y_y_y___block_id_y * 8;\n   int _630 = _629 + _blur_y_min_1;\n   int _631 = _630 + 7;\n   int _632 = _631 * _input_stride_1;\n   int _633 = _632 + _t114;\n   int _634 = _633 + _349;\n   int _635 = _634 + _input_stride_1;\n   int _636 = _635 + 1;\n   ushort2 _637 = vload2(0, (__address_space__input ushort*)_input + _636);\n   int _638 = _635 + 2;\n   ushort2 _639 = vload2(0, (__address_space__input ushort*)_input + _638);\n   ushort2 _640 = vload2(0, (__address_space__input ushort*)_input + _635);\n   ushort2 _641 = _639 + _640;\n   ushort2 _642 = _637 + _641;\n   ushort _643 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n   ushort2 _644 = _643;\n   ushort2 _645 = _642 / _644;\n   int _646 = _634 + _t146;\n   int _647 = _646 + 1;\n   ushort2 _648 = vload2(0, (__address_space__input ushort*)_input + _647);\n   int _649 = _646 + 2;\n   ushort2 _650 = vload2(0, (__address_space__input ushort*)_input + _649);\n   ushort2 _651 = vload2(0, (__address_space__input ushort*)_input + _646);\n   ushort2 _652 = _650 + _651;\n   ushort2 _653 = _648 + _652;\n   ushort2 _654 = _653 / _644;\n   int _655 = _634 + 1;\n   ushort2 _656 = vload2(0, (__address_space__input ushort*)_input + _655);\n   int _657 = _634 + 2;\n   ushort2 _658 = vload2(0, (__address_space__input ushort*)_input + _657);\n   ushort2 _659 = vload2(0, (__address_space__input ushort*)_input + _634);\n   ushort2 _660 = _658 + _659;\n   ushort2 _661 = _656 + _660;\n   ushort2 _662 = _661 / _644;\n   ushort2 _663 = _654 + _662;\n   ushort2 _664 = _645 + _663;\n   ushort2 _665 = _664 / _644;\n   int _666 = _631 * _blur_y_stride_1;\n   int _667 = _666 + _t120;\n   int _668 = _667 + _349;\n   vstore2(_665,0, (__address_space__blur_y ushort*)_blur_y + _668);\n  } // if _1 else\n } // if _0\n else\n {\n  int _669 = _blur_y_s0_x_x_x___block_id_x * 32;\n  int _670 = min(_669, _t128);\n  int _671 = ___thread_id_x + _670;\n  int _672 = _671 * 2;\n  int _673 = min(_672, _t129);\n  int _674 = _673 + _t130;\n  int _675 = _674 + _input_stride_1;\n  int _676 = _675 + 1;\n  ushort2 _677 = vload2(0, (__address_space__input ushort*)_input + _676);\n  int _678 = _675 + 2;\n  ushort2 _679 = vload2(0, (__address_space__input ushort*)_input + _678);\n  ushort2 _680 = vload2(0, (__address_space__input ushort*)_input + _675);\n  ushort2 _681 = _679 + _680;\n  ushort2 _682 = _677 + _681;\n  ushort _683 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n  ushort2 _684 = _683;\n  ushort2 _685 = _682 / _684;\n  int _686 = _674 + _t146;\n  int _687 = _686 + 1;\n  ushort2 _688 = vload2(0, (__address_space__input ushort*)_input + _687);\n  int _689 = _686 + 2;\n  ushort2 _690 = vload2(0, (__address_space__input ushort*)_input + _689);\n  ushort2 _691 = vload2(0, (__address_space__input ushort*)_input + _686);\n  ushort2 _692 = _690 + _691;\n  ushort2 _693 = _688 + _692;\n  ushort2 _694 = _693 / _684;\n  int _695 = _674 + 1;\n  ushort2 _696 = vload2(0, (__address_space__input ushort*)_input + _695);\n  int _697 = _674 + 2;\n  ushort2 _698 = vload2(0, (__address_space__input ushort*)_input + _697);\n  ushort2 _699 = vload2(0, (__address_space__input ushort*)_input + _674);\n  ushort2 _700 = _698 + _699;\n  ushort2 _701 = _696 + _700;\n  ushort2 _702 = _701 / _684;\n  ushort2 _703 = _694 + _702;\n  ushort2 _704 = _685 + _703;\n  ushort2 _705 = _704 / _684;\n  int _706 = _673 + _t131;\n  vstore2(_705,0, (__address_space__blur_y ushort*)_blur_y + _706);\n  int _707 = _673 + _t132;\n  int _708 = _707 + _input_stride_1;\n  int _709 = _708 + 1;\n  ushort2 _710 = vload2(0, (__address_space__input ushort*)_input + _709);\n  int _711 = _708 + 2;\n  ushort2 _712 = vload2(0, (__address_space__input ushort*)_input + _711);\n  ushort2 _713 = vload2(0, (__address_space__input ushort*)_input + _708);\n  ushort2 _714 = _712 + _713;\n  ushort2 _715 = _710 + _714;\n  ushort _716 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n  ushort2 _717 = _716;\n  ushort2 _718 = _715 / _717;\n  int _719 = _707 + _t146;\n  int _720 = _719 + 1;\n  ushort2 _721 = vload2(0, (__address_space__input ushort*)_input + _720);\n  int _722 = _719 + 2;\n  ushort2 _723 = vload2(0, (__address_space__input ushort*)_input + _722);\n  ushort2 _724 = vload2(0, (__address_space__input ushort*)_input + _719);\n  ushort2 _725 = _723 + _724;\n  ushort2 _726 = _721 + _725;\n  ushort2 _727 = _726 / _717;\n  int _728 = _707 + 1;\n  ushort2 _729 = vload2(0, (__address_space__input ushort*)_input + _728);\n  int _730 = _707 + 2;\n  ushort2 _731 = vload2(0, (__address_space__input ushort*)_input + _730);\n  ushort2 _732 = vload2(0, (__address_space__input ushort*)_input + _707);\n  ushort2 _733 = _731 + _732;\n  ushort2 _734 = _729 + _733;\n  ushort2 _735 = _734 / _717;\n  ushort2 _736 = _727 + _735;\n  ushort2 _737 = _718 + _736;\n  ushort2 _738 = _737 / _717;\n  int _739 = _673 + _t133;\n  vstore2(_738,0, (__address_space__blur_y ushort*)_blur_y + _739);\n  int _740 = _673 + _t134;\n  int _741 = _740 + _input_stride_1;\n  int _742 = _741 + 1;\n  ushort2 _743 = vload2(0, (__address_space__input ushort*)_input + _742);\n  int _744 = _741 + 2;\n  ushort2 _745 = vload2(0, (__address_space__input ushort*)_input + _744);\n  ushort2 _746 = vload2(0, (__address_space__input ushort*)_input + _741);\n  ushort2 _747 = _745 + _746;\n  ushort2 _748 = _743 + _747;\n  ushort _749 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n  ushort2 _750 = _749;\n  ushort2 _751 = _748 / _750;\n  int _752 = _740 + _t146;\n  int _753 = _752 + 1;\n  ushort2 _754 = vload2(0, (__address_space__input ushort*)_input + _753);\n  int _755 = _752 + 2;\n  ushort2 _756 = vload2(0, (__address_space__input ushort*)_input + _755);\n  ushort2 _757 = vload2(0, (__address_space__input ushort*)_input + _752);\n  ushort2 _758 = _756 + _757;\n  ushort2 _759 = _754 + _758;\n  ushort2 _760 = _759 / _750;\n  int _761 = _740 + 1;\n  ushort2 _762 = vload2(0, (__address_space__input ushort*)_input + _761);\n  int _763 = _740 + 2;\n  ushort2 _764 = vload2(0, (__address_space__input ushort*)_input + _763);\n  ushort2 _765 = vload2(0, (__address_space__input ushort*)_input + _740);\n  ushort2 _766 = _764 + _765;\n  ushort2 _767 = _762 + _766;\n  ushort2 _768 = _767 / _750;\n  ushort2 _769 = _760 + _768;\n  ushort2 _770 = _751 + _769;\n  ushort2 _771 = _770 / _750;\n  int _772 = _673 + _t135;\n  vstore2(_771,0, (__address_space__blur_y ushort*)_blur_y + _772);\n  int _773 = _673 + _t136;\n  int _774 = _773 + _input_stride_1;\n  int _775 = _774 + 1;\n  ushort2 _776 = vload2(0, (__address_space__input ushort*)_input + _775);\n  int _777 = _774 + 2;\n  ushort2 _778 = vload2(0, (__address_space__input ushort*)_input + _777);\n  ushort2 _779 = vload2(0, (__address_space__input ushort*)_input + _774);\n  ushort2 _780 = _778 + _779;\n  ushort2 _781 = _776 + _780;\n  ushort _782 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n  ushort2 _783 = _782;\n  ushort2 _784 = _781 / _783;\n  int _785 = _773 + _t146;\n  int _786 = _785 + 1;\n  ushort2 _787 = vload2(0, (__address_space__input ushort*)_input + _786);\n  int _788 = _785 + 2;\n  ushort2 _789 = vload2(0, (__address_space__input ushort*)_input + _788);\n  ushort2 _790 = vload2(0, (__address_space__input ushort*)_input + _785);\n  ushort2 _791 = _789 + _790;\n  ushort2 _792 = _787 + _791;\n  ushort2 _793 = _792 / _783;\n  int _794 = _773 + 1;\n  ushort2 _795 = vload2(0, (__address_space__input ushort*)_input + _794);\n  int _796 = _773 + 2;\n  ushort2 _797 = vload2(0, (__address_space__input ushort*)_input + _796);\n  ushort2 _798 = vload2(0, (__address_space__input ushort*)_input + _773);\n  ushort2 _799 = _797 + _798;\n  ushort2 _800 = _795 + _799;\n  ushort2 _801 = _800 / _783;\n  ushort2 _802 = _793 + _801;\n  ushort2 _803 = _784 + _802;\n  ushort2 _804 = _803 / _783;\n  int _805 = _673 + _t137;\n  vstore2(_804,0, (__address_space__blur_y ushort*)_blur_y + _805);\n  int _806 = _673 + _t138;\n  int _807 = _806 + _input_stride_1;\n  int _808 = _807 + 1;\n  ushort2 _809 = vload2(0, (__address_space__input ushort*)_input + _808);\n  int _810 = _807 + 2;\n  ushort2 _811 = vload2(0, (__address_space__input ushort*)_input + _810);\n  ushort2 _812 = vload2(0, (__address_space__input ushort*)_input + _807);\n  ushort2 _813 = _811 + _812;\n  ushort2 _814 = _809 + _813;\n  ushort _815 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n  ushort2 _816 = _815;\n  ushort2 _817 = _814 / _816;\n  int _818 = _806 + _t146;\n  int _819 = _818 + 1;\n  ushort2 _820 = vload2(0, (__address_space__input ushort*)_input + _819);\n  int _821 = _818 + 2;\n  ushort2 _822 = vload2(0, (__address_space__input ushort*)_input + _821);\n  ushort2 _823 = vload2(0, (__address_space__input ushort*)_input + _818);\n  ushort2 _824 = _822 + _823;\n  ushort2 _825 = _820 + _824;\n  ushort2 _826 = _825 / _816;\n  int _827 = _806 + 1;\n  ushort2 _828 = vload2(0, (__address_space__input ushort*)_input + _827);\n  int _829 = _806 + 2;\n  ushort2 _830 = vload2(0, (__address_space__input ushort*)_input + _829);\n  ushort2 _831 = vload2(0, (__address_space__input ushort*)_input + _806);\n  ushort2 _832 = _830 + _831;\n  ushort2 _833 = _828 + _832;\n  ushort2 _834 = _833 / _816;\n  ushort2 _835 = _826 + _834;\n  ushort2 _836 = _817 + _835;\n  ushort2 _837 = _836 / _816;\n  int _838 = _673 + _t139;\n  vstore2(_837,0, (__address_space__blur_y ushort*)_blur_y + _838);\n  int _839 = _673 + _t140;\n  int _840 = _839 + _input_stride_1;\n  int _841 = _840 + 1;\n  ushort2 _842 = vload2(0, (__address_space__input ushort*)_input + _841);\n  int _843 = _840 + 2;\n  ushort2 _844 = vload2(0, (__address_space__input ushort*)_input + _843);\n  ushort2 _845 = vload2(0, (__address_space__input ushort*)_input + _840);\n  ushort2 _846 = _844 + _845;\n  ushort2 _847 = _842 + _846;\n  ushort _848 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n  ushort2 _849 = _848;\n  ushort2 _850 = _847 / _849;\n  int _851 = _839 + _t146;\n  int _852 = _851 + 1;\n  ushort2 _853 = vload2(0, (__address_space__input ushort*)_input + _852);\n  int _854 = _851 + 2;\n  ushort2 _855 = vload2(0, (__address_space__input ushort*)_input + _854);\n  ushort2 _856 = vload2(0, (__address_space__input ushort*)_input + _851);\n  ushort2 _857 = _855 + _856;\n  ushort2 _858 = _853 + _857;\n  ushort2 _859 = _858 / _849;\n  int _860 = _839 + 1;\n  ushort2 _861 = vload2(0, (__address_space__input ushort*)_input + _860);\n  int _862 = _839 + 2;\n  ushort2 _863 = vload2(0, (__address_space__input ushort*)_input + _862);\n  ushort2 _864 = vload2(0, (__address_space__input ushort*)_input + _839);\n  ushort2 _865 = _863 + _864;\n  ushort2 _866 = _861 + _865;\n  ushort2 _867 = _866 / _849;\n  ushort2 _868 = _859 + _867;\n  ushort2 _869 = _850 + _868;\n  ushort2 _870 = _869 / _849;\n  int _871 = _673 + _t141;\n  vstore2(_870,0, (__address_space__blur_y ushort*)_blur_y + _871);\n  int _872 = _673 + _t142;\n  int _873 = _872 + _input_stride_1;\n  int _874 = _873 + 1;\n  ushort2 _875 = vload2(0, (__address_space__input ushort*)_input + _874);\n  int _876 = _873 + 2;\n  ushort2 _877 = vload2(0, (__address_space__input ushort*)_input + _876);\n  ushort2 _878 = vload2(0, (__address_space__input ushort*)_input + _873);\n  ushort2 _879 = _877 + _878;\n  ushort2 _880 = _875 + _879;\n  ushort _881 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n  ushort2 _882 = _881;\n  ushort2 _883 = _880 / _882;\n  int _884 = _872 + _t146;\n  int _885 = _884 + 1;\n  ushort2 _886 = vload2(0, (__address_space__input ushort*)_input + _885);\n  int _887 = _884 + 2;\n  ushort2 _888 = vload2(0, (__address_space__input ushort*)_input + _887);\n  ushort2 _889 = vload2(0, (__address_space__input ushort*)_input + _884);\n  ushort2 _890 = _888 + _889;\n  ushort2 _891 = _886 + _890;\n  ushort2 _892 = _891 / _882;\n  int _893 = _872 + 1;\n  ushort2 _894 = vload2(0, (__address_space__input ushort*)_input + _893);\n  int _895 = _872 + 2;\n  ushort2 _896 = vload2(0, (__address_space__input ushort*)_input + _895);\n  ushort2 _897 = vload2(0, (__address_space__input ushort*)_input + _872);\n  ushort2 _898 = _896 + _897;\n  ushort2 _899 = _894 + _898;\n  ushort2 _900 = _899 / _882;\n  ushort2 _901 = _892 + _900;\n  ushort2 _902 = _883 + _901;\n  ushort2 _903 = _902 / _882;\n  int _904 = _673 + _t143;\n  vstore2(_903,0, (__address_space__blur_y ushort*)_blur_y + _904);\n  int _905 = _673 + _t144;\n  int _906 = _905 + _input_stride_1;\n  int _907 = _906 + 1;\n  ushort2 _908 = vload2(0, (__address_space__input ushort*)_input + _907);\n  int _909 = _906 + 2;\n  ushort2 _910 = vload2(0, (__address_space__input ushort*)_input + _909);\n  ushort2 _911 = vload2(0, (__address_space__input ushort*)_input + _906);\n  ushort2 _912 = _910 + _911;\n  ushort2 _913 = _908 + _912;\n  ushort _914 = (ushort)(ADD_UINT64_T_SUFFIX(3));\n  ushort2 _915 = _914;\n  ushort2 _916 = _913 / _915;\n  int _917 = _905 + _t146;\n  int _918 = _917 + 1;\n  ushort2 _919 = vload2(0, (__address_space__input ushort*)_input + _918);\n  int _920 = _917 + 2;\n  ushort2 _921 = vload2(0, (__address_space__input ushort*)_input + _920);\n  ushort2 _922 = vload2(0, (__address_space__input ushort*)_input + _917);\n  ushort2 _923 = _921 + _922;\n  ushort2 _924 = _919 + _923;\n  ushort2 _925 = _924 / _915;\n  int _926 = _905 + 1;\n  ushort2 _927 = vload2(0, (__address_space__input ushort*)_input + _926);\n  int _928 = _905 + 2;\n  ushort2 _929 = vload2(0, (__address_space__input ushort*)_input + _928);\n  ushort2 _930 = vload2(0, (__address_space__input ushort*)_input + _905);\n  ushort2 _931 = _929 + _930;\n  ushort2 _932 = _927 + _931;\n  ushort2 _933 = _932 / _915;\n  ushort2 _934 = _925 + _933;\n  ushort2 _935 = _916 + _934;\n  ushort2 _936 = _935 / _915;\n  int _937 = _673 + _t145;\n  vstore2(_936,0, (__address_space__blur_y ushort*)_blur_y + _937);\n } // if _0 else\n} // kernel kernel_blur_y_s0_y_y_y___block_id_y\n#undef __address_space__blur_y\n#undef __address_space__input\n"
	.size	.Lhalide_halide_blur_opencl_kernel_src, 42341

	.type	.L__unnamed_1,@object   // @0
	.p2align	4
.L__unnamed_1:
	.zero	32
	.size	.L__unnamed_1, 32

	.type	.L__unnamed_2,@object   // @1
	.p2align	4
.L__unnamed_2:
	.zero	32
	.size	.L__unnamed_2, 32

	.type	.L__unnamed_3,@object   // @2
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4
.L__unnamed_3:
	.xword	.Lstr
	.word	1                       // 0x1
	.word	2                       // 0x2
	.byte	1                       // 0x1
	.byte	16                      // 0x10
	.hword	1                       // 0x1
	.zero	4
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	.L__unnamed_1
	.xword	.Lstr.278
	.word	2                       // 0x2
	.word	2                       // 0x2
	.byte	1                       // 0x1
	.byte	16                      // 0x10
	.hword	1                       // 0x1
	.zero	4
	.xword	0
	.xword	0
	.xword	0
	.xword	0
	.xword	.L__unnamed_2
	.size	.L__unnamed_3, 128

	.type	.Lstr.284,@object       // @str.284
	.section	.rodata,"a",@progbits
	.p2align	5
.Lstr.284:
	.asciz	"arm-64-android-opencl"
	.size	.Lstr.284, 22

	.type	.Lstr.285,@object       // @str.285
	.p2align	5
.Lstr.285:
	.asciz	"halide_blur"
	.size	.Lstr.285, 12

	.type	.Lhalide_blur_metadata_storage,@object // @halide_blur_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4
.Lhalide_blur_metadata_storage:
	.word	1                       // 0x1
	.word	2                       // 0x2
	.xword	.L__unnamed_3
	.xword	.Lstr.284
	.xword	.Lstr.285
	.size	.Lhalide_blur_metadata_storage, 32

	.type	.Lswitch.table.halide_type_to_string,@object // @switch.table.halide_type_to_string
	.p2align	3
.Lswitch.table.halide_type_to_string:
	.xword	.L.str.13.77
	.xword	.L.str.14.76
	.xword	.L.str.15.75
	.xword	.L.str.16.74
	.size	.Lswitch.table.halide_type_to_string, 32

	.type	.Lswitch.table._ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi,@object // @switch.table._ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi
	.p2align	3
.Lswitch.table._ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi:
	.xword	.L.str.238
	.xword	.L.str.237
	.xword	.L.str.236
	.xword	.L.str.235
	.xword	.L.str.234
	.xword	.L.str.233
	.xword	.L.str.232
	.xword	.L.str.231
	.xword	.L.str.230
	.xword	.L.str.229
	.xword	.L.str.228
	.xword	.L.str.227
	.xword	.L.str.226
	.xword	.L.str.225
	.xword	.L.str.224
	.xword	.L.str.223
	.xword	.L.str.222
	.xword	.L.str.221
	.xword	.L.str.220
	.xword	.L.str.219
	.xword	.L.str.218
	.xword	.L.str.217
	.xword	.L.str.216
	.xword	.L.str.215
	.xword	.L.str.214
	.xword	.L.str.213
	.xword	.L.str.212
	.xword	.L.str.211
	.xword	.L.str.210
	.xword	.L.str.209.217
	.xword	.L.str.208
	.xword	.L.str.207
	.xword	.L.str.206
	.xword	.L.str.205
	.xword	.L.str.204
	.xword	.L.str.203
	.xword	.L.str.202
	.xword	.L.str.201
	.xword	.L.str.200
	.xword	.L.str.239
	.xword	.L.str.239
	.xword	.L.str.239
	.xword	.L.str.239
	.xword	.L.str.239
	.xword	.L.str.239
	.xword	.L.str.239
	.xword	.L.str.239
	.xword	.L.str.239
	.xword	.L.str.239
	.xword	.L.str.199
	.xword	.L.str.198.218
	.xword	.L.str.197
	.xword	.L.str.196
	.xword	.L.str.195
	.xword	.L.str.194
	.xword	.L.str.193
	.xword	.L.str.192
	.xword	.L.str.191
	.xword	.L.str.190
	.xword	.L.str.189
	.xword	.L.str.188
	.xword	.L.str.187
	.xword	.L.str.186
	.xword	.L.str.185
	.xword	.L.str.184
	.xword	.L.str.183
	.xword	.L.str.182
	.xword	.L.str.181
	.xword	.L.str.180
	.size	.Lswitch.table._ZN6Halide7Runtime8Internal6OpenCL21get_opencl_error_nameEi, 552


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

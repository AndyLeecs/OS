cmd_fs/nfsd/lockd.o := arm-linux-androideabi-gcc -Wp,-MD,fs/nfsd/.lockd.o.d  -nostdinc -isystem /home/andylee/Downloads/android-ndk-r11-linux-x86_64.tar.bz2/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/../lib/gcc/arm-linux-androideabi/4.9/include -I/home/andylee/kernel/goldfish/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /home/andylee/kernel/goldfish/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-goldfish/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -fno-pic -marm -fno-dwarf2-cfi-asm -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(lockd)"  -D"KBUILD_MODNAME=KBUILD_STR(nfsd)" -c -o fs/nfsd/lockd.o fs/nfsd/lockd.c

source_fs/nfsd/lockd.o := fs/nfsd/lockd.c

deps_fs/nfsd/lockd.o := \
    $(wildcard include/config/lockd/v4.h) \
  include/linux/file.h \
  include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  include/linux/compiler-gcc4.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/types.h \
  include/asm-generic/int-ll64.h \
  arch/arm/include/generated/asm/bitsperlong.h \
  include/asm-generic/bitsperlong.h \
  include/linux/posix_types.h \
  include/linux/stddef.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/posix_types.h \
  include/asm-generic/posix_types.h \
  include/linux/lockd/bind.h \
  include/linux/lockd/nlm.h \
  include/linux/lockd/xdr.h \
  include/linux/fs.h \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/debug/writecount.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
    $(wildcard include/config/fs/xip.h) \
    $(wildcard include/config/migration.h) \
  include/linux/limits.h \
  include/linux/ioctl.h \
  arch/arm/include/generated/asm/ioctl.h \
  include/asm-generic/ioctl.h \
  include/linux/blk_types.h \
    $(wildcard include/config/blk/dev/integrity.h) \
  include/linux/linkage.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/linkage.h \
  include/linux/wait.h \
    $(wildcard include/config/lockdep.h) \
  include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  include/linux/const.h \
  include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
  include/linux/typecheck.h \
  include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
  include/linux/bitops.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/bitops.h \
  include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/irqflags.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/arm/thumb.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/hwcap.h \
  include/asm-generic/bitops/non-atomic.h \
  include/asm-generic/bitops/fls64.h \
  include/asm-generic/bitops/sched.h \
  include/asm-generic/bitops/hweight.h \
  include/asm-generic/bitops/arch_hweight.h \
  include/asm-generic/bitops/const_hweight.h \
  include/asm-generic/bitops/lock.h \
  include/asm-generic/bitops/le.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/byteorder.h \
  include/linux/byteorder/little_endian.h \
  include/linux/swab.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/swab.h \
  include/linux/byteorder/generic.h \
  include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/cpu/use/domains.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arch/has/barriers.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/outercache.h \
    $(wildcard include/config/outer/cache/sync.h) \
    $(wildcard include/config/outer/cache.h) \
  include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  include/linux/sysinfo.h \
  /home/andylee/Downloads/android-ndk-r11-linux-x86_64.tar.bz2/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/lib/gcc/arm-linux-androideabi/4.9/include/stdarg.h \
  include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  include/linux/printk.h \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
  include/linux/dynamic_debug.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/div64.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/compiler.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/debug/bugverbose.h) \
    $(wildcard include/config/arm/lpae.h) \
  include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  include/linux/stringify.h \
  include/linux/bottom_half.h \
  include/linux/spinlock_types.h \
  include/linux/spinlock_types_up.h \
  include/linux/lockdep.h \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/prove/rcu.h) \
  include/linux/rwlock_types.h \
  include/linux/spinlock_up.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/arm/errata/754327.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/hw_breakpoint.h \
  include/linux/rwlock.h \
  include/linux/spinlock_api_up.h \
  include/linux/atomic.h \
    $(wildcard include/config/arch/has/atomic/or.h) \
    $(wildcard include/config/generic/atomic64.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/atomic.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/cmpxchg.h \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/v6.h) \
  include/asm-generic/cmpxchg-local.h \
  include/asm-generic/atomic-long.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/current.h \
  include/linux/kdev_t.h \
  include/linux/dcache.h \
  include/linux/rculist.h \
  include/linux/rcupdate.h \
    $(wildcard include/config/rcu/torture/test.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tree/preempt/rcu.h) \
    $(wildcard include/config/rcu/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tiny/preempt/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/preempt/rt.h) \
  include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  include/linux/bitmap.h \
  include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/string.h \
  include/linux/bug.h \
  include/linux/seqlock.h \
  include/linux/completion.h \
  include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  include/linux/rcutiny.h \
  include/linux/rculist_bl.h \
  include/linux/list_bl.h \
  include/linux/bit_spinlock.h \
  include/linux/path.h \
  include/linux/stat.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/stat.h \
  include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  include/linux/math64.h \
  include/linux/radix-tree.h \
  include/linux/prio_tree.h \
  include/linux/pid.h \
  include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/have/arch/mutex/cpu/relax.h) \
  include/linux/capability.h \
  include/linux/semaphore.h \
  include/linux/fiemap.h \
  include/linux/shrinker.h \
  include/linux/migrate_mode.h \
  include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  include/linux/errno.h \
  arch/arm/include/generated/asm/errno.h \
  include/asm-generic/errno.h \
  include/asm-generic/errno-base.h \
  include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  include/linux/rwsem-spinlock.h \
  include/linux/percpu_counter.h \
  include/linux/smp.h \
    $(wildcard include/config/use/generic/smp/helpers.h) \
  include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  include/linux/pfn.h \
  arch/arm/include/generated/asm/percpu.h \
  include/asm-generic/percpu.h \
  include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  include/linux/dqblk_xfs.h \
  include/linux/dqblk_v1.h \
  include/linux/dqblk_v2.h \
  include/linux/dqblk_qtree.h \
  include/linux/nfs_fs_i.h \
  include/linux/fcntl.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/fcntl.h \
  include/asm-generic/fcntl.h \
  include/linux/err.h \
  include/linux/nfs.h \
  include/linux/sunrpc/msg_prot.h \
  include/linux/inet.h \
  include/linux/sunrpc/xdr.h \
  include/linux/uio.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/unaligned.h \
  include/linux/unaligned/le_byteshift.h \
  include/linux/unaligned/be_byteshift.h \
  include/linux/unaligned/generic.h \
  include/linux/scatterlist.h \
    $(wildcard include/config/debug/sg.h) \
  include/linux/mm.h \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sysctl.h) \
    $(wildcard include/config/have/arch/mmap/rnd/bits.h) \
    $(wildcard include/config/have/arch/mmap/rnd/compat/bits.h) \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/sparsemem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/ksm.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/hugetlbfs.h) \
  include/linux/gfp.h \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/pm/sleep.h) \
  include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/cgroup/mem/res/ctlr.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/have/memblock/node.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  include/linux/nodemask.h \
  include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  include/generated/bounds.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v3.h) \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/glue.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/pgtable-2level-types.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
  arch/arm/include/generated/asm/sizes.h \
  include/asm-generic/sizes.h \
  include/asm-generic/memory_model.h \
  include/asm-generic/getorder.h \
  include/linux/memory_hotplug.h \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
  include/linux/notifier.h \
  include/linux/srcu.h \
  include/linux/topology.h \
    $(wildcard include/config/sched/smt.h) \
    $(wildcard include/config/sched/mc.h) \
    $(wildcard include/config/sched/book.h) \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/topology.h \
    $(wildcard include/config/arm/cpu/topology.h) \
  include/asm-generic/topology.h \
  include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/virtual.h) \
  include/linux/rbtree.h \
  include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  include/linux/mm_types.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/have/cmpxchg/double.h) \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/want/page/debug/flags.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mm/owner.h) \
    $(wildcard include/config/mmu/notifier.h) \
  include/linux/auxvec.h \
  arch/arm/include/generated/asm/auxvec.h \
  include/asm-generic/auxvec.h \
  include/linux/page-debug-flags.h \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/page/guard.h) \
    $(wildcard include/config/page/debug/something/else.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
  include/linux/range.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/pgtable.h \
    $(wildcard include/config/highpte.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/proc-fns.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/glue-proc.h \
    $(wildcard include/config/cpu/arm610.h) \
    $(wildcard include/config/cpu/arm7tdmi.h) \
    $(wildcard include/config/cpu/arm710.h) \
    $(wildcard include/config/cpu/arm720t.h) \
    $(wildcard include/config/cpu/arm740t.h) \
    $(wildcard include/config/cpu/arm9tdmi.h) \
    $(wildcard include/config/cpu/arm920t.h) \
    $(wildcard include/config/cpu/arm922t.h) \
    $(wildcard include/config/cpu/arm925t.h) \
    $(wildcard include/config/cpu/arm926t.h) \
    $(wildcard include/config/cpu/arm940t.h) \
    $(wildcard include/config/cpu/arm946e.h) \
    $(wildcard include/config/cpu/arm1020.h) \
    $(wildcard include/config/cpu/arm1020e.h) \
    $(wildcard include/config/cpu/arm1022.h) \
    $(wildcard include/config/cpu/arm1026.h) \
    $(wildcard include/config/cpu/mohawk.h) \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/cpu/v6k.h) \
    $(wildcard include/config/cpu/v7.h) \
  include/asm-generic/pgtable-nopud.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/pgtable-hwdef.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/pgtable-2level-hwdef.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/pgtable-2level.h \
  include/asm-generic/pgtable.h \
  include/linux/page-flags.h \
    $(wildcard include/config/pageflags/extended.h) \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/s390.h) \
  include/linux/huge_mm.h \
  include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
  include/linux/vm_event_item.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/scatterlist.h \
    $(wildcard include/config/arm/has/sg/chain.h) \
  include/asm-generic/scatterlist.h \
    $(wildcard include/config/need/sg/dma/length.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/io.h \
    $(wildcard include/config/need/mach/io/h.h) \
    $(wildcard include/config/pcmcia/soc/common.h) \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/isa.h) \
    $(wildcard include/config/pccard.h) \
  include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  arch/arm/mach-goldfish/include/mach/io.h \
  include/linux/lockd/xdr4.h \
  fs/nfsd/nfsd.h \
    $(wildcard include/config/nfsd/v2/acl.h) \
    $(wildcard include/config/nfsd/v3/acl.h) \
    $(wildcard include/config/nfsd/v4.h) \
  include/linux/mount.h \
  include/linux/nfs2.h \
  include/linux/nfs3.h \
  include/linux/nfs4.h \
    $(wildcard include/config/nfs/v4/1.h) \
  include/linux/nfsd/debug.h \
  include/linux/sunrpc/debug.h \
    $(wildcard include/config/sunrpc/debug.h) \
    $(wildcard include/config/tracepoints.h) \
  include/linux/nfsd/export.h \
  include/linux/nfsd/nfsfh.h \
    $(wildcard include/config/nfsd/v3.h) \
  include/linux/sunrpc/svc.h \
    $(wildcard include/config/sunrpc/backchannel.h) \
  include/linux/in.h \
  include/linux/socket.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/socket.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/sockios.h \
  include/linux/sockios.h \
  include/linux/in6.h \
  include/linux/sunrpc/types.h \
  include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  include/linux/ktime.h \
    $(wildcard include/config/ktime/scalar.h) \
  include/linux/jiffies.h \
  include/linux/timex.h \
  include/linux/param.h \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/param.h \
    $(wildcard include/config/hz.h) \
  /home/andylee/kernel/goldfish/arch/arm/include/asm/timex.h \
  arch/arm/mach-goldfish/include/mach/timex.h \
  include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
  include/linux/sunrpc/auth.h \
  include/linux/sunrpc/sched.h \
  include/linux/sunrpc/svcauth.h \
  include/linux/sunrpc/cache.h \
  include/linux/kref.h \
  include/linux/slab.h \
    $(wildcard include/config/slab/debug.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/slab.h) \
  include/linux/slab_def.h \
  include/linux/kmalloc_sizes.h \
  include/linux/proc_fs.h \
    $(wildcard include/config/proc/devicetree.h) \
    $(wildcard include/config/proc/kcore.h) \
  include/linux/magic.h \
  include/linux/hash.h \
  include/linux/nfsd/stats.h \
  fs/nfsd/vfs.h \
  fs/nfsd/nfsfh.h \

fs/nfsd/lockd.o: $(deps_fs/nfsd/lockd.o)

$(deps_fs/nfsd/lockd.o):

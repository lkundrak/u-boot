#
# (C) Copyright 2006
# Wolfgang Denk, DENX Software Engineering, wd@denx.de.
#
# SPDX-License-Identifier:	GPL-2.0+
#

ifdef CONFIG_SPL_BUILD
# necessary to create built-in.o
obj- := __dummy__.o
else
obj-$(CONFIG_SPEAR3XX)	+= spr_misc.o spr_lowlevel_init.o
obj-$(CONFIG_SPEAR600)	+= spr_misc.o spr_lowlevel_init.o
obj-$(CONFIG_SPEAR13XX) += spr13xx_misc.o
obj-$(CONFIG_SPEAR13XX) += spr13xx_lowlevel_init.o
endif

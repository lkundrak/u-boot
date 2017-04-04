/*
 * arch/arm/include/debug/pl01x.S
 *
 *  Copyright (C) 1994-1999 Russell King
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * SPDX-License-Identifier:     GPL-2.0
 */

/* Duplicated from serial_pl01x_internal.h */
#define UART_PL01x_DR		0x00 /* offsetof(struct pl01x_regs, dr) */
#define UART_PL01x_FR		0x18 /* offsetof(struct pl01x_regs, fr) */
#define UART_PL01x_FR_BUSY	0x08
#define UART_PL01x_FR_TXFF	0x20

		.macro	addruart, rp, rv, tmp
		ldr	\rp, =CONFIG_DEBUG_UART_PHYS
		ldr	\rv, =CONFIG_DEBUG_UART_VIRT
		.endm

		.macro	senduart,rd,rx
		strb	\rd, [\rx, #UART_PL01x_DR]
		.endm

		.macro	waituart,rd,rx
1001:		ldr	\rd, [\rx, #UART_PL01x_FR]
		tst	\rd, #UART_PL01x_FR_TXFF
		bne	1001b
		.endm

		.macro	busyuart,rd,rx
1001:		ldr	\rd, [\rx, #UART_PL01x_FR]
		tst	\rd, #UART_PL01x_FR_BUSY
		bne	1001b
		.endm

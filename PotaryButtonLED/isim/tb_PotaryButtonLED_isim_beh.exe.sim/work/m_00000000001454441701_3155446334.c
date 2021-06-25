/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/susu/Documents/mygithub/FPGA/PotaryButtonLED/PotaryButtonLED.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {128U, 0U};



static void Always_14_0(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    int t10;

LAB0:    t1 = (t0 + 2584U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(14, ng0);
    t2 = (t0 + 3212);
    *((int *)t2) = 1;
    t3 = (t0 + 2612);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(15, ng0);

LAB5:    t4 = (t0 + 148);
    xsi_vlog_namedbase_setdisablestate(t4, &&LAB6);
    t5 = (t0 + 2484);
    xsi_vlog_namedbase_pushprocess(t4, t5);

LAB7:    xsi_set_current_line(16, ng0);
    t7 = (t0 + 912U);
    t8 = *((char **)t7);
    t7 = (t0 + 1004U);
    t9 = *((char **)t7);
    xsi_vlogtype_concat(t6, 2, 2, 2U, t9, 1, t8, 1);
    t7 = (t0 + 1692);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 2, 0LL);
    xsi_set_current_line(18, ng0);
    t2 = (t0 + 1692);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);

LAB8:    t5 = ((char*)((ng1)));
    t10 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 2);
    if (t10 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng2)));
    t10 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t10 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng3)));
    t10 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t10 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng4)));
    t10 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t10 == 1)
        goto LAB15;

LAB16:
LAB18:
LAB17:    xsi_set_current_line(23, ng0);

LAB20:    xsi_set_current_line(24, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1508);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(25, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1600);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB19:    t2 = (t0 + 148);
    xsi_vlog_namedbase_popprocess(t2);

LAB6:    t3 = (t0 + 2484);
    xsi_vlog_dispose_process_subprogram_invocation(t3);
    goto LAB2;

LAB9:    xsi_set_current_line(19, ng0);
    t7 = ((char*)((ng1)));
    t8 = (t0 + 1508);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 1, 0LL);
    goto LAB19;

LAB11:    xsi_set_current_line(20, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1600);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    goto LAB19;

LAB13:    xsi_set_current_line(21, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1600);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    goto LAB19;

LAB15:    xsi_set_current_line(22, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1508);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 1, 0LL);
    goto LAB19;

}

static void Always_33_1(char *t0)
{
    char t10[8];
    char t19[8];
    char t28[8];
    char t36[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    int t60;
    int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;

LAB0:    t1 = (t0 + 2728U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 3220);
    *((int *)t2) = 1;
    t3 = (t0 + 2756);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(34, ng0);

LAB5:    t4 = (t0 + 304);
    xsi_vlog_namedbase_setdisablestate(t4, &&LAB6);
    t5 = (t0 + 2628);
    xsi_vlog_namedbase_pushprocess(t4, t5);

LAB7:    xsi_set_current_line(35, ng0);
    t6 = (t0 + 1508);
    t7 = (t6 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 1784);
    xsi_vlogvar_wait_assign_value(t9, t8, 0, 0, 1, 0LL);
    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1508);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    memset(t10, 0, 8);
    t5 = (t4 + 4);
    t11 = *((unsigned int *)t5);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t5) != 0)
        goto LAB10;

LAB11:    t7 = (t10 + 4);
    t16 = *((unsigned int *)t10);
    t17 = *((unsigned int *)t7);
    t18 = (t16 || t17);
    if (t18 > 0)
        goto LAB12;

LAB13:    memcpy(t36, t10, 8);

LAB14:    t68 = (t36 + 4);
    t69 = *((unsigned int *)t68);
    t70 = (~(t69));
    t71 = *((unsigned int *)t36);
    t72 = (t71 & t70);
    t73 = (t72 != 0);
    if (t73 > 0)
        goto LAB26;

LAB27:    xsi_set_current_line(43, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1876);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB28:    t2 = (t0 + 304);
    xsi_vlog_namedbase_popprocess(t2);

LAB6:    t3 = (t0 + 2628);
    xsi_vlog_dispose_process_subprogram_invocation(t3);
    goto LAB2;

LAB8:    *((unsigned int *)t10) = 1;
    goto LAB11;

LAB10:    t6 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t6) = 1;
    goto LAB11;

LAB12:    t8 = (t0 + 1784);
    t9 = (t8 + 36U);
    t20 = *((char **)t9);
    memset(t19, 0, 8);
    t21 = (t20 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB18;

LAB16:    if (*((unsigned int *)t21) == 0)
        goto LAB15;

LAB17:    t27 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t27) = 1;

LAB18:    memset(t28, 0, 8);
    t29 = (t19 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t19);
    t33 = (t32 & t31);
    t34 = (t33 & 1U);
    if (t34 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t29) != 0)
        goto LAB21;

LAB22:    t37 = *((unsigned int *)t10);
    t38 = *((unsigned int *)t28);
    t39 = (t37 & t38);
    *((unsigned int *)t36) = t39;
    t40 = (t10 + 4);
    t41 = (t28 + 4);
    t42 = (t36 + 4);
    t43 = *((unsigned int *)t40);
    t44 = *((unsigned int *)t41);
    t45 = (t43 | t44);
    *((unsigned int *)t42) = t45;
    t46 = *((unsigned int *)t42);
    t47 = (t46 != 0);
    if (t47 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB14;

LAB15:    *((unsigned int *)t19) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t28) = 1;
    goto LAB22;

LAB21:    t35 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB22;

LAB23:    t48 = *((unsigned int *)t36);
    t49 = *((unsigned int *)t42);
    *((unsigned int *)t36) = (t48 | t49);
    t50 = (t10 + 4);
    t51 = (t28 + 4);
    t52 = *((unsigned int *)t10);
    t53 = (~(t52));
    t54 = *((unsigned int *)t50);
    t55 = (~(t54));
    t56 = *((unsigned int *)t28);
    t57 = (~(t56));
    t58 = *((unsigned int *)t51);
    t59 = (~(t58));
    t60 = (t53 & t55);
    t61 = (t57 & t59);
    t62 = (~(t60));
    t63 = (~(t61));
    t64 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t64 & t62);
    t65 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t65 & t63);
    t66 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t66 & t62);
    t67 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t67 & t63);
    goto LAB25;

LAB26:    xsi_set_current_line(38, ng0);

LAB29:    xsi_set_current_line(39, ng0);
    t74 = ((char*)((ng2)));
    t75 = (t0 + 1876);
    xsi_vlogvar_wait_assign_value(t75, t74, 0, 0, 1, 0LL);
    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1600);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 1968);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    goto LAB28;

}

static void Always_50_2(char *t0)
{
    char t4[8];
    char t16[8];
    char t45[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    int t42;
    char *t43;
    char *t44;
    char *t46;
    char *t47;

LAB0:    t1 = (t0 + 2872U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 3228);
    *((int *)t2) = 1;
    t3 = (t0 + 2900);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(50, ng0);

LAB5:    xsi_set_current_line(52, ng0);
    t5 = (t0 + 2060);
    t6 = (t5 + 36U);
    t7 = *((char **)t6);
    memset(t4, 0, 8);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t7);
    t12 = (t11 & t10);
    t13 = (t12 & 255U);
    if (t13 != 0)
        goto LAB6;

LAB7:    if (*((unsigned int *)t8) != 0)
        goto LAB8;

LAB9:    t15 = ((char*)((ng1)));
    memset(t16, 0, 8);
    t17 = (t4 + 4);
    t18 = (t15 + 4);
    t19 = *((unsigned int *)t4);
    t20 = *((unsigned int *)t15);
    t21 = (t19 ^ t20);
    t22 = *((unsigned int *)t17);
    t23 = *((unsigned int *)t18);
    t24 = (t22 ^ t23);
    t25 = (t21 | t24);
    t26 = *((unsigned int *)t17);
    t27 = *((unsigned int *)t18);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB13;

LAB10:    if (t28 != 0)
        goto LAB12;

LAB11:    *((unsigned int *)t16) = 1;

LAB13:    t32 = (t16 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t16);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB14;

LAB15:    xsi_set_current_line(59, ng0);

LAB24:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1876);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t6 = (t5 + 4);
    t9 = *((unsigned int *)t6);
    t10 = (~(t9));
    t11 = *((unsigned int *)t5);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB25;

LAB26:
LAB27:
LAB16:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB8:    t14 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB9;

LAB12:    t31 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB13;

LAB14:    xsi_set_current_line(52, ng0);

LAB17:    xsi_set_current_line(53, ng0);
    t38 = (t0 + 1968);
    t39 = (t38 + 36U);
    t40 = *((char **)t39);

LAB18:    t41 = ((char*)((ng1)));
    t42 = xsi_vlog_unsigned_case_compare(t40, 1, t41, 2);
    if (t42 == 1)
        goto LAB19;

LAB20:
LAB22:
LAB21:    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2060);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB23:    goto LAB16;

LAB19:    xsi_set_current_line(54, ng0);
    t43 = ((char*)((ng5)));
    t44 = (t0 + 2060);
    xsi_vlogvar_wait_assign_value(t44, t43, 0, 0, 8, 0LL);
    goto LAB23;

LAB25:    xsi_set_current_line(60, ng0);

LAB28:    xsi_set_current_line(61, ng0);
    t7 = (t0 + 1968);
    t8 = (t7 + 36U);
    t14 = *((char **)t8);
    t15 = (t14 + 4);
    t19 = *((unsigned int *)t15);
    t20 = (~(t19));
    t21 = *((unsigned int *)t14);
    t22 = (t21 & t20);
    t23 = (t22 != 0);
    if (t23 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 2060);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    memset(t16, 0, 8);
    t6 = (t16 + 4);
    t7 = (t5 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 1);
    *((unsigned int *)t16) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 1);
    *((unsigned int *)t6) = t12;
    t13 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t13 & 127U);
    t19 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t19 & 127U);
    t8 = (t0 + 2060);
    t14 = (t8 + 36U);
    t15 = *((char **)t14);
    memset(t45, 0, 8);
    t17 = (t45 + 4);
    t18 = (t15 + 4);
    t20 = *((unsigned int *)t15);
    t21 = (t20 >> 0);
    t22 = (t21 & 1);
    *((unsigned int *)t45) = t22;
    t23 = *((unsigned int *)t18);
    t24 = (t23 >> 0);
    t25 = (t24 & 1);
    *((unsigned int *)t17) = t25;
    xsi_vlogtype_concat(t4, 8, 8, 2U, t45, 1, t16, 7);
    t31 = (t0 + 2060);
    xsi_vlogvar_wait_assign_value(t31, t4, 0, 0, 8, 0LL);

LAB31:    goto LAB27;

LAB29:    xsi_set_current_line(61, ng0);
    t17 = (t0 + 2060);
    t18 = (t17 + 36U);
    t31 = *((char **)t18);
    memset(t16, 0, 8);
    t32 = (t16 + 4);
    t38 = (t31 + 4);
    t24 = *((unsigned int *)t31);
    t25 = (t24 >> 7);
    t26 = (t25 & 1);
    *((unsigned int *)t16) = t26;
    t27 = *((unsigned int *)t38);
    t28 = (t27 >> 7);
    t29 = (t28 & 1);
    *((unsigned int *)t32) = t29;
    t39 = (t0 + 2060);
    t41 = (t39 + 36U);
    t43 = *((char **)t41);
    memset(t45, 0, 8);
    t44 = (t45 + 4);
    t46 = (t43 + 4);
    t30 = *((unsigned int *)t43);
    t33 = (t30 >> 0);
    *((unsigned int *)t45) = t33;
    t34 = *((unsigned int *)t46);
    t35 = (t34 >> 0);
    *((unsigned int *)t44) = t35;
    t36 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t36 & 127U);
    t37 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t37 & 127U);
    xsi_vlogtype_concat(t4, 8, 8, 2U, t45, 7, t16, 1);
    t47 = (t0 + 2060);
    xsi_vlogvar_wait_assign_value(t47, t4, 0, 0, 8, 0LL);
    goto LAB31;

}

static void Cont_68_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t16[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;

LAB0:    t1 = (t0 + 3016U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1096U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t12);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    t30 = *((unsigned int *)t4);
    t31 = (~(t30));
    t32 = *((unsigned int *)t12);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t36, 8);

LAB16:    t37 = (t0 + 3280);
    t38 = (t37 + 32U);
    t39 = *((char **)t38);
    t40 = (t39 + 40U);
    t41 = *((char **)t40);
    memset(t41, 0, 8);
    t42 = 255U;
    t43 = t42;
    t44 = (t3 + 4);
    t45 = *((unsigned int *)t3);
    t42 = (t42 & t45);
    t46 = *((unsigned int *)t44);
    t43 = (t43 & t46);
    t47 = (t41 + 4);
    t48 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t48 | t42);
    t49 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t49 | t43);
    xsi_driver_vfirst_trans(t37, 0, 7);
    t50 = (t0 + 3236);
    *((int *)t50) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t17 = (t0 + 2060);
    t18 = (t17 + 36U);
    t19 = *((char **)t18);
    memset(t16, 0, 8);
    t20 = (t16 + 4);
    t21 = (t19 + 4);
    t22 = *((unsigned int *)t19);
    t23 = (~(t22));
    *((unsigned int *)t16) = t23;
    *((unsigned int *)t20) = 0;
    if (*((unsigned int *)t21) != 0)
        goto LAB18;

LAB17:    t28 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t28 & 255U);
    t29 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t29 & 255U);
    goto LAB9;

LAB10:    t34 = (t0 + 2060);
    t35 = (t34 + 36U);
    t36 = *((char **)t35);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 8, t16, 8, t36, 8);
    goto LAB16;

LAB14:    memcpy(t3, t16, 8);
    goto LAB16;

LAB18:    t24 = *((unsigned int *)t16);
    t25 = *((unsigned int *)t21);
    *((unsigned int *)t16) = (t24 | t25);
    t26 = *((unsigned int *)t20);
    t27 = *((unsigned int *)t21);
    *((unsigned int *)t20) = (t26 | t27);
    goto LAB17;

}


extern void work_m_00000000001454441701_3155446334_init()
{
	static char *pe[] = {(void *)Always_14_0,(void *)Always_33_1,(void *)Always_50_2,(void *)Cont_68_3};
	xsi_register_didat("work_m_00000000001454441701_3155446334", "isim/tb_PotaryButtonLED_isim_beh.exe.sim/work/m_00000000001454441701_3155446334.didat");
	xsi_register_executes(pe);
}

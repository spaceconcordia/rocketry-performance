/* Include files */

#include <stddef.h>
#include "blas.h"
#include "rocket_dynamic_data_library_sfun.h"
#include "c2_rocket_dynamic_data_library.h"
#define CHARTINSTANCE_CHARTNUMBER      (chartInstance->chartNumber)
#define CHARTINSTANCE_INSTANCENUMBER   (chartInstance->instanceNumber)
#include "rocket_dynamic_data_library_sfun_debug_macros.h"
#define _SF_MEX_LISTEN_FOR_CTRL_C(S)   sf_mex_listen_for_ctrl_c(sfGlobalDebugInstanceStruct,S);

/* Type Definitions */

/* Named Constants */
#define CALL_EVENT                     (-1)

/* Variable Declarations */

/* Variable Definitions */
static real_T _sfTime_;
static const char * c2_debug_family_names[10] = { "data_length", "nargin",
  "nargout", "thrust_curve", "burntime", "wet_motor_weight", "wfc", "mass",
  "weight", "thrust" };

/* Function Declarations */
static void initialize_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance);
static void initialize_params_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance);
static void enable_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance);
static void disable_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance);
static void c2_update_debugger_state_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance);
static const mxArray *get_sim_state_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance);
static void set_sim_state_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance, const mxArray *
   c2_st);
static void finalize_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance);
static void sf_gateway_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance);
static void initSimStructsc2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance);
static void init_script_number_translation(uint32_T c2_machineNumber, uint32_T
  c2_chartNumber, uint32_T c2_instanceNumber);
static const mxArray *c2_sf_marshallOut(void *chartInstanceVoid, void *c2_inData);
static void c2_emlrt_marshallIn(SFc2_rocket_dynamic_data_libraryInstanceStruct
  *chartInstance, const mxArray *c2_thrust, const char_T *c2_identifier, real_T
  c2_y[121]);
static void c2_b_emlrt_marshallIn(SFc2_rocket_dynamic_data_libraryInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[121]);
static void c2_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData);
static const mxArray *c2_b_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData);
static real_T c2_c_emlrt_marshallIn
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance, const mxArray *
   c2_u, const emlrtMsgIdentifier *c2_parentId);
static void c2_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData);
static void c2_info_helper(const mxArray **c2_info);
static const mxArray *c2_emlrt_marshallOut(const char * c2_u);
static const mxArray *c2_b_emlrt_marshallOut(const uint32_T c2_u);
static const mxArray *c2_c_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData);
static int32_T c2_d_emlrt_marshallIn
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance, const mxArray *
   c2_u, const emlrtMsgIdentifier *c2_parentId);
static void c2_c_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData);
static uint8_T c2_e_emlrt_marshallIn
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance, const mxArray *
   c2_b_is_active_c2_rocket_dynamic_data_library, const char_T *c2_identifier);
static uint8_T c2_f_emlrt_marshallIn
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance, const mxArray *
   c2_u, const emlrtMsgIdentifier *c2_parentId);
static void init_dsm_address_info(SFc2_rocket_dynamic_data_libraryInstanceStruct
  *chartInstance);

/* Function Definitions */
static void initialize_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance)
{
  chartInstance->c2_sfEvent = CALL_EVENT;
  _sfTime_ = sf_get_time(chartInstance->S);
  chartInstance->c2_is_active_c2_rocket_dynamic_data_library = 0U;
}

static void initialize_params_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static void enable_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void disable_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance)
{
  _sfTime_ = sf_get_time(chartInstance->S);
}

static void c2_update_debugger_state_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static const mxArray *get_sim_state_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance)
{
  const mxArray *c2_st;
  const mxArray *c2_y = NULL;
  int32_T c2_i0;
  real_T c2_u[121];
  const mxArray *c2_b_y = NULL;
  int32_T c2_i1;
  real_T c2_b_u[121];
  const mxArray *c2_c_y = NULL;
  int32_T c2_i2;
  real_T c2_c_u[121];
  const mxArray *c2_d_y = NULL;
  uint8_T c2_hoistedGlobal;
  uint8_T c2_d_u;
  const mxArray *c2_e_y = NULL;
  real_T (*c2_weight)[121];
  real_T (*c2_thrust)[121];
  real_T (*c2_mass)[121];
  c2_thrust = (real_T (*)[121])ssGetOutputPortSignal(chartInstance->S, 3);
  c2_weight = (real_T (*)[121])ssGetOutputPortSignal(chartInstance->S, 2);
  c2_mass = (real_T (*)[121])ssGetOutputPortSignal(chartInstance->S, 1);
  c2_st = NULL;
  c2_st = NULL;
  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_createcellmatrix(4, 1), false);
  for (c2_i0 = 0; c2_i0 < 121; c2_i0++) {
    c2_u[c2_i0] = (*c2_mass)[c2_i0];
  }

  c2_b_y = NULL;
  sf_mex_assign(&c2_b_y, sf_mex_create("y", c2_u, 0, 0U, 1U, 0U, 1, 121), false);
  sf_mex_setcell(c2_y, 0, c2_b_y);
  for (c2_i1 = 0; c2_i1 < 121; c2_i1++) {
    c2_b_u[c2_i1] = (*c2_thrust)[c2_i1];
  }

  c2_c_y = NULL;
  sf_mex_assign(&c2_c_y, sf_mex_create("y", c2_b_u, 0, 0U, 1U, 0U, 1, 121),
                false);
  sf_mex_setcell(c2_y, 1, c2_c_y);
  for (c2_i2 = 0; c2_i2 < 121; c2_i2++) {
    c2_c_u[c2_i2] = (*c2_weight)[c2_i2];
  }

  c2_d_y = NULL;
  sf_mex_assign(&c2_d_y, sf_mex_create("y", c2_c_u, 0, 0U, 1U, 0U, 1, 121),
                false);
  sf_mex_setcell(c2_y, 2, c2_d_y);
  c2_hoistedGlobal = chartInstance->c2_is_active_c2_rocket_dynamic_data_library;
  c2_d_u = c2_hoistedGlobal;
  c2_e_y = NULL;
  sf_mex_assign(&c2_e_y, sf_mex_create("y", &c2_d_u, 3, 0U, 0U, 0U, 0), false);
  sf_mex_setcell(c2_y, 3, c2_e_y);
  sf_mex_assign(&c2_st, c2_y, false);
  return c2_st;
}

static void set_sim_state_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance, const mxArray *
   c2_st)
{
  const mxArray *c2_u;
  real_T c2_dv0[121];
  int32_T c2_i3;
  real_T c2_dv1[121];
  int32_T c2_i4;
  real_T c2_dv2[121];
  int32_T c2_i5;
  real_T (*c2_mass)[121];
  real_T (*c2_thrust)[121];
  real_T (*c2_weight)[121];
  c2_thrust = (real_T (*)[121])ssGetOutputPortSignal(chartInstance->S, 3);
  c2_weight = (real_T (*)[121])ssGetOutputPortSignal(chartInstance->S, 2);
  c2_mass = (real_T (*)[121])ssGetOutputPortSignal(chartInstance->S, 1);
  chartInstance->c2_doneDoubleBufferReInit = true;
  c2_u = sf_mex_dup(c2_st);
  c2_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c2_u, 0)), "mass",
                      c2_dv0);
  for (c2_i3 = 0; c2_i3 < 121; c2_i3++) {
    (*c2_mass)[c2_i3] = c2_dv0[c2_i3];
  }

  c2_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c2_u, 1)),
                      "thrust", c2_dv1);
  for (c2_i4 = 0; c2_i4 < 121; c2_i4++) {
    (*c2_thrust)[c2_i4] = c2_dv1[c2_i4];
  }

  c2_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c2_u, 2)),
                      "weight", c2_dv2);
  for (c2_i5 = 0; c2_i5 < 121; c2_i5++) {
    (*c2_weight)[c2_i5] = c2_dv2[c2_i5];
  }

  chartInstance->c2_is_active_c2_rocket_dynamic_data_library =
    c2_e_emlrt_marshallIn(chartInstance, sf_mex_dup(sf_mex_getcell(c2_u, 3)),
    "is_active_c2_rocket_dynamic_data_library");
  sf_mex_destroy(&c2_u);
  c2_update_debugger_state_c2_rocket_dynamic_data_library(chartInstance);
  sf_mex_destroy(&c2_st);
}

static void finalize_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static void sf_gateway_c2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance)
{
  int32_T c2_i6;
  int32_T c2_i7;
  real_T c2_hoistedGlobal;
  real_T c2_b_hoistedGlobal;
  int32_T c2_i8;
  real_T c2_thrust_curve[121];
  int32_T c2_i9;
  real_T c2_burntime[121];
  real_T c2_wet_motor_weight;
  real_T c2_wfc;
  uint32_T c2_debug_family_var_map[10];
  real_T c2_data_length;
  real_T c2_nargin = 4.0;
  real_T c2_nargout = 3.0;
  real_T c2_mass[121];
  real_T c2_weight[121];
  real_T c2_thrust[121];
  int32_T c2_i10;
  real_T c2_a;
  int32_T c2_i11;
  real_T c2_b[121];
  int32_T c2_i12;
  int32_T c2_i13;
  int32_T c2_i14;
  int32_T c2_i15;
  int32_T c2_i16;
  int32_T c2_i17;
  int32_T c2_i18;
  int32_T c2_i19;
  int32_T c2_i20;
  int32_T c2_i21;
  int32_T c2_i22;
  real_T *c2_b_wet_motor_weight;
  real_T *c2_b_wfc;
  real_T (*c2_b_mass)[121];
  real_T (*c2_b_weight)[121];
  real_T (*c2_b_thrust)[121];
  real_T (*c2_b_burntime)[121];
  real_T (*c2_b_thrust_curve)[121];
  c2_b_thrust = (real_T (*)[121])ssGetOutputPortSignal(chartInstance->S, 3);
  c2_b_weight = (real_T (*)[121])ssGetOutputPortSignal(chartInstance->S, 2);
  c2_b_wfc = (real_T *)ssGetInputPortSignal(chartInstance->S, 3);
  c2_b_wet_motor_weight = (real_T *)ssGetInputPortSignal(chartInstance->S, 2);
  c2_b_mass = (real_T (*)[121])ssGetOutputPortSignal(chartInstance->S, 1);
  c2_b_burntime = (real_T (*)[121])ssGetInputPortSignal(chartInstance->S, 1);
  c2_b_thrust_curve = (real_T (*)[121])ssGetInputPortSignal(chartInstance->S, 0);
  _SFD_SYMBOL_SCOPE_PUSH(0U, 0U);
  _sfTime_ = sf_get_time(chartInstance->S);
  _SFD_CC_CALL(CHART_ENTER_SFUNCTION_TAG, 0U, chartInstance->c2_sfEvent);
  for (c2_i6 = 0; c2_i6 < 121; c2_i6++) {
    _SFD_DATA_RANGE_CHECK((*c2_b_thrust_curve)[c2_i6], 0U);
  }

  for (c2_i7 = 0; c2_i7 < 121; c2_i7++) {
    _SFD_DATA_RANGE_CHECK((*c2_b_burntime)[c2_i7], 1U);
  }

  chartInstance->c2_sfEvent = CALL_EVENT;
  _SFD_CC_CALL(CHART_ENTER_DURING_FUNCTION_TAG, 0U, chartInstance->c2_sfEvent);
  c2_hoistedGlobal = *c2_b_wet_motor_weight;
  c2_b_hoistedGlobal = *c2_b_wfc;
  for (c2_i8 = 0; c2_i8 < 121; c2_i8++) {
    c2_thrust_curve[c2_i8] = (*c2_b_thrust_curve)[c2_i8];
  }

  for (c2_i9 = 0; c2_i9 < 121; c2_i9++) {
    c2_burntime[c2_i9] = (*c2_b_burntime)[c2_i9];
  }

  c2_wet_motor_weight = c2_hoistedGlobal;
  c2_wfc = c2_b_hoistedGlobal;
  _SFD_SYMBOL_SCOPE_PUSH_EML(0U, 10U, 10U, c2_debug_family_names,
    c2_debug_family_var_map);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c2_data_length, 0U, c2_b_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c2_nargin, 1U, c2_b_sf_marshallOut,
    c2_b_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(&c2_nargout, 2U, c2_b_sf_marshallOut,
    c2_b_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML(c2_thrust_curve, 3U, c2_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(c2_burntime, 4U, c2_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c2_wet_motor_weight, 5U, c2_b_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML(&c2_wfc, 6U, c2_b_sf_marshallOut);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(c2_mass, 7U, c2_sf_marshallOut,
    c2_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(c2_weight, 8U, c2_sf_marshallOut,
    c2_sf_marshallIn);
  _SFD_SYMBOL_SCOPE_ADD_EML_IMPORTABLE(c2_thrust, 9U, c2_sf_marshallOut,
    c2_sf_marshallIn);
  CV_EML_FCN(0, 0);
  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 15);
  c2_data_length = 121.0;
  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 18);
  for (c2_i10 = 0; c2_i10 < 121; c2_i10++) {
    c2_weight[c2_i10] = 0.0;
  }

  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 21);
  c2_a = c2_wfc;
  for (c2_i11 = 0; c2_i11 < 121; c2_i11++) {
    c2_b[c2_i11] = c2_burntime[c2_i11];
  }

  for (c2_i12 = 0; c2_i12 < 121; c2_i12++) {
    c2_b[c2_i12] *= c2_a;
  }

  for (c2_i13 = 0; c2_i13 < 121; c2_i13++) {
    c2_weight[c2_i13] = c2_wet_motor_weight - c2_b[c2_i13];
  }

  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 27);
  for (c2_i14 = 0; c2_i14 < 121; c2_i14++) {
    c2_thrust[c2_i14] = c2_thrust_curve[c2_i14];
  }

  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, 28);
  for (c2_i15 = 0; c2_i15 < 121; c2_i15++) {
    c2_b[c2_i15] = c2_weight[c2_i15];
  }

  for (c2_i16 = 0; c2_i16 < 121; c2_i16++) {
    c2_mass[c2_i16] = c2_b[c2_i16] * 9.81;
  }

  _SFD_EML_CALL(0U, chartInstance->c2_sfEvent, -28);
  _SFD_SYMBOL_SCOPE_POP();
  for (c2_i17 = 0; c2_i17 < 121; c2_i17++) {
    (*c2_b_mass)[c2_i17] = c2_mass[c2_i17];
  }

  for (c2_i18 = 0; c2_i18 < 121; c2_i18++) {
    (*c2_b_weight)[c2_i18] = c2_weight[c2_i18];
  }

  for (c2_i19 = 0; c2_i19 < 121; c2_i19++) {
    (*c2_b_thrust)[c2_i19] = c2_thrust[c2_i19];
  }

  _SFD_CC_CALL(EXIT_OUT_OF_FUNCTION_TAG, 0U, chartInstance->c2_sfEvent);
  _SFD_SYMBOL_SCOPE_POP();
  _SFD_CHECK_FOR_STATE_INCONSISTENCY(_rocket_dynamic_data_libraryMachineNumber_,
    chartInstance->chartNumber, chartInstance->instanceNumber);
  for (c2_i20 = 0; c2_i20 < 121; c2_i20++) {
    _SFD_DATA_RANGE_CHECK((*c2_b_mass)[c2_i20], 2U);
  }

  _SFD_DATA_RANGE_CHECK(*c2_b_wet_motor_weight, 3U);
  _SFD_DATA_RANGE_CHECK(*c2_b_wfc, 4U);
  for (c2_i21 = 0; c2_i21 < 121; c2_i21++) {
    _SFD_DATA_RANGE_CHECK((*c2_b_weight)[c2_i21], 5U);
  }

  for (c2_i22 = 0; c2_i22 < 121; c2_i22++) {
    _SFD_DATA_RANGE_CHECK((*c2_b_thrust)[c2_i22], 6U);
  }
}

static void initSimStructsc2_rocket_dynamic_data_library
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance)
{
  (void)chartInstance;
}

static void init_script_number_translation(uint32_T c2_machineNumber, uint32_T
  c2_chartNumber, uint32_T c2_instanceNumber)
{
  (void)c2_machineNumber;
  (void)c2_chartNumber;
  (void)c2_instanceNumber;
}

static const mxArray *c2_sf_marshallOut(void *chartInstanceVoid, void *c2_inData)
{
  const mxArray *c2_mxArrayOutData = NULL;
  int32_T c2_i23;
  real_T c2_b_inData[121];
  int32_T c2_i24;
  real_T c2_u[121];
  const mxArray *c2_y = NULL;
  SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance;
  chartInstance = (SFc2_rocket_dynamic_data_libraryInstanceStruct *)
    chartInstanceVoid;
  c2_mxArrayOutData = NULL;
  for (c2_i23 = 0; c2_i23 < 121; c2_i23++) {
    c2_b_inData[c2_i23] = (*(real_T (*)[121])c2_inData)[c2_i23];
  }

  for (c2_i24 = 0; c2_i24 < 121; c2_i24++) {
    c2_u[c2_i24] = c2_b_inData[c2_i24];
  }

  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", c2_u, 0, 0U, 1U, 0U, 1, 121), false);
  sf_mex_assign(&c2_mxArrayOutData, c2_y, false);
  return c2_mxArrayOutData;
}

static void c2_emlrt_marshallIn(SFc2_rocket_dynamic_data_libraryInstanceStruct
  *chartInstance, const mxArray *c2_thrust, const char_T *c2_identifier, real_T
  c2_y[121])
{
  emlrtMsgIdentifier c2_thisId;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_thrust), &c2_thisId, c2_y);
  sf_mex_destroy(&c2_thrust);
}

static void c2_b_emlrt_marshallIn(SFc2_rocket_dynamic_data_libraryInstanceStruct
  *chartInstance, const mxArray *c2_u, const emlrtMsgIdentifier *c2_parentId,
  real_T c2_y[121])
{
  real_T c2_dv3[121];
  int32_T c2_i25;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), c2_dv3, 1, 0, 0U, 1, 0U, 1, 121);
  for (c2_i25 = 0; c2_i25 < 121; c2_i25++) {
    c2_y[c2_i25] = c2_dv3[c2_i25];
  }

  sf_mex_destroy(&c2_u);
}

static void c2_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData)
{
  const mxArray *c2_thrust;
  const char_T *c2_identifier;
  emlrtMsgIdentifier c2_thisId;
  real_T c2_y[121];
  int32_T c2_i26;
  SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance;
  chartInstance = (SFc2_rocket_dynamic_data_libraryInstanceStruct *)
    chartInstanceVoid;
  c2_thrust = sf_mex_dup(c2_mxArrayInData);
  c2_identifier = c2_varName;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_b_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_thrust), &c2_thisId, c2_y);
  sf_mex_destroy(&c2_thrust);
  for (c2_i26 = 0; c2_i26 < 121; c2_i26++) {
    (*(real_T (*)[121])c2_outData)[c2_i26] = c2_y[c2_i26];
  }

  sf_mex_destroy(&c2_mxArrayInData);
}

static const mxArray *c2_b_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData)
{
  const mxArray *c2_mxArrayOutData = NULL;
  real_T c2_u;
  const mxArray *c2_y = NULL;
  SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance;
  chartInstance = (SFc2_rocket_dynamic_data_libraryInstanceStruct *)
    chartInstanceVoid;
  c2_mxArrayOutData = NULL;
  c2_u = *(real_T *)c2_inData;
  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", &c2_u, 0, 0U, 0U, 0U, 0), false);
  sf_mex_assign(&c2_mxArrayOutData, c2_y, false);
  return c2_mxArrayOutData;
}

static real_T c2_c_emlrt_marshallIn
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance, const mxArray *
   c2_u, const emlrtMsgIdentifier *c2_parentId)
{
  real_T c2_y;
  real_T c2_d0;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), &c2_d0, 1, 0, 0U, 0, 0U, 0);
  c2_y = c2_d0;
  sf_mex_destroy(&c2_u);
  return c2_y;
}

static void c2_b_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData)
{
  const mxArray *c2_nargout;
  const char_T *c2_identifier;
  emlrtMsgIdentifier c2_thisId;
  real_T c2_y;
  SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance;
  chartInstance = (SFc2_rocket_dynamic_data_libraryInstanceStruct *)
    chartInstanceVoid;
  c2_nargout = sf_mex_dup(c2_mxArrayInData);
  c2_identifier = c2_varName;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_y = c2_c_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_nargout), &c2_thisId);
  sf_mex_destroy(&c2_nargout);
  *(real_T *)c2_outData = c2_y;
  sf_mex_destroy(&c2_mxArrayInData);
}

const mxArray *sf_c2_rocket_dynamic_data_library_get_eml_resolved_functions_info
  (void)
{
  const mxArray *c2_nameCaptureInfo = NULL;
  c2_nameCaptureInfo = NULL;
  sf_mex_assign(&c2_nameCaptureInfo, sf_mex_createstruct("structure", 2, 2, 1),
                false);
  c2_info_helper(&c2_nameCaptureInfo);
  sf_mex_emlrtNameCapturePostProcessR2012a(&c2_nameCaptureInfo);
  return c2_nameCaptureInfo;
}

static void c2_info_helper(const mxArray **c2_info)
{
  const mxArray *c2_rhs0 = NULL;
  const mxArray *c2_lhs0 = NULL;
  const mxArray *c2_rhs1 = NULL;
  const mxArray *c2_lhs1 = NULL;
  sf_mex_addfield(*c2_info, c2_emlrt_marshallOut(""), "context", "context", 0);
  sf_mex_addfield(*c2_info, c2_emlrt_marshallOut("eml_mtimes_helper"), "name",
                  "name", 0);
  sf_mex_addfield(*c2_info, c2_emlrt_marshallOut(""), "dominantType",
                  "dominantType", 0);
  sf_mex_addfield(*c2_info, c2_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m"),
                  "resolved", "resolved", 0);
  sf_mex_addfield(*c2_info, c2_b_emlrt_marshallOut(1383880894U), "fileTimeLo",
                  "fileTimeLo", 0);
  sf_mex_addfield(*c2_info, c2_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 0);
  sf_mex_addfield(*c2_info, c2_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 0);
  sf_mex_addfield(*c2_info, c2_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 0);
  sf_mex_assign(&c2_rhs0, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c2_lhs0, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c2_info, sf_mex_duplicatearraysafe(&c2_rhs0), "rhs", "rhs", 0);
  sf_mex_addfield(*c2_info, sf_mex_duplicatearraysafe(&c2_lhs0), "lhs", "lhs", 0);
  sf_mex_addfield(*c2_info, c2_emlrt_marshallOut(
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/eml_mtimes_helper.m!common_checks"),
                  "context", "context", 1);
  sf_mex_addfield(*c2_info, c2_emlrt_marshallOut(
    "coder.internal.isBuiltInNumeric"), "name", "name", 1);
  sf_mex_addfield(*c2_info, c2_emlrt_marshallOut("double"), "dominantType",
                  "dominantType", 1);
  sf_mex_addfield(*c2_info, c2_emlrt_marshallOut(
    "[IXE]$matlabroot$/toolbox/shared/coder/coder/+coder/+internal/isBuiltInNumeric.m"),
                  "resolved", "resolved", 1);
  sf_mex_addfield(*c2_info, c2_b_emlrt_marshallOut(1363718156U), "fileTimeLo",
                  "fileTimeLo", 1);
  sf_mex_addfield(*c2_info, c2_b_emlrt_marshallOut(0U), "fileTimeHi",
                  "fileTimeHi", 1);
  sf_mex_addfield(*c2_info, c2_b_emlrt_marshallOut(0U), "mFileTimeLo",
                  "mFileTimeLo", 1);
  sf_mex_addfield(*c2_info, c2_b_emlrt_marshallOut(0U), "mFileTimeHi",
                  "mFileTimeHi", 1);
  sf_mex_assign(&c2_rhs1, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_assign(&c2_lhs1, sf_mex_createcellmatrix(0, 1), false);
  sf_mex_addfield(*c2_info, sf_mex_duplicatearraysafe(&c2_rhs1), "rhs", "rhs", 1);
  sf_mex_addfield(*c2_info, sf_mex_duplicatearraysafe(&c2_lhs1), "lhs", "lhs", 1);
  sf_mex_destroy(&c2_rhs0);
  sf_mex_destroy(&c2_lhs0);
  sf_mex_destroy(&c2_rhs1);
  sf_mex_destroy(&c2_lhs1);
}

static const mxArray *c2_emlrt_marshallOut(const char * c2_u)
{
  const mxArray *c2_y = NULL;
  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", c2_u, 15, 0U, 0U, 0U, 2, 1, strlen
    (c2_u)), false);
  return c2_y;
}

static const mxArray *c2_b_emlrt_marshallOut(const uint32_T c2_u)
{
  const mxArray *c2_y = NULL;
  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", &c2_u, 7, 0U, 0U, 0U, 0), false);
  return c2_y;
}

static const mxArray *c2_c_sf_marshallOut(void *chartInstanceVoid, void
  *c2_inData)
{
  const mxArray *c2_mxArrayOutData = NULL;
  int32_T c2_u;
  const mxArray *c2_y = NULL;
  SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance;
  chartInstance = (SFc2_rocket_dynamic_data_libraryInstanceStruct *)
    chartInstanceVoid;
  c2_mxArrayOutData = NULL;
  c2_u = *(int32_T *)c2_inData;
  c2_y = NULL;
  sf_mex_assign(&c2_y, sf_mex_create("y", &c2_u, 6, 0U, 0U, 0U, 0), false);
  sf_mex_assign(&c2_mxArrayOutData, c2_y, false);
  return c2_mxArrayOutData;
}

static int32_T c2_d_emlrt_marshallIn
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance, const mxArray *
   c2_u, const emlrtMsgIdentifier *c2_parentId)
{
  int32_T c2_y;
  int32_T c2_i27;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), &c2_i27, 1, 6, 0U, 0, 0U, 0);
  c2_y = c2_i27;
  sf_mex_destroy(&c2_u);
  return c2_y;
}

static void c2_c_sf_marshallIn(void *chartInstanceVoid, const mxArray
  *c2_mxArrayInData, const char_T *c2_varName, void *c2_outData)
{
  const mxArray *c2_b_sfEvent;
  const char_T *c2_identifier;
  emlrtMsgIdentifier c2_thisId;
  int32_T c2_y;
  SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance;
  chartInstance = (SFc2_rocket_dynamic_data_libraryInstanceStruct *)
    chartInstanceVoid;
  c2_b_sfEvent = sf_mex_dup(c2_mxArrayInData);
  c2_identifier = c2_varName;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_y = c2_d_emlrt_marshallIn(chartInstance, sf_mex_dup(c2_b_sfEvent),
    &c2_thisId);
  sf_mex_destroy(&c2_b_sfEvent);
  *(int32_T *)c2_outData = c2_y;
  sf_mex_destroy(&c2_mxArrayInData);
}

static uint8_T c2_e_emlrt_marshallIn
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance, const mxArray *
   c2_b_is_active_c2_rocket_dynamic_data_library, const char_T *c2_identifier)
{
  uint8_T c2_y;
  emlrtMsgIdentifier c2_thisId;
  c2_thisId.fIdentifier = c2_identifier;
  c2_thisId.fParent = NULL;
  c2_y = c2_f_emlrt_marshallIn(chartInstance, sf_mex_dup
    (c2_b_is_active_c2_rocket_dynamic_data_library), &c2_thisId);
  sf_mex_destroy(&c2_b_is_active_c2_rocket_dynamic_data_library);
  return c2_y;
}

static uint8_T c2_f_emlrt_marshallIn
  (SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance, const mxArray *
   c2_u, const emlrtMsgIdentifier *c2_parentId)
{
  uint8_T c2_y;
  uint8_T c2_u0;
  (void)chartInstance;
  sf_mex_import(c2_parentId, sf_mex_dup(c2_u), &c2_u0, 1, 3, 0U, 0, 0U, 0);
  c2_y = c2_u0;
  sf_mex_destroy(&c2_u);
  return c2_y;
}

static void init_dsm_address_info(SFc2_rocket_dynamic_data_libraryInstanceStruct
  *chartInstance)
{
  (void)chartInstance;
}

/* SFunction Glue Code */
#ifdef utFree
#undef utFree
#endif

#ifdef utMalloc
#undef utMalloc
#endif

#ifdef __cplusplus

extern "C" void *utMalloc(size_t size);
extern "C" void utFree(void*);

#else

extern void *utMalloc(size_t size);
extern void utFree(void*);

#endif

void sf_c2_rocket_dynamic_data_library_get_check_sum(mxArray *plhs[])
{
  ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(336196741U);
  ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(3124409700U);
  ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(1766905423U);
  ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(1318190417U);
}

mxArray *sf_c2_rocket_dynamic_data_library_get_autoinheritance_info(void)
{
  const char *autoinheritanceFields[] = { "checksum", "inputs", "parameters",
    "outputs", "locals" };

  mxArray *mxAutoinheritanceInfo = mxCreateStructMatrix(1,1,5,
    autoinheritanceFields);

  {
    mxArray *mxChecksum = mxCreateString("dmMvOEl0Wt8hOWnbOeu6wG");
    mxSetField(mxAutoinheritanceInfo,0,"checksum",mxChecksum);
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,4,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(121);
      pr[1] = (double)(1);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(121);
      pr[1] = (double)(1);
      mxSetField(mxData,1,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,1,"type",mxType);
    }

    mxSetField(mxData,1,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(1);
      pr[1] = (double)(1);
      mxSetField(mxData,2,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,2,"type",mxType);
    }

    mxSetField(mxData,2,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(1);
      pr[1] = (double)(1);
      mxSetField(mxData,3,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,3,"type",mxType);
    }

    mxSetField(mxData,3,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"inputs",mxData);
  }

  {
    mxSetField(mxAutoinheritanceInfo,0,"parameters",mxCreateDoubleMatrix(0,0,
                mxREAL));
  }

  {
    const char *dataFields[] = { "size", "type", "complexity" };

    mxArray *mxData = mxCreateStructMatrix(1,3,3,dataFields);

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(121);
      pr[1] = (double)(1);
      mxSetField(mxData,0,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,0,"type",mxType);
    }

    mxSetField(mxData,0,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(121);
      pr[1] = (double)(1);
      mxSetField(mxData,1,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,1,"type",mxType);
    }

    mxSetField(mxData,1,"complexity",mxCreateDoubleScalar(0));

    {
      mxArray *mxSize = mxCreateDoubleMatrix(1,2,mxREAL);
      double *pr = mxGetPr(mxSize);
      pr[0] = (double)(121);
      pr[1] = (double)(1);
      mxSetField(mxData,2,"size",mxSize);
    }

    {
      const char *typeFields[] = { "base", "fixpt" };

      mxArray *mxType = mxCreateStructMatrix(1,1,2,typeFields);
      mxSetField(mxType,0,"base",mxCreateDoubleScalar(10));
      mxSetField(mxType,0,"fixpt",mxCreateDoubleMatrix(0,0,mxREAL));
      mxSetField(mxData,2,"type",mxType);
    }

    mxSetField(mxData,2,"complexity",mxCreateDoubleScalar(0));
    mxSetField(mxAutoinheritanceInfo,0,"outputs",mxData);
  }

  {
    mxSetField(mxAutoinheritanceInfo,0,"locals",mxCreateDoubleMatrix(0,0,mxREAL));
  }

  return(mxAutoinheritanceInfo);
}

mxArray *sf_c2_rocket_dynamic_data_library_third_party_uses_info(void)
{
  mxArray * mxcell3p = mxCreateCellMatrix(1,0);
  return(mxcell3p);
}

mxArray *sf_c2_rocket_dynamic_data_library_updateBuildInfo_args_info(void)
{
  mxArray *mxBIArgs = mxCreateCellMatrix(1,0);
  return mxBIArgs;
}

static const mxArray *sf_get_sim_state_info_c2_rocket_dynamic_data_library(void)
{
  const char *infoFields[] = { "chartChecksum", "varInfo" };

  mxArray *mxInfo = mxCreateStructMatrix(1, 1, 2, infoFields);
  const char *infoEncStr[] = {
    "100 S1x4'type','srcId','name','auxInfo'{{M[1],M[5],T\"mass\",},{M[1],M[11],T\"thrust\",},{M[1],M[10],T\"weight\",},{M[8],M[0],T\"is_active_c2_rocket_dynamic_data_library\",}}"
  };

  mxArray *mxVarInfo = sf_mex_decode_encoded_mx_struct_array(infoEncStr, 4, 10);
  mxArray *mxChecksum = mxCreateDoubleMatrix(1, 4, mxREAL);
  sf_c2_rocket_dynamic_data_library_get_check_sum(&mxChecksum);
  mxSetField(mxInfo, 0, infoFields[0], mxChecksum);
  mxSetField(mxInfo, 0, infoFields[1], mxVarInfo);
  return mxInfo;
}

static void chart_debug_initialization(SimStruct *S, unsigned int
  fullDebuggerInitialization)
{
  if (!sim_mode_is_rtw_gen(S)) {
    SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance;
    ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
    ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
    chartInstance = (SFc2_rocket_dynamic_data_libraryInstanceStruct *)
      chartInfo->chartInstance;
    if (ssIsFirstInitCond(S) && fullDebuggerInitialization==1) {
      /* do this only if simulation is starting */
      {
        unsigned int chartAlreadyPresent;
        chartAlreadyPresent = sf_debug_initialize_chart
          (sfGlobalDebugInstanceStruct,
           _rocket_dynamic_data_libraryMachineNumber_,
           2,
           1,
           1,
           0,
           7,
           0,
           0,
           0,
           0,
           0,
           &(chartInstance->chartNumber),
           &(chartInstance->instanceNumber),
           (void *)S);

        /* Each instance must initialize ist own list of scripts */
        init_script_number_translation
          (_rocket_dynamic_data_libraryMachineNumber_,chartInstance->chartNumber,
           chartInstance->instanceNumber);
        if (chartAlreadyPresent==0) {
          /* this is the first instance */
          sf_debug_set_chart_disable_implicit_casting
            (sfGlobalDebugInstanceStruct,
             _rocket_dynamic_data_libraryMachineNumber_,
             chartInstance->chartNumber,1);
          sf_debug_set_chart_event_thresholds(sfGlobalDebugInstanceStruct,
            _rocket_dynamic_data_libraryMachineNumber_,
            chartInstance->chartNumber,
            0,
            0,
            0);
          _SFD_SET_DATA_PROPS(0,1,1,0,"thrust_curve");
          _SFD_SET_DATA_PROPS(1,1,1,0,"burntime");
          _SFD_SET_DATA_PROPS(2,2,0,1,"mass");
          _SFD_SET_DATA_PROPS(3,1,1,0,"wet_motor_weight");
          _SFD_SET_DATA_PROPS(4,1,1,0,"wfc");
          _SFD_SET_DATA_PROPS(5,2,0,1,"weight");
          _SFD_SET_DATA_PROPS(6,2,0,1,"thrust");
          _SFD_STATE_INFO(0,0,2);
          _SFD_CH_SUBSTATE_COUNT(0);
          _SFD_CH_SUBSTATE_DECOMP(0);
        }

        _SFD_CV_INIT_CHART(0,0,0,0);

        {
          _SFD_CV_INIT_STATE(0,0,0,0,0,0,NULL,NULL);
        }

        _SFD_CV_INIT_TRANS(0,0,NULL,NULL,0,NULL);

        /* Initialization of MATLAB Function Model Coverage */
        _SFD_CV_INIT_EML(0,1,1,0,0,0,0,0,0,0,0);
        _SFD_CV_INIT_EML_FCN(0,0,"eML_blk_kernel",0,-1,1024);

        {
          unsigned int dimVector[1];
          dimVector[0]= 121;
          _SFD_SET_DATA_COMPILED_PROPS(0,SF_DOUBLE,1,&(dimVector[0]),0,0,0,0.0,
            1.0,0,0,(MexFcnForType)c2_sf_marshallOut,(MexInFcnForType)NULL);
        }

        {
          unsigned int dimVector[1];
          dimVector[0]= 121;
          _SFD_SET_DATA_COMPILED_PROPS(1,SF_DOUBLE,1,&(dimVector[0]),0,0,0,0.0,
            1.0,0,0,(MexFcnForType)c2_sf_marshallOut,(MexInFcnForType)NULL);
        }

        {
          unsigned int dimVector[1];
          dimVector[0]= 121;
          _SFD_SET_DATA_COMPILED_PROPS(2,SF_DOUBLE,1,&(dimVector[0]),0,0,0,0.0,
            1.0,0,0,(MexFcnForType)c2_sf_marshallOut,(MexInFcnForType)
            c2_sf_marshallIn);
        }

        _SFD_SET_DATA_COMPILED_PROPS(3,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c2_b_sf_marshallOut,(MexInFcnForType)NULL);
        _SFD_SET_DATA_COMPILED_PROPS(4,SF_DOUBLE,0,NULL,0,0,0,0.0,1.0,0,0,
          (MexFcnForType)c2_b_sf_marshallOut,(MexInFcnForType)NULL);

        {
          unsigned int dimVector[1];
          dimVector[0]= 121;
          _SFD_SET_DATA_COMPILED_PROPS(5,SF_DOUBLE,1,&(dimVector[0]),0,0,0,0.0,
            1.0,0,0,(MexFcnForType)c2_sf_marshallOut,(MexInFcnForType)
            c2_sf_marshallIn);
        }

        {
          unsigned int dimVector[1];
          dimVector[0]= 121;
          _SFD_SET_DATA_COMPILED_PROPS(6,SF_DOUBLE,1,&(dimVector[0]),0,0,0,0.0,
            1.0,0,0,(MexFcnForType)c2_sf_marshallOut,(MexInFcnForType)
            c2_sf_marshallIn);
        }

        {
          real_T *c2_wet_motor_weight;
          real_T *c2_wfc;
          real_T (*c2_thrust_curve)[121];
          real_T (*c2_burntime)[121];
          real_T (*c2_mass)[121];
          real_T (*c2_weight)[121];
          real_T (*c2_thrust)[121];
          c2_thrust = (real_T (*)[121])ssGetOutputPortSignal(chartInstance->S, 3);
          c2_weight = (real_T (*)[121])ssGetOutputPortSignal(chartInstance->S, 2);
          c2_wfc = (real_T *)ssGetInputPortSignal(chartInstance->S, 3);
          c2_wet_motor_weight = (real_T *)ssGetInputPortSignal(chartInstance->S,
            2);
          c2_mass = (real_T (*)[121])ssGetOutputPortSignal(chartInstance->S, 1);
          c2_burntime = (real_T (*)[121])ssGetInputPortSignal(chartInstance->S,
            1);
          c2_thrust_curve = (real_T (*)[121])ssGetInputPortSignal
            (chartInstance->S, 0);
          _SFD_SET_DATA_VALUE_PTR(0U, *c2_thrust_curve);
          _SFD_SET_DATA_VALUE_PTR(1U, *c2_burntime);
          _SFD_SET_DATA_VALUE_PTR(2U, *c2_mass);
          _SFD_SET_DATA_VALUE_PTR(3U, c2_wet_motor_weight);
          _SFD_SET_DATA_VALUE_PTR(4U, c2_wfc);
          _SFD_SET_DATA_VALUE_PTR(5U, *c2_weight);
          _SFD_SET_DATA_VALUE_PTR(6U, *c2_thrust);
        }
      }
    } else {
      sf_debug_reset_current_state_configuration(sfGlobalDebugInstanceStruct,
        _rocket_dynamic_data_libraryMachineNumber_,chartInstance->chartNumber,
        chartInstance->instanceNumber);
    }
  }
}

static const char* sf_get_instance_specialization(void)
{
  return "qHAMhuJmHFxgi6t5MU46KG";
}

static void sf_opaque_initialize_c2_rocket_dynamic_data_library(void
  *chartInstanceVar)
{
  chart_debug_initialization(((SFc2_rocket_dynamic_data_libraryInstanceStruct*)
    chartInstanceVar)->S,0);
  initialize_params_c2_rocket_dynamic_data_library
    ((SFc2_rocket_dynamic_data_libraryInstanceStruct*) chartInstanceVar);
  initialize_c2_rocket_dynamic_data_library
    ((SFc2_rocket_dynamic_data_libraryInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_enable_c2_rocket_dynamic_data_library(void
  *chartInstanceVar)
{
  enable_c2_rocket_dynamic_data_library
    ((SFc2_rocket_dynamic_data_libraryInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_disable_c2_rocket_dynamic_data_library(void
  *chartInstanceVar)
{
  disable_c2_rocket_dynamic_data_library
    ((SFc2_rocket_dynamic_data_libraryInstanceStruct*) chartInstanceVar);
}

static void sf_opaque_gateway_c2_rocket_dynamic_data_library(void
  *chartInstanceVar)
{
  sf_gateway_c2_rocket_dynamic_data_library
    ((SFc2_rocket_dynamic_data_libraryInstanceStruct*) chartInstanceVar);
}

extern const mxArray* sf_internal_get_sim_state_c2_rocket_dynamic_data_library
  (SimStruct* S)
{
  ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
  ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
  mxArray *plhs[1] = { NULL };

  mxArray *prhs[4];
  int mxError = 0;
  prhs[0] = mxCreateString("chart_simctx_raw2high");
  prhs[1] = mxCreateDoubleScalar(ssGetSFuncBlockHandle(S));
  prhs[2] = (mxArray*) get_sim_state_c2_rocket_dynamic_data_library
    ((SFc2_rocket_dynamic_data_libraryInstanceStruct*)chartInfo->chartInstance);/* raw sim ctx */
  prhs[3] = (mxArray*) sf_get_sim_state_info_c2_rocket_dynamic_data_library();/* state var info */
  mxError = sf_mex_call_matlab(1, plhs, 4, prhs, "sfprivate");
  mxDestroyArray(prhs[0]);
  mxDestroyArray(prhs[1]);
  mxDestroyArray(prhs[2]);
  mxDestroyArray(prhs[3]);
  if (mxError || plhs[0] == NULL) {
    sf_mex_error_message("Stateflow Internal Error: \nError calling 'chart_simctx_raw2high'.\n");
  }

  return plhs[0];
}

extern void sf_internal_set_sim_state_c2_rocket_dynamic_data_library(SimStruct*
  S, const mxArray *st)
{
  ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
  ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
  mxArray *plhs[1] = { NULL };

  mxArray *prhs[3];
  int mxError = 0;
  prhs[0] = mxCreateString("chart_simctx_high2raw");
  prhs[1] = mxDuplicateArray(st);      /* high level simctx */
  prhs[2] = (mxArray*) sf_get_sim_state_info_c2_rocket_dynamic_data_library();/* state var info */
  mxError = sf_mex_call_matlab(1, plhs, 3, prhs, "sfprivate");
  mxDestroyArray(prhs[0]);
  mxDestroyArray(prhs[1]);
  mxDestroyArray(prhs[2]);
  if (mxError || plhs[0] == NULL) {
    sf_mex_error_message("Stateflow Internal Error: \nError calling 'chart_simctx_high2raw'.\n");
  }

  set_sim_state_c2_rocket_dynamic_data_library
    ((SFc2_rocket_dynamic_data_libraryInstanceStruct*)chartInfo->chartInstance,
     mxDuplicateArray(plhs[0]));
  mxDestroyArray(plhs[0]);
}

static const mxArray* sf_opaque_get_sim_state_c2_rocket_dynamic_data_library
  (SimStruct* S)
{
  return sf_internal_get_sim_state_c2_rocket_dynamic_data_library(S);
}

static void sf_opaque_set_sim_state_c2_rocket_dynamic_data_library(SimStruct* S,
  const mxArray *st)
{
  sf_internal_set_sim_state_c2_rocket_dynamic_data_library(S, st);
}

static void sf_opaque_terminate_c2_rocket_dynamic_data_library(void
  *chartInstanceVar)
{
  if (chartInstanceVar!=NULL) {
    SimStruct *S = ((SFc2_rocket_dynamic_data_libraryInstanceStruct*)
                    chartInstanceVar)->S;
    ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
    if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
      sf_clear_rtw_identifier(S);
      unload_rocket_dynamic_data_library_optimization_info();
    }

    finalize_c2_rocket_dynamic_data_library
      ((SFc2_rocket_dynamic_data_libraryInstanceStruct*) chartInstanceVar);
    utFree((void *)chartInstanceVar);
    if (crtInfo != NULL) {
      utFree((void *)crtInfo);
    }

    ssSetUserData(S,NULL);
  }
}

static void sf_opaque_init_subchart_simstructs(void *chartInstanceVar)
{
  initSimStructsc2_rocket_dynamic_data_library
    ((SFc2_rocket_dynamic_data_libraryInstanceStruct*) chartInstanceVar);
}

extern unsigned int sf_machine_global_initializer_called(void);
static void mdlProcessParameters_c2_rocket_dynamic_data_library(SimStruct *S)
{
  int i;
  for (i=0;i<ssGetNumRunTimeParams(S);i++) {
    if (ssGetSFcnParamTunable(S,i)) {
      ssUpdateDlgParamAsRunTimeParam(S,i);
    }
  }

  if (sf_machine_global_initializer_called()) {
    ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)(ssGetUserData(S));
    ChartInfoStruct * chartInfo = (ChartInfoStruct *)(crtInfo->instanceInfo);
    initialize_params_c2_rocket_dynamic_data_library
      ((SFc2_rocket_dynamic_data_libraryInstanceStruct*)
       (chartInfo->chartInstance));
  }
}

static void mdlSetWorkWidths_c2_rocket_dynamic_data_library(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S) || sim_mode_is_external(S)) {
    mxArray *infoStruct = load_rocket_dynamic_data_library_optimization_info();
    int_T chartIsInlinable =
      (int_T)sf_is_chart_inlinable(sf_get_instance_specialization(),infoStruct,2);
    ssSetStateflowIsInlinable(S,chartIsInlinable);
    ssSetRTWCG(S,sf_rtw_info_uint_prop(sf_get_instance_specialization(),
                infoStruct,2,"RTWCG"));
    ssSetEnableFcnIsTrivial(S,1);
    ssSetDisableFcnIsTrivial(S,1);
    ssSetNotMultipleInlinable(S,sf_rtw_info_uint_prop
      (sf_get_instance_specialization(),infoStruct,2,
       "gatewayCannotBeInlinedMultipleTimes"));
    sf_update_buildInfo(sf_get_instance_specialization(),infoStruct,2);
    if (chartIsInlinable) {
      ssSetInputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 1, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 2, SS_REUSABLE_AND_LOCAL);
      ssSetInputPortOptimOpts(S, 3, SS_REUSABLE_AND_LOCAL);
      sf_mark_chart_expressionable_inputs(S,sf_get_instance_specialization(),
        infoStruct,2,4);
      sf_mark_chart_reusable_outputs(S,sf_get_instance_specialization(),
        infoStruct,2,3);
    }

    {
      unsigned int outPortIdx;
      for (outPortIdx=1; outPortIdx<=3; ++outPortIdx) {
        ssSetOutputPortOptimizeInIR(S, outPortIdx, 1U);
      }
    }

    {
      unsigned int inPortIdx;
      for (inPortIdx=0; inPortIdx < 4; ++inPortIdx) {
        ssSetInputPortOptimizeInIR(S, inPortIdx, 1U);
      }
    }

    sf_set_rtw_dwork_info(S,sf_get_instance_specialization(),infoStruct,2);
    ssSetHasSubFunctions(S,!(chartIsInlinable));
  } else {
  }

  ssSetOptions(S,ssGetOptions(S)|SS_OPTION_WORKS_WITH_CODE_REUSE);
  ssSetChecksum0(S,(3988725553U));
  ssSetChecksum1(S,(3219258645U));
  ssSetChecksum2(S,(2530239302U));
  ssSetChecksum3(S,(2591451042U));
  ssSetmdlDerivatives(S, NULL);
  ssSetExplicitFCSSCtrl(S,1);
  ssSupportsMultipleExecInstances(S,1);
}

static void mdlRTW_c2_rocket_dynamic_data_library(SimStruct *S)
{
  if (sim_mode_is_rtw_gen(S)) {
    ssWriteRTWStrParam(S, "StateflowChartType", "Embedded MATLAB");
  }
}

static void mdlStart_c2_rocket_dynamic_data_library(SimStruct *S)
{
  SFc2_rocket_dynamic_data_libraryInstanceStruct *chartInstance;
  ChartRunTimeInfo * crtInfo = (ChartRunTimeInfo *)utMalloc(sizeof
    (ChartRunTimeInfo));
  chartInstance = (SFc2_rocket_dynamic_data_libraryInstanceStruct *)utMalloc
    (sizeof(SFc2_rocket_dynamic_data_libraryInstanceStruct));
  memset(chartInstance, 0, sizeof(SFc2_rocket_dynamic_data_libraryInstanceStruct));
  if (chartInstance==NULL) {
    sf_mex_error_message("Could not allocate memory for chart instance.");
  }

  chartInstance->chartInfo.chartInstance = chartInstance;
  chartInstance->chartInfo.isEMLChart = 1;
  chartInstance->chartInfo.chartInitialized = 0;
  chartInstance->chartInfo.sFunctionGateway =
    sf_opaque_gateway_c2_rocket_dynamic_data_library;
  chartInstance->chartInfo.initializeChart =
    sf_opaque_initialize_c2_rocket_dynamic_data_library;
  chartInstance->chartInfo.terminateChart =
    sf_opaque_terminate_c2_rocket_dynamic_data_library;
  chartInstance->chartInfo.enableChart =
    sf_opaque_enable_c2_rocket_dynamic_data_library;
  chartInstance->chartInfo.disableChart =
    sf_opaque_disable_c2_rocket_dynamic_data_library;
  chartInstance->chartInfo.getSimState =
    sf_opaque_get_sim_state_c2_rocket_dynamic_data_library;
  chartInstance->chartInfo.setSimState =
    sf_opaque_set_sim_state_c2_rocket_dynamic_data_library;
  chartInstance->chartInfo.getSimStateInfo =
    sf_get_sim_state_info_c2_rocket_dynamic_data_library;
  chartInstance->chartInfo.zeroCrossings = NULL;
  chartInstance->chartInfo.outputs = NULL;
  chartInstance->chartInfo.derivatives = NULL;
  chartInstance->chartInfo.mdlRTW = mdlRTW_c2_rocket_dynamic_data_library;
  chartInstance->chartInfo.mdlStart = mdlStart_c2_rocket_dynamic_data_library;
  chartInstance->chartInfo.mdlSetWorkWidths =
    mdlSetWorkWidths_c2_rocket_dynamic_data_library;
  chartInstance->chartInfo.extModeExec = NULL;
  chartInstance->chartInfo.restoreLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.restoreBeforeLastMajorStepConfiguration = NULL;
  chartInstance->chartInfo.storeCurrentConfiguration = NULL;
  chartInstance->chartInfo.debugInstance = sfGlobalDebugInstanceStruct;
  chartInstance->S = S;
  crtInfo->instanceInfo = (&(chartInstance->chartInfo));
  crtInfo->isJITEnabled = false;
  ssSetUserData(S,(void *)(crtInfo));  /* register the chart instance with simstruct */
  init_dsm_address_info(chartInstance);
  if (!sim_mode_is_rtw_gen(S)) {
  }

  sf_opaque_init_subchart_simstructs(chartInstance->chartInfo.chartInstance);
  chart_debug_initialization(S,1);
}

void c2_rocket_dynamic_data_library_method_dispatcher(SimStruct *S, int_T method,
  void *data)
{
  switch (method) {
   case SS_CALL_MDL_START:
    mdlStart_c2_rocket_dynamic_data_library(S);
    break;

   case SS_CALL_MDL_SET_WORK_WIDTHS:
    mdlSetWorkWidths_c2_rocket_dynamic_data_library(S);
    break;

   case SS_CALL_MDL_PROCESS_PARAMETERS:
    mdlProcessParameters_c2_rocket_dynamic_data_library(S);
    break;

   default:
    /* Unhandled method */
    sf_mex_error_message("Stateflow Internal Error:\n"
                         "Error calling c2_rocket_dynamic_data_library_method_dispatcher.\n"
                         "Can't handle method %d.\n", method);
    break;
  }
}

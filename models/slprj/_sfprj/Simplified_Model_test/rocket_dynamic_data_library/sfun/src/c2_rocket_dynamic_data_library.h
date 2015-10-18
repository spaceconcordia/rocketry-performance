#ifndef __c2_rocket_dynamic_data_library_h__
#define __c2_rocket_dynamic_data_library_h__

/* Include files */
#include "sf_runtime/sfc_sf.h"
#include "sf_runtime/sfc_mex.h"
#include "rtwtypes.h"
#include "multiword_types.h"

/* Type Definitions */
#ifndef typedef_SFc2_rocket_dynamic_data_libraryInstanceStruct
#define typedef_SFc2_rocket_dynamic_data_libraryInstanceStruct

typedef struct {
  SimStruct *S;
  ChartInfoStruct chartInfo;
  uint32_T chartNumber;
  uint32_T instanceNumber;
  int32_T c2_sfEvent;
  boolean_T c2_isStable;
  boolean_T c2_doneDoubleBufferReInit;
  uint8_T c2_is_active_c2_rocket_dynamic_data_library;
} SFc2_rocket_dynamic_data_libraryInstanceStruct;

#endif                                 /*typedef_SFc2_rocket_dynamic_data_libraryInstanceStruct*/

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern const mxArray
  *sf_c2_rocket_dynamic_data_library_get_eml_resolved_functions_info(void);

/* Function Definitions */
extern void sf_c2_rocket_dynamic_data_library_get_check_sum(mxArray *plhs[]);
extern void c2_rocket_dynamic_data_library_method_dispatcher(SimStruct *S, int_T
  method, void *data);

#endif

/* Include files */

#include "DynamicWeightCalculation_TestModel_sfun.h"
#include "DynamicWeightCalculation_TestModel_sfun_debug_macros.h"
#include "c1_DynamicWeightCalculation_TestModel.h"
#include "c2_DynamicWeightCalculation_TestModel.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
uint32_T _DynamicWeightCalculation_TestModelMachineNumber_;

/* Function Declarations */

/* Function Definitions */
void DynamicWeightCalculation_TestModel_initializer(void)
{
}

void DynamicWeightCalculation_TestModel_terminator(void)
{
}

/* SFunction Glue Code */
unsigned int sf_DynamicWeightCalculation_TestModel_method_dispatcher(SimStruct
  *simstructPtr, unsigned int chartFileNumber, const char* specsCksum, int_T
  method, void *data)
{
  if (chartFileNumber==1) {
    c1_DynamicWeightCalculation_TestModel_method_dispatcher(simstructPtr, method,
      data);
    return 1;
  }

  if (chartFileNumber==2) {
    c2_DynamicWeightCalculation_TestModel_method_dispatcher(simstructPtr, method,
      data);
    return 1;
  }

  return 0;
}

unsigned int sf_DynamicWeightCalculation_TestModel_process_check_sum_call( int
  nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] )
{

#ifdef MATLAB_MEX_FILE

  char commandName[20];
  if (nrhs<1 || !mxIsChar(prhs[0]) )
    return 0;

  /* Possible call to get the checksum */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"sf_get_check_sum"))
    return 0;
  plhs[0] = mxCreateDoubleMatrix( 1,4,mxREAL);
  if (nrhs>1 && mxIsChar(prhs[1])) {
    mxGetString(prhs[1], commandName,sizeof(commandName)/sizeof(char));
    commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
    if (!strcmp(commandName,"machine")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2845109529U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(721416768U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(171666105U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(3017239525U);
    } else if (!strcmp(commandName,"exportedFcn")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(0U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(0U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(0U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(0U);
    } else if (!strcmp(commandName,"makefile")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(2287025347U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(2213824637U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3447881020U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(4283747939U);
    } else if (nrhs==3 && !strcmp(commandName,"chart")) {
      unsigned int chartFileNumber;
      chartFileNumber = (unsigned int)mxGetScalar(prhs[2]);
      switch (chartFileNumber) {
       case 1:
        {
          extern void sf_c1_DynamicWeightCalculation_TestModel_get_check_sum
            (mxArray *plhs[]);
          sf_c1_DynamicWeightCalculation_TestModel_get_check_sum(plhs);
          break;
        }

       case 2:
        {
          extern void sf_c2_DynamicWeightCalculation_TestModel_get_check_sum
            (mxArray *plhs[]);
          sf_c2_DynamicWeightCalculation_TestModel_get_check_sum(plhs);
          break;
        }

       default:
        ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(0.0);
        ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(0.0);
        ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(0.0);
        ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(0.0);
      }
    } else if (!strcmp(commandName,"target")) {
      ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(3031367619U);
      ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(4001028638U);
      ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(3978939492U);
      ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(838979348U);
    } else {
      return 0;
    }
  } else {
    ((real_T *)mxGetPr((plhs[0])))[0] = (real_T)(1991236626U);
    ((real_T *)mxGetPr((plhs[0])))[1] = (real_T)(1473987885U);
    ((real_T *)mxGetPr((plhs[0])))[2] = (real_T)(2335650507U);
    ((real_T *)mxGetPr((plhs[0])))[3] = (real_T)(2832697981U);
  }

  return 1;

#else

  return 0;

#endif

}

unsigned int sf_DynamicWeightCalculation_TestModel_autoinheritance_info( int
  nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] )
{

#ifdef MATLAB_MEX_FILE

  char commandName[32];
  char aiChksum[64];
  if (nrhs<3 || !mxIsChar(prhs[0]) )
    return 0;

  /* Possible call to get the autoinheritance_info */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_autoinheritance_info"))
    return 0;
  mxGetString(prhs[2], aiChksum,sizeof(aiChksum)/sizeof(char));
  aiChksum[(sizeof(aiChksum)/sizeof(char)-1)] = '\0';

  {
    unsigned int chartFileNumber;
    chartFileNumber = (unsigned int)mxGetScalar(prhs[1]);
    switch (chartFileNumber) {
     case 1:
      {
        if (strcmp(aiChksum, "RNFJatNMr99AW1Its6MMj") == 0) {
          extern mxArray
            *sf_c1_DynamicWeightCalculation_TestModel_get_autoinheritance_info
            (void);
          plhs[0] =
            sf_c1_DynamicWeightCalculation_TestModel_get_autoinheritance_info();
          break;
        }

        plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
        break;
      }

     case 2:
      {
        if (strcmp(aiChksum, "GK3iEerhiNwsfm1a9GDsBC") == 0) {
          extern mxArray
            *sf_c2_DynamicWeightCalculation_TestModel_get_autoinheritance_info
            (void);
          plhs[0] =
            sf_c2_DynamicWeightCalculation_TestModel_get_autoinheritance_info();
          break;
        }

        plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
        break;
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;

#else

  return 0;

#endif

}

unsigned int
  sf_DynamicWeightCalculation_TestModel_get_eml_resolved_functions_info( int
  nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] )
{

#ifdef MATLAB_MEX_FILE

  char commandName[64];
  if (nrhs<2 || !mxIsChar(prhs[0]))
    return 0;

  /* Possible call to get the get_eml_resolved_functions_info */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_eml_resolved_functions_info"))
    return 0;

  {
    unsigned int chartFileNumber;
    chartFileNumber = (unsigned int)mxGetScalar(prhs[1]);
    switch (chartFileNumber) {
     case 1:
      {
        extern const mxArray
          *sf_c1_DynamicWeightCalculation_TestModel_get_eml_resolved_functions_info
          (void);
        mxArray *persistentMxArray = (mxArray *)
          sf_c1_DynamicWeightCalculation_TestModel_get_eml_resolved_functions_info
          ();
        plhs[0] = mxDuplicateArray(persistentMxArray);
        mxDestroyArray(persistentMxArray);
        break;
      }

     case 2:
      {
        extern const mxArray
          *sf_c2_DynamicWeightCalculation_TestModel_get_eml_resolved_functions_info
          (void);
        mxArray *persistentMxArray = (mxArray *)
          sf_c2_DynamicWeightCalculation_TestModel_get_eml_resolved_functions_info
          ();
        plhs[0] = mxDuplicateArray(persistentMxArray);
        mxDestroyArray(persistentMxArray);
        break;
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;

#else

  return 0;

#endif

}

unsigned int sf_DynamicWeightCalculation_TestModel_third_party_uses_info( int
  nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] )
{
  char commandName[64];
  char tpChksum[64];
  if (nrhs<3 || !mxIsChar(prhs[0]))
    return 0;

  /* Possible call to get the third_party_uses_info */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  mxGetString(prhs[2], tpChksum,sizeof(tpChksum)/sizeof(char));
  tpChksum[(sizeof(tpChksum)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_third_party_uses_info"))
    return 0;

  {
    unsigned int chartFileNumber;
    chartFileNumber = (unsigned int)mxGetScalar(prhs[1]);
    switch (chartFileNumber) {
     case 1:
      {
        if (strcmp(tpChksum, "N5a4cBD58EjIzKJPJmhGR") == 0) {
          extern mxArray
            *sf_c1_DynamicWeightCalculation_TestModel_third_party_uses_info(void);
          plhs[0] =
            sf_c1_DynamicWeightCalculation_TestModel_third_party_uses_info();
          break;
        }
      }

     case 2:
      {
        if (strcmp(tpChksum, "MFOJdM7dTGNGn9IuqhwCGG") == 0) {
          extern mxArray
            *sf_c2_DynamicWeightCalculation_TestModel_third_party_uses_info(void);
          plhs[0] =
            sf_c2_DynamicWeightCalculation_TestModel_third_party_uses_info();
          break;
        }
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;
}

unsigned int sf_DynamicWeightCalculation_TestModel_updateBuildInfo_args_info
  ( int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] )
{
  char commandName[64];
  char tpChksum[64];
  if (nrhs<3 || !mxIsChar(prhs[0]))
    return 0;

  /* Possible call to get the updateBuildInfo_args_info */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  mxGetString(prhs[2], tpChksum,sizeof(tpChksum)/sizeof(char));
  tpChksum[(sizeof(tpChksum)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_updateBuildInfo_args_info"))
    return 0;

  {
    unsigned int chartFileNumber;
    chartFileNumber = (unsigned int)mxGetScalar(prhs[1]);
    switch (chartFileNumber) {
     case 1:
      {
        if (strcmp(tpChksum, "N5a4cBD58EjIzKJPJmhGR") == 0) {
          extern mxArray
            *sf_c1_DynamicWeightCalculation_TestModel_updateBuildInfo_args_info
            (void);
          plhs[0] =
            sf_c1_DynamicWeightCalculation_TestModel_updateBuildInfo_args_info();
          break;
        }
      }

     case 2:
      {
        if (strcmp(tpChksum, "MFOJdM7dTGNGn9IuqhwCGG") == 0) {
          extern mxArray
            *sf_c2_DynamicWeightCalculation_TestModel_updateBuildInfo_args_info
            (void);
          plhs[0] =
            sf_c2_DynamicWeightCalculation_TestModel_updateBuildInfo_args_info();
          break;
        }
      }

     default:
      plhs[0] = mxCreateDoubleMatrix(0,0,mxREAL);
    }
  }

  return 1;
}

void DynamicWeightCalculation_TestModel_debug_initialize(struct
  SfDebugInstanceStruct* debugInstance)
{
  _DynamicWeightCalculation_TestModelMachineNumber_ =
    sf_debug_initialize_machine(debugInstance,
    "DynamicWeightCalculation_TestModel","sfun",0,2,0,0,0);
  sf_debug_set_machine_event_thresholds(debugInstance,
    _DynamicWeightCalculation_TestModelMachineNumber_,0,0);
  sf_debug_set_machine_data_thresholds(debugInstance,
    _DynamicWeightCalculation_TestModelMachineNumber_,0);
}

void DynamicWeightCalculation_TestModel_register_exported_symbols(SimStruct* S)
{
}

static mxArray* sRtwOptimizationInfoStruct= NULL;
mxArray* load_DynamicWeightCalculation_TestModel_optimization_info(void)
{
  if (sRtwOptimizationInfoStruct==NULL) {
    sRtwOptimizationInfoStruct = sf_load_rtw_optimization_info(
      "DynamicWeightCalculation_TestModel", "DynamicWeightCalculation_TestModel");
    mexMakeArrayPersistent(sRtwOptimizationInfoStruct);
  }

  return(sRtwOptimizationInfoStruct);
}

void unload_DynamicWeightCalculation_TestModel_optimization_info(void)
{
  if (sRtwOptimizationInfoStruct!=NULL) {
    mxDestroyArray(sRtwOptimizationInfoStruct);
    sRtwOptimizationInfoStruct = NULL;
  }
}

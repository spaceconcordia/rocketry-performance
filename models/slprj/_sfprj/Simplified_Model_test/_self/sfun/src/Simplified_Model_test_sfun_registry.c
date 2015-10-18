#include "Simplified_Model_test_sfun.h"
#include "sf_runtime/sfcdebug.h"

struct SfDebugInstanceStruct;
struct SfDebugInstanceStruct* sfGlobalDebugInstanceStruct = NULL;

#define PROCESS_MEX_SFUNCTION_CMD_LINE_CALL

unsigned int sf_process_check_sum_call( int nlhs, mxArray * plhs[], int nrhs,
  const mxArray * prhs[] )
{
  extern unsigned int sf_Simplified_Model_test_process_check_sum_call( int nlhs,
    mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  extern unsigned int sf_rocket_dynamic_data_library_process_check_sum_call( int
    nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  extern unsigned int sf_rocket_thrust_data_library_process_check_sum_call( int
    nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  if (sf_Simplified_Model_test_process_check_sum_call(nlhs,plhs,nrhs,prhs))
    return 1;
  if (sf_rocket_dynamic_data_library_process_check_sum_call(nlhs,plhs,nrhs,prhs))
    return 1;
  if (sf_rocket_thrust_data_library_process_check_sum_call(nlhs,plhs,nrhs,prhs))
    return 1;
  return 0;
}

unsigned int sf_process_autoinheritance_call( int nlhs, mxArray * plhs[], int
  nrhs, const mxArray * prhs[] )
{
  extern unsigned int sf_Simplified_Model_test_autoinheritance_info( int nlhs,
    mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  extern unsigned int sf_rocket_dynamic_data_library_autoinheritance_info( int
    nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  extern unsigned int sf_rocket_thrust_data_library_autoinheritance_info( int
    nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  char commandName[64];
  char machineName[128];
  if (nrhs < 4) {
    return 0;
  }

  if (!mxIsChar(prhs[0]) || !mxIsChar(prhs[1]))
    return 0;
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_autoinheritance_info"))
    return 0;
  mxGetString(prhs[1], machineName,sizeof(machineName)/sizeof(char));
  machineName[(sizeof(machineName)/sizeof(char)-1)] = '\0';
  if (strcmp(machineName, "Simplified_Model_test") == 0) {
    const mxArray *newRhs[3] = { NULL, NULL, NULL };

    newRhs[0] = prhs[0];
    newRhs[1] = prhs[2];
    newRhs[2] = prhs[3];
    return sf_Simplified_Model_test_autoinheritance_info(nlhs,plhs,3,newRhs);
  }

  if (strcmp(machineName, "rocket_dynamic_data_library") == 0) {
    const mxArray *newRhs[3] = { NULL, NULL, NULL };

    newRhs[0] = prhs[0];
    newRhs[1] = prhs[2];
    newRhs[2] = prhs[3];
    return sf_rocket_dynamic_data_library_autoinheritance_info(nlhs,plhs,3,
      newRhs);
  }

  if (strcmp(machineName, "rocket_thrust_data_library") == 0) {
    const mxArray *newRhs[3] = { NULL, NULL, NULL };

    newRhs[0] = prhs[0];
    newRhs[1] = prhs[2];
    newRhs[2] = prhs[3];
    return sf_rocket_thrust_data_library_autoinheritance_info(nlhs,plhs,3,newRhs);
  }

  return 0;
}

unsigned int sf_process_get_third_party_uses_info_call( int nlhs, mxArray *
  plhs[], int nrhs, const mxArray * prhs[] )
{
  extern unsigned int sf_Simplified_Model_test_third_party_uses_info( int nlhs,
    mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  extern unsigned int sf_rocket_dynamic_data_library_third_party_uses_info( int
    nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  extern unsigned int sf_rocket_thrust_data_library_third_party_uses_info( int
    nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  char commandName[64];
  char machineName[128];
  if (nrhs < 4) {
    return 0;
  }

  if (!mxIsChar(prhs[0]) || !mxIsChar(prhs[1]))
    return 0;
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_third_party_uses_info"))
    return 0;
  mxGetString(prhs[1], machineName,sizeof(machineName)/sizeof(char));
  machineName[(sizeof(machineName)/sizeof(char)-1)] = '\0';
  if (strcmp(machineName, "Simplified_Model_test") == 0) {
    const mxArray *newRhs[3] = { NULL, NULL, NULL };

    newRhs[0] = prhs[0];
    newRhs[1] = prhs[2];
    newRhs[2] = prhs[3];
    return sf_Simplified_Model_test_third_party_uses_info(nlhs,plhs,3,newRhs);
  }

  if (strcmp(machineName, "rocket_dynamic_data_library") == 0) {
    const mxArray *newRhs[3] = { NULL, NULL, NULL };

    newRhs[0] = prhs[0];
    newRhs[1] = prhs[2];
    newRhs[2] = prhs[3];
    return sf_rocket_dynamic_data_library_third_party_uses_info(nlhs,plhs,3,
      newRhs);
  }

  if (strcmp(machineName, "rocket_thrust_data_library") == 0) {
    const mxArray *newRhs[3] = { NULL, NULL, NULL };

    newRhs[0] = prhs[0];
    newRhs[1] = prhs[2];
    newRhs[2] = prhs[3];
    return sf_rocket_thrust_data_library_third_party_uses_info(nlhs,plhs,3,
      newRhs);
  }

  return 0;
}

unsigned int sf_process_get_updateBuildInfo_args_info_call( int nlhs, mxArray *
  plhs[], int nrhs, const mxArray * prhs[] )
{
  extern unsigned int sf_Simplified_Model_test_updateBuildInfo_args_info( int
    nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  extern unsigned int sf_rocket_dynamic_data_library_updateBuildInfo_args_info
    ( int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  extern unsigned int sf_rocket_thrust_data_library_updateBuildInfo_args_info
    ( int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  char commandName[64];
  char machineName[128];
  if (nrhs < 4) {
    return 0;
  }

  if (!mxIsChar(prhs[0]) || !mxIsChar(prhs[1]))
    return 0;
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_updateBuildInfo_args_info"))
    return 0;
  mxGetString(prhs[1], machineName,sizeof(machineName)/sizeof(char));
  machineName[(sizeof(machineName)/sizeof(char)-1)] = '\0';
  if (strcmp(machineName, "Simplified_Model_test") == 0) {
    const mxArray *newRhs[3] = { NULL, NULL, NULL };

    newRhs[0] = prhs[0];
    newRhs[1] = prhs[2];
    newRhs[2] = prhs[3];
    return sf_Simplified_Model_test_updateBuildInfo_args_info(nlhs,plhs,3,newRhs);
  }

  if (strcmp(machineName, "rocket_dynamic_data_library") == 0) {
    const mxArray *newRhs[3] = { NULL, NULL, NULL };

    newRhs[0] = prhs[0];
    newRhs[1] = prhs[2];
    newRhs[2] = prhs[3];
    return sf_rocket_dynamic_data_library_updateBuildInfo_args_info(nlhs,plhs,3,
      newRhs);
  }

  if (strcmp(machineName, "rocket_thrust_data_library") == 0) {
    const mxArray *newRhs[3] = { NULL, NULL, NULL };

    newRhs[0] = prhs[0];
    newRhs[1] = prhs[2];
    newRhs[2] = prhs[3];
    return sf_rocket_thrust_data_library_updateBuildInfo_args_info(nlhs,plhs,3,
      newRhs);
  }

  return 0;
}

unsigned int sf_process_get_eml_resolved_functions_info_call( int nlhs, mxArray *
  plhs[], int nrhs, const mxArray * prhs[] )
{
  extern unsigned int sf_Simplified_Model_test_get_eml_resolved_functions_info
    ( int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  extern unsigned int
    sf_rocket_dynamic_data_library_get_eml_resolved_functions_info( int nlhs,
    mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  extern unsigned int
    sf_rocket_thrust_data_library_get_eml_resolved_functions_info( int nlhs,
    mxArray * plhs[], int nrhs, const mxArray * prhs[] );
  char commandName[64];
  char machineName[128];
  if (nrhs < 3) {
    return 0;
  }

  if (!mxIsChar(prhs[0]) || !mxIsChar(prhs[1]))
    return 0;
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"get_eml_resolved_functions_info"))
    return 0;
  mxGetString(prhs[1], machineName,sizeof(machineName)/sizeof(char));
  machineName[(sizeof(machineName)/sizeof(char)-1)] = '\0';
  if (strcmp(machineName, "Simplified_Model_test") == 0) {
    const mxArray *newRhs[2] = { NULL, NULL };

    newRhs[0] = prhs[0];
    newRhs[1] = prhs[2];
    return sf_Simplified_Model_test_get_eml_resolved_functions_info(nlhs,plhs,2,
      newRhs);
  }

  if (strcmp(machineName, "rocket_dynamic_data_library") == 0) {
    const mxArray *newRhs[2] = { NULL, NULL };

    newRhs[0] = prhs[0];
    newRhs[1] = prhs[2];
    return sf_rocket_dynamic_data_library_get_eml_resolved_functions_info(nlhs,
      plhs,2,newRhs);
  }

  if (strcmp(machineName, "rocket_thrust_data_library") == 0) {
    const mxArray *newRhs[2] = { NULL, NULL };

    newRhs[0] = prhs[0];
    newRhs[1] = prhs[2];
    return sf_rocket_thrust_data_library_get_eml_resolved_functions_info(nlhs,
      plhs,2,newRhs);
  }

  return 0;
}

unsigned int sf_mex_unlock_call( int nlhs, mxArray * plhs[], int nrhs, const
  mxArray * prhs[] )
{
  char commandName[20];
  if (nrhs<1 || !mxIsChar(prhs[0]) )
    return 0;

  /* Possible call to get the checksum */
  mxGetString(prhs[0], commandName,sizeof(commandName)/sizeof(char));
  commandName[(sizeof(commandName)/sizeof(char)-1)] = '\0';
  if (strcmp(commandName,"sf_mex_unlock"))
    return 0;
  while (mexIsLocked()) {
    mexUnlock();
  }

  return(1);
}

extern unsigned int sf_debug_api(struct SfDebugInstanceStruct* debugInstance,
  int nlhs, mxArray * plhs[], int nrhs, const mxArray * prhs[] );
static unsigned int sf_debug_api_wrapper( int nlhs, mxArray * plhs[], int nrhs,
  const mxArray * prhs[] )
{
  return sf_debug_api(sfGlobalDebugInstanceStruct, nlhs, plhs, nrhs, prhs);
}

static unsigned int ProcessMexSfunctionCmdLineCall(int nlhs, mxArray * plhs[],
  int nrhs, const mxArray * prhs[])
{
  if (sf_debug_api_wrapper(nlhs,plhs,nrhs,prhs))
    return 1;
  if (sf_process_check_sum_call(nlhs,plhs,nrhs,prhs))
    return 1;
  if (sf_mex_unlock_call(nlhs,plhs,nrhs,prhs))
    return 1;
  if (sf_process_autoinheritance_call(nlhs,plhs,nrhs,prhs))
    return 1;
  if (sf_process_get_third_party_uses_info_call(nlhs,plhs,nrhs,prhs))
    return 1;
  if (sf_process_get_updateBuildInfo_args_info_call(nlhs,plhs,nrhs,prhs))
    return 1;
  if (sf_process_get_eml_resolved_functions_info_call(nlhs,plhs,nrhs,prhs))
    return 1;
  mexErrMsgTxt("Unsuccessful command.");
  return 0;
}

static unsigned int sfGlobalMdlStartCallCounts = 0;
unsigned int sf_machine_global_initializer_called(void)
{
  return(sfGlobalMdlStartCallCounts > 0);
}

extern unsigned int sf_Simplified_Model_test_method_dispatcher(SimStruct *S,
  unsigned int chartFileNumber, const char* specsCksum, int_T method, void *data);
extern unsigned int sf_rocket_dynamic_data_library_method_dispatcher(SimStruct
  *S, unsigned int chartFileNumber, const char* specsCksum, int_T method, void
  *data);
extern unsigned int sf_rocket_thrust_data_library_method_dispatcher(SimStruct *S,
  unsigned int chartFileNumber, const char* specsCksum, int_T method, void *data);
unsigned int sf_machine_global_method_dispatcher(SimStruct *simstructPtr, const
  char *machineName, unsigned int chartFileNumber, const char* specsCksum, int_T
  method, void *data)
{
  if (!strcmp(machineName,"Simplified_Model_test")) {
    return(sf_Simplified_Model_test_method_dispatcher(simstructPtr,
            chartFileNumber,specsCksum,method,data));
  }

  if (!strcmp(machineName,"rocket_dynamic_data_library")) {
    return(sf_rocket_dynamic_data_library_method_dispatcher(simstructPtr,
            chartFileNumber,specsCksum,method,data));
  }

  if (!strcmp(machineName,"rocket_thrust_data_library")) {
    return(sf_rocket_thrust_data_library_method_dispatcher(simstructPtr,
            chartFileNumber,specsCksum,method,data));
  }

  return 0;
}

extern void Simplified_Model_test_terminator(void);
extern void rocket_dynamic_data_library_terminator(void);
extern void rocket_thrust_data_library_terminator(void);
void sf_machine_global_terminator(void)
{
  sfGlobalMdlStartCallCounts--;
  if (sfGlobalMdlStartCallCounts == 0) {
    Simplified_Model_test_terminator();
    rocket_dynamic_data_library_terminator();
    rocket_thrust_data_library_terminator();
    sf_debug_terminate(sfGlobalDebugInstanceStruct);
    sfGlobalDebugInstanceStruct = NULL;
  }

  return;
}

extern void Simplified_Model_test_initializer(void);
extern void rocket_dynamic_data_library_initializer(void);
extern void rocket_thrust_data_library_initializer(void);
extern void Simplified_Model_test_register_exported_symbols(SimStruct* S);
extern void rocket_dynamic_data_library_register_exported_symbols(SimStruct* S);
extern void rocket_thrust_data_library_register_exported_symbols(SimStruct* S);
extern void Simplified_Model_test_debug_initialize(struct SfDebugInstanceStruct*);
extern void rocket_dynamic_data_library_debug_initialize(struct
  SfDebugInstanceStruct*);
extern void rocket_thrust_data_library_debug_initialize(struct
  SfDebugInstanceStruct*);
void sf_register_machine_exported_symbols(SimStruct* S)
{
  Simplified_Model_test_register_exported_symbols(S);
  rocket_dynamic_data_library_register_exported_symbols(S);
  rocket_thrust_data_library_register_exported_symbols(S);
}

bool callCustomFcn(char initFlag)
{
  return false;
}

void sf_machine_global_initializer(SimStruct* S)
{
  bool simModeIsRTWGen = sim_mode_is_rtw_gen(S);
  sfGlobalMdlStartCallCounts++;
  if (sfGlobalMdlStartCallCounts == 1) {
    if (simModeIsRTWGen) {
      sf_register_machine_exported_symbols(S);
    }

    sfGlobalDebugInstanceStruct = sf_debug_create_debug_instance_struct();
    if (!simModeIsRTWGen) {
      Simplified_Model_test_debug_initialize(sfGlobalDebugInstanceStruct);
    }

    Simplified_Model_test_initializer();
    if (!simModeIsRTWGen) {
      rocket_dynamic_data_library_debug_initialize(sfGlobalDebugInstanceStruct);
    }

    rocket_dynamic_data_library_initializer();
    if (!simModeIsRTWGen) {
      rocket_thrust_data_library_debug_initialize(sfGlobalDebugInstanceStruct);
    }

    rocket_thrust_data_library_initializer();
  }

  return;
}

#include "sf_runtime/stateflow_mdl_methods.stub"

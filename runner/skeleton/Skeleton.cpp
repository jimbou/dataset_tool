#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/IRBuilder.h"
#include <vector>

using namespace llvm;

namespace{
struct SkeletonPass : public ModulePass{
    static char ID;
    
    Function *monitor;       // this will be the identifier for the function that does the rapl read for basic blocks
    Function *monitor_2;     // this will be the identifier for the function that does the rapl read at the start the external functions
    Function *monitor_3;     // this will be the identifier for the function that does the rapl read at the end the external functions

    SkeletonPass() : ModulePass(ID) {}

    virtual bool runOnModule(Module &M)
    {

        BasicBlock::iterator B_last;
        BasicBlock::iterator BF_ins;
        BasicBlock::iterator BF_ins_2;
        BasicBlock::iterator BF_ins_3;
        BasicBlock::iterator BF_ins_4;
        Function::iterator F_last;


        for(Module::iterator L= M.begin(), K = M.end(); L!= K; ++L)
        {

            //if(L->getName() == "print_1"){   //find the first rapl read function - the one for basic blocks
            if(L->getName() == "rapl_A"){   //find the first rapl read function - the one for basic blocks

                monitor = cast<Function>(L);
                
            }
            
            //else if(L->getName() == "print_2"){   // find the second rapl read function - the one for start of functions
            else if(L->getName() == "rapl_B"){   // find the second rapl read function - the one for start of functions

                monitor_2 = cast<Function>(L);
                
            }
            
            //else if(L->getName() == "print_3"){   // find the third rapl read function - the one for end of functions
            else if(L->getName() == "rapl_C"){   // find the second rapl read function - the one for start of functions

                monitor_3 = cast<Function>(L);
                
            }
        }

        

        for(Module::iterator F = M.begin(), E = M.end(); F!= E; ++F)
        {
            //if((F->getName() == "print_1") || (F->getName() == "print_2") || (F->getName() == "print_3")) { // if this is one of the rapl read functions dont modify it
            if((F->getName() == "rapl_A") || (F->getName() == "rapl_B") || (F->getName() == "rapl_D") || (F->getName() == "rapl_C")) { // if this is one of the rapl read functions dont modify it


                continue;
            }
           

            
            bool last_inst =false;    //this becomes true if the prev instruction than the one that is now examined was a call
            bool prev_last = false ;   // this becomes true if the second to last instruction to the one we are currently examining was a call instruction
            for(Function::iterator BB = F->begin(), E = F->end(); BB != E; ++BB)
            {           

                        int count =0 ;
                        int count_temp =0 ;
                        bool just_entered =false;
                        count = std::distance(BB->begin(), BB->end());  // find the size of the BB
                        //errs() << count << " \n";
                        for (BasicBlock::iterator I = BB->begin(), IE = BB->end(); I != IE; ++I) {
                            count_temp++;
                            if ((llvm::isa <llvm::CallInst> (I))){         //if we found a call instruction
                                if (count_temp<count){                    //in this case we are in a intermidiate inst of bb
                                    
                                    if (!just_entered ){                                        //just enters says that the last instruction was a call
                                        just_entered =true;}
                                    else{
                                        just_entered =true;                                   //this is only the case if we have 2 call instructions back to back
                                        Instruction *inst2 = &*I;
                                        IRBuilder<> builder2(inst2);
                                        Instruction *newInst2 = CallInst::Create(monitor_3,  "");    // create the second call insttruction to be added : a call to the rapl function
                                        BB->getInstList().insert(I, newInst2); 
                                    } 
                                    
                                    errs() << "Case 1  \n";
                                    Instruction *inst1 = &*I;
                                    IRBuilder<> builder1(inst1);
                                    Instruction *newInst1 = CallInst::Create(monitor_2,  "");    // create the first call insttruction to be added : a call to the rapl function
                                    BB->getInstList().insert(I, newInst1);    
                                    

                                }
                                else {
                                    errs() << "Case 2  \n";  //in this case the last inst of BB is a calll
                                    Instruction *inst3 = &*I;
                                    IRBuilder<> builder3(inst3);
                                    Instruction *newInst3 = CallInst::Create(monitor_2,  "");    // create the first insttruction to be added : a call to the rapl function
                                   
                                    BB->getInstList().insert(I, newInst3);  
                                    last_inst =true;  // the last instruction of BB was a call inst 
                                    
                                }
                            }
                            else { // here it means the instruction is not a call inst but we need to know if the previous one was
                                    if (count_temp==count) {
                                        last_inst=false;}// In this case the last inst is not a call inst
                                   
                                    if (just_entered ){ // in this case the previous inst was a call  in the middle of BB so a new call to monitor has to be added
                                        just_entered =false;
                                        Instruction *inst4 = &*I;
                                        IRBuilder<> builder4(inst4);
                                        Instruction *newInst4 = CallInst::Create(monitor_3,  "");    // create the second insttruction to be added : a call to the rapl function
                                        BB->getInstList().insert(I, newInst4); 
                                    } 
                            }
                        }
                            

                    BasicBlock::iterator BI = BB->begin();     // BI will hold the begging point  of the basic block so that we can insert instructions there
                    BasicBlock::iterator BF = BB->end();
                    
                    
                     if(prev_last)  {    //Checkif last inst of previous BB was a call so we have to add call  to rapl now 
                        Instruction *inst5 = &*BI;
                        IRBuilder<> builder5(inst5);
                        Instruction *newInst5 = CallInst::Create(monitor_3,  "");    // create the first insttruction to be added : a call to the rapl  function
                        BB->getInstList().insert(BI, newInst5); 

                    }     
                    prev_last = last_inst; 
                    
                    
                    BF--;                                      // BF will hold the ending point  of the basic block so that we can insert instructions there
                    B_last = BF;
                    F_last = BB;
                    errs() << "new basic block\n";
                    BB->setName(F->getName());                // set the name of the bb to its function name plus a unique number which will be added automatically . for more check read.ME
                   
                    errs() << "Basic Block name: " << BB->getName() << "\n";
                    errs()<< "Of function : " << F->getName() << "\n";  // print the name of the current BB
                    errs() << *BB;                                            // print the contents of the bb in the form of llvm IR assembly instructions
                    
                    Instruction *inst = &*BI;
                    IRBuilder<> builder(inst);
                    //Value *v = builder.CreateGlobalStringPtr(BB->getName(), "str");
                    //ArrayRef<Value *> args(v);
                    Instruction *newInst = CallInst::Create(monitor, /*args,*/ "");    // create the first insttruction to be added : a call to the print function
                    BB->getInstList().insert(BI, newInst);                         // we give as argument the name of the bb and we insert it at the beggining f the bb
                  

                          

                
            }
        }

                   /*                                            
                    Instruction *inst0 = &*B_last;                  // add another basic block read with final as input name at the end of the code
                    IRBuilder<> builder(inst0);
                    Value *v1 = builder.CreateGlobalStringPtr("final  ", "str");
                    ArrayRef<Value *> args(v1);
                    Instruction *newInst0 = CallInst::Create(monitor, args, "");    // create the first insttruction to be added : a call to the print function
                    F_last->getInstList().insert(B_last, newInst0);  
                    
                    */
       


        return true;
    }
};
}

char SkeletonPass::ID = 0;
static RegisterPass<SkeletonPass> X("skeleton", "LLVM IR Instrumentation Pass");


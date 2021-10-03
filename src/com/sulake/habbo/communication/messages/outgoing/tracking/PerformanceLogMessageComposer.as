package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2546:int = 0;
      
      private var var_1508:String = "";
      
      private var var_1874:String = "";
      
      private var var_2524:String = "";
      
      private var var_3000:String = "";
      
      private var var_2181:int = 0;
      
      private var var_2998:int = 0;
      
      private var var_3001:int = 0;
      
      private var var_1509:int = 0;
      
      private var var_2999:int = 0;
      
      private var var_1510:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2546 = param1;
         this.var_1508 = param2;
         this.var_1874 = param3;
         this.var_2524 = param4;
         this.var_3000 = param5;
         if(param6)
         {
            this.var_2181 = 1;
         }
         else
         {
            this.var_2181 = 0;
         }
         this.var_2998 = param7;
         this.var_3001 = param8;
         this.var_1509 = param9;
         this.var_2999 = param10;
         this.var_1510 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2546,this.var_1508,this.var_1874,this.var_2524,this.var_3000,this.var_2181,this.var_2998,this.var_3001,this.var_1509,this.var_2999,this.var_1510];
      }
   }
}

package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_2098:IID;
      
      private var var_1156:Boolean;
      
      private var var_1338:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_2098 = param1;
         this.var_1338 = new Array();
         this.var_1156 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_2098;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1156;
      }
      
      public function get receivers() : Array
      {
         return this.var_1338;
      }
      
      public function dispose() : void
      {
         if(!this.var_1156)
         {
            this.var_1156 = true;
            this.var_2098 = null;
            while(this.var_1338.length > 0)
            {
               this.var_1338.pop();
            }
            this.var_1338 = null;
         }
      }
   }
}

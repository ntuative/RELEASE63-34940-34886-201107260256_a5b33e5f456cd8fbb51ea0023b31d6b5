package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1503:IID;
      
      private var var_1856:String;
      
      private var var_124:IUnknown;
      
      private var var_795:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1503 = param1;
         this.var_1856 = getQualifiedClassName(this.var_1503);
         this.var_124 = param2;
         this.var_795 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1503;
      }
      
      public function get iis() : String
      {
         return this.var_1856;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_124;
      }
      
      public function get references() : uint
      {
         return this.var_795;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_124 == null;
      }
      
      public function dispose() : void
      {
         this.var_1503 = null;
         this.var_1856 = null;
         this.var_124 = null;
         this.var_795 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_795;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_795) : uint(0);
      }
   }
}

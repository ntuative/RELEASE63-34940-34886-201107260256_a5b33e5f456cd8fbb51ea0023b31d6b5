package com.sulake.habbo.avatar.geometry
{
   public class Node3D
   {
       
      
      private var var_498:Vector3D;
      
      private var var_2111:Vector3D;
      
      private var var_2885:Boolean = false;
      
      public function Node3D(param1:Number, param2:Number, param3:Number)
      {
         this.var_2111 = new Vector3D();
         super();
         this.var_498 = new Vector3D(param1,param2,param3);
         if(param1 != 0 || param2 != 0 || param3 != 0)
         {
            this.var_2885 = true;
         }
      }
      
      public function get location() : Vector3D
      {
         return this.var_498;
      }
      
      public function get transformedLocation() : Vector3D
      {
         return this.var_2111;
      }
      
      public function applyTransform(param1:Matrix4x4) : void
      {
         if(this.var_2885)
         {
            this.var_2111 = param1.vectorMultiplication(this.var_498);
         }
      }
   }
}

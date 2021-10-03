package com.sulake.core.utils
{
   public class ErrorReportStorage
   {
      
      private static var var_1371:Map = new Map();
      
      private static var var_898:Map = new Map();
       
      
      public function ErrorReportStorage()
      {
         super();
      }
      
      public static function getDebugData() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = 0;
         while(_loc2_ < var_898.length)
         {
            if(_loc2_ == 0)
            {
               _loc1_ = var_898.getWithIndex(_loc2_);
            }
            else
            {
               _loc1_ = _loc1_ + " ** " + var_898.getWithIndex(_loc2_);
            }
            _loc2_++;
         }
         if(_loc1_.length > 400)
         {
            _loc1_ = _loc1_.substr(_loc1_.length - 400);
         }
         return _loc1_;
      }
      
      public static function addDebugData(param1:String, param2:String) : void
      {
         var_898.remove(param1);
         var_898.add(param1,param2);
      }
      
      public static function setParameter(param1:String, param2:String) : void
      {
         var_1371[param1] = param2;
      }
      
      public static function getParameter(param1:String) : String
      {
         return var_1371[param1];
      }
      
      public static function getParameterNames() : Array
      {
         return var_1371.getKeys();
      }
   }
}

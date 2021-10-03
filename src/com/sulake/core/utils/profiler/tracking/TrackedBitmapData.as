package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2293:int = 16777215;
      
      public static const const_1218:int = 8191;
      
      public static const const_1385:int = 8191;
      
      public static const const_2343:int = 1;
      
      public static const const_1286:int = 1;
      
      public static const const_1319:int = 1;
      
      private static var var_523:uint = 0;
      
      private static var var_522:uint = 0;
       
      
      private var _owner:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1218)
         {
            param2 = const_1218;
         }
         else if(param2 < const_1286)
         {
            param2 = const_1286;
         }
         if(param3 > const_1385)
         {
            param3 = const_1385;
         }
         else if(param3 < const_1319)
         {
            param3 = const_1319;
         }
         super(param2,param3,param4,param5);
         ++var_523;
         var_522 += param2 * param3 * 4;
         this._owner = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_523;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_522;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_522 -= width * height * 4;
            --var_523;
            this._disposed = true;
            this._owner = null;
            super.dispose();
         }
      }
   }
}

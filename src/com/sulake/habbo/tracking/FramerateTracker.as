package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1870:int;
      
      private var var_3008:int;
      
      private var var_921:int;
      
      private var var_539:Number;
      
      private var var_3009:Boolean;
      
      private var var_3010:int;
      
      private var var_2185:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_539);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_3008 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_3010 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_3009 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_921;
         if(this.var_921 == 1)
         {
            this.var_539 = param1;
            this.var_1870 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_921);
            this.var_539 = this.var_539 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_3009 && param3 - this.var_1870 >= this.var_3008)
         {
            this.var_921 = 0;
            if(this.var_2185 < this.var_3010)
            {
               param2.trackGoogle("performance","averageFramerate",this.frameRate);
               ++this.var_2185;
               this.var_1870 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}

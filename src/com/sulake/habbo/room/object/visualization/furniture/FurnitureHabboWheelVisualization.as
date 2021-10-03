package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1090:int = 10;
      
      private static const const_714:int = 20;
      
      private static const const_1561:int = 31;
      
      private static const const_1458:int = 32;
       
      
      private var var_343:Array;
      
      private var var_873:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
      {
         this.var_343 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_873)
            {
               this.var_873 = true;
               this.var_343 = new Array();
               this.var_343.push(const_1561);
               this.var_343.push(const_1458);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_1090)
         {
            if(this.var_873)
            {
               this.var_873 = false;
               this.var_343 = new Array();
               this.var_343.push(const_1090 + param1);
               this.var_343.push(const_714 + param1);
               this.var_343.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(this.var_343.length > 0)
            {
               super.setAnimation(this.var_343.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}

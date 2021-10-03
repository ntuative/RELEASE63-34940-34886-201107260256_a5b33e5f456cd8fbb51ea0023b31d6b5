package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1090:int = 20;
      
      private static const const_714:int = 9;
      
      private static const const_1458:int = -1;
       
      
      private var var_343:Array;
      
      private var var_873:Boolean = false;
      
      public function FurnitureBottleVisualization()
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
               this.var_343.push(const_1458);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_873)
            {
               this.var_873 = false;
               this.var_343 = new Array();
               this.var_343.push(const_1090);
               this.var_343.push(const_714 + param1);
               this.var_343.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
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

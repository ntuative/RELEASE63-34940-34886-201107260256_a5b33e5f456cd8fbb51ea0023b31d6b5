package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1458:int = 3;
      
      private static const const_1620:int = 2;
      
      private static const const_1621:int = 1;
      
      private static const const_1619:int = 15;
       
      
      private var var_343:Array;
      
      private var var_1339:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_343 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1620)
         {
            this.var_343 = new Array();
            this.var_343.push(const_1621);
            this.var_1339 = const_1619;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1339 > 0)
         {
            --this.var_1339;
         }
         if(this.var_1339 == 0)
         {
            if(this.var_343.length > 0)
            {
               super.setAnimation(this.var_343.shift());
            }
         }
         return super.updateAnimation(param1);
      }
      
      override protected function usesAnimationResetting() : Boolean
      {
         return true;
      }
   }
}

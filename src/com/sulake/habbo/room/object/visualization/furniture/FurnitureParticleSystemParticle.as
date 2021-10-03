package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import flash.geom.Vector3D;
   
   public class FurnitureParticleSystemParticle
   {
       
      
      private var _x:Number;
      
      private var var_175:Number;
      
      private var var_174:Number;
      
      private var var_1800:Number;
      
      private var var_1801:Number;
      
      private var var_1798:Number;
      
      private var var_1201:Boolean = false;
      
      private var _direction:Vector3D;
      
      private var var_532:int = 0;
      
      private var var_964:int;
      
      private var var_2452:Boolean = false;
      
      private var var_1799:Boolean = false;
      
      private var var_1716:Number;
      
      private var _alphaMultiplier:Number = 1.0;
      
      private var _frames:Array;
      
      public function FurnitureParticleSystemParticle()
      {
         super();
      }
      
      public function get fade() : Boolean
      {
         return this.var_1799;
      }
      
      public function get alphaMultiplier() : Number
      {
         return this._alphaMultiplier;
      }
      
      public function get direction() : Vector3D
      {
         return this._direction;
      }
      
      public function get age() : int
      {
         return this.var_532;
      }
      
      public function init(param1:Number, param2:Number, param3:Number, param4:Vector3D, param5:Number, param6:Number, param7:int, param8:Boolean = false, param9:Array = null, param10:Boolean = false) : void
      {
         this._x = param1;
         this.var_175 = param2;
         this.var_174 = param3;
         this._direction = new Vector3D(param4.x,param4.y,param4.z);
         this._direction.scaleBy(param5);
         this.var_1800 = this._x - this._direction.x * param6;
         this.var_1801 = this.var_175 - this._direction.y * param6;
         this.var_1798 = this.var_174 - this._direction.z * param6;
         this.var_532 = 0;
         this.var_1201 = false;
         this.var_964 = param7;
         this.var_2452 = param8;
         this._frames = param9;
         this.var_1799 = param10;
         this._alphaMultiplier = 1;
         this.var_1716 = 0.5 + Math.random() * 0.5;
      }
      
      public function update() : void
      {
         ++this.var_532;
         if(this.var_532 == this.var_964)
         {
            this.ignite();
         }
         if(this.var_1799)
         {
            if(this.var_532 / this.var_964 > this.var_1716)
            {
               this._alphaMultiplier = (this.var_964 - this.var_532) / (this.var_964 * (1 - this.var_1716));
            }
         }
      }
      
      public function getAsset() : IGraphicAsset
      {
         if(this._frames && this._frames.length > 0)
         {
            return this._frames[this.var_532 % this._frames.length];
         }
         return null;
      }
      
      protected function ignite() : void
      {
      }
      
      public function get isEmitter() : Boolean
      {
         return this.var_2452;
      }
      
      public function get isAlive() : Boolean
      {
         return this.var_532 <= this.var_964;
      }
      
      public function dispose() : void
      {
         this._direction = null;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_175;
      }
      
      public function get z() : Number
      {
         return this.var_174;
      }
      
      public function set x(param1:Number) : void
      {
         this._x = param1;
      }
      
      public function set y(param1:Number) : void
      {
         this.var_175 = param1;
      }
      
      public function set z(param1:Number) : void
      {
         this.var_174 = param1;
      }
      
      public function get lastX() : Number
      {
         return this.var_1800;
      }
      
      public function set lastX(param1:Number) : void
      {
         this.var_1201 = true;
         this.var_1800 = param1;
      }
      
      public function get lastY() : Number
      {
         return this.var_1801;
      }
      
      public function set lastY(param1:Number) : void
      {
         this.var_1201 = true;
         this.var_1801 = param1;
      }
      
      public function get lastZ() : Number
      {
         return this.var_1798;
      }
      
      public function set lastZ(param1:Number) : void
      {
         this.var_1201 = true;
         this.var_1798 = param1;
      }
      
      public function get hasMoved() : Boolean
      {
         return this.var_1201;
      }
      
      public function toString() : String
      {
         return [this._x,this.var_175,this.var_174].toString();
      }
   }
}

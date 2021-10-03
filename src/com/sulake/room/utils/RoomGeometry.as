package com.sulake.room.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   
   public class RoomGeometry implements IRoomGeometry
   {
      
      public static const const_576:Number = 64;
      
      public static const const_1186:Number = 32;
       
      
      private var var_189:int = 0;
      
      private var _x:Vector3d;
      
      private var var_175:Vector3d;
      
      private var var_174:Vector3d;
      
      private var var_1403:Vector3d;
      
      private var var_498:Vector3d;
      
      private var _direction:Vector3d;
      
      private var var_1402:Vector3d;
      
      private var _scale:Number = 1.0;
      
      private var var_499:Number = 1.0;
      
      private var var_501:Number = 1.0;
      
      private var var_502:Number = 1.0;
      
      private var var_2202:Number = 1.0;
      
      private var var_2203:Number = 1.0;
      
      private var var_2201:Number = 1.0;
      
      private var var_107:Vector3d;
      
      private var var_500:Vector3d;
      
      private var var_3110:Number = -500.0;
      
      private var var_3109:Number = 500.0;
      
      private var var_602:Map = null;
      
      public function RoomGeometry(param1:Number, param2:IVector3d, param3:IVector3d, param4:IVector3d = null)
      {
         super();
         this.scale = param1;
         this._x = new Vector3d();
         this.var_175 = new Vector3d();
         this.var_174 = new Vector3d();
         this.var_1403 = new Vector3d();
         this.var_498 = new Vector3d();
         this._direction = new Vector3d();
         this.var_1402 = new Vector3d();
         this.var_2202 = 1;
         this.var_2203 = 1;
         this.x_scale = 1;
         this.y_scale = 1;
         this.var_2201 = Math.sqrt(0.5) / Math.sqrt(0.75);
         this.z_scale = 1;
         this.location = new Vector3d(param3.x,param3.y,param3.z);
         this.direction = new Vector3d(param2.x,param2.y,param2.z);
         if(param4 != null)
         {
            this.setDepthVector(param4);
         }
         else
         {
            this.setDepthVector(param2);
         }
         this.var_602 = new Map();
      }
      
      public static function getIntersectionVector(param1:IVector3d, param2:IVector3d, param3:IVector3d, param4:IVector3d) : IVector3d
      {
         var _loc5_:Number = Vector3d.dotProduct(param2,param4);
         if(Math.abs(_loc5_) < 0.00001)
         {
            return null;
         }
         var _loc6_:Vector3d = Vector3d.dif(param1,param3);
         var _loc7_:Number = -Vector3d.dotProduct(param4,_loc6_) / _loc5_;
         return Vector3d.sum(param1,Vector3d.product(param2,_loc7_));
      }
      
      public function get updateId() : int
      {
         return this.var_189;
      }
      
      public function get scale() : Number
      {
         return this._scale / Math.sqrt(0.5);
      }
      
      public function get directionAxis() : IVector3d
      {
         return this.var_1403;
      }
      
      public function get location() : IVector3d
      {
         this.var_498.assign(this.var_107);
         this.var_498.x *= this.var_499;
         this.var_498.y *= this.var_501;
         this.var_498.z *= this.var_502;
         return this.var_498;
      }
      
      public function get direction() : IVector3d
      {
         return this._direction;
      }
      
      public function set x_scale(param1:Number) : void
      {
         if(this.var_499 != param1 * this.var_2202)
         {
            this.var_499 = param1 * this.var_2202;
            ++this.var_189;
         }
      }
      
      public function set y_scale(param1:Number) : void
      {
         if(this.var_501 != param1 * this.var_2203)
         {
            this.var_501 = param1 * this.var_2203;
            ++this.var_189;
         }
      }
      
      public function set z_scale(param1:Number) : void
      {
         if(this.var_502 != param1 * this.var_2201)
         {
            this.var_502 = param1 * this.var_2201;
            ++this.var_189;
         }
      }
      
      public function set scale(param1:Number) : void
      {
         if(param1 <= 1)
         {
            param1 = 1;
         }
         param1 *= Math.sqrt(0.5);
         if(param1 != this._scale)
         {
            this._scale = param1;
            ++this.var_189;
         }
      }
      
      public function set location(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_107 == null)
         {
            this.var_107 = new Vector3d();
         }
         var _loc2_:Number = this.var_107.x;
         var _loc3_:Number = this.var_107.y;
         var _loc4_:Number = this.var_107.z;
         this.var_107.assign(param1);
         this.var_107.x /= this.var_499;
         this.var_107.y /= this.var_501;
         this.var_107.z /= this.var_502;
         if(this.var_107.x != _loc2_ || this.var_107.y != _loc3_ || this.var_107.z != _loc4_)
         {
            ++this.var_189;
         }
      }
      
      public function set direction(param1:IVector3d) : void
      {
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc25_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(this.var_500 == null)
         {
            this.var_500 = new Vector3d();
         }
         var _loc2_:Number = this.var_500.x;
         var _loc3_:Number = this.var_500.y;
         var _loc4_:Number = this.var_500.z;
         this.var_500.assign(param1);
         this._direction.assign(param1);
         if(this.var_500.x != _loc2_ || this.var_500.y != _loc3_ || this.var_500.z != _loc4_)
         {
            ++this.var_189;
         }
         var _loc5_:Vector3d = new Vector3d(0,1,0);
         var _loc6_:Vector3d = new Vector3d(0,0,1);
         var _loc7_:Vector3d = new Vector3d(1,0,0);
         var _loc8_:Number = param1.x / 180 * 0;
         var _loc9_:Number = param1.y / 180 * 0;
         var _loc10_:Number = param1.z / 180 * 0;
         var _loc11_:Number = Math.cos(_loc8_);
         var _loc12_:Number = Math.sin(_loc8_);
         var _loc13_:Vector3d = Vector3d.sum(Vector3d.product(_loc5_,_loc11_),Vector3d.product(_loc7_,-_loc12_));
         var _loc14_:Vector3d = new Vector3d(_loc6_.x,_loc6_.y,_loc6_.z);
         var _loc15_:Vector3d = Vector3d.sum(Vector3d.product(_loc5_,_loc12_),Vector3d.product(_loc7_,_loc11_));
         var _loc16_:Number = Math.cos(_loc9_);
         var _loc17_:Number = Math.sin(_loc9_);
         var _loc18_:Vector3d = new Vector3d(_loc13_.x,_loc13_.y,_loc13_.z);
         var _loc19_:Vector3d = Vector3d.sum(Vector3d.product(_loc14_,_loc16_),Vector3d.product(_loc15_,_loc17_));
         var _loc20_:Vector3d = Vector3d.sum(Vector3d.product(_loc14_,-_loc17_),Vector3d.product(_loc15_,_loc16_));
         if(_loc10_ != 0)
         {
            _loc21_ = Math.cos(_loc10_);
            _loc22_ = Math.sin(_loc10_);
            _loc23_ = Vector3d.sum(Vector3d.product(_loc18_,_loc21_),Vector3d.product(_loc19_,_loc22_));
            _loc24_ = Vector3d.sum(Vector3d.product(_loc18_,-_loc22_),Vector3d.product(_loc19_,_loc21_));
            _loc25_ = new Vector3d(_loc20_.x,_loc20_.y,_loc20_.z);
            this._x.assign(_loc23_);
            this.var_175.assign(_loc24_);
            this.var_174.assign(_loc25_);
            this.var_1403.assign(this.var_174);
         }
         else
         {
            this._x.assign(_loc18_);
            this.var_175.assign(_loc19_);
            this.var_174.assign(_loc20_);
            this.var_1403.assign(this.var_174);
         }
      }
      
      public function dispose() : void
      {
         this._x = null;
         this.var_175 = null;
         this.var_174 = null;
         this.var_107 = null;
         this.var_500 = null;
         this.var_1403 = null;
         this.var_498 = null;
         if(this.var_602 != null)
         {
            this.var_602.dispose();
            this.var_602 = null;
         }
      }
      
      public function setDisplacement(param1:IVector3d, param2:IVector3d) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(this.var_602 != null)
         {
            _loc3_ = int(Math.round(param1.x)) + "_" + int(Math.round(param1.y)) + "_" + int(Math.round(param1.z));
            this.var_602.remove(_loc3_);
            _loc4_ = new Vector3d();
            _loc4_.assign(param2);
            this.var_602.add(_loc3_,_loc4_);
            ++this.var_189;
         }
      }
      
      private function getDisplacenent(param1:IVector3d) : IVector3d
      {
         var _loc2_:* = null;
         if(this.var_602 != null)
         {
            _loc2_ = int(Math.round(param1.x)) + "_" + int(Math.round(param1.y)) + "_" + int(Math.round(param1.z));
            return this.var_602.getValue(_loc2_);
         }
         return null;
      }
      
      public function setDepthVector(param1:IVector3d) : void
      {
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc2_:Vector3d = new Vector3d(0,1,0);
         var _loc3_:Vector3d = new Vector3d(0,0,1);
         var _loc4_:Vector3d = new Vector3d(1,0,0);
         var _loc5_:Number = param1.x / 180 * 0;
         var _loc6_:Number = param1.y / 180 * 0;
         var _loc7_:Number = param1.z / 180 * 0;
         var _loc8_:Number = Math.cos(_loc5_);
         var _loc9_:Number = Math.sin(_loc5_);
         var _loc10_:Vector3d = Vector3d.sum(Vector3d.product(_loc2_,_loc8_),Vector3d.product(_loc4_,-_loc9_));
         var _loc11_:Vector3d = new Vector3d(_loc3_.x,_loc3_.y,_loc3_.z);
         var _loc12_:Vector3d = Vector3d.sum(Vector3d.product(_loc2_,_loc9_),Vector3d.product(_loc4_,_loc8_));
         var _loc13_:Number = Math.cos(_loc6_);
         var _loc14_:Number = Math.sin(_loc6_);
         var _loc15_:Vector3d = new Vector3d(_loc10_.x,_loc10_.y,_loc10_.z);
         var _loc16_:Vector3d = Vector3d.sum(Vector3d.product(_loc11_,_loc13_),Vector3d.product(_loc12_,_loc14_));
         var _loc17_:Vector3d = Vector3d.sum(Vector3d.product(_loc11_,-_loc14_),Vector3d.product(_loc12_,_loc13_));
         if(_loc7_ != 0)
         {
            _loc18_ = Math.cos(_loc7_);
            _loc19_ = Math.sin(_loc7_);
            _loc20_ = Vector3d.sum(Vector3d.product(_loc15_,_loc18_),Vector3d.product(_loc16_,_loc19_));
            _loc21_ = Vector3d.sum(Vector3d.product(_loc15_,-_loc19_),Vector3d.product(_loc16_,_loc18_));
            _loc22_ = new Vector3d(_loc17_.x,_loc17_.y,_loc17_.z);
            this.var_1402.assign(_loc22_);
         }
         else
         {
            this.var_1402.assign(_loc17_);
         }
         ++this.var_189;
      }
      
      public function adjustLocation(param1:IVector3d, param2:Number) : void
      {
         if(param1 == null || this.var_174 == null)
         {
            return;
         }
         var _loc3_:Vector3d = Vector3d.product(this.var_174,-param2);
         var _loc4_:Vector3d = new Vector3d(param1.x + _loc3_.x,param1.y + _loc3_.y,param1.z + _loc3_.z);
         this.location = _loc4_;
      }
      
      public function getCoordinatePosition(param1:IVector3d) : IVector3d
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Number = Vector3d.scalarProjection(param1,this._x);
         var _loc3_:Number = Vector3d.scalarProjection(param1,this.var_175);
         var _loc4_:Number = Vector3d.scalarProjection(param1,this.var_174);
         return new Vector3d(_loc2_,_loc3_,_loc4_);
      }
      
      public function getScreenPosition(param1:IVector3d) : IVector3d
      {
         var _loc2_:Vector3d = Vector3d.dif(param1,this.var_107);
         _loc2_.x *= this.var_499;
         _loc2_.y *= this.var_501;
         _loc2_.z *= this.var_502;
         var _loc3_:Number = Vector3d.scalarProjection(_loc2_,this.var_1402);
         if(_loc3_ < this.var_3110 || _loc3_ > this.var_3109)
         {
            return null;
         }
         var _loc4_:Number = Vector3d.scalarProjection(_loc2_,this._x);
         var _loc5_:Number = -Vector3d.scalarProjection(_loc2_,this.var_175);
         _loc4_ *= this._scale;
         _loc5_ *= this._scale;
         var _loc6_:IVector3d = this.getDisplacenent(param1);
         if(_loc6_ != null)
         {
            _loc2_ = Vector3d.dif(param1,this.var_107);
            _loc2_.add(_loc6_);
            _loc2_.x *= this.var_499;
            _loc2_.y *= this.var_501;
            _loc2_.z *= this.var_502;
            _loc3_ = Vector3d.scalarProjection(_loc2_,this.var_1402);
         }
         _loc2_.x = _loc4_;
         _loc2_.y = _loc5_;
         _loc2_.z = _loc3_;
         return _loc2_;
      }
      
      public function getScreenPoint(param1:IVector3d) : Point
      {
         var _loc2_:IVector3d = this.getScreenPosition(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return new Point(_loc2_.x,_loc2_.y);
      }
      
      public function getPlanePosition(param1:Point, param2:IVector3d, param3:IVector3d, param4:IVector3d) : Point
      {
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc5_:Number = param1.x / this._scale;
         var _loc6_:Number = -param1.y / this._scale;
         var _loc7_:Vector3d = Vector3d.product(this._x,_loc5_);
         _loc7_.add(Vector3d.product(this.var_175,_loc6_));
         var _loc8_:Vector3d = new Vector3d(this.var_107.x * this.var_499,this.var_107.y * this.var_501,this.var_107.z * this.var_502);
         _loc8_.add(_loc7_);
         var _loc9_:IVector3d = this.var_174;
         var _loc10_:Vector3d = new Vector3d(param2.x * this.var_499,param2.y * this.var_501,param2.z * this.var_502);
         var _loc11_:Vector3d = new Vector3d(param3.x * this.var_499,param3.y * this.var_501,param3.z * this.var_502);
         var _loc12_:Vector3d = new Vector3d(param4.x * this.var_499,param4.y * this.var_501,param4.z * this.var_502);
         var _loc13_:IVector3d = Vector3d.crossProduct(_loc11_,_loc12_);
         var _loc14_:Vector3d = new Vector3d();
         _loc14_.assign(RoomGeometry.getIntersectionVector(_loc8_,_loc9_,_loc10_,_loc13_));
         if(_loc14_ != null)
         {
            _loc14_.sub(_loc10_);
            _loc15_ = Vector3d.scalarProjection(_loc14_,param3) / _loc11_.length * param3.length;
            _loc16_ = Vector3d.scalarProjection(_loc14_,param4) / _loc12_.length * param4.length;
            return new Point(_loc15_,_loc16_);
         }
         return null;
      }
      
      public function performZoom() : void
      {
         if(this.isZoomedIn())
         {
            this.scale = const_1186;
         }
         else
         {
            this.scale = const_576;
         }
      }
      
      public function isZoomedIn() : Boolean
      {
         return this.scale == const_576;
      }
      
      public function method_5() : void
      {
         this.scale = const_1186;
      }
      
      public function performZoomIn() : void
      {
         this.scale = const_576;
      }
   }
}

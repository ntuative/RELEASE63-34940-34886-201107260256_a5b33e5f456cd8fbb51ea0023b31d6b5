package com.sulake.habbo.sound.trax
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.IEventDispatcher;
   import flash.events.SampleDataEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class TraxSequencer implements IHabboSound, IDisposable
   {
      
      private static const const_121:Number = 44100;
      
      private static const const_120:uint = 8192;
      
      private static const const_1147:uint = 88000;
      
      private static const const_725:uint = 88000;
      
      private static const const_203:Vector.<int> = new Vector.<int>(const_120,true);
      
      private static const INTERPOLATION_BUFFER:Vector.<int> = new Vector.<int>(const_120,true);
       
      
      private var _disposed:Boolean = false;
      
      private var _events:IEventDispatcher;
      
      private var var_950:Number;
      
      private var var_1071:Sound;
      
      private var var_475:SoundChannel;
      
      private var var_476:TraxData;
      
      private var var_1651:Map;
      
      private var var_1153:Boolean;
      
      private var var_1649:int;
      
      private var var_1647:int = 0;
      
      private var var_180:uint;
      
      private var var_349:Array;
      
      private var var_1648:Boolean;
      
      private var var_711:Boolean = true;
      
      private var var_301:uint;
      
      private var var_1650:uint;
      
      private var var_1073:Boolean;
      
      private var var_886:Boolean;
      
      private var var_887:int;
      
      private var var_478:int;
      
      private var var_1072:int;
      
      private var var_581:int;
      
      private var var_712:Timer;
      
      private var var_477:Timer;
      
      private var var_1646:Boolean;
      
      private var var_1349:int = 0;
      
      private var var_2116:int = 0;
      
      public function TraxSequencer(param1:int, param2:TraxData, param3:Map, param4:IEventDispatcher)
      {
         this.var_1650 = uint(30);
         super();
         this._events = param4;
         this.var_1649 = param1;
         this.var_950 = 1;
         this.var_1071 = new Sound();
         this.var_475 = null;
         this.var_1651 = param3;
         this.var_476 = param2;
         this.var_1153 = true;
         this.var_180 = 0;
         this.var_349 = [];
         this.var_1648 = false;
         this.var_301 = 0;
         this.var_711 = false;
         this.var_1073 = false;
         this.var_886 = false;
         this.var_887 = 0;
         this.var_478 = 0;
         this.var_1072 = 0;
         this.var_581 = 0;
      }
      
      public function set position(param1:Number) : void
      {
         this.var_180 = uint(param1 * const_121);
      }
      
      public function get volume() : Number
      {
         return this.var_950;
      }
      
      public function get position() : Number
      {
         return this.var_180 / const_121;
      }
      
      public function get ready() : Boolean
      {
         return this.var_1153;
      }
      
      public function set ready(param1:Boolean) : void
      {
         this.var_1153 = param1;
      }
      
      public function get finished() : Boolean
      {
         return this.var_711;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_478 / const_121;
      }
      
      public function set fadeOutSeconds(param1:Number) : void
      {
         this.var_478 = int(param1 * const_121);
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_887 / const_121;
      }
      
      public function set fadeInSeconds(param1:Number) : void
      {
         this.var_887 = int(param1 * const_121);
      }
      
      public function get traxData() : TraxData
      {
         return this.var_476;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_950 = param1;
         if(this.var_475 != null)
         {
            this.var_475.soundTransform = new SoundTransform(this.var_950);
         }
      }
      
      public function get length() : Number
      {
         return this.var_301 / const_121;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.stopImmediately();
            this.var_476 = null;
            this.var_1651 = null;
            this.var_349 = null;
            this._events = null;
            this.var_1071 = null;
            this._disposed = true;
         }
      }
      
      public function prepare() : Boolean
      {
         if(!this.var_1153)
         {
            Logger.log("Cannot start trax playback until samples ready!");
            return false;
         }
         if(!this.var_1648)
         {
            if(this.var_476 != null)
            {
               this.var_1646 = false;
               if(this.var_476.hasMetaData)
               {
                  this.var_1646 = this.var_476.metaCutMode;
               }
               if(this.var_1646)
               {
                  if(!this.prepareSequence())
                  {
                     Logger.log("Cannot start playback, prepare sequence failed!");
                     return false;
                  }
               }
               else if(!this.prepareLegacySequence())
               {
                  Logger.log("Cannot start playback, prepare legacy sequence failed!");
                  return false;
               }
            }
         }
         return true;
      }
      
      private function prepareLegacySequence() : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(this.var_349 == null)
         {
            return false;
         }
         var _loc1_:uint = getTimer();
         var _loc2_:int = 0;
         while(_loc2_ < this.var_476.channels.length)
         {
            _loc3_ = new Map();
            _loc4_ = this.var_476.channels[_loc2_] as TraxChannel;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            while(_loc7_ < _loc4_.itemCount)
            {
               _loc8_ = _loc4_.getItem(_loc7_).id;
               _loc9_ = this.var_1651.getValue(_loc8_) as TraxSample;
               _loc9_.setUsageFromSong(this.var_1649,_loc1_);
               if(_loc9_ == null)
               {
                  Logger.log("Error in prepareLegacySequence(), sample was null!");
               }
               continue;
               _loc10_ = this.getSampleBars(_loc9_.length);
               _loc11_ = _loc4_.getItem(_loc7_).length / _loc10_;
               _loc12_ = 0;
               while(_loc12_ < _loc11_)
               {
                  if(_loc8_ != 0)
                  {
                     _loc3_.add(_loc5_,_loc9_);
                  }
                  _loc6_ += _loc10_;
                  _loc5_ = uint(_loc6_ * const_725);
                  _loc12_++;
               }
               if(this.var_301 < _loc5_)
               {
                  this.var_301 = _loc5_;
               }
               _loc7_++;
               return false;
            }
            this.var_349.push(_loc3_);
            _loc2_++;
         }
         this.var_1648 = true;
         return true;
      }
      
      private function prepareSequence() : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(this.var_349 == null)
         {
            return false;
         }
         var _loc1_:uint = getTimer();
         var _loc2_:int = 0;
         while(_loc2_ < this.var_476.channels.length)
         {
            _loc3_ = new Map();
            _loc4_ = this.var_476.channels[_loc2_] as TraxChannel;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = false;
            _loc8_ = 0;
            while(_loc8_ < _loc4_.itemCount)
            {
               _loc9_ = _loc4_.getItem(_loc8_).id;
               _loc10_ = this.var_1651.getValue(_loc9_) as TraxSample;
               _loc10_.setUsageFromSong(this.var_1649,_loc1_);
               if(_loc10_ == null)
               {
                  Logger.log("Error in prepareSequence(), sample was null!");
               }
               continue;
               _loc11_ = _loc6_;
               _loc12_ = _loc5_;
               _loc13_ = this.getSampleBars(_loc10_.length);
               _loc14_ = _loc4_.getItem(_loc8_).length;
               while(_loc11_ < _loc6_ + _loc14_)
               {
                  if(_loc9_ != 0 || _loc7_)
                  {
                     _loc3_.add(_loc12_,_loc10_);
                     _loc7_ = false;
                  }
                  _loc11_ += _loc13_;
                  _loc12_ = _loc11_ * const_725;
                  if(_loc11_ > _loc6_ + _loc14_)
                  {
                     _loc7_ = true;
                  }
               }
               _loc6_ += _loc4_.getItem(_loc8_).length;
               _loc5_ = uint(_loc6_ * const_725);
               if(this.var_301 < _loc5_)
               {
                  this.var_301 = _loc5_;
               }
               _loc8_++;
               return false;
            }
            this.var_349.push(_loc3_);
            _loc2_++;
         }
         this.var_1648 = true;
         return true;
      }
      
      public function play(param1:Number = 0.0) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         this.removeFadeoutStopTimer();
         if(this.var_475 != null)
         {
            this.stopImmediately();
         }
         if(this.var_887 > 0)
         {
            this.var_1073 = true;
            this.var_1072 = 0;
         }
         this.var_886 = false;
         this.var_581 = 0;
         this.var_711 = false;
         this.var_1071.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         this.var_1647 = param1 * const_121;
         this.var_1349 = 0;
         this.var_2116 = 0;
         this.var_475 = this.var_1071.play();
         this.volume = this.var_950;
         return true;
      }
      
      public function render(param1:SampleDataEvent) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         while(!this.var_711)
         {
            this.onSampleData(param1);
         }
         return true;
      }
      
      public function stop() : Boolean
      {
         if(this.var_478 > 0 && !this.var_711)
         {
            this.stopWithFadeout();
         }
         else
         {
            this.playingComplete();
         }
         return true;
      }
      
      private function stopImmediately() : void
      {
         this.removeStopTimer();
         if(this.var_475 != null)
         {
            this.var_475.stop();
            this.var_475 = null;
         }
         if(this.var_1071 != null)
         {
            this.var_1071.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         }
      }
      
      private function stopWithFadeout() : void
      {
         if(this.var_712 == null)
         {
            this.var_886 = true;
            this.var_581 = 0;
            this.var_712 = new Timer(this.var_1650 + this.var_478 / (const_121 / 1000),1);
            this.var_712.start();
            this.var_712.addEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
         }
      }
      
      private function getSampleBars(param1:uint) : int
      {
         if(this.var_1646)
         {
            return Math.round(param1 / const_1147);
         }
         return Math.ceil(param1 / const_1147);
      }
      
      private function getChannelSequenceOffsets() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:* = [];
         if(this.var_349 != null)
         {
            _loc2_ = this.var_349.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.var_349[_loc3_];
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length && _loc4_.getKey(_loc5_) < this.var_180)
               {
                  _loc5_++;
               }
               _loc1_.push(_loc5_ - 1);
               _loc3_++;
            }
         }
         return _loc1_;
      }
      
      private function mixChannelsIntoBuffer() : void
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(this.var_349 == null)
         {
            return;
         }
         var _loc1_:Array = this.getChannelSequenceOffsets();
         var _loc2_:int = this.var_349.length;
         var _loc3_:* = null;
         var _loc4_:int = _loc2_ - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = this.var_349[_loc4_];
            _loc6_ = _loc1_[_loc4_];
            _loc7_ = _loc5_.getWithIndex(_loc6_);
            if(_loc7_ == null)
            {
               _loc3_ = null;
            }
            else
            {
               _loc10_ = _loc5_.getKey(_loc6_);
               _loc11_ = this.var_180 - _loc10_;
               if(_loc7_.id == 0 || _loc11_ < 0)
               {
                  _loc3_ = null;
               }
               else
               {
                  _loc3_ = new TraxChannelSample(_loc7_,_loc11_);
               }
            }
            _loc8_ = const_120;
            if(this.var_301 - this.var_180 < _loc8_)
            {
               _loc8_ = this.var_301 - this.var_180;
            }
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc12_ = _loc8_;
               if(_loc6_ < _loc5_.length - 1)
               {
                  _loc13_ = _loc5_.getKey(_loc6_ + 1);
                  if(_loc8_ + this.var_180 >= _loc13_)
                  {
                     _loc12_ = _loc13_ - this.var_180;
                  }
               }
               if(_loc12_ > _loc8_ - _loc9_)
               {
                  _loc12_ = _loc8_ - _loc9_;
               }
               if(_loc4_ == _loc2_ - 1)
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.setSample(const_203,_loc9_,_loc12_);
                     _loc9_ += _loc12_;
                  }
                  else
                  {
                     _loc14_ = 0;
                     while(_loc14_ < _loc12_)
                     {
                        var _loc15_:*;
                        const_203[_loc15_ = _loc9_++] = 0;
                        _loc14_++;
                     }
                  }
               }
               else
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.addSample(const_203,_loc9_,_loc12_);
                  }
                  _loc9_ += _loc12_;
               }
               if(_loc9_ < _loc8_)
               {
                  _loc7_ = _loc5_.getWithIndex(++_loc6_);
                  if(_loc7_ == null || _loc7_.id == 0)
                  {
                     _loc3_ = null;
                  }
                  else
                  {
                     _loc3_ = new TraxChannelSample(_loc7_,0);
                  }
               }
            }
            _loc4_--;
         }
      }
      
      private function checkSongFinishing() : void
      {
         var _loc1_:int = this.var_301 < this.var_1647 ? int(this.var_301) : (this.var_1647 > 0 ? int(this.var_1647) : int(this.var_301));
         if(this.var_180 > _loc1_ + this.var_1650 * (const_121 / 1000) && !this.var_711)
         {
            this.var_711 = true;
            if(this.var_477 != null)
            {
               this.var_477.reset();
               this.var_477.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
            }
            this.var_477 = new Timer(2,1);
            this.var_477.start();
            this.var_477.addEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
         }
         else if(this.var_180 > _loc1_ - this.var_478 && !this.var_886)
         {
            this.var_1073 = false;
            this.var_886 = true;
            this.var_581 = 0;
         }
      }
      
      private function onSampleData(param1:SampleDataEvent) : void
      {
         if(param1.position > this.var_1349)
         {
            ++this.var_2116;
            Logger.log("Audio buffer under run...");
            this.var_1349 = param1.position;
         }
         if(this.volume > 0)
         {
            this.mixChannelsIntoBuffer();
         }
         var _loc2_:int = const_120;
         if(this.var_301 - this.var_180 < _loc2_)
         {
            _loc2_ = this.var_301 - this.var_180;
            if(_loc2_ < 0)
            {
               _loc2_ = 0;
            }
         }
         if(this.volume <= 0)
         {
            _loc2_ = 0;
         }
         this.writeAudioToOutputStream(param1.data,_loc2_);
         this.var_180 += const_120;
         this.var_1349 += const_120;
         if(this.var_475 != null)
         {
            this.var_1650 = param1.position / const_121 * 1000 - this.var_475.position;
         }
         this.checkSongFinishing();
      }
      
      private function interpolate(param1:int, param2:Number) : int
      {
         var _loc4_:* = NaN;
         var _loc5_:* = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc3_:* = 0;
         while(_loc10_ < param1)
         {
            _loc6_ = Math.floor(_loc3_);
            _loc7_ = Math.ceil(_loc3_);
            _loc4_ = 0;
            _loc5_ = 0;
            _loc8_ = _loc3_ - _loc6_;
            _loc9_ = _loc5_ - _loc4_;
            INTERPOLATION_BUFFER[_loc10_] = _loc4_ + _loc9_ * _loc8_;
            _loc3_ += param2;
            if(_loc3_ > const_120 - 2)
            {
               this.var_180 += const_120;
               this.mixChannelsIntoBuffer();
               _loc3_ = 0;
            }
            _loc10_++;
         }
         return int(Math.round(_loc3_));
      }
      
      private function writeAudioToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(param2 > 0)
         {
            if(!this.var_1073 && !this.var_886)
            {
               this.writeMixingBufferToOutputStream(param1,param2);
            }
            else
            {
               if(this.var_1073)
               {
                  _loc5_ = 1 / this.var_887;
                  _loc6_ = this.var_1072 / Number(this.var_887);
                  this.var_1072 += const_120;
                  if(this.var_1072 > this.var_887)
                  {
                     this.var_1073 = false;
                  }
               }
               else if(this.var_886)
               {
                  _loc5_ = -1 / this.var_478;
                  _loc6_ = 1 - this.var_581 / Number(this.var_478);
                  this.var_581 += const_120;
                  if(this.var_581 > this.var_478)
                  {
                     this.var_581 = this.var_478;
                  }
               }
               this.writeMixingBufferToOutputStreamWithFade(param1,param2,_loc6_,_loc5_);
            }
         }
         var _loc4_:int = param2;
         while(_loc4_ < const_120)
         {
            param1.writeFloat(0);
            param1.writeFloat(0);
            _loc4_++;
         }
      }
      
      private function writeMixingBufferToOutputStream(param1:ByteArray, param2:int) : void
      {
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            _loc3_ = Number(Number(const_203[_loc4_]) * 0);
            param1.writeFloat(_loc3_);
            param1.writeFloat(_loc3_);
            _loc4_++;
         }
      }
      
      private function writeMixingBufferToOutputStreamWithFade(param1:ByteArray, param2:int, param3:Number, param4:Number) : void
      {
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         _loc6_ = 0;
         while(_loc6_ < param2)
         {
            if(param3 < 0 || param3 > 1)
            {
               break;
            }
            _loc5_ = Number(Number(const_203[_loc6_]) * 0 * param3);
            param3 += param4;
            param1.writeFloat(_loc5_);
            param1.writeFloat(_loc5_);
            _loc6_++;
         }
         if(param3 < 0)
         {
            while(_loc6_ < param2)
            {
               param1.writeFloat(0);
               param1.writeFloat(0);
               _loc6_++;
            }
         }
         else if(param3 > 1)
         {
            while(_loc6_ < param2)
            {
               _loc5_ = Number(Number(const_203[_loc6_]) * 0);
               param3 += param4;
               param1.writeFloat(_loc5_);
               param1.writeFloat(_loc5_);
               _loc6_++;
            }
         }
      }
      
      private function onPlayingComplete(param1:TimerEvent) : void
      {
         if(this.var_711)
         {
            this.playingComplete();
         }
      }
      
      private function onFadeOutComplete(param1:TimerEvent) : void
      {
         this.removeFadeoutStopTimer();
         this.playingComplete();
      }
      
      private function playingComplete() : void
      {
         this.stopImmediately();
         this._events.dispatchEvent(new SoundCompleteEvent(SoundCompleteEvent.TRAX_SONG_COMPLETE,this.var_1649));
      }
      
      private function removeFadeoutStopTimer() : void
      {
         if(this.var_712 != null)
         {
            this.var_712.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
            this.var_712.reset();
            this.var_712 = null;
         }
      }
      
      private function removeStopTimer() : void
      {
         if(this.var_477 != null)
         {
            this.var_477.reset();
            this.var_477.removeEventListener(TimerEvent.TIMER_COMPLETE,this.onPlayingComplete);
            this.var_477 = null;
         }
      }
   }
}

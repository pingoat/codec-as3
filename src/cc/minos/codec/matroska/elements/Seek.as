/**
 * ...
 * Author: SiuzukZan <minoscc@gmail.com>
 * Date: 14/12/31 10:19
 */
package cc.minos.codec.matroska.elements {
    import cc.minos.codec.matroska.Matroska;

    public class Seek extends Element {

        private var _seekId:uint;
        private var _seekPosition:uint;

        public function Seek()
        {
            super(Matroska.SEEK);
        }

        override protected function getElement(type:uint):Element
        {
            switch (type)
            {
                case Matroska.SEEK_ID:
                case Matroska.SEEK_POSITION:
                    return new VarElement(type);
            }
            return super.getElement(type);
        }

        override protected function init():void
        {
            if(children.length == 2)
            {
                _seekId = toHex(children[0].data);
                _seekPosition = toHex(children[1].data);
            }
        }

        public function get seekId():uint
        {
            return _seekId;
        }

        public function get seekPosition():uint
        {
            return _seekPosition;
        }
    }
}

package ;
import gml.NativeArray;
import gml.NativeType;
import gml.io.Buffer;

/**
 * ...
 * @author YellowAfterlife
 */
@:nativeGen
@:doc @:keep class Gmx {
	public var name:String;
	public function getName() return name;
	public function setName(name:String) this.name = name;
	
	public var text:String;
	public function getText() return text;
	public function setText(text:String) this.text = text;
	
	public var children:Array<Gmx> = [];
	public var attributes:Array<GmxAttribute> = [];
	
	public function new(name:String, ?text:Any) {
		this.name = name;
		if (text == null) {
			this.text = null;
		} else if (text is String) {
			this.text = text;
		} else {
			this.text = NativeType.toString(text);
		}
	}
	
	public inline function addChild(child:Gmx) {
		children.push(child);
	}
	public inline function addTextChild(name:String, value:String):Gmx {
		var gmx = new Gmx(name, value);
		addChild(gmx);
		return gmx;
	}
	public function addEmptyChild(name:String):Gmx {
		return addTextChild(name, null);
	}
	public function addBoolChild(name:String, value:Bool):Gmx {
		return addTextChild(name, value ? "-1" : "0");
	}
	public function addIntChild(name:String, value:Int):Gmx {
		return addTextChild(name, cast value);
	}
	public function addFloatChild(name:String, value:Float):Gmx {
		return addTextChild(name, Std.string(value));
	}
	public function insertBefore(newNode:Gmx, refNode:Gmx) {
		var pos = children.indexOf(refNode);
		if (pos >= 0) {
			children.insert(pos, newNode);
		} else children.push(newNode);
	}
	//
	public inline function removeChild(q:Gmx):Bool {
		var pos = children.indexOf(q);
		if (pos >= 0) {
			removeChildAt(pos);
			return true;
		} else return false;
	}
	public inline function removeChildAt(pos:Int):Bool {
		var cur = children;
		var next = arrayDelete(cur, pos);
		if (next == cur) return false;
		children = next;
		return true;
	}
	public inline function clearChildren():Void {
		children = [];
	}
	//
	/** Finds the first element with given name */
	public function find(name:String):Gmx {
		for (q in children) if (q.name == name) return q;
		return null;
	}
	/** Finds the first element with given name and returns its text, otherwise returns null */
	public function findText(name:String):String {
		for (q in children) if (q.name == name) return q.text;
		return null;
	}
	/** Finds all elements with given name */
	public function findAll(name:String):Array<Gmx> {
		var r = [];
		for (q in children) if (q.name == name) r.push(q);
		return r;
	}
	/** Finds all elements with given name, including in child nodes */
	public function findRec(name:String, ?r:Array<Gmx>):Array<Gmx> {
		if (r == null) r = [];
		for (q in children) {
			if (q.name == name) r.push(q);
			q.findRec(name, r);
		}
		return r;
	}
	
	public function getAttribute(name:String):String {
		var arr = attributes;
		for (i in 0 ... arr.length) {
			var item = arr[i];
			if (item.name == name) return item.value;
		}
		return null;
	}
	public function hasAttribute(name:String):Bool {
		var arr = attributes;
		for (i in 0 ... arr.length) {
			var item = arr[i];
			if (item.name == name) return true;
		}
		return false;
	}
	public function setAttribute(name:String, value:String):Void {
		var arr = attributes;
		var item:GmxAttribute;
		for (i in 0 ... arr.length) {
			item = arr[i];
			if (item.name == name) {
				if (value == null) {
					value = "null";
				} else if (value is String) {
					// OK!
				} else if (NativeType.isReal(value)) {
					value = Std.string(value);
				} else value = NativeType.toString(value);
				item.value = value;
				return;
			}
		}
		item = { name: name, value: value };
		attributes.push(item);
	}
	public function removeAttribute(name:String):Bool {
		var arr = attributes;
		var item:GmxAttribute;
		for (i in 0 ... arr.length) {
			item = arr[i];
			if (item.name == name) {
				attributes = arrayDelete(arr, i);
				return true;
			}
		}
		return false;
	}
	
	@:noDoc public function printRec(buf:Buffer, tab:String) {
		buf.writeByte("<".code);
		buf.writeChars(name);
		var attrs = this.attributes;
		for (i in 0 ... attrs.length) {
			var attr = attrs[i];
			var val = attr.value;
			val = StringTools.htmlEscape(val, true);
			val = StringTools.replace(val, "\r\n", "&#xA;");
			val = StringTools.replace(val, "\n", "&#xA;");
			buf.writeByte(" ".code);
			buf.writeChars(attr.name);
			buf.writeChars('="');
			buf.writeChars(val);
			buf.writeChars('"');
		}
		var children = children;
		var len = children.length;
		if (len == 0 && text == null) {
			buf.writeChars("/>");
			return;
		}
		buf.writeByte(">".code);
		if (len > 0) {
			var t1 = tab + "  ";
			for (i in 0 ... len) {
				buf.writeByte("\r".code);
				buf.writeByte("\n".code);
				buf.writeChars(t1);
				children[i].printRec(buf, t1);
			}
			buf.writeByte("\r".code);
			buf.writeByte("\n".code);
			buf.writeChars(tab);
		} else {
			buf.writeChars(StringTools.htmlEscape(text));
		}
		buf.writeChars("</");
		buf.writeChars(name);
		buf.writeByte(">".code);
	}
	@:noDoc static var printBuf:Buffer = null;
	public function print() {
		var buf = printBuf;
		if (buf == null) {
			buf = new Buffer(1024, Grow, 1);
			printBuf = buf;
		} else buf.position = 0;
		printRec(buf, "");
		buf.writeByte(0);
		buf.position = 0;
		return buf.readString();
	}
	public function printWithHeader() {
		var buf = printBuf;
		if (buf == null) {
			buf = new Buffer(1024, Grow, 1);
			printBuf = buf;
		} else buf.position = 0;
		buf.writeChars("<!--This Document is generated by GameMaker, if you edit it by hand then you do so at your own risk!-->");
		buf.writeByte("\r".code);
		buf.writeByte("\n".code);
		
		printRec(buf, "");
		buf.writeByte("\r".code);
		buf.writeByte("\n".code);
		
		buf.writeByte(0);
		buf.position = 0;
		return buf.readString();
	}
	
	@:noDoc static function arrayDelete<T>(arr:Array<T>, pos:Int):Array<T> {
		var len = arr.length;
		if (pos < 0 || pos >= len) return arr;
		var next = NativeArray.createEmpty(len - 1);
		NativeArray.copyPart(next, 0, arr, 0, pos);
		NativeArray.copyPart(next, pos, arr, pos + 1, len - pos - 1);
		return next;
	}
	public static function main() {}
}
@:nativeGen typedef GmxAttribute = {
	var name:String;
	var value:String;
}
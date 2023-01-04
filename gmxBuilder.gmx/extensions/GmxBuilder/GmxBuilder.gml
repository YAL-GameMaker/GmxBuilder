#define gmx_init
// Generated at 2023-01-04 14:09:10 (304ms) for v1.4.1804+
/// @lint nullToAny true
// Feather disable all
globalvar mq_gmx_std_haxe_class; mq_gmx_std_haxe_class = [undefined, /* 1:marker */undefined, /* 2:index */0, /* 3:name */undefined, /* 4:superClass */undefined, /* 5:constructor */undefined];
globalvar g_gmx_print_buf; /// @is {buffer}
g_gmx_print_buf = undefined;

#define gmx_create
// gmx_create(name:string, ?text:any)
var _this = array_create(4);
/// @typedef {tuple<name:string,text:string,children:array<gmx>,attributes:array<GmxAttribute>>} gmx
var _text;
if (argument_count > 1) _text = argument[1]; else _text = undefined;
_this[@3/* attributes */] = [];
_this[@2/* children */] = [];
_this[@0/* name */] = argument[0];
if (_text == undefined) {
	_this[@1/* text */] = undefined;
} else if (is_string(_text)) {
	_this[@1/* text */] = _text;
} else _this[@1/* text */] = string(_text);
return _this;

#define gmx_array_delete
// gmx_array_delete(arr:array<T>, pos:int)->array<T>
var _arr = argument[0], _pos = argument[1];
var _len = array_length_1d(_arr);
if (_pos < 0 || _pos >= _len) return _arr;
var _next = array_create(_len - 1, 0);
array_copy(_next, 0, _arr, 0, _pos);
array_copy(_next, _pos, _arr, _pos + 1, _len - _pos - 1);
return _next;

#define gmx_get_name
// gmx_get_name(this:gmx)->string
var _this = argument[0];
return _this[0/* name */];

#define gmx_set_name
// gmx_set_name(this:gmx, name:string)
var _this = argument[0];
_this[@0/* name */] = argument[1];

#define gmx_get_text
// gmx_get_text(this:gmx)->string
var _this = argument[0];
return _this[1/* text */];

#define gmx_set_text
// gmx_set_text(this:gmx, text:string)
var _this = argument[0];
_this[@1/* text */] = argument[1];

#define gmx_add_child
// gmx_add_child(this:gmx, child:gmx)
var _this = argument[0];
gmx_std_gml_internal_ArrayImpl_push(_this[2/* children */], argument[1]);

#define gmx_add_text_child
// gmx_add_text_child(this:gmx, name:string, value:string)->gmx
var _this = argument[0];
var _gmx = gmx_create(argument[1], argument[2]);
gmx_std_gml_internal_ArrayImpl_push(_this[2/* children */], _gmx);
return _gmx;

#define gmx_add_empty_child
// gmx_add_empty_child(this:gmx, name:string)->gmx
var _this = argument[0];
var _gmx = gmx_create(argument[1], undefined);
gmx_std_gml_internal_ArrayImpl_push(_this[2/* children */], _gmx);
return _gmx;

#define gmx_add_bool_child
// gmx_add_bool_child(this:gmx, name:string, value:bool)->gmx
var _this = argument[0];
var _gmx = gmx_create(argument[1], (argument[2] ? "-1" : "0"));
gmx_std_gml_internal_ArrayImpl_push(_this[2/* children */], _gmx);
return _gmx;

#define gmx_add_int_child
// gmx_add_int_child(this:gmx, name:string, value:int)->gmx
var _this = argument[0];
var _gmx = gmx_create(argument[1], argument[2]);
gmx_std_gml_internal_ArrayImpl_push(_this[2/* children */], _gmx);
return _gmx;

#define gmx_add_float_child
// gmx_add_float_child(this:gmx, name:string, value:number)->gmx
var _this = argument[0];
var _gmx = gmx_create(argument[1], gmx_std_Std_string(argument[2]));
gmx_std_gml_internal_ArrayImpl_push(_this[2/* children */], _gmx);
return _gmx;

#define gmx_insert_before
// gmx_insert_before(this:gmx, newNode:gmx, refNode:gmx)
var _this = argument[0];
if (gmx_std_gml_internal_ArrayImpl_indexOf(_this[2/* children */], argument[2]) >= 0) gmx_std_gml_internal_ArrayImpl_insert(_this[2/* children */]); else gmx_std_gml_internal_ArrayImpl_push(_this[2/* children */], argument[1]);

#define gmx_remove_child
// gmx_remove_child(this:gmx, q:gmx)->bool
var _this = argument[0];
var _pos = gmx_std_gml_internal_ArrayImpl_indexOf(_this[2/* children */], argument[1]);
if (_pos >= 0) {
	var _cur = _this[2/* children */];
	var _next = gmx_array_delete(_cur, _pos);
	if (_next != _cur) _this[@2/* children */] = _next;
	return true;
} else return false;

#define gmx_remove_child_at
// gmx_remove_child_at(this:gmx, pos:int)->bool
var _this = argument[0];
var _cur = _this[2/* children */];
var _next = gmx_array_delete(_cur, argument[1]);
if (_next == _cur) return false;
_this[@2/* children */] = _next;
return true;

#define gmx_clear_children
// gmx_clear_children(this:gmx)
var _this = argument[0];
_this[@2/* children */] = [];

#define gmx_find
// gmx_find(this:gmx, name:string)->gmx
var _this = argument[0];
var __g = 0;
var __g1 = _this[2/* children */];
while (__g < array_length_1d(__g1)) {
	var _q = __g1[__g];
	++__g;
	if (_q[0/* name */] == argument[1]) return _q;
}
return undefined;

#define gmx_find_text
// gmx_find_text(this:gmx, name:string)->string
var _this = argument[0];
var __g = 0;
var __g1 = _this[2/* children */];
while (__g < array_length_1d(__g1)) {
	var _q = __g1[__g];
	++__g;
	if (_q[0/* name */] == argument[1]) return _q[1/* text */];
}
return undefined;

#define gmx_find_all
// gmx_find_all(this:gmx, name:string)->array<gmx>
var _this = argument[0];
var _r = [];
var __g = 0;
var __g1 = _this[2/* children */];
while (__g < array_length_1d(__g1)) {
	var _q = __g1[__g];
	++__g;
	if (_q[0/* name */] == argument[1]) gmx_std_gml_internal_ArrayImpl_push(_r, _q);
}
return _r;

#define gmx_find_rec
// gmx_find_rec(this:gmx, name:string, ?r:array<gmx>)->array<gmx>
var _this = argument[0], _name = argument[1], _r;
if (argument_count > 2) _r = argument[2]; else _r = undefined;
if (_r == undefined) _r = [];
var __g = 0;
var __g1 = _this[2/* children */];
while (__g < array_length_1d(__g1)) {
	var _q = __g1[__g];
	++__g;
	if (_q[0/* name */] == _name) gmx_std_gml_internal_ArrayImpl_push(_r, _q);
	gmx_find_rec(_q, _name, _r);
}
return _r;

#define gmx_get_attribute
// gmx_get_attribute(this:gmx, name:string)->string
var _this = argument[0];
var _arr = _this[3/* attributes */];
var _i = 0;
for (var __g1 = array_length_1d(_arr); _i < __g1; ++_i) {
	var _item = _arr[_i];
	if (_item[0/* name */] == argument[1]) return _item[1/* value */];
}
return undefined;

#define gmx_has_attribute
// gmx_has_attribute(this:gmx, name:string)->bool
var _this = argument[0];
var _arr = _this[3/* attributes */];
var _i = 0;
for (var __g1 = array_length_1d(_arr); _i < __g1; ++_i) {
	if (gmx_std_haxe_boot_wget(_arr[_i], 0) == argument[1]) return true;
}
return false;

#define gmx_set_attribute
// gmx_set_attribute(this:gmx, name:string, value:string)
var _this = argument[0], _name = argument[1], _value = argument[2];
var _arr = _this[3/* attributes */];
var _item;
var _i = 0;
for (var __g1 = array_length_1d(_arr); _i < __g1; ++_i) {
	_item = _arr[_i];
	if (_item[0/* name */] == _name) {
		if (_value == undefined) {
			_value = "null";
		} else if (!is_string(_value)) {
			if (is_real(_value)) _value = _value; else _value = string(_value);
		}
		_item[@1/* value */] = _value;
		return 0;
	}
}
_item = [/* name: */_name, /* value: */_value];
gmx_std_gml_internal_ArrayImpl_push(_this[3/* attributes */], _item);

#define gmx_remove_attribute
// gmx_remove_attribute(this:gmx, name:string)->bool
var _this = argument[0];
var _arr = _this[3/* attributes */];
var _item;
var _i = 0;
for (var __g1 = array_length_1d(_arr); _i < __g1; ++_i) {
	_item = _arr[_i];
	if (_item[0/* name */] == argument[1]) {
		_this[@3/* attributes */] = gmx_array_delete(_arr, _i);
		return true;
	}
}
return false;

#define gmx_print_rec
// gmx_print_rec(this:gmx, buf:buffer, tab:string)
var _this = argument[0], _buf = argument[1], _tab = argument[2];
buffer_write(_buf, buffer_u8, 60);
buffer_write(_buf, buffer_text, _this[0/* name */]);
var _attrs = _this[3/* attributes */];
var _i = 0;
for (var __g1 = array_length_1d(_attrs); _i < __g1; ++_i) {
	var _attr = _attrs[_i];
	var _val = _attr[1/* value */];
	_val = gmx_std_StringTools_htmlEscape(_val, true);
	_val = string_replace_all(_val, (chr(13) + chr(10)), "&#xA;");
	_val = string_replace_all(_val, chr(10), "&#xA;");
	buffer_write(_buf, buffer_u8, 32);
	buffer_write(_buf, buffer_text, _attr[0/* name */]);
	buffer_write(_buf, buffer_text, '="');
	buffer_write(_buf, buffer_text, _val);
	buffer_write(_buf, buffer_text, '"');
}
var _children = _this[2/* children */];
var _len = array_length_1d(_children);
if (_len == 0 && _this[1/* text */] == undefined) {
	buffer_write(_buf, buffer_text, "/>");
	return 0;
}
buffer_write(_buf, buffer_u8, 62);
if (_len > 0) {
	var _t1 = _tab + "  ";
	var _i = 0;
	for (var __g1 = _len; _i < __g1; ++_i) {
		buffer_write(_buf, buffer_u8, 13);
		buffer_write(_buf, buffer_u8, 10);
		buffer_write(_buf, buffer_text, _t1);
		gmx_print_rec(_children[_i], _buf, _t1);
	}
	buffer_write(_buf, buffer_u8, 13);
	buffer_write(_buf, buffer_u8, 10);
	buffer_write(_buf, buffer_text, _tab);
} else buffer_write(_buf, buffer_text, gmx_std_StringTools_htmlEscape(_this[1/* text */]));
buffer_write(_buf, buffer_text, "</");
buffer_write(_buf, buffer_text, _this[0/* name */]);
buffer_write(_buf, buffer_u8, 62);

#define gmx_print
// gmx_print(this:gmx)->string
var _this = argument[0];
var _buf = g_gmx_print_buf;
if (_buf == undefined) {
	_buf = buffer_create(1024, buffer_grow, 1);
	g_gmx_print_buf = _buf;
} else buffer_seek(_buf, buffer_seek_start, 0);
gmx_print_rec(_this, _buf, "");
buffer_write(_buf, buffer_u8, 0);
buffer_seek(_buf, buffer_seek_start, 0);
return buffer_read(_buf, buffer_string);

#define gmx_print_with_header
// gmx_print_with_header(this:gmx)->string
var _this = argument[0];
var _buf = g_gmx_print_buf;
if (_buf == undefined) {
	_buf = buffer_create(1024, buffer_grow, 1);
	g_gmx_print_buf = _buf;
} else buffer_seek(_buf, buffer_seek_start, 0);
buffer_write(_buf, buffer_text, "<!--This Document is generated by GameMaker, if you edit it by hand then you do so at your own risk!-->");
buffer_write(_buf, buffer_u8, 13);
buffer_write(_buf, buffer_u8, 10);
gmx_print_rec(_this, _buf, "");
buffer_write(_buf, buffer_u8, 13);
buffer_write(_buf, buffer_u8, 10);
buffer_write(_buf, buffer_u8, 0);
buffer_seek(_buf, buffer_seek_start, 0);
return buffer_read(_buf, buffer_string);

#define gmx_std_Std_string
// gmx_std_Std_string(value:any)->string
var _value = argument[0];
if (_value == undefined) return "null";
if (is_string(_value)) return _value;
var _n, _i, _s;
if (is_real(_value)) {
	_s = string_format(_value, 0, 16);
	if (os_browser != browser_not_a_browser) {
		_n = string_length(_s);
		_i = _n;
		while (_i > 0) {
			switch (string_ord_at(_s, _i)) {
				case 48:
					--_i;
					continue;
				case 46: --_i; break;
			}
			break;
		}
	} else {
		_n = string_byte_length(_s);
		_i = _n;
		while (_i > 0) {
			switch (string_byte_at(_s, _i)) {
				case 48:
					--_i;
					continue;
				case 46: --_i; break;
			}
			break;
		}
	}
	return string_copy(_s, 1, _i);
}
return string(_value);

#define gmx_std_StringTools_htmlEscape
// gmx_std_StringTools_htmlEscape(s:string, quotes:bool = false)->string
var _s = argument[0], _quotes;
if (argument_count > 1) _quotes = argument[1]; else _quotes = false;
_s = string_replace_all(_s, "&", "&amp;");
_s = string_replace_all(_s, "<", "&lt;");
_s = string_replace_all(_s, ">", "&gt;");
if (_quotes) {
	_s = string_replace_all(_s, '"', "&quot;");
	_s = string_replace_all(_s, "'", "&#039;");
}
return _s;

#define gmx_std_gml_internal_ArrayImpl_push
// gmx_std_gml_internal_ArrayImpl_push(arr:array<T>, val:T)->int
var _arr = argument[0];
var _i = array_length_1d(_arr);
_arr[@_i] = argument[1];
return _i;

#define gmx_std_gml_internal_ArrayImpl_insert
// gmx_std_gml_internal_ArrayImpl_insert(arr:array<T>, pos:int, val:T)
var _arr = argument[0], _pos = argument[1];
var _len = array_length_1d(_arr);
if (_pos < 0) {
	_pos += _len;
	if (_pos < 0) _pos = 0;
} else if (_pos > _len) {
	_pos = _len;
}
while (_len > _pos) {
	_arr[@_len] = _arr[_len - 1];
	--_len;
}
_arr[@_pos] = argument[2];

#define gmx_std_gml_internal_ArrayImpl_indexOf
// gmx_std_gml_internal_ArrayImpl_indexOf(arr:array<T>, v:T, i:int = 0)->int
var _arr = argument[0], _i;
if (argument_count > 2) _i = argument[2]; else _i = 0;
var _len = array_length_1d(_arr);
if (_i < 0) {
	_i += _len;
	if (_i < 0) _i = 0;
}
while (_i < _len) {
	if (_arr[_i] == argument[1]) return _i;
	++_i;
}
return -1;

#define gmx_std_haxe_boot_wget
// gmx_std_haxe_boot_wget(arr:array<T>, index:int)->T
var _arr = argument[0], _index = argument[1];
return _arr[_index];

/// @typedef {any} GmxAttribute
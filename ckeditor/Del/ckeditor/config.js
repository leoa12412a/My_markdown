/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config

	// The toolbar groups arrangement, optimized for two toolbar rows.
	config.toolbarGroups = [
		{ name: 'clipboard',   groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing',     groups: [ 'find', 'selection', 'spellchecker' ] },
		{ name: 'links' },
		{ name: 'insert' },
		{ name: 'forms' },
		{ name: 'tools' },
		{ name: 'document',	   groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'others' },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph',   groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
		{ name: 'styles' },
		{ name: 'colors' },
		{ name: 'about' }
	];

	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	config.removeButtons = 'Underline,Subscript,Superscript';

	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';

	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	
	var lib_root = "http://localhost/";
	
	config.filebrowserBrowseUrl = lib_root + 'ckfinder/ckfinder.html';
	config.filebrowserImageBrowseUrl = lib_root + 'ckfinder/ckfinder.html?Type=Images';
	config.filebrowserFlashBrowseUrl = lib_root + 'ckfinder/ckfinder.html?Type=Flash';
	//可上傳圖檔
	config.filebrowserImageUploadUrl=lib_root+'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files';
	/*上傳一般檔案 依照需求使用*/
	config.filebrowserUploadUrl=lib_root+'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files';
	/*上傳Flash檔案 依照需求使用*/
	config.filebrowserFlashUploadUrl=lib_root+'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';
	//這邊主要是讓ckeditor去引入ckfinder的檔案，藉此開啟附加的上傳功能(包含圖片管理庫)

};

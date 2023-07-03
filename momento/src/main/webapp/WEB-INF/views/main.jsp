<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <style>
      div#editor {
        padding: 16px 24px;
        border: 1px solid #d6d6d6;
        border-radius: 4px;
      }
      button.active {
        background-color: purple;
        color: #fff;
      }
    </style>
    <title>글쓰기</title>
  </head>
  <body>
    <form id="contentForm" action="/board/textEdit" method="post">
      <div>
        <p>공지사항 등록</p>
        <label for="title">제목<input type="text" class="title" /></label>
        <label><input type="checkbox" class="fixedPost" /> 고정글 등록</label>
      </div>
    </form>
    <div class="editor-menu">
      <button id="btn-bold">
        <b>B</b>
      </button>
      <button id="btn-italic">
        <i>I</i>
      </button>
      <button id="btn-underline">
        <u>U</u>
      </button>
      <button id="btn-strike">
        <s>S</s>
      </button>
      <button id="btn-ordered-list">OL</button>
      <button id="btn-unordered-list">UL</button>
      <input type="color" id="color-picker">
    </div>
    <form action="/board/textEdit" method="post">
      <div id="editor" contenteditable="true"></div>
      <textarea id="textArea" name="content" style="display:none"></textarea>
      <button id="submitBtn" type="button">등록</button>
    </form>
    <form>
      <div class="filebox">
        <p>파일 업로드</p>
        <input class="uploadName" value="첨부파일" placeholder="첨부파일" />
        <label for="file">파일찾기</label>
        <input type="file" class="file" />
      </div>
      
    </form>
    <script>
      const editor = document.getElementById("editor");
      const btnBold = document.getElementById("btn-bold");
      const btnItalic = document.getElementById("btn-italic");
      const btnUnderline = document.getElementById("btn-underline");
      const btnStrike = document.getElementById("btn-strike");
      const btnOrderedList = document.getElementById("btn-ordered-list");
      const btnUnorderedList = document.getElementById("btn-unordered-list");
      const colorPicker = document.getElementById("color-picker");
  
  colorPicker.addEventListener("change", function() {
    const selectedColor = colorPicker.value;
    setFontColor(selectedColor);
  });
  
  function setFontColor(color) {
    document.execCommand("foreColor", false, color);
    focusEditor();
  }
      btnBold.addEventListener("click", function () {
        setStyle("bold");
      });

      btnItalic.addEventListener("click", function () {
        setStyle("italic");
      });

      btnUnderline.addEventListener("click", function () {
        setStyle("underline");
      });

      btnStrike.addEventListener("click", function () {
        setStyle("strikeThrough");
      });

      btnOrderedList.addEventListener("click", function () {
        setStyle("insertOrderedList");
      });

      btnUnorderedList.addEventListener("click", function () {
        setStyle("insertUnorderedList");
      });

      function setStyle(style) {
        document.execCommand(style);
        focusEditor();
      }

      // 버튼 클릭 시 에디터가 포커스를 잃기 때문에 다시 에디터에 포커스를 해줌
      function focusEditor() {
        editor.focus({ preventScroll: true });
      }
      editor.addEventListener("keydown", function () {
        checkStyle();
      });

      editor.addEventListener("mousedown", function () {
        checkStyle();
      });

      function setStyle(style) {
        document.execCommand(style);
        focusEditor();
        checkStyle();
      }

      function checkStyle() {
        if (isStyle("bold")) {
          btnBold.classList.add("active");
        } else {
          btnBold.classList.remove("active");
        }
        if (isStyle("italic")) {
          btnItalic.classList.add("active");
        } else {
          btnItalic.classList.remove("active");
        }
        if (isStyle("underline")) {
          btnUnderline.classList.add("active");
        } else {
          btnUnderline.classList.remove("active");
        }
        if (isStyle("strikeThrough")) {
          btnStrike.classList.add("active");
        } else {
          btnStrike.classList.remove("active");
        }
        if (isStyle("insertOrderedList")) {
          btnOrderedList.classList.add("active");
        } else {
          btnOrderedList.classList.remove("active");
        }
        if (isStyle("insertUnorderedList")) {
          btnUnorderedList.classList.add("active");
        } else {
          btnUnorderedList.classList.remove("active");
        }
      }

      function isStyle(style) {
        return document.queryCommandState(style);
      }
window.onload = function() {
	var submitBtn =document.getElementById("submitBtn");
	var editable = document.getElementById("editor");
	var textArea = document.getElementById("textArea");
	var form = document.getElementById("contentForm");
	
	 submitBtn.addEventListener("click", function(e) {
		 e.preventDefault();
		 textArea.value = editable.innerHTML;
		 form.submit();
		 
	 });
		
	
}

    </script>
</html>



package com.printmanagement.util;

import java.awt.Color;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.stereotype.Component;

import com.spire.doc.Document;
import com.spire.doc.FieldType;
import com.spire.doc.FileFormat;
import com.spire.doc.HeaderFooter;
import com.spire.doc.PictureWatermark;
import com.spire.doc.Section;
import com.spire.doc.collections.SectionCollection;
import com.spire.doc.documents.HorizontalAlignment;
import com.spire.doc.documents.PageOrientation;
import com.spire.doc.documents.Paragraph;

@Component
public class WaterMarkToWordUtil {

	 public void addImageWaterMark(String pathToWordFile, String pathToImageFile, String rootPath){

	        Document document = new Document();
	        document.loadFromFile(pathToWordFile);

	        PictureWatermark picture = new PictureWatermark();
	        picture.setPicture(pathToImageFile);
	        picture.setScaling(100);
	        picture.isWashout(false);
	        document.setWatermark(picture);

	        document.saveToFile(rootPath+"/docs/result2.docx",FileFormat.Docx );
	    }
	 
	 public void addImageWaterMark(Document document, String pathToImageFile){
	        PictureWatermark picture = new PictureWatermark();
	        picture.setPicture(pathToImageFile);
	        picture.setScaling(101);
	        picture.isWashout(false);
	        document.setWatermark(picture);
	    }
	 
	 public String WordToPdf(String pathToWordFile, String rootPath){
	        try {
	        	Document document = new Document();
		        document.loadFromFile(pathToWordFile);

		        document.saveToFile(rootPath+"/docs/pdfbynct.pdf",FileFormat.PDF );
		         return "pdfbynct.pdf";
			} catch (Exception e) {
				return null;
			}
	    }
	 
	 public String Doc2Byte(String pathToWordFile, String rootPath) {
		// Load the document.
		 Document doc = new Document(pathToWordFile);

		 // Create a new memory stream.
		 ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		 // Save the document to stream.
		 doc.saveToFile(outStream,FileFormat.Docx );

		 // Convert the document to byte form.
		 byte[] docBytes = outStream.toByteArray();

		 // The bytes are now ready to be stored/transmitted.

		 // Now reverse the steps to load the bytes back into a document object.
		 ByteArrayInputStream inStream = new ByteArrayInputStream(docBytes);

		 // Load the stream into a new document object.
		 Document loadDoc = new Document(inStream);
		 // Save the document.
		 loadDoc.saveToFile(rootPath+"/docs/loadDoc.doc",FileFormat.Doc);
		 
		 String s = new String(docBytes, StandardCharsets.UTF_8);
		 return s;
	 }
	 
	 public String WordSetUp(String pathToWordFile, String rootPath, String pathToImageFile, String headerStr, String footerStr){

	        Document document = new Document();
	        document.loadFromFile(pathToWordFile);
	        
	        SectionCollection sections =  document.getSections();
	        for (Iterator<?> iterator = sections.iterator(); iterator.hasNext();) {
				Section section = (Section) iterator.next();
				section.getPageSetup().setOrientation(PageOrientation.Landscape);
				section.getPageSetup().getMargins().setLeft(21f);
				section.getPageSetup().getMargins().setRight(21f);
			}
	        
	        //get footer object of the first section
	        HeaderFooter footer = document.getSections().get(0).getHeadersFooters().getFooter();

	        //add a paragraph to footer
	        Paragraph footerParagraph = footer.addParagraph();

	        //append text and automatic page field to the paragraph
	        footerParagraph.appendText("Page ");
	        footerParagraph.appendField("page number", FieldType.Field_Page);
	        footerParagraph.getFormat().setHorizontalAlignment(HorizontalAlignment.Left);

	        //determine if the document has more than one section
	        if (document.getSections().getCount()>1) {

	            //loop through the sections except the first one
	            for (int i = 1; i < document.getSections().getCount(); i++) {

	                //restart page numbering of the current section
	                document.getSections().get(i).getPageSetup().setRestartPageNumbering(true);
	                
	                //set the starting number to 1 
	                document.getSections().get(i).getPageSetup().setPageStartingNumber(1);
	            }
	        }
	        
	       if(headerStr != null) {
	    	 //get footer object of the first section
		        HeaderFooter header = document.getSections().get(0).getHeadersFooters().getHeader();

		        //add a paragraph to footer
		        Paragraph headerParagraph = header.addParagraph();

		        //append text and automatic page field to the paragraph
		        headerParagraph.appendText(headerStr);
		        headerParagraph.getFormat().setHorizontalAlignment(HorizontalAlignment.Right);
	       }
	       
	       if(footerStr != null) {
		        //add a paragraph to footer
		        Paragraph footerParagraphLeft = footer.addParagraph();

		        //append text and automatic page field to the paragraph
		        footerParagraphLeft.appendText(footerStr);
		        footerParagraphLeft.getFormat().setHorizontalAlignment(HorizontalAlignment.Left);
	       }


	        if(pathToImageFile != null) {
	        	PictureWatermark picture = new PictureWatermark();
		        picture.setPicture(pathToImageFile);
		        picture.setScaling(100);
		        picture.isWashout(false);
		        document.setWatermark(picture);
	        }
	        
	        
	        document.saveToFile(rootPath+"/docs/docxbynct.doc",FileFormat.Doc );
        
	        return rootPath+"/docs/docxbynct.doc";	        
	    }
	 
	    public String htmlTableToDoc(String htmlString, String localFileName) {
	    	String header = "data:application/vnd.ms-word;charset=utf-8," +
	    			  "<html xmlns:o='urn:schemas-microsoft-com:office:office' "+
	    	          "xmlns:w='urn:schemas-microsoft-com:office:word' "+
	    	          "xmlns='http://www.w3.org/TR/REC-html40'>"+
	    	          "<head><meta charset='utf-8'><title>Export HTML to Word Document with JavaScript</title>"  +
	    	         "<style>" +
	    		     "@page WordSection1{size: 11.69in 8.27in;mso-page-orientation: landscape; margin: 1in 0.2in 1in 0.2in}" +
	    		     "div.WordSection1 {page: WordSection1;}" +
	    		     "table{border-collapse:collapse;}td{border:1px black solid;font-size:15px;font-family:'Arial'}"+
	    		     "th{border:1px black solid;font-size:15px;font-family:'Arial'}" +
	    		     "table.textright{margin-right:0px}" +
	    		     "</style>" +
	    	     "</head><body>";
    	     String footer = "</body></html>";
    	     
    	     //htmlString = "data:application/vnd.ms-word;charset=utf-8,%3Chtml%20xmlns%3Ao%3D'urn%3Aschemas-microsoft-com%3Aoffice%3Aoffice'%20xmlns%3Aw%3D'urn%3Aschemas-microsoft-com%3Aoffice%3Aword'%20xmlns%3D'http%3A%2F%2Fwww.w3.org%2FTR%2FREC-html40'%3E%3Chead%3E%3Cmeta%20charset%3D'utf-8'%3E%3Ctitle%3EExport%20HTML%20to%20Word%20Document%20with%20JavaScript%3C%2Ftitle%3E%3Cstyle%3E%40page%20WordSection1%7Bsize%3A%2011.69in%208.27in%3Bmso-page-orientation%3A%20landscape%3B%20margin%3A%201in%200.2in%201in%200.2in%7Ddiv.WordSection1%20%7Bpage%3A%20WordSection1%3B%7Dtable%7Bborder-collapse%3Acollapse%3B%7Dtd%7Bborder%3A1px%20black%20solid%3Bfont-size%3A15px%3Bfont-family%3A%22Arial%22%7Dth%7Bborder%3A1px%20black%20solid%3Bfont-size%3A15px%3Bfont-family%3A%22Arial%22%7Dtable.textright%7Bmargin-right%3A0px%7D%3C%2Fstyle%3E%3C%2Fhead%3E%3Cbody%3E%0A%09%09%09%09%20%09%3Cdiv%20class%3D%22WordSection1%22%3E%0A%20%0A%0A%0A%0A%0A%0A%0A%09%0A%0A%0A%0A%0A%0A%0A%0A%0A%0A%09%0A%09%0A%09%3Ctable%20id%3D%22tableReportCustomerOrder%22%20class%3D%22table%20table-striped%20table-bordered%22%20style%3D%22width%3A%2099%25%3B%20border%3A%201px%20black%20solid%3B%22%3E%0A%09%09%3Cthead%3E%0A%09%09%09%3Ctr%20role%3D%22row%22%3E%0A%09%09%09%09%3Cth%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3Bcolor%3Ablack%22%20class%3D%22textcenter%20code%22%3ES%E1%BB%91%20phi%E1%BA%BFu%3C%2Fth%3E%0A%09%09%09%09%3Cth%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3Bcolor%3Ablack%22%20class%3D%22textcenter%20orderdate%22%3ENg%C3%A0y%3C%2Fth%3E%0A%09%09%09%09%3Cth%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3Bcolor%3Ablack%22%20class%3D%22textcenter%22%3ES%E1%BA%A3n%20ph%E1%BA%A9m%3C%2Fth%3E%0A%09%09%09%09%3Cth%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3Bcolor%3Ablack%22%20class%3D%22textcenter%20content%22%3EN%E1%BB%99i%20dung%3C%2Fth%3E%0A%09%09%09%09%3Cth%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3Bcolor%3Ablack%22%20class%3D%22textcenter%22%3ED%C3%A0i%3C%2Fth%3E%0A%09%09%09%09%3Cth%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3Bcolor%3Ablack%22%20class%3D%22textcenter%22%3ER%E1%BB%99ng%3C%2Fth%3E%0A%09%09%09%09%3Cth%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3Bcolor%3Ablack%22%20class%3D%22textcenter%22%3ES%E1%BB%91%20l%E1%BA%A7n%3C%2Fth%3E%0A%09%09%09%09%3Cth%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3Bcolor%3Ablack%22%20class%3D%22textcenter%20area%22%3EDi%E1%BB%87n%20t%C3%ADch%3C%2Fth%3E%0A%09%09%09%09%3Cth%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3Bcolor%3Ablack%22%20class%3D%22textcenter%20price%22%3E%C4%90%C6%A1n%20gi%C3%A1%3C%2Fth%3E%0A%09%09%09%09%3Cth%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3Bcolor%3Ablack%22%20class%3D%22textcenter%20total%22%3ETh%C3%A0nh%20ti%E1%BB%81n%3C%2Fth%3E%0A%09%09%09%3C%2Ftr%3E%0A%09%09%3C%2Fthead%3E%0A%09%09%3Ctbody%3E%0A%09%09%0A%09%09%09%3C!--%20%3Ctr%20role%3D%22row%22%3E%0A%09%09%09%09%3Ctd%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3B%22%20class%3D%22textcenter%22%3ES%E1%BB%91%20phi%E1%BA%BFu%3C%2Ftd%3E%0A%09%09%09%09%3Ctd%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3B%22%20class%3D%22textcenter%22%3ENg%C3%A0y%3C%2Ftd%3E%0A%09%09%09%09%3Ctd%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3B%22%20class%3D%22textcenter%22%3ES%E1%BA%A3n%20ph%E1%BA%A9m%3C%2Ftd%3E%0A%09%09%09%09%3Ctd%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3B%22%20class%3D%22textcenter%22%3EN%E1%BB%99i%20dung%3C%2Ftd%3E%0A%09%09%09%09%3Ctd%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3B%22%20class%3D%22textcenter%22%3ED%C3%A0i%3C%2Ftd%3E%0A%09%09%09%09%3Ctd%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3B%22%20class%3D%22textcenter%22%3ER%E1%BB%99ng%3C%2Ftd%3E%0A%09%09%09%09%3Ctd%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3B%22%20class%3D%22textcenter%22%3ES%E1%BB%91%20l%E1%BA%A7n%3C%2Ftd%3E%0A%09%09%09%09%3Ctd%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3B%22%20class%3D%22textcenter%22%3EDi%E1%BB%87n%20t%C3%ADch%3C%2Ftd%3E%0A%09%09%09%09%3Ctd%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3B%22%20class%3D%22textcenter%22%3E%C4%90%C6%A1n%20gi%C3%A1%3C%2Ftd%3E%0A%09%09%09%09%3Ctd%20style%3D%22background-color%3A%20rgb(84%2C%20141%2C%20212)%3B%22%20class%3D%22textcenter%22%3ETh%C3%A0nh%20ti%E1%BB%81n%3C%2Ftd%3E%0A%09%09%09%3C%2Ftr%3E%20--%3E%0A%09%09%09%0A%09%09%09%0A%09%09%09%0A%09%09%09%0A%09%09%09%0A%09%09%09%0A%09%09%09%0A%09%09%09%0A%0A%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%09%3Ctr%20style%3D%22background-color%3A%20rgb(184%2C%20204%2C%20228)%3B%22%3E%0A%09%09%09%09%09%09%09%3Ctd%20colspan%3D%222%22%20class%3D%22textcenter%22%20style%3D%22text-align%3A%20center%22%3E%3Cb%3EKH200826235330%3C%2Fb%3E%3C%2Ftd%3E%0A%09%09%09%09%09%09%09%3Ctd%20colspan%3D%222%22%20class%3D%22textcenter%22%20style%3D%22text-align%3A%20center%22%3E%3Cb%3EA%20CH%C3%8D%20C%E1%BB%9C%20%C4%90%E1%BB%8E%3C%2Fb%3E%3C%2Ftd%3E%0A%09%09%09%09%09%09%09%3Ctd%20colspan%3D%226%22%3E%3C%2Ftd%3E%0A%09%09%09%09%09%09%3C%2Ftr%3E%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%09%3Ctr%20role%3D%22row%22%20class%3D%22odd%22%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textcenter%22%20style%3D%22text-align%3A%20center%22%3EDH00110-21105021150%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textcenter%22%20style%3D%22text-align%3A%20center%22%3E05%2F01%2F2021%2002%3A11%3A50%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textleft%22%3EB%E1%BA%A2NG%20HI%E1%BB%86U%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textleft%22%3Eccss%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3E1.0%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3E2.0%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3E3%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3E6.0%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3E25%2C000%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3E150%2C000%3C%2Ftd%3E%0A%09%09%09%09%09%3C%2Ftr%3E%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%09%3Ctr%3E%0A%09%09%09%09%09%09%09%3Ctd%20colspan%3D%224%22%3E%3C%2Ftd%3E%0A%09%09%09%09%09%09%09%3Ctd%20colspan%3D%222%22%20style%3D%22background-color%3Ayellow%22%3ET%E1%BB%95ng%20theo%20kh%C3%A1ch%20h%C3%A0ng%3C%2Ftd%3E%0A%09%09%09%09%09%09%09%3Ctd%20colspan%3D%221%22%20style%3D%22background-color%3Ayellow%22%3ES%E1%BB%91%20%C4%91%C6%A1n%3A%201%3C%2Ftd%3E%0A%09%09%09%09%09%09%09%3Ctd%20colspan%3D%221%22%20style%3D%22background-color%3Ayellow%3B%20text-align%3A%20right%22%20class%3D%22textright%22%3E%0A%09%09%09%09%09%09%09%09Di%E1%BB%87n%20t%C3%ADch%3A%206%3C%2Ftd%3E%0A%09%09%09%09%09%09%09%0A%09%09%09%09%09%09%09%3Ctd%20colspan%3D%222%22%20style%3D%22background-color%3Ayellow%3Btext-align%3A%20right%22%20class%3D%22textright%22%3ES%E1%BB%91%20ti%E1%BB%81n%3A%20150%2C000%20%3C%2Ftd%3E%0A%09%09%09%09%09%09%3C%2Ftr%3E%0A%09%09%09%09%09%09%3Ctr%20style%3D%22background-color%3A%20rgb(184%2C%20204%2C%20228)%3B%22%3E%0A%09%09%09%09%09%09%09%3Ctd%20colspan%3D%222%22%20class%3D%22textcenter%22%20style%3D%22text-align%3A%20center%22%3E%3Cb%3EKH200826235410%3C%2Fb%3E%3C%2Ftd%3E%0A%09%09%09%09%09%09%09%3Ctd%20colspan%3D%222%22%20class%3D%22textcenter%22%20style%3D%22text-align%3A%20center%22%3E%3Cb%3EA%20HO%C3%80N%20TH%E1%BA%A0NH%20TH%E1%BA%AENG%3C%2Fb%3E%3C%2Ftd%3E%0A%09%09%09%09%09%09%09%3Ctd%20colspan%3D%226%22%3E%3C%2Ftd%3E%0A%09%09%09%09%09%09%3C%2Ftr%3E%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%09%3Ctr%20role%3D%22row%22%20class%3D%22odd%22%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textcenter%22%20style%3D%22text-align%3A%20center%22%3EDH00111-21105045821%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textcenter%22%20style%3D%22text-align%3A%20center%22%3E05%2F01%2F2021%2004%3A58%3A21%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textleft%22%3EDECAL%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textleft%22%3ETho%E1%BA%A1i%20%C4%91%E1%BA%A1i%20ca%20Tho%E1%BA%A1i%20Tho%E1%BA%A1i%20%C4%91%E1%BA%A1i%20ca%20Tho%E1%BA%A1i%20Tho%E1%BA%A1i%20%C4%91%E1%BA%A1i%20ca%20Tho%E1%BA%A1i%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3E3.0%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3E2.0%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3E5%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3E30.0%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3E50%2C000%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3E1%2C500%2C000%3C%2Ftd%3E%0A%09%09%09%09%09%3C%2Ftr%3E%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%09%09%3Ctr%3E%0A%09%09%09%09%09%09%3Ctd%20colspan%3D%224%22%3E%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20colspan%3D%222%22%20style%3D%22background-color%3Ayellow%22%3ET%E1%BB%95ng%20theo%20kh%C3%A1ch%20h%C3%A0ng%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20colspan%3D%221%22%20style%3D%22background-color%3Ayellow%22%3ES%E1%BB%91%20%C4%91%C6%A1n%3A%201%3C%2Ftd%3E%0A%09%09%09%09%09%09%3Ctd%20colspan%3D%221%22%20style%3D%22background-color%3Ayellow%3Btext-align%3A%20right%22%20class%3D%22textright%22%3E%0A%09%09%09%09%09%09%09Di%E1%BB%87n%20t%C3%ADch%3A%2030%3C%2Ftd%3E%0A%09%09%09%09%09%09%0A%09%09%09%09%09%09%3Ctd%20colspan%3D%222%22%20style%3D%22background-color%3Ayellow%3Btext-align%3A%20right%22%20class%3D%22textright%22%3ES%E1%BB%91%20ti%E1%BB%81n%3A%201%2C500%2C000%20%3C%2Ftd%3E%0A%09%09%09%09%09%3C%2Ftr%3E%0A%09%09%09%09%0A%09%09%09%09%0A%09%09%09%0A%09%09%09%0A%09%09%09%09%3Ctr%20style%3D%22background-color%3Aaquamarine%22%3E%0A%09%09%09%09%09%3Ctd%20colspan%3D%222%22%3ET%E1%BB%95ng%20c%E1%BB%99ng%3C%2Ftd%3E%0A%09%09%09%09%09%3Ctd%20colspan%3D%224%22%3ES%E1%BB%91%20kh%C3%A1ch%3A%202%3C%2Ftd%3E%0A%09%09%09%09%09%3Ctd%20colspan%3D%221%22%3ES%E1%BB%91%20%C4%91%C6%A1n%3A%202%3C%2Ftd%3E%0A%09%09%09%09%09%3Ctd%20colspan%3D%221%22%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3E%0A%09%09%09%09%09%09Di%E1%BB%87n%20t%C3%ADch%3A%2036%3C%2Ftd%3E%0A%09%09%09%09%09%0A%09%09%09%09%09%3Ctd%20colspan%3D%222%22%20class%3D%22textright%22%20style%3D%22text-align%3A%20right%22%3ES%E1%BB%91%20ti%E1%BB%81n%3A%201%2C650%2C000%20%3C%2Ftd%3E%0A%09%09%09%09%3C%2Ftr%3E%0A%09%09%3C%2Ftbody%3E%0A%09%3C%2Ftable%3E%0A%0A%0A%3C%2Fdiv%3E%0A%09%09%09%09%3C%2Fbody%3E%3C%2Fhtml%3E";
    	     
    	     //htmlString = URLDecoder.decode(htmlString, StandardCharsets.UTF_8);
    	     htmlString = header + htmlString + footer;
    	     
	    	try {
	        	byte[] decodedBytes = htmlString.getBytes();
	        	// Note the try-with-resources block here, to close the stream automatically
	        	try (OutputStream stream = new FileOutputStream(localFileName)) {
	        	    stream.write(decodedBytes);
	        	}
	            return localFileName;
	        } 
	        catch (Exception exception) { 
	            exception.printStackTrace();
	            return null;
	        } 

	    }
	    
	    public void PageSetupHeaderFooter(Document document, String headerStr, String footerStr) {
	    	 //get footer object of the first section
	        HeaderFooter footer = document.getSections().get(0).getHeadersFooters().getFooter();

	        //add a paragraph to footer
	        Paragraph footerParagraph = footer.addParagraph();

	        //append text and automatic page field to the paragraph
	        footerParagraph.appendText("P a g e ").getCharacterFormat().setTextColor(Color.LIGHT_GRAY);
	        footerParagraph.appendField("page number", FieldType.Field_Page);
	        footerParagraph.appendText(" | "+document.getPageCount());
	        footerParagraph.getFormat().setHorizontalAlignment(HorizontalAlignment.Right);

	        //determine if the document has more than one section
	        if (document.getSections().getCount()>1) {

	            //loop through the sections except the first one
	            for (int i = 1; i < document.getSections().getCount(); i++) {

	                //restart page numbering of the current section
	                document.getSections().get(i).getPageSetup().setRestartPageNumbering(true);
	                
	                //set the starting number to 1 
	                document.getSections().get(i).getPageSetup().setPageStartingNumber(1);
	            }
	        }
	        
	       if(headerStr != null) {
	    	 //get footer object of the first section
		        HeaderFooter header = document.getSections().get(0).getHeadersFooters().getHeader();

		        //add a paragraph to footer
		        Paragraph headerParagraph = header.addParagraph();

		        //append text and automatic page field to the paragraph
		        headerParagraph.appendText(headerStr);
		        headerParagraph.getFormat().setHorizontalAlignment(HorizontalAlignment.Right);
	       }
	       
	       if(footerStr != null) {
		        //add a paragraph to footer
		        Paragraph footerParagraphLeft = footer.addParagraph();

		        //append text and automatic page field to the paragraph
		        footerParagraphLeft.appendText(footerStr);
		        footerParagraphLeft.getFormat().setHorizontalAlignment(HorizontalAlignment.Left);
	       }
		}
}

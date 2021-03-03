
package com.printmanagement.service.impl;



import java.awt.Color;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.printmanagement.dto.OrdersDTO;
import com.printmanagement.service.IReportService;
import com.printmanagement.util.WaterMarkToWordUtil;
import com.spire.doc.CellWidthType;
import com.spire.doc.Document;
import com.spire.doc.FileFormat;
import com.spire.doc.Section;
import com.spire.doc.Table;
import com.spire.doc.TableRow;
import com.spire.doc.documents.HorizontalAlignment;
import com.spire.doc.documents.PageOrientation;
import com.spire.doc.documents.PageSize;
import com.spire.doc.documents.Paragraph;
import com.spire.doc.documents.ParagraphStyle;
import com.spire.doc.documents.TableRowHeightType;
import com.spire.doc.documents.VerticalAlignment;
import com.spire.doc.fields.TextRange;

@Service
public class ReportService implements IReportService {
	@Autowired
	private WaterMarkToWordUtil waterMarkUtil;

	@Override
	public void exportReportCustomerOrderWord(List<OrdersDTO> models, String rootPath, String headerStr, String footerStr, String title, String statusTitle, String reportName) {
        //Create a Document object
        Document document = new Document();
        //Add a section
        Section section = document.addSection();
        //Addd Paragraph
        Paragraph paragraph = section.addParagraph();
        paragraph.getFormat().setHorizontalAlignment(HorizontalAlignment.Center);
        TextRange tr = paragraph.appendText("ĐƠN HÀNG" + statusTitle);
        tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
        tr.getCharacterFormat().setFontSize(12);
        tr.getCharacterFormat().setBold(true);
        //Set paragraph after spacing
        paragraph.getFormat().setAfterSpacing(3f);
        paragraph = section.addParagraph();
        paragraph.getFormat().setHorizontalAlignment(HorizontalAlignment.Center);
        tr = paragraph.appendText(title);
        tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
        tr.getCharacterFormat().setFontSize(10);
        tr.getCharacterFormat().setBold(true);
        paragraph.getFormat().setAfterSpacing(10f);
        
        ParagraphStyle style = new ParagraphStyle(document);
        style.setName("FontSize");
        style.getCharacterFormat().setFontName("SVN-Helvetica Neue");
        style.getCharacterFormat().setFontSize(8);
        document.getStyles().add(style);
        paragraph.applyStyle(style.getName());
        
        //Set the page size
        section.getPageSetup().setPageSize(PageSize.A4);
        //Set the page orientation
        section.getPageSetup().setOrientation(PageOrientation.Landscape);
        //set the page margins
        section.getPageSetup().getMargins().setTop(64.8f);
        section.getPageSetup().getMargins().setBottom(45.36f);
        section.getPageSetup().getMargins().setLeft(45f);
        section.getPageSetup().getMargins().setRight(45f);

        //Data used to create table
        String[] header = {"Số phiếu", "Ngày", "Sản phẩm", "Nội dung", "Dài", "Rộng",
        		"Số lần", "Diện tích", "Đơn giá", "Thành tiền"};
        List<Integer> rowCustomTitleCustomerList = new ArrayList<>();
        List<Integer> rowCustomSummaryCustomerList = new ArrayList<>();

        //Add table
        Table table = section.addTable(true);
        table.resetCells(2, header.length);

        //Set the first row as table header and add data
        TableRow row = table.getFirstRow();
        row.isHeader(true);
        row.setHeight(20);
        //row.setHeightType(TableRowHeightType.Auto);
        row.getRowFormat().setBackColor(new Color(84, 141, 212));
        for (int i = 0; i < header.length; i++) {
            row.getCells().get(i).getCellFormat().setVerticalAlignment(VerticalAlignment.Middle);
            Paragraph p = row.getCells().get(i).addParagraph();
            p.getFormat().setHorizontalAlignment(HorizontalAlignment.Center);
            TextRange txtRange = p.appendText(header[i]);
            txtRange.getCharacterFormat().setBold(true);
            txtRange.getCharacterFormat().setFontSize(8);
            txtRange.getCharacterFormat().setFontName("SVN-Helvetica Neue");
        }
        
        Long totalbycustomer = 0L;
        Long total = 0L;
        int count = 0;
        int totalCountCustomer = 0;
        Float totalarea = 0F;
        Float areabycustomer = 0F;
        int countbycustomer = 0;
        Long currentCustomerId = 0L;
        
        for (OrdersDTO model : models) {
        	
        	if(model.getCustomerid() != currentCustomerId) { 
        		if(count == 0) {
        			addRowCustomTitleCustomer(table, model);
        			rowCustomTitleCustomerList.add(table.getRows().getCount()-1);
    			} else {
    				addRowCustomSummaryCustomer(table, countbycustomer, (float)Math.round(areabycustomer * 100) / 100, totalbycustomer); 
    				rowCustomSummaryCustomerList.add(table.getRows().getCount()-1);
    				
    				addRowCustomTitleCustomer(table, model);
    				rowCustomTitleCustomerList.add(table.getRows().getCount()-1);
    			} 
        		
        		totalCountCustomer++;
                totalbycustomer = 0L;
                areabycustomer = 0F;
                countbycustomer = 0;
                currentCustomerId = model.getCustomerid();
    		} 

        	if(model.getCustomerid() == currentCustomerId) {
        		addRowCustom(table, model);
        	}
        	
            totalbycustomer += model.getTotal();
            areabycustomer += model.getArea();
            countbycustomer++;
            count++;
            totalarea += model.getArea();
            total += model.getTotal();
            
            if (count == models.size() && totalCountCustomer > 1) {
            	addRowCustomSummaryCustomer(table, countbycustomer, (float)Math.round(areabycustomer * 100) / 100, totalbycustomer); 
                rowCustomSummaryCustomerList.add(table.getRows().getCount()-1);
            }
        }
        
        addRowCustomSummary(table, totalCountCustomer, count, (float)Math.round(totalarea * 100) / 100, total);

        //Autofit column widths to window
        //table.autoFit(AutoFitBehaviorType.Fixed_Column_Widths);
        
        for(int j =0; j < table.getRows().getCount(); j++) {
			table.getRows().get(j).getCells().get(0).setCellWidth(108, CellWidthType.Point);
			table.getRows().get(j).getCells().get(1).setCellWidth(95, CellWidthType.Point);
			table.getRows().get(j).getCells().get(2).setCellWidth(134, CellWidthType.Point);
			table.getRows().get(j).getCells().get(3).setCellWidth(197, CellWidthType.Point);
			table.getRows().get(j).getCells().get(4).setCellWidth(31, CellWidthType.Point);
			table.getRows().get(j).getCells().get(5).setCellWidth(31, CellWidthType.Point);
			table.getRows().get(j).getCells().get(6).setCellWidth(36, CellWidthType.Point);
			table.getRows().get(j).getCells().get(7).setCellWidth(54, CellWidthType.Point);
			table.getRows().get(j).getCells().get(8).setCellWidth(45, CellWidthType.Point);
			table.getRows().get(j).getCells().get(9).setCellWidth(60, CellWidthType.Point);
			
			table.getRows().get(j).setHeight(19);
			table.getRows().get(j).setHeightType(TableRowHeightType.At_Least);
			
			for(int k = 0; k < 10; k++) {
				table.getRows().get(j).getCells().get(k).getCellFormat().setVerticalAlignment(VerticalAlignment.Middle); 
				
				if(k > 3 && j > 0) {
					try {
						table.getRows().get(j).getCells().get(k).getFirstParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Right);
					} catch (Exception e) {
						continue;
					}
				}			
			}
		}

        for (Integer index : rowCustomTitleCustomerList) {
        	table.getRows().get(index).setHeight(19);
        	table.applyHorizontalMerge(index, 0, 1);
    		table.applyHorizontalMerge(index, 2, 3);
    		table.applyHorizontalMerge(index, 4, 9);
    		TableRow row2 = table.getRows().get(index);
    		for (int f = 0; f < row2.getCells().getCount(); f++) {
                row2.getCells().get(f).getCellFormat().setBackColor(new Color(184, 204, 228));
            }
		}
        
        for (Integer index : rowCustomSummaryCustomerList) {
        	table.getRows().get(index).setHeight(19);
        	table.applyHorizontalMerge(index, 0, 2);
        	table.applyHorizontalMerge(index, 4, 5);
    		table.applyHorizontalMerge(index, 6, 7);
    		table.applyHorizontalMerge(index, 8, 9);
    		TableRow row2 = table.getRows().get(index);
    		for (int f = 1; f < row2.getCells().getCount(); f++) {
                row2.getCells().get(f).getCellFormat().setBackColor(Color.YELLOW);
            }
		}
        
        // Merg Cell total
        table.getRows().get(table.getRows().getCount()-1).setHeight(25);
        table.applyHorizontalMerge(table.getRows().getCount()-1, 0, 3);
		table.applyHorizontalMerge(table.getRows().getCount()-1, 4, 5);
		table.applyHorizontalMerge(table.getRows().getCount()-1, 6, 7);
		table.applyHorizontalMerge(table.getRows().getCount()-1, 8, 9);
		TableRow row2 = table.getRows().get(table.getRows().getCount()-1);
		for (int f = 0; f < row2.getCells().getCount(); f++) {
            row2.getCells().get(f).getCellFormat().setBackColor(Color.GREEN);
        }
        
		table.getRows().remove(table.getRows().get(1));
		
		// Add WaterMark - Header - Footer
		waterMarkUtil.addImageWaterMark(document, rootPath+"/images/watermarkphattin.jpg");
		waterMarkUtil.PageSetupHeaderFooter(document, headerStr, footerStr);
        //save the document
        document.saveToFile(rootPath+"/docs/"+reportName+".docx", FileFormat.Docx);
	}


	private void addRowCustomTitleCustomer(Table table, OrdersDTO model) {
        TableRow dataRow = table.addRow();
        
        TextRange tr = dataRow.getCells().get(0).addParagraph().appendText(model.getCustomer().getCode());
        tr.getCharacterFormat().setFontSize(10);
        tr.getCharacterFormat().setBold(true);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
        dataRow.getCells().get(0).getCellFormat().setVerticalAlignment(VerticalAlignment.Middle);       
        dataRow.getCells().get(0).getFirstParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Center);
              
        tr = dataRow.getCells().get(2).addParagraph().appendText(model.getCustomer().getName());
        tr.getCharacterFormat().setFontSize(10);
        tr.getCharacterFormat().setBold(true);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
        dataRow.getCells().get(2).getCellFormat().setVerticalAlignment(VerticalAlignment.Middle);
        dataRow.getCells().get(2).getFirstParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Center);
       
	}
	
	private void addRowCustom(Table table, OrdersDTO model) {
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		DecimalFormat dFormat = new DecimalFormat();
        TableRow dataRow = table.addRow();
        
        TextRange tr = dataRow.getCells().get(0).addParagraph().appendText(model.getCode());
		tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		
		tr = dataRow.getCells().get(1).addParagraph().appendText(dateFormat.format(model.getOrderDate()));
		tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		
		tr = dataRow.getCells().get(2).addParagraph().appendText(model.getItem().getName());
		tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		
		tr = dataRow.getCells().get(3).addParagraph().appendText(model.getContent());
		tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		
		tr = dataRow.getCells().get(4).addParagraph().appendText(model.getHeight().toString());
		tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		
		tr = dataRow.getCells().get(5).addParagraph().appendText(model.getWidth().toString());
		tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		
		tr = dataRow.getCells().get(6).addParagraph().appendText(model.getQuantity().toString());
		tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		
		tr = dataRow.getCells().get(7).addParagraph().appendText(model.getArea().toString());
		tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		
		tr = dataRow.getCells().get(8).addParagraph().appendText(dFormat.format(model.getPrice()));
		tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		
		tr = dataRow.getCells().get(9).addParagraph().appendText(dFormat.format(model.getTotal()));
		tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");

	}
	
	private void addRowCustomSummaryCustomer(Table table, int countbycustomer, Float areabycustomer, Long totalbycustomer) {
		DecimalFormat dFormat = new DecimalFormat();
        TableRow dataRow = table.addRow();
           
        TextRange tr = dataRow.getCells().get(3).addParagraph().appendText("Tổng theo khách hàng");
        tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		tr.getCharacterFormat().setBold(true);
        dataRow.getCells().get(3).getCellFormat().setVerticalAlignment(VerticalAlignment.Middle);       
        dataRow.getCells().get(3).getFirstParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Left);
              
        tr = dataRow.getCells().get(5).addParagraph().appendText("Số đơn: "+countbycustomer);
        tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		tr.getCharacterFormat().setBold(true);
        dataRow.getCells().get(5).getCellFormat().setVerticalAlignment(VerticalAlignment.Middle);
        dataRow.getCells().get(5).getFirstParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Right);
        
        tr = dataRow.getCells().get(7).addParagraph().appendText("DT: "+areabycustomer);
        tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		tr.getCharacterFormat().setBold(true);
        dataRow.getCells().get(7).getCellFormat().setVerticalAlignment(VerticalAlignment.Middle);
        dataRow.getCells().get(7).getFirstParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Right);
        
        tr = dataRow.getCells().get(9).addParagraph().appendText("Số tiền: "+dFormat.format(totalbycustomer));
        tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		tr.getCharacterFormat().setBold(true);
        dataRow.getCells().get(9).getCellFormat().setVerticalAlignment(VerticalAlignment.Middle);
        dataRow.getCells().get(9).getFirstParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Right);
	}
	
	private void addRowCustomSummary(Table table, int totalcountcustomer, int count, Float totalarea, Long total) {
		DecimalFormat dFormat = new DecimalFormat();
        TableRow dataRow = table.addRow();
           
        TextRange tr = dataRow.getCells().get(0).addParagraph().appendText("Tổng cộng");
        tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		tr.getCharacterFormat().setBold(true);
        dataRow.getCells().get(0).getCellFormat().setVerticalAlignment(VerticalAlignment.Middle);       
        dataRow.getCells().get(0).getFirstParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Left);
              
        tr = dataRow.getCells().get(5).addParagraph().appendText("Số đơn: "+count);
        tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		tr.getCharacterFormat().setBold(true);
        dataRow.getCells().get(5).getCellFormat().setVerticalAlignment(VerticalAlignment.Middle);
        dataRow.getCells().get(5).getFirstParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Right);
        
        tr = dataRow.getCells().get(7).addParagraph().appendText("DT: "+totalarea);
        tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		tr.getCharacterFormat().setBold(true);
        dataRow.getCells().get(7).getCellFormat().setVerticalAlignment(VerticalAlignment.Middle);
        dataRow.getCells().get(7).getFirstParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Right);
        
        tr = dataRow.getCells().get(9).addParagraph().appendText("Số tiền: "+dFormat.format(total));
        tr.getCharacterFormat().setFontSize(8);
		tr.getCharacterFormat().setFontName("SVN-Helvetica Neue");
		tr.getCharacterFormat().setBold(true);
        dataRow.getCells().get(9).getCellFormat().setVerticalAlignment(VerticalAlignment.Middle);
        dataRow.getCells().get(9).getFirstParagraph().getFormat().setHorizontalAlignment(HorizontalAlignment.Right);
	}

}

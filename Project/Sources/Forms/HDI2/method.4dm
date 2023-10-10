
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222(_TabTitles; 0)
		ARRAY TEXT:C222(_Descriptions; 0)
		
		var $emptyField : Text
		
		$emptyField:="-"
		Form:C1466.lastUpdate:=$emptyField
		Form:C1466.editionType:="No changes..."
		Form:C1466.stamp:=$emptyField
		Form:C1466.globalStamp:=$emptyField
		Form:C1466.updateRecords:=$emptyField
		Form:C1466.deletedRecords:=$emptyField
		Form:C1466.refStamp:=$emptyField
		
		Use (Storage:C1525)
			Storage:C1525.tracking:=New shared object:C1526("referenceStamp"; ds:C1482.getGlobalStamp())
			$track:=Storage:C1525.tracking
		End use 
		
		InitMetaValue
		
		READ ONLY:C145([INFO:1])
		ALL RECORDS:C47([INFO:1])
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		
		SELECTION TO ARRAY:C260([INFO:1]TabTitle:3; _TabTitles; [INFO:1]Description:2; _Descriptions)
		
End case 

Form:C1466.trace:=False:C215
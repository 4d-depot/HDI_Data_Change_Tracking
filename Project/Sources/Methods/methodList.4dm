//%attributes = {}
#DECLARE() : Object

var $current : Object

Use (Storage:C1525)
	$current:=Storage:C1525.tracking
End use 

If (This:C1470.__GlobalStamp>=$current.referenceStamp)
	$0:=Form:C1466.meta.color
End if 


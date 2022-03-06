&AtClient
Procedure FinishEditing(Command)

	Structure = New Structure;

	For Each String In ValueTable_Structure Do
		Structure.Insert(String.Key, String.Value);
	EndDo;

	Close(Structure);

EndProcedure

&AtServer
Procedure OnCreateAtServer(Cancel, StandardProcessing)

	If TypeOf(Parameters.ПрошлоеЗначение) = Type("Structure") Then
		For Each String In Parameters.ПрошлоеЗначение Do
			NewLine = ValueTable_Structure.Add();
			NewLine.Key = String.Key;
			NewLine.Value = String.Value;
		EndDo;
	EndIf;

EndProcedure
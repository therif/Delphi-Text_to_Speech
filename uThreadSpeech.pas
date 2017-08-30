unit uThreadSpeech;

interface

uses
  System.Classes, SpeechLib_TLB;

type
  TThreadSpeech = class(TThread)
  zSpVoice: TSpVoice;
  zTextnya : String;
  private
    { Private declarations }
    class procedure MenandaiWord(ASender: TObject; StreamNumber: Integer;
        StreamPosition: OleVariant; CharacterPosition, Length: Integer);
    procedure bacaText;
    procedure selectYgDibaca;
  protected
    procedure Execute; override;
  end;

implementation
uses unit1;

class procedure TThreadSpeech.MenandaiWord(ASender: TObject; StreamNumber: Integer;
  StreamPosition: OleVariant; CharacterPosition, Length: Integer);
begin

  form1.RichEdit1.Lines.BeginUpdate;
  form1.RichEdit1.SelectAll;
  form1.RichEdit1.SelAttributes.Color := 0;

  form1.RichEdit1.SelStart := CharacterPosition;
  form1.RichEdit1.SelLength := Length;
  form1.RichEdit1.SelAttributes.Color := 32768;
  form1.RichEdit1.Lines.EndUpdate;
end;

procedure TThreadSpeech.Execute;
begin
  { Place thread code here }
  zSpVoice := TSpVoice.Create(nil);
  //zSpVoice.OnWord := MenandaiWord;
  Synchronize(bacaText);
end;

procedure TThreadSpeech.bacaText;
begin
  zSpVoice.Speak(zTextnya, SVSFDefault)
end;

procedure TThreadSpeech.selectYgDibaca;
begin
//
end;

end.

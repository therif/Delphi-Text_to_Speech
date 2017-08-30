unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ComObj, SpeechLib_TLB, Vcl.StdCtrls,
  Vcl.OleServer, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo2: TMemo;
    RichEdit1: TRichEdit;
    procedure Button1Click(Sender: TObject);
    procedure SpVoice1Word(ASender: TObject; StreamNumber: Integer;
      StreamPosition: OleVariant; CharacterPosition, Length: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses uThreadSpeech;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var azThreadSpeech : TThreadSpeech;
begin
  azThreadSpeech := TThreadSpeech.Create(True);
  azThreadSpeech.FreeOnTerminate := True;

  azThreadSpeech.zTextnya := RichEdit1.Text;

  azThreadSpeech.Start;
end;

procedure TForm1.SpVoice1Word(ASender: TObject; StreamNumber: Integer;
  StreamPosition: OleVariant; CharacterPosition, Length: Integer);
begin

  RichEdit1.Lines.BeginUpdate;
  RichEdit1.SelectAll;
  RichEdit1.SelAttributes.Color := 0;

  RichEdit1.SelStart := CharacterPosition;
  RichEdit1.SelLength := Length;
  RichEdit1.SelAttributes.Color := clGreen;
  RichEdit1.Lines.EndUpdate;
end;

end.

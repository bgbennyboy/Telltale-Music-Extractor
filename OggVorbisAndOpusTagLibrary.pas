//********************************************************************************************************************************
//*                                                                                                                              *
//*     Ogg Vorbis and Opus Tag Library 1.0.5.11 © 3delite 2012                                                                  *
//*     See Ogg Vorbis and Opus Tag Library Readme.txt for details                                                               *
//*                                                                                                                              *
//* Two licenses are available for commercial usage of this component:                                                           *
//* Shareware License: 50 Euros                                                                                                  *
//* Commercial License: 250 Euros                                                                                                *
//*                                                                                                                              *
//*     http://www.shareit.com/product.html?productid=300552311                                                                  *
//*                                                                                                                              *
//* Using the component in free programs is free.                                                                                *
//*                                                                                                                              *
//*     http://www.3delite.hu/Object%20Pascal%20Developer%20Resources/OpusTagLibrary.html                                        *
//*                                                                                                                              *
//* There is also an ID3v2 Library available at:                                                                                 *
//*                                                                                                                              *
//*     http://www.3delite.hu/Object%20Pascal%20Developer%20Resources/id3v2library.html                                          *
//*                                                                                                                              *
//* an APEv2 Library available at:                                                                                               *
//*                                                                                                                              *
//*     http://www.3delite.hu/Object%20Pascal%20Developer%20Resources/APEv2Library.html                                          *
//*                                                                                                                              *
//* an MP4 Tag Library available at:                                                                                             *
//*                                                                                                                              *
//*     http://www.3delite.hu/Object%20Pascal%20Developer%20Resources/MP4TagLibrary.html                                         *
//*                                                                                                                              *
//* For other Delphi components see the home page:                                                                               *
//*                                                                                                                              *
//*     http://www.3delite.hu/                                                                                                   *
//*                                                                                                                              *
//* If you have any questions or enquiries please mail: 3delite@3delite.hu                                                       *
//*                                                                                                                              *
//* Good coding! :)                                                                                                              *
//* 3delite                                                                                                                      *
//********************************************************************************************************************************

unit OggVorbisAndOpusTagLibrary;

{$Optimization On}

interface

Uses
    Classes;

Const
    OPUSTAGLIBRARY_VERSION = $01000511;

Const
    OPUSTAGLIBRARY_SUCCESS                              = 0;
    OPUSTAGLIBRARY_ERROR                                = $FFFF;
    OPUSTAGLIBRARY_ERROR_NO_TAG_FOUND                   = 1;
    OPUSTAGLIBRARY_ERROR_EMPTY_TAG                      = 2;
    OPUSTAGLIBRARY_ERROR_EMPTY_FRAMES                   = 3;
    OPUSTAGLIBRARY_ERROR_OPENING_FILE                   = 4;
    OPUSTAGLIBRARY_ERROR_READING_FILE                   = 5;
    OPUSTAGLIBRARY_ERROR_WRITING_FILE                   = 6;
    OPUSTAGLIBRARY_ERROR_CORRUPT                        = 7;
    OPUSTAGLIBRARY_ERROR_NOT_SUPPORTED_VERSION          = 8;
    OPUSTAGLIBRARY_ERROR_NOT_SUPPORTED_FORMAT           = 9;
    OPUSTAGLIBRARY_ERROR_NEED_EXCLUSIVE_ACCESS          = 10;

Const
    OGG_PAGE_ID = 'OggS';
    //* Opus
    OPUS_PARAMETERS_ID = 'OpusHead';
    OPUS_TAG_ID = 'OpusTags';
    OPUSTAGLIBRARY_FRAMENAME_METADATA_BLOCK_PICTURE = 'METADATA_BLOCK_PICTURE';
    OPUSTAGLIBRARY_FRAMENAME_PADDING = 'PADDING';
    OPUSTAGLIBRARY_PADDING_BYTE = '#';
    //* Vorbis
    VORBIS_PARAMETERS_ID = #1 + 'vorbis';
    VORBIS_TAG_ID = #3 + 'vorbis';

Const
    OGG_PAGE_SEGMENT_SIZE = 17;

type
    // Ogg page header
    TOggHeader = packed record
        ID: array [1..4] of AnsiChar;                             { Always "OggS" }
        StreamVersion: Byte;                           { Stream structure version }
        TypeFlag: Byte;                                        { Header type flag }
        AbsolutePosition: Int64;                      { Absolute granule position }
        Serial: Integer;                                   { Stream serial number }
        PageNumber: Integer;                               { Page sequence number }
        Checksum: Cardinal;                                       { Page checksum }
        Segments: Byte;                                 { Number of page segments }
        LacingValues: array [1..$FF] of Byte;     { Lacing values - segment sizes }
     end;

    // Opus parameter header
    TOpusHeader = packed record
        ID: array [1..8] of AnsiChar;                         { Always "OpusHead" }
        BitstreamVersion: Byte;                        { Bitstream version number }
        ChannelCount: Byte;                                  { Number of channels }
        PreSkip: Word;
        SampleRate: LongWord;                                  { Sample rate (hz) }
        OutputGain: Word;
        MappingFamily: Byte;                                            { 0,1,255 }
    end;

    // Opus tag data
    TOpusTags = record
        ID: array [1..8] of AnsiChar;                         { Always "OpusTags" }
        Fields: Integer;                                   { Number of tag fields }
     end;

    // Vorbis parameter header
    TVorbisHeader = packed record
        ID: array [1..7] of AnsiChar;                      { Always #1 + "vorbis" }
        BitstreamVersion: array [1..4] of Byte;        { Bitstream version number }
        ChannelMode: Byte;                                   { Number of channels }
        SampleRate: Integer;                                   { Sample rate (hz) }
        BitRateMaximal: Integer;                           { Bit rate upper limit }
        BitRateNominal: Integer;                               { Nominal bit rate }
        BitRateMinimal: Integer;                           { Bit rate lower limit }
        BlockSize: Byte;                   { Coded size for small and long blocks }
        StopFlag: Byte;                                                { Always 1 }
    end;

    { Vorbis tag data }
    TVorbisTag = record
        ID: array [1..7] of AnsiChar;                      { Always #3 + "vorbis" }
        Fields: Integer;                                   { Number of tag fields }
    end;

type
    // Opus file data
    TFileInfo = record
        FPage, SPage, LPage: TOggHeader;            { First, second and last page }
        OpusParameters: TOpusHeader;                      { Opus parameter header }
        Tag: TOpusTags;                                           { Opus tag data }
        VorbisParameters: TVorbisHeader;
        VorbisTag: TVorbisTag;
        ChannelMapping: Array [0..7] of Byte;
        FileSize: Integer;                                    { File size (bytes) }
        ID3v2Size: Integer;                              { ID3v2 tag size (bytes) }
        SPagePos: Integer;                          { Position of second Ogg page }
        TagEndPos: Integer;                                    { Tag end position }
        TagCount: Integer;
        DataPageNumberStartsFrom: Int64;
    end;

type
    TOGGStream = class
        FStream: TStream;
        LastPageQueried: Int64;
        FirstOGGHeader: TOggHeader;
        Constructor Create(SourceStream: TStream);
    public
        function GetPage(PageNumber: Int64; Stream: TStream): Boolean;
        function GetPageData(PageNumber: Int64; Stream: TStream): Boolean;
        function GetNextPage(Stream: TStream): Boolean;
        function GetNextPageData(Stream: TStream): Boolean;
        function CreateTagStream(TagStream: TStream; OutputOGGStream: TStream): Integer;
        function CreateTagStreamVorbis(TagSize: Integer; TagStream: TStream; OutputOGGStream: TStream): Integer;
        function CalculateWrappedStreamSize(InputDataSize: Integer): Integer;
        function CalculateWrappedStreamSizeVorbis(TagSize: Integer; InputDataSize: Integer): Integer;
        function CalculateWrappedStreamSizeEx(InputDataSize: Integer; MustFitSize: Integer; var PaddingNeeded: Integer): Integer;
        function ReNumberPages(PageNumberStartsFrom: Int64; Source, Destination: TStream): Boolean;
    end;

type
    TOggFormat = (ofUnknown, ofVorbis, ofOpus);


type
    TOpusTagFrameFormat = (otffUnknown, otffText, otffCoverArt, otffBinary);

type
    TOpusTagFrame = class
    private
    public
        Name: AnsiString;
        Format: TOpusTagFrameFormat;
        Stream: TMemoryStream;
        Index: Integer;
        Constructor Create;
        Destructor Destroy; override;
        function GetAsText: String;
        function SetAsText(Text: String): Boolean;
        function GetAsList(var List: TStrings): Boolean;
        function SetAsList(List: TStrings): Boolean;
        function IsCoverArt: Boolean;
        procedure Clear;
        function Assign(OpusTagFrame: TOpusTagFrame): Boolean;
        function CalculateTotalFrameSize: Integer;
    end;

type
    TOpusTag = class
    private
    public
        FileName: String;
        Loaded: Boolean;
        Frames: Array of TOpusTagFrame;
        Info: TFileInfo;
        VendorString: String;
        FirstOGGPage: TMemoryStream;
        WritePadding: Boolean;
        PaddingSize: Cardinal;
        Format: TOggFormat;
        VorbisData: TMemoryStream;
        Constructor Create;
        Destructor Destroy; override;
        procedure FillDefault;
        function LoadFromFile(FileName: String): Integer;
        function LoadFromStream(TagStream: TStream): Integer;
        function SaveToFile(FileName: String): Integer;
        //function SaveToStream(var TagStream: TStream): Integer;
        function AddFrame(Name: String): TOpusTagFrame;
        function DeleteFrame(FrameIndex: Integer): Boolean;
        procedure DeleteAllFrames;
        procedure Clear;
        function Count: Integer;
        function FrameExists(Name: AnsiString): Integer; overload;
        function FrameTypeCount(Name: String): Integer;
        function CalculateTotalFramesSize: Integer;
        function CalculateTagSize(IncludePadding: Boolean): Integer;
        procedure AddTextFrame(Name: String; Text: String);
        function AddBinaryFrame(Name: String; BinaryStream: TStream): Boolean;
        function SetBinaryFrame(FrameIndex: Integer; BinaryStream: TStream): Boolean;
        procedure SetTextFrameText(Name: String; Text: String);
        procedure SetListFrameText(Name: String; List: TStrings);
        function ReadFrameByNameAsText(Name: String): String;
        function ReadFrameByNameAsList(Name: String; var List: TStrings): Boolean;
        function ReadBinaryFrame(FrameIndex: Integer; BinaryStream: TStream): Boolean; overload;
        function ReadBinaryFrame(Name: String; BinaryStream: TStream): Boolean; overload;
        procedure RemoveEmptyFrames;
        function AddPictureFrame(PictureStream: TStream; PictureType: Cardinal; MIMEType: AnsiString; Description: String; Width: Cardinal; Height: Cardinal; ColorDepth: Cardinal; NoOfColors: Cardinal): Boolean;
        function SetPictureFrame(Index: Integer; PictureStream: TStream; PictureType: Cardinal; MIMEType: AnsiString; Description: String; Width: Cardinal; Height: Cardinal; ColorDepth: Cardinal; NoOfColors: Cardinal): Boolean;
        function GetPictureFromFrame(Index: Integer; var PictureStream: TStream; var PictureType: Cardinal; var MIMEType: AnsiString; var Description: String; var Width: Cardinal; var Height: Cardinal; var ColorDepth: Cardinal; var NoOfColors: Cardinal): Boolean;
        function DeleteFrameByName(Name: String): Boolean;
        function Assign(Source: TOpusTag): Boolean;
        procedure SetTagItem(const Data: AnsiString; DataStream: TMemoryStream);
        procedure ReadTag(const Source: TStream; OGGStream: TOGGStream);
        function GetInfo(SourceFile: TStream): Boolean;
        function BuildTag(var Stream: TMemoryStream; PaddingSize: Cardinal): Boolean;
        function AdjustPadding(TagSize: Cardinal): Boolean;
    end;

    function RemoveOpusTagFromFile(FileName: String): Integer;

    function RebuildFile(FileName: String; Info: TFileInfo; TagOGGStream: TStream; ReplaceMode: Boolean): Integer;

    procedure CalculateCRC(var CRC: Cardinal; const Data; Size: Cardinal);
    function SetCRC(const Destination: TStream; Header: TOggHeader): Boolean;

    function ReverseBytes(Value: Cardinal): Cardinal;

    procedure EncodeStream(Input, Output: TStream);
    procedure DecodeStream(Input, Output: TStream);

Const
    // CRC table for checksum calculating
    CRC_TABLE: array [0..$FF] of Cardinal = (
    $00000000, $04C11DB7, $09823B6E, $0D4326D9, $130476DC, $17C56B6B,
    $1A864DB2, $1E475005, $2608EDB8, $22C9F00F, $2F8AD6D6, $2B4BCB61,
    $350C9B64, $31CD86D3, $3C8EA00A, $384FBDBD, $4C11DB70, $48D0C6C7,
    $4593E01E, $4152FDA9, $5F15ADAC, $5BD4B01B, $569796C2, $52568B75,
    $6A1936C8, $6ED82B7F, $639B0DA6, $675A1011, $791D4014, $7DDC5DA3,
    $709F7B7A, $745E66CD, $9823B6E0, $9CE2AB57, $91A18D8E, $95609039,
    $8B27C03C, $8FE6DD8B, $82A5FB52, $8664E6E5, $BE2B5B58, $BAEA46EF,
    $B7A96036, $B3687D81, $AD2F2D84, $A9EE3033, $A4AD16EA, $A06C0B5D,
    $D4326D90, $D0F37027, $DDB056FE, $D9714B49, $C7361B4C, $C3F706FB,
    $CEB42022, $CA753D95, $F23A8028, $F6FB9D9F, $FBB8BB46, $FF79A6F1,
    $E13EF6F4, $E5FFEB43, $E8BCCD9A, $EC7DD02D, $34867077, $30476DC0,
    $3D044B19, $39C556AE, $278206AB, $23431B1C, $2E003DC5, $2AC12072,
    $128E9DCF, $164F8078, $1B0CA6A1, $1FCDBB16, $018AEB13, $054BF6A4,
    $0808D07D, $0CC9CDCA, $7897AB07, $7C56B6B0, $71159069, $75D48DDE,
    $6B93DDDB, $6F52C06C, $6211E6B5, $66D0FB02, $5E9F46BF, $5A5E5B08,
    $571D7DD1, $53DC6066, $4D9B3063, $495A2DD4, $44190B0D, $40D816BA,
    $ACA5C697, $A864DB20, $A527FDF9, $A1E6E04E, $BFA1B04B, $BB60ADFC,
    $B6238B25, $B2E29692, $8AAD2B2F, $8E6C3698, $832F1041, $87EE0DF6,
    $99A95DF3, $9D684044, $902B669D, $94EA7B2A, $E0B41DE7, $E4750050,
    $E9362689, $EDF73B3E, $F3B06B3B, $F771768C, $FA325055, $FEF34DE2,
    $C6BCF05F, $C27DEDE8, $CF3ECB31, $CBFFD686, $D5B88683, $D1799B34,
    $DC3ABDED, $D8FBA05A, $690CE0EE, $6DCDFD59, $608EDB80, $644FC637,
    $7A089632, $7EC98B85, $738AAD5C, $774BB0EB, $4F040D56, $4BC510E1,
    $46863638, $42472B8F, $5C007B8A, $58C1663D, $558240E4, $51435D53,
    $251D3B9E, $21DC2629, $2C9F00F0, $285E1D47, $36194D42, $32D850F5,
    $3F9B762C, $3B5A6B9B, $0315D626, $07D4CB91, $0A97ED48, $0E56F0FF,
    $1011A0FA, $14D0BD4D, $19939B94, $1D528623, $F12F560E, $F5EE4BB9,
    $F8AD6D60, $FC6C70D7, $E22B20D2, $E6EA3D65, $EBA91BBC, $EF68060B,
    $D727BBB6, $D3E6A601, $DEA580D8, $DA649D6F, $C423CD6A, $C0E2D0DD,
    $CDA1F604, $C960EBB3, $BD3E8D7E, $B9FF90C9, $B4BCB610, $B07DABA7,
    $AE3AFBA2, $AAFBE615, $A7B8C0CC, $A379DD7B, $9B3660C6, $9FF77D71,
    $92B45BA8, $9675461F, $8832161A, $8CF30BAD, $81B02D74, $857130C3,
    $5D8A9099, $594B8D2E, $5408ABF7, $50C9B640, $4E8EE645, $4A4FFBF2,
    $470CDD2B, $43CDC09C, $7B827D21, $7F436096, $7200464F, $76C15BF8,
    $68860BFD, $6C47164A, $61043093, $65C52D24, $119B4BE9, $155A565E,
    $18197087, $1CD86D30, $029F3D35, $065E2082, $0B1D065B, $0FDC1BEC,
    $3793A651, $3352BBE6, $3E119D3F, $3AD08088, $2497D08D, $2056CD3A,
    $2D15EBE3, $29D4F654, $C5A92679, $C1683BCE, $CC2B1D17, $C8EA00A0,
    $D6AD50A5, $D26C4D12, $DF2F6BCB, $DBEE767C, $E3A1CBC1, $E760D676,
    $EA23F0AF, $EEE2ED18, $F0A5BD1D, $F464A0AA, $F9278673, $FDE69BC4,
    $89B8FD09, $8D79E0BE, $803AC667, $84FBDBD0, $9ABC8BD5, $9E7D9662,
    $933EB0BB, $97FFAD0C, $AFB010B1, $AB710D06, $A6322BDF, $A2F33668,
    $BCB4666D, $B8757BDA, $B5365D03, $B1F740B4);

const
    EncodeTable: array[0..63] of AnsiChar =
        AnsiString('ABCDEFGHIJKLMNOPQRSTUVWXYZ') +
        AnsiString('abcdefghijklmnopqrstuvwxyz') +
        AnsiString('0123456789+/');

    DecodeTable: array[#0..#127] of Integer = (
        Byte('='), 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
            64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
            64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 62, 64, 64, 64, 63,
            52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 64, 64, 64, 64, 64, 64,
            64,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
            15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 64, 64, 64, 64, 64,
            64, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
            41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 64, 64, 64, 64, 64);

type
    PPacket = ^TPacket;
    TPacket = packed record
        case Integer of
            0: (b0, b1, b2, b3: Byte);
            1: (i: Integer);
            2: (a: array[0..3] of Byte);
            3: (c: array[0..3] of AnsiChar);
        end;

var
    OpusTagLibraryWritePadding: Boolean = False;
    OpusTagLibraryPaddingSize: Cardinal = 2048;

implementation

Uses
    {$IFDEF MSWINDOWS}
    Windows,
    {$ENDIF}
    SysUtils;

procedure EncodePacket(const Packet: TPacket; NumChars: Integer; OutBuf: PAnsiChar);
begin
  OutBuf[0] := EnCodeTable[Packet.a[0] shr 2];
  OutBuf[1] := EnCodeTable[((Packet.a[0] shl 4) or (Packet.a[1] shr 4)) and $0000003f];
  if NumChars < 2 then
    OutBuf[2] := '='
  else OutBuf[2] := EnCodeTable[((Packet.a[1] shl 2) or (Packet.a[2] shr 6)) and $0000003f];
  if NumChars < 3 then
    OutBuf[3] := '='
  else OutBuf[3] := EnCodeTable[Packet.a[2] and $0000003f];
end;

function DecodePacket(InBuf: PAnsiChar; var nChars: Integer): TPacket;
begin
  Result.a[0] := (DecodeTable[InBuf[0]] shl 2) or
    (DecodeTable[InBuf[1]] shr 4);
  NChars := 1;
  if InBuf[2] <> '=' then
  begin
    Inc(NChars);
    Result.a[1] := Byte((DecodeTable[InBuf[1]] shl 4) or (DecodeTable[InBuf[2]] shr 2));
  end;
  if InBuf[3] <> '=' then
  begin
    Inc(NChars);
    Result.a[2] := Byte((DecodeTable[InBuf[2]] shl 6) or DecodeTable[InBuf[3]]);
  end;
end;

procedure EncodeStream(Input, Output: TStream);
type
  PInteger = ^Integer;
var
  InBuf: array[0..509] of Byte;
  OutBuf: array[0..1023] of AnsiChar;
  BufPtr: PAnsiChar;
  I, J, K, BytesRead: Integer;
  Packet: TPacket;
begin
  K := 0;
  repeat
    BytesRead := Input.Read(InBuf, SizeOf(InBuf));
    I := 0;
    BufPtr := OutBuf;
    while I < BytesRead do
    begin
      if BytesRead - I < 3 then
        J := BytesRead - I
      else J := 3;
      Packet.i := 0;
      Packet.b0 := InBuf[I];
      if J > 1 then
        Packet.b1 := InBuf[I + 1];
      if J > 2 then
        Packet.b2 := InBuf[I + 2];
      EncodePacket(Packet, J, BufPtr);
      Inc(I, 3);
      Inc(BufPtr, 4);
      Inc(K, 4);
    end;
    Output.Write(Outbuf, BufPtr - PChar(@OutBuf));
  until BytesRead = 0;
end;

procedure DecodeStream(Input, Output: TStream);
var
  InBuf: array[0..75] of AnsiChar;
  OutBuf: array[0..60] of Byte;
  InBufPtr, OutBufPtr: PAnsiChar;
  I, J, K, BytesRead: Integer;
  Packet: TPacket;

  procedure SkipWhite;
  var
    C: AnsiChar;
    NumRead: Integer;
  begin
    while True do
    begin
      NumRead := Input.Read(C, 1);
      if NumRead = 1 then
      begin
        if C in ['0'..'9','A'..'Z','a'..'z','+','/','='] then
        begin
          Input.Position := Input.Position - 1;
          Break;
        end;
      end else Break;
    end;
  end;

  function ReadInput: Integer;
  var
    WhiteFound, EndReached : Boolean;
    CntRead, Idx, IdxEnd: Integer;
  begin
    IdxEnd:= 0;
    repeat
      WhiteFound := False;
      CntRead := Input.Read(InBuf[IdxEnd], (SizeOf(InBuf)-IdxEnd));
      EndReached := CntRead < (SizeOf(InBuf)-IdxEnd);
      Idx := IdxEnd;
      IdxEnd := CntRead + IdxEnd;
      while (Idx < IdxEnd) do
      begin
        if not (InBuf[Idx] in ['0'..'9','A'..'Z','a'..'z','+','/','=']) then
        begin
          Dec(IdxEnd);
          if Idx < IdxEnd then
            Move(InBuf[Idx+1], InBuf[Idx], IdxEnd-Idx);
          WhiteFound := True;
        end
        else
          Inc(Idx);
      end;
    until (not WhiteFound) or (EndReached);
    Result := IdxEnd;
  end;

begin
  repeat
    SkipWhite;
    BytesRead := ReadInput;
    InBufPtr := InBuf;
    OutBufPtr := @OutBuf;
    I := 0;
    while I < BytesRead do
    begin
      Packet := DecodePacket(InBufPtr, J);
      K := 0;
      while J > 0 do
      begin
        OutBufPtr^ := AnsiChar(Packet.a[K]);
        Inc(OutBufPtr);
        Dec(J);
        Inc(K);
      end;
      Inc(InBufPtr, 4);
      Inc(I, 4);
    end;
    Output.Write(OutBuf, OutBufPtr - PAnsiChar(@OutBuf));
  until BytesRead = 0;
end;

function ReverseBytes(Value: Cardinal): Cardinal;
begin
    Result := (Value SHR 24) OR (Value SHL 24) OR ((Value AND $00FF0000) SHR 8) OR ((Value AND $0000FF00) SHL 8);
end;

Constructor TOGGStream.Create(SourceStream: TStream);
var
    PreviousPosition: Int64;
begin
    FStream := SourceStream;
    try
        if Assigned(SourceStream) then begin
            PreviousPosition := FStream.Position;
            FStream.Read(FirstOGGHeader, SizeOf(TOggHeader));
            FStream.Seek(PreviousPosition, soBeginning);
        end;
    except
        //*
    end;
end;

function GetPageDataSize(Header: TOggHeader): Integer;
var
    i: Integer;
begin
    Result := 0;
    i := 1;
    repeat
        Result := Result + Header.LacingValues[i];
        Inc(i);
    until i > Header.Segments;
end;

function GetPageHeaderSize(Header: TOggHeader): Integer;
begin
    Result := 27 + Header.Segments;
end;

function GetPageSize(Header: TOggHeader): Integer;
begin
    Result := GetPageHeaderSize(Header) + GetPageDataSize(Header);
end;

function TOGGStream.GetPage(PageNumber: Int64; Stream: TStream): Boolean;
var
    Header: TOggHeader;
    PageCounter: Int64;
    DataSize: Integer;
    PageSize: Integer;
    //PageHeaderSize: Integer;
begin
    Result := False;
    try
        LastPageQueried := PageNumber;
        PageCounter := 0;
        FStream.Seek(0, soBeginning);
        repeat
            FillChar(Header, SizeOf(TOggHeader), 0);
            FStream.Read(Header, SizeOf(TOggHeader) - SizeOf(Header.LacingValues));
            FStream.Read(Header.LacingValues, Header.Segments);
            PageSize := GetPageSize(Header);
            //PageHeaderSize := GetPageHeaderSize(Header);
            DataSize := GetPageDataSize(Header);
            Inc(PageCounter);
            if PageCounter = PageNumber then begin
                FStream.Seek(- (SizeOf(TOggHeader) - SizeOf(Header.LacingValues)) - Header.Segments, soCurrent);
                Stream.CopyFrom(FStream, PageSize);
                Result := True;
                Break;
            end else begin
                FStream.Seek(DataSize, soCurrent);
            end;
        until FStream.Position = FStream.Size;
    except
        Result := False;
    end;
end;

function TOGGStream.GetPageData(PageNumber: Int64; Stream: TStream): Boolean;
var
    Header: TOggHeader;
    PageCounter: Int64;
    DataSize: Integer;
    //PageHeaderSize: Integer;
begin
    Result := False;
    try
        LastPageQueried := PageNumber;
        PageCounter := 0;
        FStream.Seek(0, soBeginning);
        repeat
            FillChar(Header, SizeOf(TOggHeader), 0);
            FStream.Read(Header, SizeOf(TOggHeader) - SizeOf(Header.LacingValues));
            FStream.Read(Header.LacingValues, Header.Segments);
            DataSize := GetPageDataSize(Header);
            //PageHeaderSize := GetPageHeaderSize(Header);
            Inc(PageCounter);
            if PageCounter = PageNumber then begin
                Stream.CopyFrom(FStream, DataSize);
                Result := True;
                Break;
            end else begin
                FStream.Seek(DataSize, soCurrent);
            end;
        until FStream.Position = FStream.Size;
    except
        Result := False;
    end;
end;

function TOGGStream.GetNextPage(Stream: TStream): Boolean;
var
    Header: TOggHeader;
    //DataSize: Integer;
    PageSize: Integer;
    //PageHeaderSize: Integer;
begin
    try
        FillChar(Header, SizeOf(TOggHeader), 0);
        FStream.Read(Header, SizeOf(TOggHeader) - SizeOf(Header.LacingValues));
        FStream.Read(Header.LacingValues, Header.Segments);
        PageSize := GetPageSize(Header);
        //PageHeaderSize := GetPageHeaderSize(Header);
        //DataSize := GetPageDataSize(Header);
        FStream.Seek(- (SizeOf(TOggHeader) - SizeOf(Header.LacingValues)) - Header.Segments, soCurrent);
        Stream.CopyFrom(FStream, PageSize);
        Inc(LastPageQueried);
        Result := True;
    except
        Result := False;
    end;
end;

function TOGGStream.GetNextPageData(Stream: TStream): Boolean;
var
    Header: TOggHeader;
    DataSize: Integer;
    //PageHeaderSize: Integer;
begin
    try
        FillChar(Header, SizeOf(TOggHeader), 0);
        FStream.Read(Header, SizeOf(TOggHeader) - SizeOf(Header.LacingValues));
        FStream.Read(Header.LacingValues, Header.Segments);
        DataSize := GetPageDataSize(Header);
        //PageHeaderSize := GetPageHeaderSize(Header);
        Stream.CopyFrom(FStream, DataSize);
        Inc(LastPageQueried);
        Result := True;
    except
        Result := False;
    end;
end;

function TOGGStream.CreateTagStream(TagStream: TStream; OutputOGGStream: TStream): Integer;
var
    Header: TOggHeader;
    DataSize: Integer;
    i: Integer;
    OGGPage: TMemoryStream;
begin
    try
        Result := 0;
        Header := FirstOGGHeader;
        Header.TypeFlag := 0;
        Header.AbsolutePosition := 0 {- 1};
        Header.PageNumber := 1;
        Header.Checksum := 0;
        OGGPage := TMemoryStream.Create;
        try
            while TagStream.Position < TagStream.Size do begin
                FillChar(Header.LacingValues, SizeOf(Header.LacingValues), 0);
                if TagStream.Size - TagStream.Position > OGG_PAGE_SEGMENT_SIZE * High(Byte) then begin
                    DataSize := OGG_PAGE_SEGMENT_SIZE * High(Byte);
                    Header.Segments := OGG_PAGE_SEGMENT_SIZE;
                    for i := 1 to High(Header.LacingValues) do begin
                        Header.LacingValues[i] := $FF;
                    end;
                end else begin
                    DataSize := TagStream.Size - TagStream.Position;
                    if DataSize MOD $FF = 0 then begin
                        Header.Segments := DataSize div $FF;
                    end else begin
                        Header.Segments := (DataSize div $FF) + 1;
                    end;
                    for i := 1 to Header.Segments do begin
                        Header.LacingValues[i] := $FF;
                    end;
                    if DataSize mod $FF <> 0 then begin
                        Header.LacingValues[Header.Segments] := (DataSize mod $FF);
                    end;
                end;
                OGGPage.Clear;
                OGGPage.Write(Header, SizeOf(TOggHeader) - SizeOf(Header.LacingValues));
                OGGPage.Write(Header.LacingValues, Header.Segments);
                OGGPage.CopyFrom(TagStream, DataSize);
                OGGPage.Seek(0, soBeginning);
                SetCRC(OGGPage, Header);
                OGGPage.Seek(0, soBeginning);
                OutputOGGStream.CopyFrom(OGGPage, OGGPage.Size);
                Header.TypeFlag := 1;
                Header.Checksum := 0;
                Inc(Header.PageNumber);
                Inc(Result);
            end;
        finally
            FreeAndNil(OGGPage);
        end;
    except
        Result := 0;
    end;
end;

function TOGGStream.CreateTagStreamVorbis(TagSize: Integer; TagStream: TStream; OutputOGGStream: TStream): Integer;
var
    Header: TOggHeader;
    DataSize: Integer;
    i: Integer;
    OGGPage: TMemoryStream;
    TagSegments: Integer;
    TagDataSize: Integer;
begin
    try
        Result := 0;
        Header := FirstOGGHeader;
        Header.TypeFlag := 0;
        Header.AbsolutePosition := 0 {- 1};
        //Header.PageNumber := 1;
        Header.Checksum := 0;
        OGGPage := TMemoryStream.Create;
        try
            while TagStream.Position < TagStream.Size do begin
                FillChar(Header.LacingValues, SizeOf(Header.LacingValues), 0);
                if TagSize > 0 then begin
                    if TagSize > OGG_PAGE_SEGMENT_SIZE * High(Byte) then begin
                        DataSize := OGG_PAGE_SEGMENT_SIZE * High(Byte);
                        Header.Segments := OGG_PAGE_SEGMENT_SIZE;
                        for i := 1 to High(Header.LacingValues) do begin
                            Header.LacingValues[i] := $FF;
                        end;
                        Dec(TagSize, DataSize);
                    end else begin
                        DataSize := TagSize;
                        Dec(TagSize, DataSize);
                        if DataSize MOD $FF = 0 then begin
                            Header.Segments := DataSize div $FF;
                        end else begin
                            Header.Segments := (DataSize div $FF) + 1;
                        end;
                        TagSegments := Header.Segments;
                        TagDataSize := DataSize;
                        for i := 1 to Header.Segments do begin
                            Header.LacingValues[i] := $FF;
                        end;
                        if DataSize mod $FF <> 0 then begin
                            Header.LacingValues[Header.Segments] := (DataSize mod $FF);
                        end;
                        DataSize := TagStream.Size - TagStream.Position;
                        if (DataSize - TagDataSize) MOD $FF = 0 then begin
                            Header.Segments := Header.Segments + ((DataSize - TagDataSize) div $FF);
                        end else begin
                            Header.Segments := Header.Segments + ((DataSize - TagDataSize) div $FF) + 1;
                        end;
                        for i := TagSegments + 1 to Header.Segments do begin
                            Header.LacingValues[i] := $FF;
                        end;
                        if ((DataSize - TagDataSize) mod $FF) <> 0 then begin
                            Header.LacingValues[Header.Segments] := ((DataSize - TagDataSize) mod $FF);
                        end;
                    end;
                end else begin
                    if TagStream.Size - TagStream.Position > OGG_PAGE_SEGMENT_SIZE * High(Byte) then begin
                        DataSize := OGG_PAGE_SEGMENT_SIZE * High(Byte);
                        Header.Segments := OGG_PAGE_SEGMENT_SIZE;
                        for i := 1 to High(Header.LacingValues) do begin
                            Header.LacingValues[i] := $FF;
                        end;
                    end else begin
                        DataSize := TagStream.Size - TagStream.Position;
                        if DataSize MOD $FF = 0 then begin
                            Header.Segments := DataSize div $FF;
                        end else begin
                            Header.Segments := (DataSize div $FF) + 1;
                        end;
                        for i := 1 to Header.Segments do begin
                            Header.LacingValues[i] := $FF;
                        end;
                        if DataSize mod $FF <> 0 then begin
                            Header.LacingValues[Header.Segments] := (DataSize mod $FF);
                        end;
                    end;
                end;
                OGGPage.Clear;
                OGGPage.Write(Header, SizeOf(TOggHeader) - SizeOf(Header.LacingValues));
                OGGPage.Write(Header.LacingValues, Header.Segments);
                OGGPage.CopyFrom(TagStream, DataSize);
                OGGPage.Seek(0, soBeginning);
                SetCRC(OGGPage, Header);
                OGGPage.Seek(0, soBeginning);
                OutputOGGStream.CopyFrom(OGGPage, OGGPage.Size);
                Header.TypeFlag := 1;
                Header.Checksum := 0;
                Inc(Header.PageNumber);
                Inc(Result);
            end;
        finally
            FreeAndNil(OGGPage);
        end;
    except
        Result := 0;
    end;
end;

function TOGGStream.CalculateWrappedStreamSize(InputDataSize: Integer): Integer;
var
    Header: TOggHeader;
    DataSize: Integer;
    i: Integer;
    DataLeft: Integer;
begin
    try
        Result := 0;
        DataLeft := InputDataSize;
        while DataLeft > 0 do begin
            if DataLeft > OGG_PAGE_SEGMENT_SIZE * High(Byte) then begin
                DataSize := OGG_PAGE_SEGMENT_SIZE * High(Byte);
                Header.Segments := OGG_PAGE_SEGMENT_SIZE;
            end else begin
                DataSize := DataLeft;
                if DataSize MOD $FF = 0 then begin
                    Header.Segments := DataSize div $FF;
                end else begin
                    Header.Segments := (DataSize div $FF) + 1;
                end;
            end;
            Inc(Result, SizeOf(TOggHeader) - SizeOf(Header.LacingValues));
            Inc(Result, Header.Segments);
            Inc(Result, DataSize);
            Dec(DataLeft, DataSize);
        end;
    except
        Result := 0;
    end;
end;

function TOGGStream.CalculateWrappedStreamSizeVorbis(TagSize: Integer; InputDataSize: Integer): Integer;
var
    Header: TOggHeader;
    DataSize: Integer;
    i: Integer;
    DataLeft: Integer;
    TagSegments: Integer;
    TagDataSize: Integer;
begin
    try
        Result := 0;
        DataLeft := InputDataSize;
        while DataLeft > 0 do begin
            if TagSize > 0 then begin

                if TagSize > OGG_PAGE_SEGMENT_SIZE * High(Byte) then begin
                    DataSize := OGG_PAGE_SEGMENT_SIZE * High(Byte);
                    Header.Segments := OGG_PAGE_SEGMENT_SIZE;
                    Dec(TagSize, DataSize);
                end else begin
                    DataSize := TagSize;
                    Dec(TagSize, DataSize);
                    if DataSize MOD $FF = 0 then begin
                        Header.Segments := DataSize div $FF;
                    end else begin
                        Header.Segments := (DataSize div $FF) + 1;
                    end;
                    TagSegments := Header.Segments;
                    TagDataSize := DataSize;

                    DataSize := DataLeft;
                    if (DataSize - TagDataSize) MOD $FF = 0 then begin
                        Header.Segments := Header.Segments + ((DataSize - TagDataSize) div $FF);
                    end else begin
                        Header.Segments := Header.Segments + ((DataSize - TagDataSize) div $FF) + 1;
                    end;

                end;
                {
                if TagSize > OGG_PAGE_SEGMENT_SIZE * High(Byte) then begin
                    DataSize := OGG_PAGE_SEGMENT_SIZE * High(Byte);
                    Header.Segments := OGG_PAGE_SEGMENT_SIZE;
                    Dec(TagSize, DataSize);
                end else begin
                    DataSize := TagSize;
                    Dec(TagSize, DataSize);
                    if DataSize MOD $FF = 0 then begin
                        Header.Segments := DataSize div $FF;
                    end else begin
                        Header.Segments := (DataSize div $FF) + 1;
                    end;
                    TagSegments := Header.Segments;
                    TagDataSize := DataSize;
                    DataSize := DataLeft;
                    if (DataSize - TagDataSize) div $FF = 0 then begin
                        Header.Segments := Header.Segments + ((DataSize - TagDataSize) div $FF);
                    end else begin
                        Header.Segments := Header.Segments + ((DataSize - TagDataSize) div $FF) + 1;
                    end;
                end;
                }
            end else begin
                if DataLeft > OGG_PAGE_SEGMENT_SIZE * High(Byte) then begin
                    DataSize := OGG_PAGE_SEGMENT_SIZE * High(Byte);
                    Header.Segments := OGG_PAGE_SEGMENT_SIZE;
                end else begin
                    DataSize := DataLeft;
                    if DataSize MOD $FF = 0 then begin
                        Header.Segments := DataSize div $FF;
                    end else begin
                        Header.Segments := (DataSize div $FF) + 1;
                    end;
                end;
            end;
            Inc(Result, SizeOf(TOggHeader) - SizeOf(Header.LacingValues));
            Inc(Result, Header.Segments);
            Inc(Result, DataSize);
            Dec(DataLeft, DataSize);
        end;
    except
        Result := 0;
    end;
end;

function TOGGStream.CalculateWrappedStreamSizeEx(InputDataSize: Integer; MustFitSize: Integer; var PaddingNeeded: Integer): Integer;
var
    Header: TOggHeader;
    DataSize: Integer;
    i: Integer;
    DataLeft: Integer;
begin
    try
        Result := 0;
        DataLeft := InputDataSize + MustFitSize;
        while DataLeft > 0 do begin
            if (DataLeft > OGG_PAGE_SEGMENT_SIZE * High(Byte))
            OR (DataLeft < MustFitSize)
            then begin
                DataSize := OGG_PAGE_SEGMENT_SIZE * High(Byte);
                Header.Segments := OGG_PAGE_SEGMENT_SIZE;
                if DataLeft < MustFitSize then begin
                    PaddingNeeded := DataSize - MustFitSize;
                end;
            end else begin
                DataSize := DataLeft;
                if DataSize MOD $FF = 0 then begin
                    Header.Segments := DataSize div $FF;
                end else begin
                    Header.Segments := (DataSize div $FF) + 1;
                end;
            end;
            Inc(Result, SizeOf(TOggHeader) - SizeOf(Header.LacingValues));
            Inc(Result, Header.Segments);
            Inc(Result, DataSize);
            Dec(DataLeft, DataSize);
        end;
    except
        Result := 0;
    end;
end;

function TOGGStream.ReNumberPages(PageNumberStartsFrom: Int64; Source, Destination: TStream): Boolean;
var
    Header: TOggHeader;
    OGGPage: TMemoryStream;
    PageCounter: Int64;
begin
    try
        Result := False;
        FillChar(Header, SizeOf(TOggHeader), 0);
        PageCounter := PageNumberStartsFrom;
        OGGPage := TMemoryStream.Create;
        try
            while Source.Position < Source.Size do begin
                OGGPage.Clear;
                GetNextPage(OGGPage);
                OGGPage.Seek(0, soBeginning);
                OGGPage.Read(Header, SizeOf(TOggHeader) - SizeOf(Header.LacingValues));
                OGGPage.Read(Header.LacingValues, Header.Segments);
                OGGPage.Seek(0, soBeginning);
                Header.PageNumber := PageCounter;
                Header.Checksum := 0;
                OGGPage.Write(Header, SizeOf(TOggHeader) - SizeOf(Header.LacingValues));
                OGGPage.Seek(0, soBeginning);
                SetCRC(OGGPage, Header);
                OGGPage.Seek(0, soBeginning);
                Destination.CopyFrom(OGGPage, OGGPage.Size);
                Inc(PageCounter);
            end;
            Result := True;
        finally
            FreeAndNil(OGGPage);
        end;
    except
        Result := False;
    end;
end;

Constructor TOpusTagFrame.Create;
begin
    Inherited;
    Name := '';
    Stream := TMemoryStream.Create;
    Format := otffUnknown;
end;

Destructor TOpusTagFrame.Destroy;
begin
    FreeAndNil(Stream);
    Inherited;
end;

function TOpusTagFrame.GetAsText: String;
var
    i: Integer;
    Data: Byte;
    AnsiStr: AnsiString;
begin
    Result := '';
    if Format <> otffText then begin
        Exit;
    end;
    Stream.Seek(0, soBeginning);
    for i := 0 to Stream.Size - 1 do begin
        Stream.Read(Data, 1);
        AnsiStr := AnsiStr + AnsiChar(Data);
    end;
    Stream.Seek(0, soBeginning);
    Result := UTF8Decode(AnsiStr);
end;

function TOpusTagFrame.SetAsText(Text: String): Boolean;
var
    AnsiStr: AnsiString;
begin
    Result := False;
    AnsiStr := UTF8Encode(Text);
    Stream.Clear;
    Stream.Write(Pointer(AnsiStr)^, Length(AnsiStr));
    Stream.Seek(0, soBeginning);
    Format := otffText;
    Result := True;
end;

function TOpusTagFrame.SetAsList(List: TStrings): Boolean;
var
    i: Integer;
    Data: Byte;
    Name: AnsiString;
    Value: AnsiString;
begin
    Result := False;
    Stream.Clear;
    for i := 0 to List.Count - 1 do begin
        Name := UTF8Encode(List.Names[i]);
        Value := UTF8Encode(List.ValueFromIndex[i]);
        Stream.Write(Pointer(Name)^, Length(Name));
        Data := $0D;
        Stream.Write(Data, 1);
        Data := $0A;
        Stream.Write(Data, 1);
        Stream.Write(Pointer(Value)^, Length(Value));
        Data := $0D;
        Stream.Write(Data, 1);
        Data := $0A;
        Stream.Write(Data, 1);
    end;
    Stream.Seek(0, soBeginning);
    Format := otffText;
    Result := True;
end;

function TOpusTagFrame.GetAsList(var List: TStrings): Boolean;
var
    Data: Byte;
    AnsiStr: AnsiString;
    Name: String;
    Value: String;
begin
    Result := False;
    List.Clear;
    if Format <> otffText then begin
        Exit;
    end;
    Stream.Seek(0, soBeginning);
    while Stream.Position < Stream.Size do begin
        AnsiStr := '';
        repeat
            Stream.Read(Data, 1);
            if Data = $0D then begin
                Stream.Read(Data, 1);
                if Data = $0A then begin
                    Break;
                end;
            end;
            AnsiStr := AnsiStr + AnsiChar(Data);
        until Stream.Position >= Stream.Size;
        Name := UTF8Decode(AnsiStr);
        AnsiStr := '';
        repeat
            Stream.Read(Data, 1);
            if Data = $0D then begin
                Stream.Read(Data, 1);
                if Data = $0A then begin
                    Break;
                end;
            end;
            AnsiStr := AnsiStr + AnsiChar(Data);
        until Stream.Position >= Stream.Size;
        Value := UTF8Decode(AnsiStr);
        List.Append(Name + '=' + Value);
        Result := True;
    end;
    Stream.Seek(0, soBeginning);
end;

function TOpusTagFrame.IsCoverArt: Boolean;
begin
    Result := Format = otffCoverArt;
end;

procedure TOpusTagFrame.Clear;
begin
    Format := otffUnknown;
    Stream.Clear;
end;

function TOpusTagFrame.CalculateTotalFrameSize: Integer;
begin
    Result := Length(Name) + 1 + Stream.Size;
end;

function TOpusTagFrame.Assign(OpusTagFrame: TOpusTagFrame): Boolean;
begin
    Result := False;
    Clear;
    if OpusTagFrame <> nil then begin
        Format := OpusTagFrame.Format;
        OpusTagFrame.Stream.Seek(0, soBeginning);
        Stream.CopyFrom(OpusTagFrame.Stream, OpusTagFrame.Stream.Size);
        Stream.Seek(0, soBeginning);
        OpusTagFrame.Stream.Seek(0, soBeginning);
    end;
    Result := True;
end;

Constructor TOpusTag.Create;
begin
    Inherited;
    Clear;
    FillDefault;
    FirstOGGPage := TMemoryStream.Create;
    WritePadding := OpusTagLibraryWritePadding;
    PaddingSize := OpusTagLibraryPaddingSize;
    VorbisData := TMemoryStream.Create;
end;

Destructor TOpusTag.Destroy;
begin
    Clear;
    FreeAndNil(FirstOGGPage);
    FreeAndNil(VorbisData);
    Inherited;
end;

procedure TOpusTag.FillDefault;
begin
    Info.FPage.ID := OGG_PAGE_ID;
    Info.FPage.StreamVersion := 0;
    Info.FPage.TypeFlag := 0;
    Info.FPage.AbsolutePosition := 0;
    Info.FPage.Serial := 0;
    Info.FPage.PageNumber := 1;
    Info.FPage.Checksum := 0;
    Info.FPage.Segments := 1;
    Info.FPage.LacingValues[1] := 19;

    Info.SPage.ID := OGG_PAGE_ID;
    Info.SPage.StreamVersion := 0;
    Info.SPage.TypeFlag := 0;
    Info.SPage.AbsolutePosition := 0;
    Info.SPage.Serial := 0;
    Info.SPage.PageNumber := 2;
    Info.SPage.Checksum := 0;
    Info.SPage.Segments := 1;
    Info.SPage.LacingValues[1] := 19;

    Info.OpusParameters.ID := OPUS_PARAMETERS_ID;
    Info.OpusParameters.BitstreamVersion := 0;
    Info.OpusParameters.ChannelCount := 0;
    Info.OpusParameters.PreSkip := 0;
    Info.OpusParameters.SampleRate := 0;
    Info.OpusParameters.OutputGain := 0;
    Info.OpusParameters.MappingFamily := 0;

    Info.Tag.ID := OPUS_TAG_ID;
    Info.Tag.Fields := 0;

    Info.VorbisTag.ID := VORBIS_TAG_ID;

    Info.SPagePos := 47;
end;

procedure TOpusTag.DeleteAllFrames;
var
    i: Integer;
begin
    for i := 0 to Length(Frames) - 1 do begin
        FreeAndNil(Frames[i]);
    end;
    SetLength(Frames, 0);
end;

function TOpusTag.LoadFromStream(TagStream: TStream): Integer;
var
    PreviousPosition: Int64;
begin
    Result := OPUSTAGLIBRARY_ERROR;
    Loaded := False;
    Format := ofUnknown;
    Clear;
    try
        PreviousPosition := TagStream.Position;
        try
            Loaded := GetInfo(TagStream);
        finally
            TagStream.Seek(PreviousPosition, soBeginning);
        end;
        if Loaded then begin
            Result := OPUSTAGLIBRARY_SUCCESS;
        end;
    except
        Result := OPUSTAGLIBRARY_ERROR;
    end;
end;

function TOpusTag.LoadFromFile(FileName: String): Integer;
var
    FileStream: TFileStream;
begin
    Result := OPUSTAGLIBRARY_ERROR;
    //Clear;
    Loaded := False;
    Format := ofUnknown;
    if NOT FileExists(FileName) then begin
        Result := OPUSTAGLIBRARY_ERROR_OPENING_FILE;
        Exit;
    end;
    try
        FileStream := TFileStream.Create(FileName, fmOpenRead OR fmShareDenyWrite);
    except
        Result := OPUSTAGLIBRARY_ERROR_OPENING_FILE;
        Exit;
    end;
    try
        Result := LoadFromStream(FileStream);
        if (Result = OPUSTAGLIBRARY_SUCCESS)
        OR (Result = OPUSTAGLIBRARY_ERROR_NOT_SUPPORTED_VERSION)
        then begin
            Self.FileName := FileName;
        end;
    finally
        FreeAndNil(FileStream);
    end;
end;

function TOpusTag.AddFrame(Name: String): TOpusTagFrame;
begin
    Result := nil;
    try
        SetLength(Frames, Length(Frames) + 1);
        Frames[Length(Frames) - 1] := TOpusTagFrame.Create;
        Frames[Length(Frames) - 1].Name := Name;
        Frames[Length(Frames) - 1].Index := Length(Frames) - 1;
        Result := Frames[Length(Frames) - 1];
    except
        //*
    end;
end;

function TOpusTag.DeleteFrame(FrameIndex: Integer): Boolean;
var
    i: Integer;
    j: Integer;
begin
    Result := False;
    if (FrameIndex >= Length(Frames))
    OR (FrameIndex < 0)
    then begin
        Exit;
    end;
    FreeAndNil(Frames[FrameIndex]);
    i := 0;
    j := 0;
    while i <= Length(Frames) - 1 do begin
        if Frames[i] <> nil then begin
            Frames[j] := Frames[i];
            Frames[j].Index := i;
            Inc(j);
        end;
        Inc(i);
    end;
    SetLength(Frames, j);
    Result := True;
end;

function TOpusTag.FrameExists(Name: AnsiString): Integer;
var
    i: Integer;
begin
    Result := -1;
    for i := 0 to Length(Frames) - 1 do begin
        if Name = Frames[i].Name then begin
            Result := i;
            Break;
        end;
    end;
end;

function TOpusTag.FrameTypeCount(Name: String): Integer;
var
    i: Integer;
begin
    Result := 0;
    for i := 0 to Length(Frames) - 1 do begin
        if WideUpperCase(Name) = WideUpperCase(Frames[i].Name) then begin
            Inc(Result);
        end;
    end;
end;

function TOpusTag.BuildTag(var Stream: TMemoryStream; PaddingSize: Cardinal): Boolean;
var
    Fields, Size: Integer;
    VendorStringAnsi: AnsiString;
    i: Integer;
    Data: Byte;
begin
    Fields := Count;
    // Write frame ID, vendor info and number of fields
    if Format = ofOpus then begin
        Stream.Write(Info.Tag.ID, SizeOf(Info.Tag.ID));
    end;
    if Format = ofVorbis then begin
        Stream.Write(Info.VorbisTag.ID, SizeOf(Info.VorbisTag.ID));
    end;
    VendorStringAnsi := UTF8Encode(VendorString);
    Size := Length(VendorStringAnsi);
    Stream.Write(Size, SizeOf(Size));
    Stream.Write(Pointer(VendorStringAnsi)^, Size);
    Stream.Write(Fields, SizeOf(Fields));
    // Write tag fields
    for i := 0 to Count - 1 do begin
        Size := Length(Frames[i].Name) + 1 + Frames[i].Stream.Size;
        Stream.Write(Size, SizeOf(Size));
        Stream.Write(Pointer(Frames[i].Name)^, Length(Frames[i].Name));
        Data := Ord('=');
        Stream.Write(Data, 1);
        Frames[i].Stream.Seek(0, soBeginning);
        Stream.CopyFrom(Frames[i].Stream, Frames[i].Stream.Size);
        Frames[i].Stream.Seek(0, soBeginning);
    end;

    if Format = ofVorbis then begin
        Data := 1;
        Stream.Write(Data, 1);
    end;

    for i := 0 to PaddingSize - 1 do begin
        Data := 0;
        Stream.Write(Data, 1);
    end;
    {
    if Format = ofVorbis then begin
        VorbisData.Seek(0, soBeginning);
        Stream.CopyFrom(VorbisData, VorbisData.Size)
    end;
    }
    Stream.Seek(0, soBeginning);
end;

function TOpusTag.CalculateTagSize(IncludePadding: Boolean): Integer;
var
    TotalTagSize: Integer;
    VendorStringUTF8: AnsiString;
    PaddingFrameIndex: Integer;
begin
    TotalTagSize := CalculateTotalFramesSize;
    VendorStringUTF8 := UTF8Encode(VendorString);
    TotalTagSize := 8 + 4 + Length(VendorStringUTF8) + 4 + TotalTagSize;
    if NOT IncludePadding then begin
        PaddingFrameIndex := FrameExists('PADDING');
        if PaddingFrameIndex > - 1 then begin
            TotalTagSize := TotalTagSize - Frames[PaddingFrameIndex].CalculateTotalFrameSize;
        end;
    end;
    //* Not needed becouse vorbis tag header is exactly 1 less then Opus
    //if Format = ofVorbis then begin
    //    Inc(TotalTagSize);
    //end;
    Result := TotalTagSize;
end;

function TOpusTag.CalculateTotalFramesSize: Integer;
var
    TotalFramesSize: Integer;
    i: Integer;

begin
    TotalFramesSize := 0;
    for i := 0 to Length(Frames) - 1 do begin
        TotalFramesSize := TotalFramesSize + Frames[i].CalculateTotalFrameSize + 4;
    end;
    Result := TotalFramesSize;
end;

procedure TOpusTag.Clear;
begin
    DeleteAllFrames;
    FileName := '';
    Loaded := False;
    VendorString := '';
    FillChar(Info.ChannelMapping, SizeOf(Info.ChannelMapping), 0);
end;

function TOpusTag.Count: Integer;
begin
    Result := Length(Frames);
end;

procedure TOpusTag.AddTextFrame(Name: String; Text: String);
begin
    AddFrame(Name).SetAsText(Text);
end;

function TOpusTag.AddBinaryFrame(Name: String; BinaryStream: TStream): Boolean;
var
    FrameIndex: Integer;
begin
    FrameIndex := AddFrame(Name).Index;
    Result := SetBinaryFrame(FrameIndex, BinaryStream);
end;

function TOpusTag.SetBinaryFrame(FrameIndex: Integer; BinaryStream: TStream): Boolean;
var
    PreviousPosition: Int64;
    EncodedStream: TMemoryStream;
begin
    if (FrameIndex >= Length(Frames))
    OR (FrameIndex < 0)
    then begin
        Exit;
    end;
    EncodedStream := TMemoryStream.Create;
    try
        PreviousPosition := BinaryStream.Position;
        BinaryStream.Seek(0, soBeginning);
        EncodeStream(BinaryStream, EncodedStream);
        EncodedStream.Seek(0, soBeginning);
        Frames[FrameIndex].Stream.Clear;
        Frames[FrameIndex].Stream.CopyFrom(EncodedStream, EncodedStream.Size);
        Frames[FrameIndex].Stream.Seek(0, soBeginning);
        Frames[FrameIndex].Format := otffBinary;
        BinaryStream.Seek(PreviousPosition, soBeginning);
    finally
        FreeAndNil(EncodedStream);
    end;
end;

function TOpusTag.ReadBinaryFrame(Name: String; BinaryStream: TStream): Boolean;
var
    FrameIndex: Integer;
begin
    Result := False;
    FrameIndex := FrameExists(Name);
    if FrameIndex = - 1 then begin
        Exit;
    end;
    Result := ReadBinaryFrame(FrameIndex, BinaryStream);
end;

function TOpusTag.ReadBinaryFrame(FrameIndex: Integer; BinaryStream: TStream): Boolean;
var
    DecodedStream: TMemoryStream;
begin
    Result := False;
    if (FrameIndex >= Length(Frames))
    OR (FrameIndex < 0)
    then begin
        Exit;
    end;
    DecodedStream := TMemoryStream.Create;
    try
        Frames[FrameIndex].Stream.Seek(0, soBeginning);
        DecodeStream(Frames[FrameIndex].Stream, DecodedStream);
        DecodedStream.Seek(0, soBeginning);
        BinaryStream.CopyFrom(DecodedStream, DecodedStream.Size);
    finally
        Frames[FrameIndex].Stream.Seek(0, soBeginning);
        FreeAndNil(DecodedStream);
    end;
end;

procedure TOpusTag.SetTextFrameText(Name: String; Text: String);
var
    i: Integer;
    l: Integer;
begin
    i := 0;
    l := Length(Frames);
    while (i < l)
    AND (WideUpperCase(Frames[i].Name) <> WideUpperCase(Name))
    do begin
        inc(i);
    end;
    if i = l then begin
        AddTextFrame(Name, Text);
    end else begin
        Frames[i].SetAsText(Text);
    end;
end;

procedure TOpusTag.SetListFrameText(Name: String; List: TStrings);
var
    i: Integer;
    l: Integer;
begin
    i := 0;
    l := Length(Frames);
    while (i < l)
    AND (WideUpperCase(Frames[i].Name) <> WideUpperCase(Name))
    do begin
        inc(i);
    end;
    if i = l then begin
        AddFrame(Name).SetAsList(List);
    end else begin
        Frames[i].SetAsList(List);
    end;
end;

function TOpusTag.ReadFrameByNameAsText(Name: String): String;
var
    i: Integer;
    l: Integer;
begin
    Result := '';
    l := Length(Frames);
    i := 0;
    while (i <> l)
    AND (WideUpperCase(Frames[i].Name) <> WideUpperCase(Name))
    do begin
        inc(i);
    end;
    if i = l then begin
        Result := '';
    end else begin
        if Frames[i].Format = otffText then begin
            Result := Frames[i].GetAsText;
        end;
    end;
end;

function TOpusTag.ReadFrameByNameAsList(Name: String; var List: TStrings): Boolean;
var
    i: Integer;
    l: Integer;
begin
    Result := False;
    l := Length(Frames);
    i := 0;
    while (i <> l)
    AND (WideUpperCase(Frames[i].Name) <> WideUpperCase(Name))
    do begin
        inc(i);
    end;
    if i = l then begin
        Result := False;
    end else begin
        if Frames[i].Format = otffText then begin
            Result := Frames[i].GetAsList(List);
        end;
    end;
end;

procedure TOpusTag.RemoveEmptyFrames;
var
    i: Integer;
begin
    for i := Length(Frames) - 1 downto 0 do begin
        if Frames[i].Stream.Size = 0 then begin
            DeleteFrame(i);
        end;
    end;
end;

function TOpusTag.AddPictureFrame(PictureStream: TStream; PictureType: Cardinal; MIMEType: AnsiString; Description: String; Width: Cardinal; Height: Cardinal; ColorDepth: Cardinal; NoOfColors: Cardinal): Boolean;
begin
    Result := False;
    try
        Result := SetPictureFrame(AddFrame(OPUSTAGLIBRARY_FRAMENAME_METADATA_BLOCK_PICTURE).Index, PictureStream, PictureType, MIMEType, Description, Width, Height, ColorDepth, NoOfColors);
    except
        Result := False;
    end;
end;

function TOpusTag.SetPictureFrame(Index: Integer; PictureStream: TStream; PictureType: Cardinal; MIMEType: AnsiString; Description: String; Width: Cardinal; Height: Cardinal; ColorDepth: Cardinal; NoOfColors: Cardinal): Boolean;
var
    MIMETypeLength: Cardinal;
    DescriptionLength: Cardinal;
    LengthOfPictureData: Cardinal;
    DescriptionAnsi: AnsiString;
    EncodedStream: TMemoryStream;
    NewStream: TMemoryStream;
begin
    Result := False;
    if Frames[Index].Name <> OPUSTAGLIBRARY_FRAMENAME_METADATA_BLOCK_PICTURE then begin
        Exit;
    end;
    try
        try
            NewStream := TMemoryStream.Create;
            EncodedStream := TMemoryStream.Create;
            Frames[Index].Stream.Clear;
            PictureType := ReverseBytes(PictureType);
            NewStream.Write(PictureType, 4);
            MIMEType := LowerCase(MIMEType);
            MIMETypeLength := ReverseBytes(Length(MIMEType));
            NewStream.Write(MIMETypeLength, 4);
            NewStream.Write(PANSIChar(MIMEType)^, Length(MIMEType));
            DescriptionAnsi := UTF8Encode(Description);
            DescriptionLength := ReverseBytes(Length(DescriptionAnsi));
            NewStream.Write(DescriptionLength, 4);
            NewStream.Write(PANSIChar(DescriptionAnsi)^, Length(DescriptionAnsi));
            Width := ReverseBytes(Width);
            NewStream.Write(Width, 4);
            Height := ReverseBytes(Height);
            NewStream.Write(Height, 4);
            ColorDepth := ReverseBytes(ColorDepth);
            NewStream.Write(ColorDepth, 4);
            NoOfColors := ReverseBytes(NoOfColors);
            NewStream.Write(NoOfColors, 4);
            LengthOfPictureData := ReverseBytes(PictureStream.Size);
            NewStream.Write(LengthOfPictureData, 4);
            PictureStream.Seek(0, soBeginning);
            NewStream.CopyFrom(PictureStream, PictureStream.Size);
            NewStream.Seek(0, soBeginning);
            EncodeStream(NewStream, EncodedStream);
            EncodedStream.Seek(0, soBeginning);
            Frames[Index].Stream.CopyFrom(EncodedStream, EncodedStream.Size);
            Frames[Index].Stream.Seek(0, soBeginning);
            Result := True;
        finally
            Frames[Index].Format := otffCoverArt;
            FreeAndNil(EncodedStream);
            FreeAndNil(NewStream);
        end;
    except
        Result := False;
    end;
end;

function TOpusTag.GetPictureFromFrame(Index: Integer; var PictureStream: TStream; var PictureType: Cardinal; var MIMEType: AnsiString; var Description: String; var Width: Cardinal; var Height: Cardinal; var ColorDepth: Cardinal; var NoOfColors: Cardinal): Boolean;
var
    DataByte: Byte;
    MIMETypeLength: Cardinal;
    DescriptionLength: Cardinal;
    LengthOfPictureData: Cardinal;
    DescriptionAnsi: AnsiString;
    DecodedStream: TMemoryStream;
    i: Integer;
begin
    Result := False;
    if Frames[Index].Name <> OPUSTAGLIBRARY_FRAMENAME_METADATA_BLOCK_PICTURE then begin
        Exit;
    end;
    try
        try
            PictureType := 0;
            MIMEType := '';
            Description := '';
            Width := 0;
            Height := 0;
            ColorDepth := 0;
            NoOfColors := 0;
            DecodedStream := TMemoryStream.Create;
            Frames[Index].Stream.Seek(0, soBeginning);
            DecodeStream(Frames[Index].Stream, DecodedStream);
            DecodedStream.Seek(0, soBeginning);
            DecodedStream.Read(PictureType, 4);
            PictureType := ReverseBytes(PictureType);
            DecodedStream.Read(MIMETypeLength, 4);
            MIMETypeLength := ReverseBytes(MIMETypeLength);
            for i := 0 to MIMETypeLength - 1 do begin
                DecodedStream.Read(DataByte, 1);
                MIMEType := MIMEType + AnsiChar(DataByte);
            end;
            DecodedStream.Read(DescriptionLength, 4);
            DescriptionLength := ReverseBytes(DescriptionLength);
            for i := 0 to DescriptionLength - 1 do begin
                DecodedStream.Read(DataByte, 1);
                DescriptionAnsi := DescriptionAnsi + AnsiChar(DataByte);
            end;
            Description := UTF8Decode(DescriptionAnsi);
            DecodedStream.Read(Width, 4);
            Width := ReverseBytes(Width);
            DecodedStream.Read(Height, 4);
            Height := ReverseBytes(Height);
            DecodedStream.Read(ColorDepth, 4);
            ColorDepth := ReverseBytes(ColorDepth);
            DecodedStream.Read(NoOfColors, 4);
            NoOfColors := ReverseBytes(NoOfColors);
            DecodedStream.Read(LengthOfPictureData, 4);
            LengthOfPictureData := ReverseBytes(LengthOfPictureData);
            PictureStream.CopyFrom(DecodedStream, LengthOfPictureData);
            PictureStream.Seek(0, soBeginning);
            Result := True;
        finally
            FreeAndNil(DecodedStream);
        end;
    except
        Result := False;
    end;
end;

function TOpusTag.DeleteFrameByName(Name: String): Boolean;
var
    i: Integer;
    l: Integer;
    j: Integer;
begin
    Result := False;
    l := Length(Frames);
    i := 0;
    while (i <> l) and (WideUpperCase(Frames[i].Name) <> WideUpperCase(Name)) do begin
        inc(i);
    end;
    if i = l then begin
        Result := False;
        Exit;
    end;
    FreeAndNil(Frames[i]);
    i := 0;
    j := 0;
    while i <= l - 1 do begin
        if Frames[i] <> nil then begin
            Frames[j] := Frames[i];
            Inc(j);
        end;
        Inc(i);
    end;
    SetLength(Frames, j);
    Result := True;
end;

function TOpusTag.Assign(Source: TOpusTag): Boolean;
var
    i: Integer;
begin
    Result := False;
    Clear;
    FileName := Source.FileName;
    Format := Source.Format;
    Loaded := Source.Loaded;
    VendorString := Source.VendorString;
    for i := 0 to Length(Source.Frames) - 1 do begin
        AddFrame(Source.Frames[i].Name).Assign(Source.Frames[i]);
    end;
    Result := True;
end;

procedure UnSyncSafe(var Source; const SourceSize: Integer; var Dest: Cardinal);
type
    TBytes = array [0..MaxInt - 1] of Byte;
var
    I: Byte;
begin
    { Test : Source = $01 $80 -> Dest = 255
             Source = $02 $00 -> Dest = 256
             Source = $02 $01 -> Dest = 257 etc.
    }
    Dest := 0;
    for I := 0 to SourceSize - 1 do begin
        Dest := Dest shl 7;
        Dest := Dest or (TBytes(Source)[I] and $7F); // $7F = %01111111
    end;
end;

procedure TOpusTag.SetTagItem(const Data: AnsiString; DataStream: TMemoryStream);
var
    Separator: Integer;
    FieldID: string;
begin
    Separator := Pos('=', Data);
    if Separator > 0 then begin
        FieldID := UpperCase(Copy(Data, 1, Separator - 1));
        with AddFrame(FieldID) do begin
            DataStream.Seek(Separator, soBeginning);
            if DataStream.Size - Separator > 0 then begin
                Stream.CopyFrom(DataStream, DataStream.Size - Separator);
            end;
            if FieldID = OPUSTAGLIBRARY_FRAMENAME_METADATA_BLOCK_PICTURE then begin
                Format := otffCoverArt;
            end else begin
                Format := otffText;
            end;
        end;
    end;
end;

procedure TOpusTag.ReadTag(const Source: TStream; OGGStream: TOGGStream);
var
    Index, Size, Position: Integer;
    Data: array [1..250] of ANSIChar;
    DataStream: TMemoryStream;
    PreviousPosition: Int64;
    DataByte: Byte;
begin
    //* Read vendor string
    FillChar(Data, SizeOf(Data), 0);
    Source.Read(Size, SizeOf(Size));
    Position := Source.Position;
    if Size > SizeOf(Data) then begin
        Source.Read(Data, SizeOf(Data))
    end else begin
        Source.Read(Data, Size);
    end;
    VendorString := UTF8Decode(Trim(Data));
    //* Read tag count
    Source.Read(Info.Tag.Fields, SizeOf(Info.Tag.Fields));
    if Info.Tag.Fields > 0 then begin
        // Read Opus tag
        DataStream := TMemoryStream.Create;
        try
            Index := 1;
            repeat
                DataStream.Clear;
                FillChar(Data, SizeOf(Data), 0);
                //* Query more data if needed
                PreviousPosition := Source.Position;
                while Source.Position + SizeOf(Size) > Source.Size do begin
                    Source.Seek(0, soEnd);
                    OGGStream.GetNextPageData(Source);
                    Source.Seek(PreviousPosition, soBeginning);
                end;
                //* Read in tag size
                Source.Read(Size, SizeOf(Size));
                Position := Source.Position;
                //* Query more data if needed
                PreviousPosition := Source.Position;
                while Source.Position + Size > Source.Size do begin
                    Source.Seek(0, soEnd);
                    OGGStream.GetNextPageData(Source);
                    Source.Seek(PreviousPosition, soBeginning);
                end;
                //* Read tag data (to extract tag name)
                if Size > SizeOf(Data) then begin
                    Source.Read(Data, SizeOf(Data))
                end else begin
                    Source.Read(Data, Size);
                end;
                //* Read tag data in stream
                Source.Seek(Position, soBeginning);
                DataStream.CopyFrom(Source, Size);
                // Add Opus tag item
                SetTagItem(Trim(Data), DataStream);
                Source.Seek(Position + Size, soFromBeginning);
                Inc(Index);
            until Index > Info.Tag.Fields;
            //Info.TagEndPos := OGGStream.FStream.Position;
        finally
            FreeAndNil(DataStream);
        end;
    end;
    if Format = ofVorbis then begin
        Source.Seek(1, soFromCurrent);
        repeat
            Source.Read(DataByte, 1);
        until (DataByte <> 0)
        OR (DataByte = 5)
        OR (Source.Size <= Source.Position);
        VorbisData.Clear;
        Source.Seek(- 1, soFromCurrent);
        if Source.Size - Source.Position > 0 then begin
            VorbisData.CopyFrom(Source, Source.Size - Source.Position);

            //VorbisData.SaveToFile('C:\CVB.raw');

        end;
    end;
    //if Format = ofOpus then begin
        Info.TagEndPos := OGGStream.FStream.Position;
    //end;
end;

function GetID3v2Size(const Source: TStream): Cardinal;
type
    ID3v2Header = packed record
        ID: array [1..3] of AnsiChar;
        Version: Byte;
        Revision: Byte;
        Flags: Byte;
        Size: Cardinal;
    end;
var
    Header: ID3v2Header;
begin
    // Get ID3v2 tag size (if exists)
    Result := 0;
    Source.Seek(0, soFromBeginning);
    Source.Read(Header, SizeOf(ID3v2Header));
    if Header.ID = 'ID3' then begin
        UnSyncSafe(Header.Size, 4, Result);
        Inc(Result, 10);
        if Result > Source.Size then begin
            Result := 0;
        end;
    end;
end;

function TOpusTag.GetInfo(SourceFile: TStream): Boolean;
var
    OGGStream: TOGGStream;
    Data: TMemoryStream;
    OpusTags: TOpusTags;
    VorbisHeader: TVorbisHeader;
begin
    Result := False;
    Info.ID3v2Size := GetID3v2Size(SourceFile);
    SourceFile.Seek(Info.ID3v2Size, soFromBeginning);
    OGGStream := TOGGStream.Create(SourceFile);
    if OGGStream.FirstOGGHeader.ID <> OGG_PAGE_ID then begin
        Exit;
    end;
    FirstOGGPage.Clear;
    OGGStream.GetNextPageData(FirstOGGPage);
    Info.SPagePos := OGGStream.FStream.Position;
    //* This will be re-set after all the tags are parsed
    Info.TagEndPos := OGGStream.FStream.Position;
    Data := TMemoryStream.Create;
    try
        OGGStream.GetNextPageData(Data);
        Data.Seek(0, soBeginning);

        //Data.SaveToFile('C:\2ndPage.raw');

        //* Check if Opus
        Data.Read(OpusTags.ID, SizeOf(OpusTags.ID));
        if OpusTags.ID = OPUS_TAG_ID then begin
            Format := ofOpus;
            ReadTag(Data, OGGStream);
            Result := True;
        end;
        Data.Seek(0, soBeginning);
        //* Check if Vorbis
        Data.Read(VorbisHeader.ID, SizeOf(VorbisHeader.ID));
        if VorbisHeader.ID = VORBIS_TAG_ID then begin
            Format := ofVorbis;
            ReadTag(Data, OGGStream);
            Result := True;
        end;
    finally
        FreeAndNil(Data);
    end;
end;

function RemoveOpusTagFromFile(FileName: String): Integer;
var
    OpusTag: TOpusTag;
    i: Integer;
begin
    Result := OPUSTAGLIBRARY_ERROR;
    OpusTag := TOpusTag.Create;
    try
        OpusTag.LoadFromFile(FileName);
        if OpusTag.Loaded then begin
            for i := OpusTag.Count - 1 downto 0 do begin
                if OpusTag.Frames[i].Name <> 'ENCODER' then begin
                    OpusTag.DeleteFrame(i);
                end;
            end;
            Result := OpusTag.SaveToFile(FileName);
        end;
    finally
        FreeAndNil(OpusTag);
    end;
end;

procedure CalculateCRC(var CRC: Cardinal; const Data; Size: Cardinal);
var
    Buffer: ^Byte;
    Index: Cardinal;
begin
    // Calculate CRC through data
    Buffer := Addr(Data);
    for Index := 1 to Size do begin
        CRC := (CRC shl 8) xor CRC_TABLE[((CRC shr 24) and $FF) xor Buffer^];
        Inc(Buffer);
    end;
end;

function SetCRC(const Destination: TStream; Header: TOggHeader): Boolean;
var
    Index: Integer;
    Value: Cardinal;
    Data: array [1..$FF] of Byte;
begin
    // Calculate and set checksum for OGG frame
    Result := False;
    Value := 0;
    CalculateCRC(Value, Header, Header.Segments + 27);
    Destination.Seek(Header.Segments + 27, soFromBeginning);
    for Index := 1 to Header.Segments do begin
        if Header.LacingValues[Index] > 0 then begin
            Destination.Read(Data, Header.LacingValues[Index]);
            CalculateCRC(Value, Data, Header.LacingValues[Index]);
        end;
    end;
    Destination.Seek(22, soFromBeginning);
    Destination.Write(Value, SizeOf(Value));
    Result := True;
end;

function TOpusTag.AdjustPadding(TagSize: Cardinal): Boolean;
var
    Tag: TMemoryStream;
    NewOGGTagStream: TMemoryStream;
    ProcessingOGGStream: TOGGStream;
    NewTagSize: Integer;
    NewWrappedTagSize: Integer;
    TmpString: String;
    PaddingFrameIndex: Integer;
    i: Integer;
    ExistingPaddingSize: Integer;
begin
    Result := False;
    if NOT WritePadding then begin
        DeleteFrame(FrameExists(OPUSTAGLIBRARY_FRAMENAME_PADDING));
    end else begin
        if PaddingSize < Length(OPUSTAGLIBRARY_FRAMENAME_PADDING) + 1 + 4 + 1 then begin
            PaddingSize := Length(OPUSTAGLIBRARY_FRAMENAME_PADDING) + 1 + 4 + 1;
        end;
    end;
    Tag := TMemoryStream.Create;
    NewOGGTagStream := TMemoryStream.Create;
    ProcessingOGGStream := TOGGStream.Create(nil);
    try
        NewTagSize := CalculateTagSize(False);
        NewWrappedTagSize := ProcessingOGGStream.CalculateWrappedStreamSize(NewTagSize);
        if NewWrappedTagSize = TagSize then begin
            DeleteFrame(FrameExists(OPUSTAGLIBRARY_FRAMENAME_PADDING));
            Result := True;
        end else begin
            if WritePadding then begin
                NewTagSize := CalculateTagSize(True);
                NewWrappedTagSize := ProcessingOGGStream.CalculateWrappedStreamSize(NewTagSize);
                if NewWrappedTagSize = TagSize then begin
                    Result := True;
                    Exit;
                end;
                ExistingPaddingSize := 0;
                PaddingFrameIndex := FrameExists(OPUSTAGLIBRARY_FRAMENAME_PADDING);
                if PaddingFrameIndex > - 1 then begin
                    ExistingPaddingSize := Frames[PaddingFrameIndex].CalculateTotalFrameSize;
                end;
                if (TagSize - NewWrappedTagSize) > PaddingSize then begin
                    Result := False;
                    Exit;
                end;
                if (NewWrappedTagSize < TagSize)
                AND (Length(OPUSTAGLIBRARY_FRAMENAME_PADDING) + 1 + 4 < TagSize)
                AND (ExistingPaddingSize < PaddingSize)
                then begin
                    TmpString := ReadFrameByNameAsText(OPUSTAGLIBRARY_FRAMENAME_PADDING);
                    repeat
                        TmpString := TmpString + OPUSTAGLIBRARY_PADDING_BYTE;
                        if Length(TmpString) + Length(OPUSTAGLIBRARY_FRAMENAME_PADDING) + 1 + 4 > PaddingSize then begin
                            DeleteFrame(FrameExists(OPUSTAGLIBRARY_FRAMENAME_PADDING));
                            Result := False;
                            Break;
                        end;
                        SetTextFrameText(OPUSTAGLIBRARY_FRAMENAME_PADDING, TmpString);
                        NewTagSize := CalculateTagSize(True);
                        NewWrappedTagSize := ProcessingOGGStream.CalculateWrappedStreamSize(NewTagSize);
                    until NewWrappedTagSize >= TagSize;
                    if NewWrappedTagSize = TagSize then begin
                        Result := True;
                    end;
                end;
                if (NewWrappedTagSize > TagSize)
                AND (ExistingPaddingSize > 0)
                then begin
                    TmpString := ReadFrameByNameAsText(OPUSTAGLIBRARY_FRAMENAME_PADDING);
                    repeat
                        TmpString := Copy(TmpString, 1, Length(TmpString) - 1);
                        if TmpString = '' then begin
                            DeleteFrame(FrameExists(OPUSTAGLIBRARY_FRAMENAME_PADDING));
                            Break;
                        end;
                        SetTextFrameText(OPUSTAGLIBRARY_FRAMENAME_PADDING, TmpString);
                        NewTagSize := CalculateTagSize(True);
                        NewWrappedTagSize := ProcessingOGGStream.CalculateWrappedStreamSize(NewTagSize);
                    until NewWrappedTagSize <= TagSize;
                    if NewWrappedTagSize = TagSize then begin
                        Result := True;
                    end;
                end;
            end;
        end;
        if (NOT Result)
        AND WritePadding
        then begin
            PaddingFrameIndex := AddFrame(OPUSTAGLIBRARY_FRAMENAME_PADDING).Index;
            TmpString := '';
            for i := 0 to PaddingSize - Length(OPUSTAGLIBRARY_FRAMENAME_PADDING) - 1 - 4 do begin
                TmpString := TmpString + OPUSTAGLIBRARY_PADDING_BYTE;
            end;
            Frames[PaddingFrameIndex].SetAsText(TmpString);
        end;
    finally
        FreeAndNil(Tag);
        FreeAndNil(NewOGGTagStream);
        FreeAndNil(ProcessingOGGStream);
    end;
end;

function RebuildFile(FileName: String; Info: TFileInfo; TagOGGStream: TStream; ReplaceMode: Boolean): Integer;
var
    Source, Destination: TFileStream;
    BufferName: WideString;
    NewOGGStream: TOGGStream;

begin
    Source := nil;
    Destination := nil;
    // Rebuild the file with the new Opus tag
    Result := OPUSTAGLIBRARY_ERROR;
    if (NOT FileExists(FileName))
    {$IFDEF MSWINDOWS}
    OR (FileSetAttr(FileName, 0) <> 0)
    {$ENDIF}
    then begin
        Result := OPUSTAGLIBRARY_ERROR_OPENING_FILE;
        Exit;
    end;
    try
        //* Check exclusive access
        if NOT ReplaceMode then begin
            try
                Destination := TFileStream.Create(FileName, fmOpenReadWrite);
            except
                Result := OPUSTAGLIBRARY_ERROR_NEED_EXCLUSIVE_ACCESS;
                Exit;
            end;
            FreeAndNil(Destination);
        end;
        // Create file streams
        try
            Source := TFileStream.Create(FileName, fmOpenRead OR fmShareDenyNone);
        except
            Result := OPUSTAGLIBRARY_ERROR_OPENING_FILE;
            Exit;
        end;
        if ReplaceMode then begin
            Destination := TFileStream.Create(FileName, fmOpenReadWrite OR fmShareDenyWrite);
        end else begin
            BufferName := FileName + '~';
            Destination := TFileStream.Create(BufferName, fmCreate);
        end;
        try
            // Copy data blocks
            if ReplaceMode then begin
                Destination.Seek(Info.SPagePos, soBeginning);
            end else begin
                Destination.CopyFrom(Source, Info.SPagePos);
            end;
            TagOGGStream.Seek(0, soBeginning);
            Destination.CopyFrom(TagOGGStream, TagOGGStream.Size);
            //* TODO: Optimization: check if OGG page frame numbers do really need re-adjusting
            //if NOT ReplaceMode then begin
                Source.Seek(Info.TagEndPos, soFromBeginning);
                if Source.Size - Info.TagEndPos > 0 then begin
                    NewOGGStream := TOGGStream.Create(Source);
                    NewOGGStream.ReNumberPages(Info.DataPageNumberStartsFrom + 1, Source, Destination);
                    FreeAndNil(NewOGGStream);
                end;
            //end;
        finally
            if Assigned(Source) then begin
                FreeAndNil(Source);
            end;
            if Assigned(Destination) then begin
                FreeAndNil(Destination);
            end;
        end;
        // Replace old file and delete temporary file

        if NOT ReplaceMode then begin
            if (DeleteFile(PChar(FileName))) and (RenameFile(BufferName, FileName)) then begin
                Result := OPUSTAGLIBRARY_SUCCESS;
            end else begin
                raise Exception.Create('');
            end;
        end else begin
            Result := OPUSTAGLIBRARY_SUCCESS;
        end;

    except
        // Access error
        if FileExists(BufferName) then DeleteFile(PChar(BufferName));
    end;
end;

function TOpusTag.SaveToFile(FileName: String): Integer;
var
    TagStream: TFileStream;
    Tag: TMemoryStream;
    NewFileOpusTag: TOpusTag;
    NewOGGStream: TOGGStream;
    NewOGGTagStream: TMemoryStream;
    OldTagSize: Integer;
    FitsInOldTag: Boolean;
    NewPaddingSize: Integer;
    NewTagSize: Integer;
    NewWrappedTagSize: Integer;
    Temp: Integer;
    NewFileCreate: Boolean;
begin
    Result := OPUSTAGLIBRARY_ERROR;
    NewFileCreate := False;
    TagStream := nil;
    try
        if NOT FileExists(FileName) then begin
            //* If we have a first page already use that
            if FirstOGGPage.Size > 0 then begin
                FirstOGGPage.SaveToFile(FileName);
            //* If not create one (not valid yet but usefull for exporting an Opus tag becouse the component can red it back)
            end else begin
                try
                    TagStream := TFileStream.Create(FileName, fmCreate OR fmShareDenyWrite);
                    TagStream.Write(Info.FPage, 28);
                    TagStream.Write(Info.OpusParameters, 19);
                    Info.TagEndPos := 28 + 19;
                    NewFileCreate := True;
                except
                    Result := OPUSTAGLIBRARY_ERROR_WRITING_FILE;
                    Exit;
                end;
                FreeAndNil(TagStream);
            end;
        end;
        try
            TagStream := TFileStream.Create(FileName, fmOpenRead OR fmShareDenyWrite);
            //* To get basic data from OGG stream
            NewOGGStream := TOGGStream.Create(TagStream);
        except
            Result := OPUSTAGLIBRARY_ERROR_OPENING_FILE;
            Exit;
        end;
        FreeAndNil(TagStream);
        NewFileOpusTag := TOpusTag.Create;
        try
            //* Get info about destination
            NewFileOpusTag.LoadFromFile(FileName);
            if NewFileCreate then begin
                NewFileOpusTag.Format := ofOpus;
            end else begin
                if NewFileOpusTag.Format = ofUnknown then begin
                    Result := OPUSTAGLIBRARY_ERROR_NOT_SUPPORTED_FORMAT;
                    Exit;
                end;
            end;
            Format := NewFileOpusTag.Format;
            VorbisData.Clear;
            NewFileOpusTag.VorbisData.Seek(0, soBeginning);
            VorbisData.CopyFrom(NewFileOpusTag.VorbisData, NewFileOpusTag.VorbisData.Size);
            OldTagSize := NewFileOpusTag.Info.TagEndPos - NewFileOpusTag.Info.SPagePos;
            //* Check sizes and adjust padding from settings
            if Format = ofOpus then begin
                FitsInOldTag := AdjustPadding(OldTagSize);
            end;
            if Format = ofVorbis then begin
                DeleteFrame(FrameExists(OPUSTAGLIBRARY_FRAMENAME_PADDING));
            end;
            //* The new tag streams
            Tag := TMemoryStream.Create;
            NewOGGTagStream := TMemoryStream.Create;
            try
                if Format = ofVorbis then begin
                    BuildTag(Tag, 0);
                    Tag.Seek(0, soEnd);
                    VorbisData.Seek(0, soBeginning);
                    Tag.CopyFrom(VorbisData, VorbisData.Size);
                    //* Wrap it in OGG container
                    Tag.Seek(0, soBeginning);
                    NewOGGStream.CreateTagStream(Tag, NewOGGTagStream);
                    FitsInOldTag := OldTagSize >= NewOGGTagStream.Size;
                end;
                //* Create a tag stream
                Tag.Clear;
                NewOGGTagStream.Clear;
                if Format = ofVorbis then begin
                    if FitsInOldTag then begin
                        NewPaddingSize := - 1;
                        NewTagSize := CalculateTagSize(False);
                        repeat
                            Inc(NewPaddingSize);
                            NewWrappedTagSize := NewOGGStream.CalculateWrappedStreamSizeVorbis(NewTagSize + NewPaddingSize, NewTagSize + NewPaddingSize + VorbisData.Size);
                        until (NewWrappedTagSize >= OldTagSize)
                        OR (NewPaddingSize >= PaddingSize);
                        FitsInOldTag := NewWrappedTagSize = OldTagSize;
                    end;
                    if NOT FitsInOldTag then begin
                        if WritePadding then begin
                            NewOGGStream.CalculateWrappedStreamSizeEx(NewTagSize, VorbisData.Size, NewPaddingSize);
                        end else begin
                            NewPaddingSize := 0;
                        end;
                    end;
                    Tag.Clear;
                    BuildTag(Tag, NewPaddingSize);
                    NewTagSize := Tag.Size;
                    Tag.Seek(0, soEnd);
                    VorbisData.Seek(0, soBeginning);
                    Tag.CopyFrom(VorbisData, VorbisData.Size);
                    Tag.Seek(0, soBeginning);
                    //* Wrap it in OGG container
                    NewOGGStream.FirstOGGHeader.PageNumber := 1;
                    NewFileOpusTag.Info.DataPageNumberStartsFrom := NewOGGStream.CreateTagStreamVorbis(NewTagSize, Tag, NewOGGTagStream);
                    FitsInOldTag := OldTagSize = NewOGGTagStream.Size;
                end;
                if Format = ofOpus then begin
                    BuildTag(Tag, 0);
                    //* Wrap it in OGG container
                    NewOGGTagStream.Clear;
                    NewFileOpusTag.Info.DataPageNumberStartsFrom := NewOGGStream.CreateTagStream(Tag, NewOGGTagStream);
                end;
                //* Write the tag to destination
                Result := RebuildFile(FileName, NewFileOpusTag.Info, NewOGGTagStream, FitsInOldTag);
            finally
                FreeAndNil(Tag);
                FreeAndNil(NewOGGTagStream);
            end;
        finally
            FreeAndNil(NewFileOpusTag);
        end;
    except
        Result := OPUSTAGLIBRARY_ERROR;
    end;
end;

end.


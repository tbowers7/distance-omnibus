;+
; NAME:
;       VLINE
;
; PURPOSE:
;       Draw a dashed vertical line on a plot (from bottom to top of
;       the plot window).
;
; CATEGORY:
;       Plotting utilities
;
; CALLING SEQUENCE:
;       VLINE, x [,/HORIZ][,/LOG][Graphics Keywords]
;
; INPUTS:
;       X      -- x-position (in DATA units) to place the line
;
; OPTIONAL INPUTS:
;       Routine accepts usual graphics keywords and passes them to
;       CGPLOTS via _EXTRA parameter.
;
; KEYWORD PARAMETERS:
;       HORIZ  -- Draw a horizonatal line at the y-position given
;       XLOG   -- The x-axis is logarithmic
;       YLOG   -- The y-axis is logarithmic
;       LOG    -- This is a log-log plot (sets XLOG and YLOG)
;
; OUTPUTS:
;       NONE (draws a line on the current plot device)
;
; OPTIONAL OUTPUTS:
;       NONE
;
; MODIFICATION HISTORY:
;
;       Created:  09/12/10, TPEB -- Initial Version
;       Modified: 10/24/10, TPEB -- Added THICK keyword
;       Modified: 10/28/10, TPEB -- Added HORIZ keyword
;       Modified: 02/03/11, TPEB -- Added LOG keyword, & modified
;                                   routine to work with _EXTRA
;                                   parameter
;       Modified: 11/02/11, TPEB -- Added XLOG and YLOG keywords to
;                                   deal with log-linear plots.
;       Modified: 11/09/12, TPEB -- Switched from plots -> cgPlots to
;                                   allow for color to be specified by
;                                   name, not just number.
;-

PRO VLINE, x, HORIZ=horiz, LOG=log, XLOG=xlog, YLOG=ylog, _EXTRA=extra
  
  IF KEYWORD_SET(log) THEN BEGIN
     xlog=1b
     ylog=1b
  ENDIF
  
  IF KEYWORD_SET(xlog) THEN xr = 10^(!x.crange) ELSE xr = !x.crange
  IF KEYWORD_SET(ylog) THEN yr = 10^(!y.crange) ELSE yr = !y.crange
  
  IF KEYWORD_SET(horiz) THEN BEGIN
     cgPlots,xr[0],x
     cgPlots,xr[1],x,/cont,linestyle=2,_EXTRA=extra
  ENDIF ELSE BEGIN
     cgPlots,x,yr[0]
     cgPlots,x,yr[1],/cont,linestyle=2,_EXTRA=extra
  ENDELSE
  
END

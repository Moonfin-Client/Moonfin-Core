const BOOK_DEFAULTS = {
  background: '#FF0F182A',
  accent: '#FF32B9E8',
  mutedText: '#FF9EDBFF',
  primaryText: '#FFDCEFFF',
  sectionTitle: '#FFFFE6C3',
  divider: '#223E5F82',
  placeholder: '#FF2C77B7',
  shadow: '#24000000',
  gradientTop: '#FF18263D',
  gradientBottom: '#FF0B1424',
  inactiveChip: '#556388A8',
  placeholderPalette: [
    '#FF1A5C9A',
    '#FF2E7D32',
    '#FF6A1B9A',
    '#FF00695C',
    '#FFC62828',
    '#FF4527A0',
    '#FF558B2F',
    '#FF283593',
    '#FF4E342E',
    '#FF00838F',
  ],
};

function cloneBookDefaults() {
  return {
    ...BOOK_DEFAULTS,
    placeholderPalette: [...BOOK_DEFAULTS.placeholderPalette],
  };
}

const ST = {
  id: 'my-theme',
  displayName: 'My Theme',
  description: '',
  previewNavMode: 'left',
  previewProfile: 'desktop',
  colors: {
    background:        '#FF101010',
    onBackground:      '#FFFFFFFF',
    surface:           '#FF1A1A1A',
    onSurface:         '#FFFFFFFF',
    surfaceVariant:    '#FF252525',
    scrim:             '#CC000000',
    accent:            '#FF00A4DC',
    onAccent:          '#FFFFFFFF',
    buttonNormal:      '#FF2A2A2A',
    buttonFocused:     '#FF00A4DC',
    buttonDisabled:    '#FF1E1E1E',
    buttonActive:      '#FF3A3A3A',
    onButtonNormal:    '#FFFFFFFF',
    onButtonFocused:   '#FFFFFFFF',
    onButtonDisabled:  '#FF666666',
    inputBackground:   '#FF2A2A2A',
    inputFocused:      '#FF3A3A3A',
    inputBorder:       '#FF404040',
    inputBorderFocused:'#FF00A4DC',
    rangeTrack:        '#FF404040',
    rangeProgress:     '#FF00A4DC',
    rangeThumb:        '#FF00A4DC',
    seekbarBuffered:   '#80FFFFFF',
    badgeBackground:   '#FF00A4DC',
    onBadge:           '#FFFFFFFF',
    badgeUnplayed:     '#FF00A4DC',
    badgeWatched:      '#FF4CAF50',
    recordingActive:   '#FFEF4444',
    recordingScheduled:'#FFFF9800',
  },
  borders: {
    cardBorder:    { color: '#00000000', width: 1 },
    chipBorder:    { color: '#558EC8F0', width: 1 },
    focusBorder:   { color: '#FF00A4DC', width: 2 },
    cardRadius: 8,
    chipRadius: 999,
    chipBackground: '#1F8EC8F0',
    focusGlow: [],
    navBorder: null,
  },
  semantic: {
    statusAvailable:    '#FF22C55E',
    statusRequested:    '#FF9333EA',
    statusPending:      '#FFEAB308',
    statusDownloading:  '#FF6366F1',
    mediaTypeBadgeMovie:'#FF3B82F6',
    mediaTypeBadgeShow: '#FF8B5CF6',
  },
  book: cloneBookDefaults(),
  textGlow: [],
  navColorCycle: [],
};

const NEON = {
  id:'neon_pulse',displayName:'Neon Pulse',
  colors:{
    background:'#FF0B0420',onBackground:'#FF00E5FF',surface:'#CC1E0A3F',
    onSurface:'#FF00E5FF',surfaceVariant:'#CC1E0A3F',scrim:'#CC0B0420',
    accent:'#FFFF2E92',onAccent:'#FFFFFFFF',buttonNormal:'#00000000',
    buttonFocused:'#33FF2E92',buttonDisabled:'#22FFFFFF',buttonActive:'#33FF2E92',
    onButtonNormal:'#FFFF2E92',onButtonFocused:'#FFFFFFFF',onButtonDisabled:'#AAFFFFFF',
    inputBackground:'#331E0A3F',inputFocused:'#441E0A3F',inputBorder:'#66FF2E92',
    inputBorderFocused:'#FFFF2E92',rangeTrack:'#66201840',rangeProgress:'#FFFF2E92',
    rangeThumb:'#FFFF2E92',seekbarBuffered:'#66FFFFFF',badgeBackground:'#FFFF2E92',
    onBadge:'#FFFFFFFF',badgeUnplayed:'#FFFF2E92',badgeWatched:'#FF00E5FF',
    recordingActive:'#FFFF2E92',recordingScheduled:'#FF00E5FF',
  },
  borders:{
    cardBorder:{color:'#66FF2E92',width:1},chipBorder:{color:'#CCFF2E92',width:1.2},
    focusBorder:{color:'#FFFF2E92',width:1.4},cardRadius:10,chipRadius:8,
    chipBackground:'#00000000',
    focusGlow:[
      {color:'#99FF2E92',blurRadius:8,spreadRadius:0.5,offsetX:0,offsetY:0},
      {color:'#6600E5FF',blurRadius:5,spreadRadius:0,offsetX:0,offsetY:0},
    ],
    navBorder:{color:'#CCFF2E92',width:1},
  },
  semantic:{
    statusAvailable:'#FF22C55E',statusRequested:'#FF9333EA',statusPending:'#FFEAB308',
    statusDownloading:'#FF6366F1',mediaTypeBadgeMovie:'#FF3B82F6',mediaTypeBadgeShow:'#FF8B5CF6',
  },
  book: cloneBookDefaults(),
  textGlow:[{color:'#6600E5FF',blurRadius:8,offsetX:0,offsetY:0}],
  navColorCycle:['#FFFF2E92','#FF00E5FF'],
};

const DRAFT_KEY='moonfin-theme-editor-draft-v1';
const EDITOR_LAYOUT_KEY='moonfin-theme-editor-layout-v1';
const EDITOR_EXPORT_VERSION='2026.05.28';
let dirty=false;
let persistTimer=null;
let editorWidth=360;

function maxEditorWidthForViewport(){
  return Math.max(320,Math.min(760,window.innerWidth-420));
}

function clampEditorWidth(w){
  return Math.min(maxEditorWidthForViewport(),Math.max(320,Math.round(w)));
}

function applyEditorWidth(width,persist=true){
  editorWidth=clampEditorWidth(width);
  const scale=Math.max(1,Math.min(1.28,1+((editorWidth-360)/(760-360))*0.28));
  document.documentElement.style.setProperty('--editor-width',editorWidth+'px');
  document.documentElement.style.setProperty('--editor-scale',scale.toFixed(3));
  if(persist){
    localStorage.setItem(EDITOR_LAYOUT_KEY,JSON.stringify({editorWidth}));
  }
}

function loadEditorLayout(){
  try{
    const raw=localStorage.getItem(EDITOR_LAYOUT_KEY);
    if(!raw){
      applyEditorWidth(360,false);
      return;
    }
    const parsed=JSON.parse(raw);
    applyEditorWidth(parsed&&parsed.editorWidth?parsed.editorWidth:360,false);
  }catch(e){
    applyEditorWidth(360,false);
  }
}

function initEditorResizer(){
  const layout=document.querySelector('.layout');
  const resizer=document.getElementById('editorResizer');
  if(!layout||!resizer) return;

  let dragging=false;
  const onMove=(ev)=>{
    if(!dragging) return;
    const x=('touches' in ev&&ev.touches.length)?ev.touches[0].clientX:ev.clientX;
    const left=layout.getBoundingClientRect().left;
    applyEditorWidth(x-left,false);
  };
  const onUp=()=>{
    if(!dragging) return;
    dragging=false;
    document.body.classList.remove('resizing');
    applyEditorWidth(editorWidth,true);
    window.removeEventListener('mousemove',onMove);
    window.removeEventListener('mouseup',onUp);
    window.removeEventListener('touchmove',onMove);
    window.removeEventListener('touchend',onUp);
  };

  resizer.addEventListener('mousedown',(ev)=>{
    ev.preventDefault();
    dragging=true;
    document.body.classList.add('resizing');
    window.addEventListener('mousemove',onMove);
    window.addEventListener('mouseup',onUp);
  });
  resizer.addEventListener('touchstart',(ev)=>{
    dragging=true;
    document.body.classList.add('resizing');
    window.addEventListener('touchmove',onMove,{passive:false});
    window.addEventListener('touchend',onUp);
  },{passive:true});

  window.addEventListener('resize',()=>applyEditorWidth(editorWidth,false));
}

function hex2css(h){
  if(!h||typeof h!=='string') return 'rgba(0,0,0,0)';
  const s=h.replace('#','');
  if(s.length!==8) return 'rgba(0,0,0,1)';
  const a=parseInt(s.slice(0,2),16)/255,r=parseInt(s.slice(2,4),16),
        g=parseInt(s.slice(4,6),16),b=parseInt(s.slice(6,8),16);
  return `rgba(${r},${g},${b},${a.toFixed(3)})`;
}
function hex2rgb(h){ const s=(h||'').replace('#',''); return s.length>=8?'#'+s.slice(2,8).toUpperCase():'#000000'; }
function hex2a(h){ const s=(h||'').replace('#',''); return s.length>=2?parseInt(s.slice(0,2),16):255; }
function rgb_a_to_hex(rgb,a){ return '#'+Math.round(a).toString(16).padStart(2,'0').toUpperCase()+(rgb||'#000000').replace('#','').toUpperCase(); }
function parseHex(v){
  let h=v.trim().replace('#','').toUpperCase();
  if(h.length===3) h=h[0]+h[0]+h[1]+h[1]+h[2]+h[2];
  if(h.length===6) h='FF'+h;
  return h.length===8?'#'+h:null;
}
function hex2rawRgb(h){
  const s=(h||'').replace('#','');
  if(s.length<8) return '0,0,0';
  return `${parseInt(s.slice(2,4),16)},${parseInt(s.slice(4,6),16)},${parseInt(s.slice(6,8),16)}`;
}

function setStatus(text,type='ok'){
  const p=document.getElementById('statusPill');
  if(!p) return;
  p.textContent=text;
  p.className='status-pill '+type;
}

function setIssues(items){
  const box=document.getElementById('issueList');
  if(!box) return;
  box.innerHTML=(items||[]).map(msg=>`<li>${msg}</li>`).join('');
}

function stampDirty(v){
  dirty=!!v;
  const d=document.getElementById('dirtyFlag');
  if(d) d.textContent=dirty?'Unsaved changes':'Clean';
}

function queuePersist(){
  stampDirty(true);
  setStatus('Editing','warn');
  if(persistTimer) clearTimeout(persistTimer);
  persistTimer=setTimeout(()=>saveDraft(true),700);
}

function snapshot(){
  return JSON.parse(JSON.stringify(ST));
}

function saveDraft(silent=false){
  try{
    const payload={savedAt:new Date().toISOString(),state:snapshot()};
    localStorage.setItem(DRAFT_KEY,JSON.stringify(payload));
    const stamp=document.getElementById('draftStamp');
    if(stamp) stamp.textContent='Draft: '+new Date(payload.savedAt).toLocaleString();
    stampDirty(false);
    setIssues([]);
    if(!silent) setStatus('Draft saved','ok');
  }catch(e){
    setStatus('Draft save failed','err');
    setIssues(['Could not write draft to local storage.']);
  }
}

function loadDraftFromStorage(){
  try{
    const raw=localStorage.getItem(DRAFT_KEY);
    if(!raw){
      setStatus('No draft found','warn');
      return;
    }
    const parsed=JSON.parse(raw);
    if(!parsed||!parsed.state) throw new Error('missing state');
    loadFromObj(parsed.state);
    const stamp=document.getElementById('draftStamp');
    if(stamp && parsed.savedAt) stamp.textContent='Draft: '+new Date(parsed.savedAt).toLocaleString();
    stampDirty(false);
    setStatus('Draft loaded','ok');
  }catch(e){
    setStatus('Draft load failed','err');
    setIssues(['Stored draft is invalid JSON.']);
  }
}

function clearDraft(){
  localStorage.removeItem(DRAFT_KEY);
  const stamp=document.getElementById('draftStamp');
  if(stamp) stamp.textContent='No draft saved';
  setStatus('Draft cleared','ok');
}

function clampNumber(value,min,max,fallback){
  const parsed=typeof value==='number'?value:parseFloat(value);
  if(!Number.isFinite(parsed)) return fallback;
  return Math.min(max,Math.max(min,parsed));
}

function normalizeStateForConstraints(){
  if(!ST.borders||typeof ST.borders!=='object') ST.borders={};

  ['cardBorder','chipBorder','focusBorder'].forEach((key)=>{
    if(!ST.borders[key]||typeof ST.borders[key]!=='object') ST.borders[key]={};
    ST.borders[key].width=clampNumber(ST.borders[key].width,0,16,key==='focusBorder'?2:1);
  });

  if(ST.borders.navBorder&&typeof ST.borders.navBorder==='object'){
    ST.borders.navBorder.width=clampNumber(ST.borders.navBorder.width,0,16,1);
  }

  const normalizeRadius=(value,fallback)=>{
    if(typeof value==='number'){
      return clampNumber(value,0,9999,fallback);
    }
    if(value&&typeof value==='object'&&!Array.isArray(value)){
      return {
        topLeft:clampNumber(value.topLeft,0,9999,fallback),
        topRight:clampNumber(value.topRight,0,9999,fallback),
        bottomLeft:clampNumber(value.bottomLeft,0,9999,fallback),
        bottomRight:clampNumber(value.bottomRight,0,9999,fallback),
      };
    }
    return fallback;
  };

  ST.borders.cardRadius=normalizeRadius(ST.borders.cardRadius,8);
  ST.borders.chipRadius=normalizeRadius(ST.borders.chipRadius,999);

  if(!Array.isArray(ST.borders.focusGlow)) ST.borders.focusGlow=[];
  ST.borders.focusGlow=ST.borders.focusGlow.slice(0,8).map((sh)=>({
    color:sh&&sh.color?sh.color:'#99FF2E92',
    blurRadius:clampNumber(sh&&sh.blurRadius,0,64,8),
    spreadRadius:clampNumber(sh&&sh.spreadRadius,-32,32,0),
    offsetX:clampNumber(sh&&sh.offsetX,-50,50,0),
    offsetY:clampNumber(sh&&sh.offsetY,-50,50,0),
  }));

  if(!Array.isArray(ST.textGlow)) ST.textGlow=[];
  ST.textGlow=ST.textGlow.slice(0,8).map((glow)=>({
    color:glow&&glow.color?glow.color:'#6600E5FF',
    blurRadius:clampNumber(glow&&glow.blurRadius,0,64,8),
    spreadRadius:0,
    offsetX:clampNumber(glow&&glow.offsetX,-20,20,0),
    offsetY:clampNumber(glow&&glow.offsetY,-20,20,0),
  }));

  if(!Array.isArray(ST.navColorCycle)) ST.navColorCycle=[];
  ST.navColorCycle=ST.navColorCycle.slice(0,16);

  if(!ST.book||typeof ST.book!=='object') ST.book=cloneBookDefaults();
  if(!Array.isArray(ST.book.placeholderPalette)) ST.book.placeholderPalette=[];
  if(ST.book.placeholderPalette.length<1){
    ST.book.placeholderPalette=['#FF1A5C9A'];
  }
  if(ST.book.placeholderPalette.length>16){
    ST.book.placeholderPalette=ST.book.placeholderPalette.slice(0,16);
  }
}

function validateTheme(){
  const issues=[];
  const bookColorKeys=[
    'background','accent','mutedText','primaryText','sectionTitle',
    'divider','placeholder','shadow','gradientTop','gradientBottom','inactiveChip',
  ];
  const radiusKeys=['topLeft','topRight','bottomLeft','bottomRight'];
  const isNumber=(v)=>typeof v==='number'&&Number.isFinite(v);
  const inRange=(v,min,max)=>isNumber(v)&&v>=min&&v<=max;
  const validateRadius=(value,path)=>{
    if(isNumber(value)){
      if(!inRange(value,0,9999)) issues.push(`\"${path}\" must be between 0 and 9999.`);
      return;
    }
    if(value&&typeof value==='object'&&!Array.isArray(value)){
      radiusKeys.forEach((k)=>{
        const rv=value[k];
        if(!inRange(rv,0,9999)) issues.push(`\"${path}.${k}\" must be between 0 and 9999.`);
      });
      return;
    }
    issues.push(`\"${path}\" must be a number or corner object.`);
  };

  if(!/^[A-Za-z0-9_-]{2,40}$/.test(ST.id||'')) issues.push('Theme ID should be 2-40 characters using letters (a-z or A-Z), numbers, dashes, or underscores.');
  if(!(ST.displayName||'').trim()) issues.push('Display name is required.');
  Object.entries(ST.colors).forEach(([k,v])=>{ if(!parseHex(v||'')) issues.push('Invalid color in colors.'+k); });
  Object.entries(ST.semantic).forEach(([k,v])=>{ if(!parseHex(v||'')) issues.push('Invalid color in semantic.'+k); });
  bookColorKeys.forEach((k)=>{
    if(!parseHex(ST.book?.[k]||'')) issues.push('Invalid color in book.'+k);
  });
  if(!Array.isArray(ST.book?.placeholderPalette)){
    issues.push('book.placeholderPalette must be a list.');
  } else {
    if(ST.book.placeholderPalette.length<1||ST.book.placeholderPalette.length>16){
      issues.push('book.placeholderPalette must have 1 to 16 colors.');
    }
    ST.book.placeholderPalette.forEach((v,i)=>{
      if(!parseHex(v||'')) issues.push(`Invalid color in book.placeholderPalette[${i}]`);
    });
  }
  ['cardBorder','chipBorder','focusBorder'].forEach(k=>{
    const it=ST.borders[k];
    if(!it||!parseHex(it.color||'')) issues.push('Invalid border color in borders.'+k+'.color');
    if(!inRange(it?.width,0,16)) issues.push('Invalid border width in borders.'+k+'.width');
  });
  if(ST.borders.navBorder){
    if(!parseHex(ST.borders.navBorder.color||'')) issues.push('Invalid border color in borders.navBorder.color');
    if(!inRange(ST.borders.navBorder.width,0,16)) issues.push('Invalid border width in borders.navBorder.width');
  }
  validateRadius(ST.borders.cardRadius,'borders.cardRadius');
  validateRadius(ST.borders.chipRadius,'borders.chipRadius');
  if(!Array.isArray(ST.borders.focusGlow)){
    issues.push('borders.focusGlow must be a list.');
  } else {
    if(ST.borders.focusGlow.length>8) issues.push('borders.focusGlow allows up to 8 shadows.');
    ST.borders.focusGlow.forEach((sh,i)=>{
      if(!parseHex(sh?.color||'')) issues.push(`Invalid color in borders.focusGlow[${i}].color`);
      if(!inRange(sh?.blurRadius,0,64)) issues.push(`Invalid blurRadius in borders.focusGlow[${i}]`);
      if(!inRange(sh?.spreadRadius,-32,32)) issues.push(`Invalid spreadRadius in borders.focusGlow[${i}]`);
    });
  }
  if(!Array.isArray(ST.textGlow)){
    issues.push('textGlow must be a list.');
  } else {
    if(ST.textGlow.length>8) issues.push('textGlow allows up to 8 shadows.');
    ST.textGlow.forEach((sh,i)=>{
      if(!parseHex(sh?.color||'')) issues.push(`Invalid color in textGlow[${i}].color`);
      if(!inRange(sh?.blurRadius,0,64)) issues.push(`Invalid blurRadius in textGlow[${i}]`);
      if(!isNumber(sh?.offsetX)) issues.push(`Invalid offsetX in textGlow[${i}]`);
      if(!isNumber(sh?.offsetY)) issues.push(`Invalid offsetY in textGlow[${i}]`);
      if(sh&&Object.prototype.hasOwnProperty.call(sh,'spreadRadius')&&!inRange(sh.spreadRadius,0,0)){
        issues.push(`textGlow[${i}].spreadRadius must be 0.`);
      }
    });
  }
  if(!Array.isArray(ST.navColorCycle)){
    issues.push('navColorCycle must be a list.');
  } else {
    if(ST.navColorCycle.length>16) issues.push('navColorCycle allows up to 16 colors.');
    ST.navColorCycle.forEach((v,i)=>{
      if(!parseHex(v||'')) issues.push(`Invalid color in navColorCycle[${i}]`);
    });
  }
  return issues;
}

function runValidation(showSuccess){
  const issues=validateTheme();
  setIssues(issues);
  if(issues.length){
    setStatus('Validation failed','err');
    return false;
  }
  setStatus('Validation passed','ok');
  if(showSuccess){
    setIssues([]);
  }
  return true;
}

function rpath(path){
  try{ return path.split('.').reduce((o,k)=>o==null?undefined:o[k], ST); }
  catch(e){ return undefined; }
}
function spath(path,val){
  const parts=path.split('.');
  let o=ST;
  for(let i=0;i<parts.length-1;i++){
    const k=parts[i], nk=parts[i+1];
    if(o[k]==null||typeof o[k]!=='object') o[k]=/^\d+$/.test(nk)?[]:{};
    o=o[k];
  }
  o[parts[parts.length-1]]=val;
}

function updateVars(){
  const c=ST.colors, b=ST.borders, s=ST.semantic, bk=ST.book||cloneBookDefaults();
  const cr1=(typeof b.cardRadius==='number')?b.cardRadius+'px':`${b.cardRadius.topLeft||0}px ${b.cardRadius.topRight||0}px ${b.cardRadius.bottomLeft||0}px ${b.cardRadius.bottomRight||0}px`;
  const cr2=(typeof b.chipRadius==='number')?b.chipRadius+'px':`${b.chipRadius.topLeft||0}px ${b.chipRadius.topRight||0}px ${b.chipRadius.bottomLeft||0}px ${b.chipRadius.bottomRight||0}px`;
  const glow=(b.focusGlow||[]).map(sh=>`0 0 ${sh.blurRadius||0}px ${sh.spreadRadius||0}px ${hex2css(sh.color)}`).join(',');
  const textGlow=(ST.textGlow||[]).map(sh=>`${sh.offsetX||0}px ${sh.offsetY||0}px ${sh.blurRadius||0}px ${hex2css(sh.color)}`).join(',');
  const navSurface=hex2css(c.surface);
  const pf=ST.previewProfile||'desktop';
  document.body.dataset.previewProfile=pf;
  document.body.dataset.previewNav=ST.previewNavMode||'left';
  const isMobile=pf==='mobile';
  const toolbarH=isMobile?60:80;
  const sidebarW=isMobile?260:240;
  const hPad=isMobile?12:32;
  const vPad=isMobile?8:10;
  const css=`
    --t-bg:${hex2css(c.background)};--t-ob:${hex2css(c.onBackground)};
    --t-surf:${hex2css(c.surface)};--t-os:${hex2css(c.onSurface)};
    --t-sv:${hex2css(c.surfaceVariant)};--t-scrim:${hex2css(c.scrim)};
    --t-acc:${hex2css(c.accent)};--t-oa:${hex2css(c.onAccent)};
    --t-acc-r:${hex2rawRgb(c.accent)};
    --t-bn:${hex2css(c.buttonNormal)};--t-bf:${hex2css(c.buttonFocused)};
    --t-bd:${hex2css(c.buttonDisabled)};--t-ba:${hex2css(c.buttonActive)};
    --t-obn:${hex2css(c.onButtonNormal)};--t-obf:${hex2css(c.onButtonFocused)};
    --t-obd:${hex2css(c.onButtonDisabled)};
    --t-ib:${hex2css(c.inputBorder)};--t-ibf:${hex2css(c.inputBorderFocused)};
    --t-rt:${hex2css(c.rangeTrack)};--t-rp:${hex2css(c.rangeProgress)};
    --t-rth:${hex2css(c.rangeThumb)};--t-sb:${hex2css(c.seekbarBuffered)};
    --t-bb:${hex2css(c.badgeBackground)};--t-ob2:${hex2css(c.onBadge)};
    --t-bu:${hex2css(c.badgeUnplayed)};--t-bw:${hex2css(c.badgeWatched)};
    --t-ra:${hex2css(c.recordingActive)};--t-rs:${hex2css(c.recordingScheduled)};
    --t-cr1:${cr1};--t-cr2:${cr2};
    --t-cbc:${hex2css(b.cardBorder.color)};--t-cbw:${(b.cardBorder.width||0)}px;
    --t-chbc:${hex2css(b.chipBorder.color)};--t-chbw:${(b.chipBorder.width||1)}px;
    --t-fbc:${hex2css(b.focusBorder.color)};--t-fbw:${(b.focusBorder.width||2)}px;
    --t-chbg:${hex2css(b.chipBackground)};
    --t-nav:${navSurface};
    --t-nav-bc:${b.navBorder?hex2css(b.navBorder.color):'transparent'};
    --t-nav-bw:${b.navBorder?(b.navBorder.width||1)+'px':'0px'};
    --t-glow:${glow||'none'};
    --t-tglow:${textGlow||'none'};
    --t-toolbar-h:${toolbarH}px;
    --t-sidebar-w:${sidebarW}px;
    --t-hpad:${hPad}px;
    --t-vpad:${vPad}px;
    --t-sp-2xs:2px;--t-sp-xs:4px;--t-sp-sm:8px;--t-sp-md:12px;
    --t-sp-lg:16px;--t-sp-xl:24px;--t-sp-2xl:32px;--t-sp-3xl:48px;
    --t-st-av:${hex2css(s.statusAvailable)};--t-st-rq:${hex2css(s.statusRequested)};
    --t-st-pd:${hex2css(s.statusPending)};--t-st-dn:${hex2css(s.statusDownloading)};
    --t-media-m:${hex2css(s.mediaTypeBadgeMovie)};--t-media-s:${hex2css(s.mediaTypeBadgeShow)};
    --t-book-bg:${hex2css(bk.background)};--t-book-acc:${hex2css(bk.accent)};
    --t-book-muted:${hex2css(bk.mutedText)};--t-book-primary:${hex2css(bk.primaryText)};
    --t-book-title:${hex2css(bk.sectionTitle)};--t-book-divider:${hex2css(bk.divider)};
    --t-book-placeholder:${hex2css(bk.placeholder)};--t-book-shadow:${hex2css(bk.shadow)};
    --t-book-g-top:${hex2css(bk.gradientTop)};--t-book-g-bottom:${hex2css(bk.gradientBottom)};
    --t-book-chip-inactive:${hex2css(bk.inactiveChip)};
    --t-inbg:${hex2css(c.inputBackground)};
    --t-ifbg:${hex2css(c.inputFocused)};
  `;
  document.querySelectorAll('.pdevice').forEach(d=>d.setAttribute('style',css));
}

const GR=[['#1a3a5c','#0d2340'],['#3a1a5c','#220d40'],['#1a5c3a','#0d4025'],
          ['#5c3a1a','#402510'],['#5c1a3a','#400d25'],['#1a4a5c','#0d3040'],['#4a5c1a','#304010']];
const pg=i=>`linear-gradient(135deg,${GR[i%GR.length][0]},${GR[i%GR.length][1]})`;

function cardMarkup(title, sub, idx, focused, wide){
  return `<div class="mf-card${focused?' focused':''}">
    <div class="mf-poster${focused?' focused':''}${wide?' wide':''}">
      <div class="mf-poster-fill" style="background:${pg(idx)}"></div>
      ${idx%4===0?'<div class="mf-badge-unplayed"></div>':''}
      ${idx%5===0?'<div class="mf-badge-watched">✓</div>':''}
    </div>
    <div class="mf-card-title">${title}</div>
    ${sub?`<div class="mf-card-sub">${sub}</div>`:''}
  </div>`;
}

function navItems(active){
  const iHome=`<svg viewBox="0 0 24 24"><path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/></svg>`;
  const iSearch=`<svg viewBox="0 0 24 24"><path d="M15.5 14h-.79l-.28-.27A6.47 6.47 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/></svg>`;
  const iShuffle=`<svg viewBox="0 0 24 24"><path d="M10.59 9.17L5.41 4 4 5.41l5.17 5.17 1.42-1.41zM14.5 4l2.04 2.04L4 18.59 5.41 20 17.96 7.46 20 9.5V4h-5.5zm.33 9.41l-1.41 1.41 3.13 3.13L14.5 20H20v-5.5l-2.04 2.04-3.13-3.13z"/></svg>`;
  const iGenres=`<svg viewBox="0 0 24 24"><path d="M8.11,19.45C5.94,18.65 4.22,16.78 3.71,14.35L2.05,6.54C1.81,5.46 2.5,4.4 3.58,4.17L13.35,2.1L13.38,2.09C14.45,1.88 15.5,2.57 15.72,3.63L16.07,5.3L20.42,6.23H20.45C21.5,6.47 22.18,7.53 21.96,8.59L20.3,16.41C19.5,20.18 15.78,22.6 12,21.79C10.42,21.46 9.08,20.61 8.11,19.45V19.45M20,8.18L10.23,6.1L8.57,13.92V13.95C8,16.63 9.73,19.27 12.42,19.84C15.11,20.41 17.77,18.69 18.34,16L20,8.18M16,16.5C15.37,17.57 14.11,18.16 12.83,17.89C11.56,17.62 10.65,16.57 10.5,15.34L16,16.5M8.47,5.17L4,6.13L5.66,13.94L5.67,13.97C5.82,14.68 6.12,15.32 6.53,15.87C6.43,15.1 6.45,14.3 6.62,13.5L7.05,11.5C6.6,11.42 6.21,11.17 6,10.81C6.06,10.2 6.56,9.66 7.25,9.5C7.33,9.5 7.4,9.5 7.5,9.5L8.28,5.69C8.32,5.5 8.38,5.33 8.47,5.17M15.03,12.23C15.35,11.7 16.03,11.42 16.72,11.57C17.41,11.71 17.91,12.24 18,12.86C17.67,13.38 17,13.66 16.3,13.5C15.61,13.37 15.11,12.84 15.03,12.23M10.15,11.19C10.47,10.66 11.14,10.38 11.83,10.53C12.5,10.67 13.03,11.21 13.11,11.82C12.78,12.34 12.11,12.63 11.42,12.5C10.73,12.33 10.23,11.8 10.15,11.19M11.97,4.43L13.93,4.85L13.77,4.05L11.97,4.43Z" /></svg>`;
  const iFav=`<svg viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>`;
  const iLibs=`<svg viewBox="0 0 24 24"><path d="m4 6.47.85 1.7H7V6h10v2.17h2.15L20 6.47V6c0-1.1-.9-2-2-2H6C4.9 4 4 4.9 4 6v.47zM22 8H2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8zm-9 9.5v-7l5.5 3.5L13 17.5z"/></svg>`;
  const iGear=`<svg viewBox="0 0 24 24"><path d="M19.14 12.94c.04-.3.06-.61.06-.94 0-.32-.02-.64-.07-.94l2.03-1.58c.18-.14.23-.41.12-.61l-1.92-3.32c-.12-.22-.37-.29-.59-.22l-2.39.96c-.5-.38-1.03-.7-1.62-.94l-.36-2.54c-.04-.24-.24-.41-.48-.41h-3.84c-.24 0-.43.17-.47.41l-.36 2.54c-.59.24-1.13.57-1.62.94l-2.39-.96c-.22-.08-.47 0-.59.22L2.74 8.87c-.12.21-.08.47.12.61l2.03 1.58c-.05.3-.07.63-.07.94s.02.64.07.94l-2.03 1.58c-.18.14-.23.41-.12.61l1.92 3.32c.12.22.37.29.59.22l2.39-.96c.5.38 1.03.7 1.62.94l.36 2.54c.05.24.24.41.48.41h3.84c.24 0 .44-.17.47-.41l.36-2.54c.59-.24 1.13-.56 1.62-.94l2.39.96c.22.08.47 0 .59-.22l1.92-3.32c.12-.22.07-.47-.12-.61l-2.03-1.58zM12 15.6c-1.98 0-3.6-1.62-3.6-3.6s1.62-3.6 3.6-3.6 3.6 1.62 3.6 3.6-1.62 3.6-3.6 3.6z"/></svg>`;
  const main=[
    ['Home',iHome],['Search',iSearch],['Shuffle',iShuffle],
    ['Genres',iGenres],['Favorites',iFav],['Libraries',iLibs],
    ['Settings',iGear],
  ];
  return main.map(([name,ic])=>`<div class="mf-nav-item${name===active?' on':''}">\n      ${ic}<span>${name}</span>\n    </div>`).join('')
    +'<div class="mf-nav-spacer"></div>';
}

function shell(content, active, title){
  const topMode=ST.previewNavMode==='top';
  const nav=`<div class="mf-left">
    <div class="mf-user"><div class="mf-avatar">MF</div><div class="mf-uname">Moonfin User</div></div>
    <div class="mf-divider"></div>
    ${navItems(active)}
    <div class="mf-nav-clock">12:31 AM</div>
  </div>`;
  const top=`<div class="mf-top"><div class="mf-avatar" style="width:32px;height:32px;font-size:11px">MF</div><div class="mf-top-title">${title}</div><div class="mf-top-search">Search media, people, collections</div><div class="mf-clock">22:41</div></div>`;
  return `<div class="mf-app">${topMode?'':nav}<div class="mf-main">${topMode?top:''}<div class="mf-body">${content}</div></div></div>`;
}

function renderHome(){
  const iChevL=`<svg viewBox="0 0 24 24"><path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/></svg>`;
  const iChevR=`<svg viewBox="0 0 24 24"><path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"/></svg>`;
  const iHome=`<svg viewBox="0 0 24 24"><path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/></svg>`;
  const iSearch=`<svg viewBox="0 0 24 24"><path d="M15.5 14h-.79l-.28-.27A6.47 6.47 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/></svg>`;
  const iShuffle=`<svg viewBox="0 0 24 24"><path d="M10.59 9.17L5.41 4 4 5.41l5.17 5.17 1.42-1.41zM14.5 4l2.04 2.04L4 18.59 5.41 20 17.96 7.46 20 9.5V4h-5.5zm.33 9.41l-1.41 1.41 3.13 3.13L14.5 20H20v-5.5l-2.04 2.04-3.13-3.13z"/></svg>`;
  const iGenres=`<svg viewBox="0 0 24 24"><path d="M8.11,19.45C5.94,18.65 4.22,16.78 3.71,14.35L2.05,6.54C1.81,5.46 2.5,4.4 3.58,4.17L13.35,2.1L13.38,2.09C14.45,1.88 15.5,2.57 15.72,3.63L16.07,5.3L20.42,6.23H20.45C21.5,6.47 22.18,7.53 21.96,8.59L20.3,16.41C19.5,20.18 15.78,22.6 12,21.79C10.42,21.46 9.08,20.61 8.11,19.45V19.45M20,8.18L10.23,6.1L8.57,13.92V13.95C8,16.63 9.73,19.27 12.42,19.84C15.11,20.41 17.77,18.69 18.34,16L20,8.18M16,16.5C15.37,17.57 14.11,18.16 12.83,17.89C11.56,17.62 10.65,16.57 10.5,15.34L16,16.5M8.47,5.17L4,6.13L5.66,13.94L5.67,13.97C5.82,14.68 6.12,15.32 6.53,15.87C6.43,15.1 6.45,14.3 6.62,13.5L7.05,11.5C6.6,11.42 6.21,11.17 6,10.81C6.06,10.2 6.56,9.66 7.25,9.5C7.33,9.5 7.4,9.5 7.5,9.5L8.28,5.69C8.32,5.5 8.38,5.33 8.47,5.17M15.03,12.23C15.35,11.7 16.03,11.42 16.72,11.57C17.41,11.71 17.91,12.24 18,12.86C17.67,13.38 17,13.66 16.3,13.5C15.61,13.37 15.11,12.84 15.03,12.23M10.15,11.19C10.47,10.66 11.14,10.38 11.83,10.53C12.5,10.67 13.03,11.21 13.11,11.82C12.78,12.34 12.11,12.63 11.42,12.5C10.73,12.33 10.23,11.8 10.15,11.19M11.97,4.43L13.93,4.85L13.77,4.05L11.97,4.43Z" /></svg>`;
  const iFavRnd=`<svg viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>`;
  const iGroups=`<svg viewBox="0 0 24 24"><path d="M4 13c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm1.13 1.1c-.37-.06-.74-.1-1.13-.1-.99 0-1.93.21-2.78.58C.48 14.9 0 15.62 0 16.43V18h4.5v-1.61c0-.83.23-1.61.63-2.29zM20 13c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm4 3.43c0-.81-.48-1.53-1.22-1.85C21.93 14.21 20.99 14 20 14c-.39 0-.76.04-1.13.1.4.68.63 1.46.63 2.29V18H24v-1.57zM16.67 13.13c-.51-.31-1.08-.54-1.67-.7.58-.36 1-.99 1-1.68V10c0-1.1-.9-2-2-2s-2 .9-2 2v.75c0 .69.42 1.32 1 1.68-.59.16-1.16.39-1.67.7C10.52 13.77 10 14.62 10 15.6V18h8v-2.4c0-.98-.52-1.83-1.33-2.47z"/></svg>`;
  const iMovie=`<svg viewBox="0 0 24 24"><path d="m4 6.47.85 1.7H7V6h10v2.17h2.15L20 6.47V6c0-1.1-.9-2-2-2H6C4.9 4 4 4.9 4 6v.47zM22 8H2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8zm-9 9.5v-7l5.5 3.5L13 17.5z"/></svg>`;
  const iGear=`<svg viewBox="0 0 24 24"><path d="M19.14 12.94c.04-.3.06-.61.06-.94 0-.32-.02-.64-.07-.94l2.03-1.58c.18-.14.23-.41.12-.61l-1.92-3.32c-.12-.22-.37-.29-.59-.22l-2.39.96c-.5-.38-1.03-.7-1.62-.94l-.36-2.54c-.04-.24-.24-.41-.48-.41h-3.84c-.24 0-.43.17-.47.41l-.36 2.54c-.59.24-1.13.57-1.62.94l-2.39-.96c-.22-.08-.47 0-.59.22L2.74 8.87c-.12.21-.08.47.12.61l2.03 1.58c-.05.3-.07.63-.07.94s.02.64.07.94l-2.03 1.58c-.18.14-.23.41-.12.61l1.92 3.32c.12.22.37.29.59.22l2.39-.96c.5.38 1.03.7 1.62.94l.36 2.54c.05.24.24.41.48.41h3.84c.24 0 .44-.17.47-.41l.36-2.54c.59-.24 1.13-.56 1.62-.94l2.39.96c.22.08.47 0 .59-.22l1.92-3.32c.12-.22.07-.47-.12-.61l-2.03-1.58zM12 15.6c-1.98 0-3.6-1.62-3.6-3.6s1.62-3.6 3.6-3.6 3.6 1.62 3.6 3.6-1.62 3.6-3.6 3.6z"/></svg>`;
  const rowsA=[
    {t:'Foundation',s:'2021 · Drama',i:0},{t:'Night Shift',s:'2024 · Thriller',i:1},
    {t:'Static',s:'2023 · Sci-Fi',i:2},{t:'Northline',s:'2024 · Drama',i:3},
    {t:'Halcyon',s:'2022 · Mystery',i:4},{t:'Axiom',s:'2023 · Action',i:5},
    {t:'Polar',s:'2021 · Thriller',i:6},
  ];
  const rowsB=[
    {t:'Cloudless',s:'2023 · Sci-Fi',i:3},{t:'Signal',s:'2022 · Drama',i:4},
    {t:'Transit',s:'2024 · Crime',i:5},{t:'Crimson Bay',s:'2021 · Mystery',i:6},
    {t:'Kinetic',s:'2023 · Action',i:0},{t:'Echo Point',s:'2023 · Thriller',i:1},
    {t:'Glass Hour',s:'2024 · Drama',i:2},
  ];
  const rowsC=[
    {t:'Midnight Tales',s:'S1 E4 · 34:12',w:true,p:55,nc:true},{t:'Foundation',s:'S3 E7 · 18:44',w:true,p:72,nc:true},
    {t:'Night Shift',s:'S2 E1 · 02:11',w:true,p:4,nc:true},{t:'Static',s:'S1 E6 · 44:03',w:true,p:36,nc:true},
    {t:'Northline',s:'S4 E2 · 12:50',w:true,p:21,nc:true},{t:'Axiom',s:'Movie · 58:22',w:true,p:88,nc:true},
  ];
  const rowsD=[
    {t:'Dusk Protocol',s:'2022 · Thriller',i:2},{t:'Dead Signal',s:'2021 · Horror',i:3},
    {t:'Neon Veil',s:'2023 · Sci-Fi',i:4},{t:'The Margin',s:'2022 · Drama',i:5},
    {t:'Cold Static',s:'2024 · Mystery',i:6},{t:'Last Frame',s:'2020 · Crime',i:0},
    {t:'Pale Echoes',s:'2021 · Thriller',i:1},
  ];
  const mkCard=(r,focused,wide)=>{
    const w=wide||r.w||false;
    const bg=r.nc?'rgba(255,255,255,.08)':pg(r.i);
    return `<div class="rh-card${w?' wide':''}">
      <div class="rh-poster${w?' wide':''}${focused?' focused':''}">
        <div class="rh-poster-fill" style="background:${bg}"></div>
        ${focused?'<div class="rh-unplayed"></div>':''}
        ${w&&r.p?`<div class="rh-prog"><div class="rh-prog-fill" style="width:${r.p}%"></div></div>`:''}
      </div>
      <div class="rh-card-title">${r.t}</div>
      <div class="rh-card-sub">${r.s}</div>
    </div>`;
  };
  const rail=(items)=>items.map((r,i)=>mkCard(r,i===1)).join('');
  const topMode=ST.previewNavMode==='top';
  const navPill=`<div class="rd-bar">
      <div class="rd-nav-pill" style="flex:1">
        <div class="rd-nav-pill-inner">
          <div class="rd-nav-ic act">${iHome}</div>
          <div class="rd-nav-ic">${iSearch}</div>
          <div class="rd-nav-ic">${iShuffle}</div>
          <div class="rd-nav-ic">${iGenres}</div>
          <div class="rd-nav-ic">${iFavRnd}</div>
          <div class="rd-nav-ic">${iGroups}</div>
          <div class="rd-nav-ic">${iMovie}</div>
          <div class="rd-nav-ic">${iGear}</div>
        </div>
      </div>
      <div class="rd-clock">12:31 AM</div>
    </div>`;
  const content=`
    <div class="rh">
      <div class="rh-backdrop" style="background:${pg(2)}"></div>
      <div class="rh-backdrop-scrim"></div>
      ${topMode?navPill:''}
      <div class="rh-scroll">
      <div class="rh-hero">
        <div class="rh-hero-img" style="background:${pg(0)}"></div>
        <div class="rh-hero-scrim"></div>
        <div class="rh-hero-logo">Midnight<br>Tales</div>
        <div class="rh-hero-arr rh-hero-arr-l">${iChevL}</div>
        <div class="rh-hero-arr rh-hero-arr-r">${iChevR}</div>
        <div class="rh-hero-bottom">
          <div class="rh-hero-dots">
            <div class="rh-dot rh-dot-act"></div>
            <div class="rh-dot"></div>
            <div class="rh-dot"></div>
            <div class="rh-dot"></div>
          </div>
          <div class="rh-hero-card">
            <div class="rh-hero-meta">
              <span>2024</span><span class="rh-hero-sep">·</span>
              <span class="rh-hero-badge">PG-13</span><span class="rh-hero-sep">·</span>
              <span>2h 14m</span><span class="rh-hero-sep">·</span>
              <span>Thriller · Crime · Sci-Fi</span>
            </div>
            <div class="rh-hero-ov">A neo-noir thriller set in a rain-soaked metropolis where every shadow conceals a darker truth. Nothing is as it seems.</div>
          </div>
        </div>
      </div>
      <div class="rh-info">
        <div class="rh-info-title">Foundation</div>
        <div class="rh-info-meta">
          <span>2021</span><span class="rh-hero-sep">·</span>
          <span class="rh-info-badge">TV-14</span><span class="rh-hero-sep">·</span>
          <span>S3 E7</span><span class="rh-hero-sep">·</span>
          <span>42m</span><span class="rh-hero-sep">·</span>
          <span>Drama · Sci-Fi</span>
        </div>
        <div class="rh-info-ov">The Foundation faces its most dangerous crisis as the Empire tightens its grip on the outer worlds and a new threat emerges from within.</div>
      </div>
      <div class="rh-rows">
        <div class="rh-row">
          <div class="rh-row-ttl">Continue Watching</div>
          <div class="rh-rail">${rail(rowsC)}</div>
        </div>
        <div class="rh-row">
          <div class="rh-row-ttl">Recently Added</div>
          <div class="rh-rail">${rail(rowsA)}</div>
        </div>
        <div class="rh-row">
          <div class="rh-row-ttl">Recently Watched</div>
          <div class="rh-rail">${rail(rowsB)}</div>
        </div>
        <div class="rh-row">
          <div class="rh-row-ttl">Recommended For You</div>
          <div class="rh-rail">${rail(rowsD)}</div>
        </div>
      </div>
      </div>
    </div>`;
  document.getElementById('pd-home').innerHTML=topMode?content:shell(content,'Home','Home');
}

function renderDetail(){
  const iArrow=`<svg viewBox="0 0 24 24"><path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"/></svg>`;
  const iHome=`<svg viewBox="0 0 24 24"><path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/></svg>`;
  const iSearch=`<svg viewBox="0 0 24 24"><path d="M15.5 14h-.79l-.28-.27A6.47 6.47 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/></svg>`;
  const iShuffle=`<svg viewBox="0 0 24 24"><path d="M10.59 9.17L5.41 4 4 5.41l5.17 5.17 1.42-1.41zM14.5 4l2.04 2.04L4 18.59 5.41 20 17.96 7.46 20 9.5V4h-5.5zm.33 9.41l-1.41 1.41 3.13 3.13L14.5 20H20v-5.5l-2.04 2.04-3.13-3.13z"/></svg>`;
  const iGenres=`<svg viewBox="0 0 24 24"><path d="M8.11,19.45C5.94,18.65 4.22,16.78 3.71,14.35L2.05,6.54C1.81,5.46 2.5,4.4 3.58,4.17L13.35,2.1L13.38,2.09C14.45,1.88 15.5,2.57 15.72,3.63L16.07,5.3L20.42,6.23H20.45C21.5,6.47 22.18,7.53 21.96,8.59L20.3,16.41C19.5,20.18 15.78,22.6 12,21.79C10.42,21.46 9.08,20.61 8.11,19.45V19.45M20,8.18L10.23,6.1L8.57,13.92V13.95C8,16.63 9.73,19.27 12.42,19.84C15.11,20.41 17.77,18.69 18.34,16L20,8.18M16,16.5C15.37,17.57 14.11,18.16 12.83,17.89C11.56,17.62 10.65,16.57 10.5,15.34L16,16.5M8.47,5.17L4,6.13L5.66,13.94L5.67,13.97C5.82,14.68 6.12,15.32 6.53,15.87C6.43,15.1 6.45,14.3 6.62,13.5L7.05,11.5C6.6,11.42 6.21,11.17 6,10.81C6.06,10.2 6.56,9.66 7.25,9.5C7.33,9.5 7.4,9.5 7.5,9.5L8.28,5.69C8.32,5.5 8.38,5.33 8.47,5.17M15.03,12.23C15.35,11.7 16.03,11.42 16.72,11.57C17.41,11.71 17.91,12.24 18,12.86C17.67,13.38 17,13.66 16.3,13.5C15.61,13.37 15.11,12.84 15.03,12.23M10.15,11.19C10.47,10.66 11.14,10.38 11.83,10.53C12.5,10.67 13.03,11.21 13.11,11.82C12.78,12.34 12.11,12.63 11.42,12.5C10.73,12.33 10.23,11.8 10.15,11.19M11.97,4.43L13.93,4.85L13.77,4.05L11.97,4.43Z" /></svg>`;
  const iFavRnd=`<svg viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>`;
  const iGroups=`<svg viewBox="0 0 24 24"><path d="M4 13c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm1.13 1.1c-.37-.06-.74-.1-1.13-.1-.99 0-1.93.21-2.78.58C.48 14.9 0 15.62 0 16.43V18h4.5v-1.61c0-.83.23-1.61.63-2.29zM20 13c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm4 3.43c0-.81-.48-1.53-1.22-1.85C21.93 14.21 20.99 14 20 14c-.39 0-.76.04-1.13.1.4.68.63 1.46.63 2.29V18H24v-1.57zM16.67 13.13c-.51-.31-1.08-.54-1.67-.7.58-.36 1-.99 1-1.68V10c0-1.1-.9-2-2-2s-2 .9-2 2v.75c0 .69.42 1.32 1 1.68-.59.16-1.16.39-1.67.7C10.52 13.77 10 14.62 10 15.6V18h8v-2.4c0-.98-.52-1.83-1.33-2.47z"/></svg>`;
  const iMovie=`<svg viewBox="0 0 24 24"><path d="m4 6.47.85 1.7H7V6h10v2.17h2.15L20 6.47V6c0-1.1-.9-2-2-2H6C4.9 4 4 4.9 4 6v.47zM22 8H2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8zm-9 9.5v-7l5.5 3.5L13 17.5z"/></svg>`;
  const iGear=`<svg viewBox="0 0 24 24"><path d="M19.14 12.94c.04-.3.06-.61.06-.94 0-.32-.02-.64-.07-.94l2.03-1.58c.18-.14.23-.41.12-.61l-1.92-3.32c-.12-.22-.37-.29-.59-.22l-2.39.96c-.5-.38-1.03-.7-1.62-.94l-.36-2.54c-.04-.24-.24-.41-.48-.41h-3.84c-.24 0-.43.17-.47.41l-.36 2.54c-.59.24-1.13.57-1.62.94l-2.39-.96c-.22-.08-.47 0-.59.22L2.74 8.87c-.12.21-.08.47.12.61l2.03 1.58c-.05.3-.07.63-.07.94s.02.64.07.94l-2.03 1.58c-.18.14-.23.41-.12.61l1.92 3.32c.12.22.37.29.59.22l2.39-.96c.5.38 1.03.7 1.62.94l.36 2.54c.05.24.24.41.48.41h3.84c.24 0 .44-.17.47-.41l.36-2.54c.59-.24 1.13-.56 1.62-.94l2.39.96c.22.08.47 0 .59-.22l1.92-3.32c.12-.22.07-.47-.12-.61l-2.03-1.58zM12 15.6c-1.98 0-3.6-1.62-3.6-3.6s1.62-3.6 3.6-3.6 3.6 1.62 3.6 3.6-1.62 3.6-3.6 3.6z"/></svg>`;
  const iPlay=`<svg viewBox="0 0 24 24"><path d="M8 5v14l11-7z"/></svg>`;
  const iSub=`<svg viewBox="0 0 24 24"><path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 14H4V6h16v12zM6 10h2v2H6zm0 4h8v2H6zm10 0h2v2h-2zm-6-4h8v2h-8z"/></svg>`;
  const iCast=`<svg viewBox="0 0 24 24"><path d="M21 3H3c-1.1 0-2 .9-2 2v3h2V5h18v14h-7v2h7c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zM1 18v3h3c0-1.66-1.34-3-3-3zm0-4v2c2.76 0 5 2.24 5 5h2c0-3.87-3.13-7-7-7zm0-4v2c4.97 0 9 4.03 9 9h2C12 14.07 7.07 9 1 9z"/></svg>`;
  const iTrail=`<svg viewBox="0 0 24 24"><path d="m4 6.47.85 1.7H7V6h10v2.17h2.15L20 6.47V6c0-1.1-.9-2-2-2H6C4.9 4 4 4.9 4 6v.47zM22 8H2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8zm-9 9.5v-7l5.5 3.5L13 17.5z"/></svg>`;
  const iCheck=`<svg viewBox="0 0 24 24"><path d="M16.59 7.58 10 14.17l-3.59-3.58L5 12l5 5 8-8zM12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"/></svg>`;
  const iFav=`<svg viewBox="0 0 24 24"><path d="M16.5 3c-1.74 0-3.41.81-4.5 2.09C10.91 3.81 9.24 3 7.5 3 4.42 3 2 5.42 2 8.5c0 3.78 3.4 6.86 8.55 11.54L12 21.35l1.45-1.32C18.6 15.36 22 12.28 22 8.5 22 5.42 19.58 3 16.5 3zm-4.4 15.55-.1.1-.1-.1C7.14 14.24 4 11.39 4 8.5 4 6.5 5.5 5 7.5 5c1.54 0 3.04.99 3.57 2.36h1.87C13.46 5.99 14.96 5 16.5 5c2 0 3.5 1.5 3.5 3.5 0 2.89-3.14 5.74-7.9 10.05z"/></svg>`;
  const iPlist=`<svg viewBox="0 0 24 24"><path d="M14 10H2v2h12v-2zm0-4H2v2h12V6zm4 8v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zM2 16h8v-2H2v2z"/></svg>`;
  const personSvg=`<svg viewBox="0 0 24 24" style="width:36px;height:36px;fill:rgba(255,255,255,.22)"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/></svg>`;
  const castData=[
    {n:'C. Thorne',r:'Lead Actor'},{n:'M. Reeves',r:'Dir. Cameo'},
    {n:'A. Vance',r:'Villain'},{n:'J. Holt',r:'Partner'},
    {n:'S. Mara',r:'Suspect'},{n:'D. Elliot',r:'Agent'},
    {n:'L. Park',r:'Tech Lead'},{n:'K. Weiss',r:'Hacker'},
    {n:'R. Novak',r:'Commander'},{n:'T. Blake',r:'Witness'},
    {n:'E. Cross',r:'Analyst'},{n:'N. Grey',r:'Ghost'},
  ];
  const castItems=castData.map(d=>`<div class="rd-citem"><div class="rd-cav" style="background:rgba(255,255,255,.07);display:flex;align-items:center;justify-content:center">${personSvg}</div><div class="rd-cname">${d.n}</div><div class="rd-crole">${d.r}</div></div>`).join('');
  const simData=[
    {i:0,t:'Echo Point',s:'2023'},{i:3,t:'Dusk Protocol',s:'2022'},
    {i:2,t:'Glass Hour',s:'2024'},{i:4,t:'Dead Signal',s:'2021'},
    {i:1,t:'Neon Veil',s:'2023'},{i:5,t:'The Margin',s:'2022'},
    {i:2,t:'Cold Static',s:'2024'},{i:0,t:'Last Frame',s:'2020'},
    {i:6,t:'Broken Grid',s:'2023'},{i:3,t:'Pale Echoes',s:'2021'},
  ];
  const simItems=simData.map(d=>`<div class="rd-sim-card"><div class="rd-sim-poster" style="background:rgba(255,255,255,.08)"></div><div class="rd-sim-title">${d.t}</div><div class="rd-sim-sub">${d.s}</div></div>`).join('');
  const topMode=ST.previewNavMode==='top';
  const rdNavBar=topMode
    ?`<div class="rd-bar"><div class="rd-nav-pill" style="flex:1"><div class="rd-nav-pill-inner"><div class="rd-nav-ic act">${iHome}</div><div class="rd-nav-ic">${iSearch}</div><div class="rd-nav-ic">${iShuffle}</div><div class="rd-nav-ic">${iGenres}</div><div class="rd-nav-ic">${iFavRnd}</div><div class="rd-nav-ic">${iGroups}</div><div class="rd-nav-ic">${iMovie}</div><div class="rd-nav-ic">${iGear}</div></div></div><div class="rd-clock">11:42 PM</div></div>`
    :`<div class="rd-bar"><div class="rd-back">${iArrow}</div><div style="flex:1"></div><div class="rd-clock">11:42 PM</div></div>`;
  const detailHtml=`
    <div class="rd">
      <div class="rd-backdrop" style="background:${pg(1)}"></div>
      <div class="rd-scrim"></div>
      ${rdNavBar}
      <div class="rd-content">
        <div class="rd-header">
          <div class="rd-info">
            <div class="rd-title">Midnight<br>Tales</div>
            <div class="rd-meta">
              <span>2024</span><span class="rd-meta-dot">·</span><span class="rd-meta-badge">PG-13</span><span class="rd-meta-dot">·</span><span>2h 14m</span><span class="rd-meta-dot">·</span><span>Ends 11:58 PM</span><span class="rd-meta-dot">·</span><span>Thriller · Crime · Sci-Fi</span>
            </div>
            <div class="rd-chips">
              <span class="rd-chip">1080p</span><span class="rd-chip">SDR</span><span class="rd-chip">HEVC</span><span class="rd-chip">EAC3</span><span class="rd-chip">5.1</span>
            </div>
            <div class="rd-tagline">Some stories are better left untold.</div>
            <div class="rd-overview">A neo-noir thriller set in a rain-soaked metropolis where every shadow conceals a darker truth. Midnight Tales weaves interconnected stories of ambition, betrayal, and the price of silence — nothing is as it seems.</div>
          </div>
          <div class="rd-poster" style="background:${pg(2)}"></div>
        </div>
        <div class="rd-actions">
          <div class="rd-act"><div class="rd-act-ic">${iPlay}</div><div class="rd-act-lbl">Play</div></div>
          <div class="rd-act"><div class="rd-act-ic">${iSub}</div><div class="rd-act-lbl">Subtitles</div></div>
          <div class="rd-act"><div class="rd-act-ic">${iCast}</div><div class="rd-act-lbl">Cast</div></div>
          <div class="rd-act"><div class="rd-act-ic">${iTrail}</div><div class="rd-act-lbl">Trailer</div></div>
          <div class="rd-act"><div class="rd-act-ic">${iCheck}</div><div class="rd-act-lbl">Unwatched</div></div>
          <div class="rd-act"><div class="rd-act-ic">${iFav}</div><div class="rd-act-lbl">Favorite</div></div>
          <div class="rd-act"><div class="rd-act-ic">${iPlist}</div><div class="rd-act-lbl">Playlist</div></div>
        </div>
        <div class="rd-msec">
          <div class="rd-mcell"><div class="rd-mk">Director</div><div class="rd-mv">Lena Morgan</div></div>
          <div class="rd-mdiv"></div>
          <div class="rd-mcell"><div class="rd-mk">Writers</div><div class="rd-mv">T. Callahan, M. Hayes, J. Reeves</div></div>
          <div class="rd-mdiv"></div>
          <div class="rd-mcell"><div class="rd-mk">Studio</div><div class="rd-mv">Nexus Pictures, Dark Frame Productions</div></div>
        </div>
        <div class="rd-csec">
          <div class="rd-chd"><span class="rd-cttl">Cast &amp; Crew</span><div class="rd-cnav"><div class="rd-cbtn">&#8249;</div><div class="rd-cbtn">&#8250;</div></div></div>
          <div class="rd-crow">${castItems}</div>
        </div>
        <div class="rd-sim">
          <div class="rd-sim-hd"><span class="rd-sim-ttl">More Like This</span></div>
          <div class="rd-sim-row">${simItems}</div>
        </div>
      </div>
    </div>`;
  document.getElementById('pd-detail').innerHTML=topMode?detailHtml:shell(detailHtml,'','Detail');
}

function renderPlayer(){
  const icon=(content, viewBox='0 0 24 24')=>`<svg viewBox="${viewBox}" aria-hidden="true" focusable="false">${content}</svg>`;
  const iSkipPrev=icon('<path d="M7 6c.55 0 1 .45 1 1v10c0 .55-.45 1-1 1s-1-.45-1-1V7c0-.55.45-1 1-1zm3.66 6.82l5.77 4.07c.66.47 1.58-.01 1.58-.82V7.93c0-.81-.91-1.28-1.58-.82l-5.77 4.07c-.57.4-.57 1.24 0 1.64z"/>');
  const iReplay=icon('<path d="M11.99 5V2.21c0-.45-.54-.67-.85-.35L7.35 5.65c-.2.2-.2.51 0 .71l3.79 3.79c.31.31.85.09.85-.35V7c3.73 0 6.68 3.42 5.86 7.29-.47 2.27-2.31 4.1-4.57 4.57-3.57.75-6.75-1.7-7.23-5.01-.06-.48-.48-.85-.98-.85-.6 0-1.08.53-1 1.13.62 4.39 4.8 7.64 9.53 6.72 3.12-.61 5.63-3.12 6.24-6.24.99-5.13-2.9-9.61-7.85-9.61zm-1.1 11h-.85v-3.26l-1.01.31v-.69l1.77-.63h.09V16zm4.28-1.76c0 .32-.03.6-.1.82s-.17.42-.29.57-.28.26-.45.33-.37.1-.59.1-.41-.03-.59-.1-.33-.18-.46-.33-.23-.34-.3-.57-.11-.5-.11-.82v-.74c0-.32.03-.6.1-.82s.17-.42.29-.57.28-.26.45-.33.37-.1.59-.1.41.03.59.1.33.18.46.33.23.34.3.57.11.5.11.82v.74zm-.85-.86c0-.19-.01-.35-.04-.48s-.07-.23-.12-.31-.11-.14-.19-.17-.16-.05-.25-.05-.18.02-.25.05-.14.09-.19.17-.09.18-.12.31-.04.29-.04.48v.97c0 .19.01.35.04.48s.07.24.12.32.11.14.19.17.16.05.25.05.18-.02.25-.05.14-.09.19-.17.09-.19.11-.32.04-.29.04-.48v-.97z"/>');
  const iPause=icon('<path d="M8 19c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2s-2 .9-2 2v10c0 1.1.9 2 2 2zm6-12v10c0 1.1.9 2 2 2s2-.9 2-2V7c0-1.1-.9-2-2-2s-2 .9-2 2z"/>');
  const iForward=icon('<path d="M18.92 13c-.5 0-.91.37-.98.86-.48 3.37-3.77 5.84-7.42 4.96-2.25-.54-3.91-2.27-4.39-4.53C5.32 10.42 8.27 7 12 7v2.79c0 .45.54.67.85.35l3.79-3.79c.2-.2.2-.51 0-.71l-3.79-3.79c-.31-.31-.85-.09-.85.36V5c-4.94 0-8.84 4.48-7.84 9.6.6 3.11 2.9 5.5 5.99 6.19 4.83 1.08 9.15-2.2 9.77-6.67.09-.59-.4-1.12-1-1.12zm-8.02 3v-4.27h-.09l-1.77.63v.69l1.01-.31V16zm3.42-4.22c-.18-.07-.37-.1-.59-.1s-.41.03-.59.1-.33.18-.45.33-.23.34-.29.57-.1.5-.1.82v.74c0 .32.04.6.11.82s.17.42.3.57.28.26.46.33.37.1.59.1.41-.03.59-.1.33-.18.45-.33.22-.34.29-.57.1-.5.1-.82v-.74c0-.32-.04-.6-.11-.82s-.17-.42-.3-.57-.29-.26-.46-.33zm.01 2.57c0 .19-.01.35-.04.48s-.06.24-.11.32-.11.14-.19.17-.16.05-.25.05-.18-.02-.25-.05-.14-.09-.19-.17-.09-.19-.12-.32-.04-.29-.04-.48v-.97c0-.19.01-.35.04-.48s.06-.23.12-.31.11-.14.19-.17.16-.05.25-.05.18.02.25.05.14.09.19.17.09.18.12.31.04.29.04.48v.97z"/>');
  const iSkipNext=icon('<path d="M7.58 16.89l5.77-4.07c.56-.4.56-1.24 0-1.63L7.58 7.11C6.91 6.65 6 7.12 6 7.93v8.14c0 .81.91 1.28 1.58.82zM16 7v10c0 .55.45 1 1 1s1-.45 1-1V7c0-.55-.45-1-1-1s-1 .45-1 1z"/>');
  const iSubtitles=icon('<path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 14H4V6h16v12zM6 10h2v2H6zm0 4h8v2H6zm10 0h2v2h-2zm-6-4h8v2h-8z"/>');
  const iAudio=icon('<path d="M12 3v10.55c-.59-.34-1.27-.55-2-.55-2.21 0-4 1.79-4 4s1.79 4 4 4 4-1.79 4-4V7h4V3h-6zm-2 16c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2z"/>');
  const iQuality=icon('<path d="M3,6h18v5h2V6c0-1.1-0.9-2-2-2H3C1.9,4,1,4.9,1,6v12c0,1.1,0.9,2,2,2h9v-2H3V6z"/><polygon points="15,12 9,8 9,16"/><path d="M22.71,18.43c0.03-0.29,0.04-0.58,0.01-0.86l1.07-0.85c0.1-0.08,0.12-0.21,0.06-0.32l-1.03-1.79 c-0.06-0.11-0.19-0.15-0.31-0.11L21.23,15c-0.23-0.17-0.48-0.31-0.75-0.42l-0.2-1.36C20.26,13.09,20.16,13,20.03,13h-2.07 c-0.12,0-0.23,0.09-0.25,0.21l-0.2,1.36c-0.26,0.11-0.51,0.26-0.74,0.42l-1.28-0.5c-0.12-0.05-0.25,0-0.31,0.11l-1.03,1.79 c-0.06,0.11-0.04,0.24,0.06,0.32l1.07,0.86c-0.03,0.29-0.04,0.58-0.01,0.86l-1.07,0.85c-0.1,0.08-0.12,0.21-0.06,0.32l1.03,1.79 c0.06,0.11,0.19,0.15,0.31,0.11l1.27-0.5c0.23,0.17,0.48,0.31,0.75,0.42l0.2,1.36c0.02,0.12,0.12,0.21,0.25,0.21h2.07 c0.12,0,0.23-0.09,0.25-0.21l0.2-1.36c0.26-0.11,0.51-0.26,0.74-0.42l1.28,0.5c0.12,0.05,0.25,0,0.31-0.11l1.03-1.79 c0.06-0.11,0.04-0.24-0.06-0.32L22.71,18.43z M19,19.5c-0.83,0-1.5-0.67-1.5-1.5s0.67-1.5,1.5-1.5s1.5,0.67,1.5,1.5 S19.83,19.5,19,19.5z"/>');
  const iPeople=icon('<path d="M9 12c1.93 0 3.5-1.57 3.5-3.5S10.93 5 9 5 5.5 6.57 5.5 8.5 7.07 12 9 12zm0-5c.83 0 1.5.67 1.5 1.5S9.83 10 9 10s-1.5-.67-1.5-1.5S8.17 7 9 7zm0 6.75c-2.34 0-7 1.17-7 3.5V18c0 .55.45 1 1 1h12c.55 0 1-.45 1-1v-.75c0-2.33-4.66-3.5-7-3.5zM4.34 17c.84-.58 2.87-1.25 4.66-1.25s3.82.67 4.66 1.25H4.34zm11.7-3.19c1.16.84 1.96 1.96 1.96 3.44V19h3c.55 0 1-.45 1-1v-.75c0-2.02-3.5-3.17-5.96-3.44zM15 12c1.93 0 3.5-1.57 3.5-3.5S16.93 5 15 5c-.54 0-1.04.13-1.5.35.63.89 1 1.98 1 3.15s-.37 2.26-1 3.15c.46.22.96.35 1.5.35z"/>');
  const iZoom=icon('<path d="M17 15h2V7c0-1.1-.9-2-2-2H9v2h7c.55 0 1 .45 1 1v7zm-9 2c-.55 0-1-.45-1-1V2c0-.55-.45-1-1-1s-1 .45-1 1v3H2c-.55 0-1 .45-1 1s.45 1 1 1h3v10c0 1.1.9 2 2 2h10v3c0 .55.45 1 1 1s1-.45 1-1v-3h3c.55 0 1-.45 1-1s-.45-1-1-1H8z"/>');
  const iInfo=icon('<path d="M11 7h2v2h-2zm1 10c.55 0 1-.45 1-1v-4c0-.55-.45-1-1-1s-1 .45-1 1v4c0 .55.45 1 1 1zm0-15C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"/>');
  document.getElementById('pd-player').innerHTML=`
    <div class="mf-player mf-player-tv">
      <div class="mf-player-video" style="background:${pg(5)}"></div>
      <div class="mf-player-top mf-player-top-tv">
        <div class="mf-player-title">Midnight Tales - S1E04 - The Long Night</div>
      </div>
      <div class="mf-nextup">
        <div class="mf-nextup-img" style="background:${pg(0)}"></div>
        <div class="mf-nextup-body"><div class="mf-nextup-k">Up Next</div><div class="mf-nextup-t">Episode 5 - Overcast</div></div>
      </div>
      <div class="mf-player-bottom mf-player-bottom-tv">
        <div class="mf-seek"><div class="mf-seek-buf"></div><div class="mf-seek-prog"></div><div class="mf-seek-thumb"></div></div>
        <div class="mf-time-row"><span>34:12</span><span>1:02:44</span></div>
        <div class="mf-tv-controls-row">
          <div class="mf-tv-transport">
            <div class="mf-iconbtn">${iSkipPrev}</div>
            <div class="mf-tv-gap-xs"></div>
            <div class="mf-iconbtn">${iReplay}</div>
            <div class="mf-tv-gap-sm"></div>
            <div class="mf-iconbtn play">${iPause}</div>
            <div class="mf-tv-gap-sm"></div>
            <div class="mf-iconbtn">${iForward}</div>
            <div class="mf-tv-gap-xs"></div>
            <div class="mf-iconbtn">${iSkipNext}</div>
          </div>
          <div class="mf-tv-secondary">
            <div class="mf-iconbtn mf-chipbtn">1.0x</div>
            <div class="mf-iconbtn">${iSubtitles}</div>
            <div class="mf-iconbtn">${iAudio}</div>
            <div class="mf-iconbtn">${iPeople}</div>
            <div class="mf-iconbtn">${iQuality}</div>
            <div class="mf-iconbtn">${iZoom}</div>
            <div class="mf-iconbtn">${iInfo}</div>
          </div>
        </div>
      </div>
    </div>`;
}

function renderSearch(){
  const iMic=`<svg viewBox="0 0 24 24"><path d="M12 14c1.66 0 3-1.34 3-3V5c0-1.66-1.34-3-3-3S9 3.34 9 5v6c0 1.66 1.34 3 3 3zm5.91-3c-.49 0-.9.36-.98.85C16.52 14.2 14.47 16 12 16s-4.52-1.8-4.93-4.15c-.08-.49-.49-.85-.98-.85-.61 0-1.09.54-1 1.14.49 3 2.89 5.35 5.91 5.77V20c0 .55.45 1 1 1s1-.45 1-1v-2.09c3.01-.42 5.42-2.76 5.91-5.77.1-.6-.39-1.14-1-1.14z"/></svg>`;
  const iSearch=`<svg viewBox="0 0 24 24"><path d="M15.5 14h-.79l-.28-.27A6.47 6.47 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/></svg>`;
  const personSvg=`<svg viewBox="0 0 24 24"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/></svg>`;
  const movies=[
    {t:'Foundation',s:'2021 · Drama',i:0},{t:'Midnight Tales',s:'2024 · Thriller',i:1},
    {t:'Foundation Day',s:'Movie · 2022',i:3},{t:'The Foundation',s:'Movie · 2021',i:4},
    {t:'Foundation Rise',s:'2023 · Drama',i:5},
  ];
  const shows=[
    {t:'Foundation S3',s:'S3 · 10 eps',i:2},{t:'Foundation Files',s:'2022 · Doc',i:4},
    {t:'After Foundation',s:'2023 · Sci-Fi',i:6},{t:'Foundation: Side B',s:'2024 · Drama',i:0},
  ];
  const people=[
    {n:'Lee Pace',r:'Actor'},{n:'Jared Harris',r:'Actor'},{n:'Laura Birn',r:'Actress'},
    {n:'David Goyer',r:'Creator'},{n:'Todd Philips',r:'Director'},{n:'Leah Harvey',r:'Actress'},
  ];
  const mkCard=(r)=>`<div class="rh-card">
    <div class="rh-poster"><div class="rh-poster-fill" style="background:${pg(r.i)}"></div></div>
    <div class="rh-card-title">${r.t}</div><div class="rh-card-sub">${r.s}</div>
  </div>`;
  const topMode=ST.previewNavMode==='top';
  const content=`
    <div class="rs">
      <div class="rs-topbar">
        <div class="rs-mic">${iMic}</div>
        <div class="rs-field">${iSearch}<span class="rs-field-text">Foundation<span class="rs-cursor"></span></span></div>
      </div>
      <div class="rs-scroll">
        <div class="rs-row-ttl">Movies</div>
        <div class="rs-rail">${movies.map(mkCard).join('')}</div>
        <div class="rs-row-ttl">Shows</div>
        <div class="rs-rail">${shows.map(mkCard).join('')}</div>
        <div class="rs-row-ttl">People</div>
        <div class="rs-rail">${people.map(p=>`<div class="rs-person-card">
          <div class="rs-person-av">${personSvg}</div>
          <div class="rs-person-name">${p.n}</div>
          <div class="rs-person-role">${p.r}</div>
        </div>`).join('')}</div>
      </div>
    </div>`;
  document.getElementById('pd-search').innerHTML=topMode?content:shell(content,'Search','Search');
}

function renderLibrary(){
  const iBack=`<svg viewBox="0 0 24 24"><path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"/></svg>`;
  const iList=`<svg viewBox="0 0 24 24"><path d="M3 13h2v-2H3v2zm0 4h2v-2H3v2zm0-8h2V7H3v2zm4 4h14v-2H7v2zm0 4h14v-2H7v2zM7 7v2h14V7H7z"/></svg>`;
  const iSettings=`<svg viewBox="0 0 24 24"><path d="M19.14 12.94c.04-.3.06-.61.06-.94 0-.32-.02-.64-.07-.94l2.03-1.58c.18-.14.23-.41.12-.61l-1.92-3.32c-.12-.22-.37-.29-.59-.22l-2.39.96c-.5-.38-1.03-.7-1.62-.94l-.36-2.54c-.04-.24-.24-.41-.48-.41h-3.84c-.24 0-.43.17-.47.41l-.36 2.54c-.59.24-1.13.57-1.62.94l-2.39-.96c-.22-.08-.47 0-.59.22L2.74 8.87c-.12.21-.08.47.12.61l2.03 1.58c-.05.3-.07.63-.07.94s.02.64.07.94l-2.03 1.58c-.18.14-.23.41-.12.61l1.92 3.32c.12.22.37.29.59.22l2.39-.96c.5.38 1.03.7 1.62.94l.36 2.54c.05.24.24.41.48.41h3.84c.24 0 .44-.17.47-.41l.36-2.54c.59-.24 1.13-.56 1.62-.94l2.39.96c.22.08.47 0 .59-.22l1.92-3.32c.12-.22.07-.47-.12-.61l-2.03-1.58zM12 15.6c-1.98 0-3.6-1.62-3.6-3.6s1.62-3.6 3.6-3.6 3.6 1.62 3.6 3.6-1.62 3.6-3.6 3.6z"/></svg>`;
  const items=[
    {t:'Movie Title',m:'2021',r:'PG-13',d:'1h 49m',p:0},
    {t:'Movie Title',m:'2019',r:'PG-13',d:'1h 39m',p:0},
    {t:'Movie Title',m:'2018',r:'R',d:'2h 1m',p:0},
    {t:'Movie Title',m:'2020',r:'PG-13',d:'1h 52m',p:0},
    {t:'Movie Title',m:'2017',r:'PG',d:'1h 27m',p:0},
    {t:'Movie Title',m:'2016',r:'G',d:'1h 26m',p:0},
    {t:'Movie Title',m:'2015',r:'R',d:'1h 56m',p:0},
    {t:'Movie Title',m:'2022',r:'R',d:'1h 48m',p:0},
    {t:'Movie Title',m:'2023',r:'R',d:'2h 2m',p:0},
    {t:'Movie Title',m:'2024',r:'R',d:'1h 58m',p:0},
    {t:'Movie Title',m:'2014',r:'R',d:'2h 34m',p:0},
    {t:'Movie Title',m:'2013',r:'R',d:'1h 55m',p:0},
    {t:'Movie Title',m:'2012',r:'PG',d:'1h 32m',p:0},
    {t:'Movie Title',m:'2011',r:'R',d:'1h 43m',p:0},
    {t:'Movie Title',m:'2010',r:'PG',d:'1h 37m',p:0},
    {t:'Movie Title',m:'2009',r:'PG',d:'1h 36m',p:100},
    {t:'Movie Title',m:'2008',r:'R',d:'1h 39m',p:0},
    {t:'Movie Title',m:'2007',r:'R',d:'2h 17m',p:55},
    {t:'Movie Title',m:'2006',r:'PG-13',d:'2h 42m',p:0},
    {t:'Movie Title',m:'2005',r:'PG-13',d:'3h 12m',p:30},
  ];
  const letters=['All','#','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
  const letterBar=`
    <div class="rl-letterbar-btn">${iBack}</div>
    <div class="rl-letterbar-btn">${iList}</div>
    <div class="rl-letterbar-btn">${iSettings}</div>
    <div class="rl-letterbar-sep"></div>
    ${letters.map(l=>`<div class="rl-letter${l==='A'?' on':''}">${l}</div>`).join('')}`;
  const mkCard=r=>`<div class="rl-card">
    <div class="rl-poster">
      <div class="rl-poster-fill"></div>
      ${r.p>0&&r.p<100?`<div class="rl-prog"><div class="rl-prog-fill" style="width:${r.p}%"></div></div>`:''}
    </div>
    <div class="rl-card-title">${r.t}</div>
    <div class="rl-card-meta">${r.m} ${r.r} · ${r.d}</div>
  </div>`;
  const content=`
    <div class="rl">
      <div class="rl-backdrop"></div>
      <div class="rl-scrim"></div>
      <div class="rl-topbar">
        <div class="rl-focused-info">
          <div class="rl-focused-title">Movie Title</div>
          <div class="rl-focused-meta">
            <span>2021</span>
            <span>1h 49m</span>
            <span class="rl-focused-rating">PG-13</span>
          </div>
        </div>
        <div class="rl-centered-title">Movies <span class="rl-centered-count">412 Items</span></div>
      </div>
      <div class="rl-letterbar">${letterBar}</div>
      <div class="rl-grid-wrap">
        <div class="rl-grid">${items.map(mkCard).join('')}</div>
      </div>
    </div>`;
  document.getElementById('pd-library').innerHTML=content;
}

function renderEpg(){
  const iBack=`<svg viewBox="0 0 24 24"><path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"/></svg>`;
  const iChL=`<svg viewBox="0 0 24 24"><path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/></svg>`;
  const iChR=`<svg viewBox="0 0 24 24"><path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"/></svg>`;
  const iCal=`<svg viewBox="0 0 24 24"><path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"/></svg>`;
  const iDvr=`<svg viewBox="0 0 24 24"><path d="M21 3H3c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h5v2h8v-2h5c1.1 0 1.99-.9 1.99-2L23 5c0-1.1-.9-2-2-2zm0 14H3V5h18v12zm-3.5-6l-7 4.5V7l7 4.5z"/></svg>`;
  const iRec=`<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="8"/></svg>`;
  const W=180, NOW=60;
  const pct=m=>`${(m/W*100).toFixed(2)}%`;
  const ts=m=>{const b=20*60+m,h=Math.floor(b/60)%24,mn=b%60;return `${h}:${mn.toString().padStart(2,'0')}`;};
  const channels=[
    {name:'BBC News',num:'101',bg:pg(0),progs:[
      {t:'Evening News',from:0,dur:60},{t:'World Report',from:60,dur:60,live:true,lp:42},{t:'Late Headlines',from:120,dur:60}]},
    {name:'CNN',num:'202',bg:pg(1),progs:[
      {t:'Anderson Cooper',from:0,dur:30},{t:'Breaking Point',from:30,dur:30,live:true,lp:5,rec:true},{t:'Primetime',from:60,dur:60,sched:true},{t:'Night Report',from:120,dur:60}]},
    {name:'Discovery',num:'315',bg:pg(2),progs:[
      {t:'Planet Earth III',from:0,dur:90,live:true,lp:67},{t:'Deep Ocean',from:90,dur:60},{t:'Universe Explained',from:150,dur:30}]},
    {name:'HBO',num:'420',bg:pg(3),progs:[
      {t:'The Last of Us',from:0,dur:60,rec:true},{t:'Dune: Prophecy',from:60,dur:60,live:true,lp:18},{t:'House of Dragon',from:120,dur:60}]},
    {name:'ESPN',num:'510',bg:pg(4),progs:[
      {t:'SportsCenter',from:0,dur:30},{t:'NBA Live',from:30,dur:90,live:true,lp:35,rec:true},{t:'Top 10',from:120,dur:30},{t:'Late Sports',from:150,dur:30}]},
    {name:'Nat Geo',num:'630',bg:pg(5),progs:[
      {t:'Wild Kingdom',from:0,dur:60},{t:'Space Odyssey',from:60,dur:60,live:true,lp:55},{t:'Ancient Worlds',from:120,dur:60}]},
  ];
  const chSidebar=channels.map(ch=>`<div class="rg-ch-cell">
    <div class="rg-ch-logo" style="background:${ch.bg}">${ch.name.slice(0,3).toUpperCase()}</div>
    <div><div class="rg-ch-name">${ch.name}</div><div class="rg-ch-num">${ch.num}</div></div>
  </div>`).join('');
  const timeHeader=['20:00','20:30','21:00','21:30','22:00','22:30'].map(t=>
    `<div class="rg-time-cell" style="width:${pct(30)}">${t}</div>`).join('');
  const guideRows=channels.map(ch=>`<div class="rg-row">${ch.progs.map(p=>`<div class="rg-prog${p.live?' live':''}" style="width:${pct(p.dur)}">
    <div class="rg-prog-title">${p.t}</div>
    <div class="rg-prog-time">${ts(p.from)} – ${ts(p.from+p.dur)}</div>
    ${p.rec||p.sched?`<div class="rg-prog-badge${p.sched?' scheduled':''}">${iRec} ${p.sched?'SCHED':'REC'}</div>`:''}
    ${p.live&&p.lp?`<div class="rg-live-bar" style="width:${p.lp}%"></div>`:''}
  </div>`).join('')}</div>`).join('');
  const content=`
    <div class="rg">
      <div class="rg-toolbar">
        <div class="rg-pill">${iBack}</div>
        <div class="rg-pill">${iChL}</div>
        <div class="rg-pill act">Now</div>
        <div class="rg-pill">${iChR}</div>
        <div class="rg-date">Sun 4 May &nbsp;·&nbsp; 20:00 – 23:00</div>
        <div class="rg-pill">${iCal}</div>
        <div class="rg-pill">${iDvr} Recordings</div>
      </div>
      <div class="rg-chips">
        <div class="rg-chip on">All</div><div class="rg-chip">Movies</div>
        <div class="rg-chip">Series</div><div class="rg-chip">Sports</div>
        <div class="rg-chip">News</div><div class="rg-chip">Kids</div><div class="rg-chip">Premiere</div>
      </div>
      <div class="rg-divider"></div>
      <div class="rg-guide">
        <div class="rg-channels">${chSidebar}</div>
        <div class="rg-body">
          <div class="rg-timehdr">${timeHeader}</div>
          <div class="rg-rows">
            <div class="rg-now-line" style="left:${pct(NOW)}"><div class="rg-now-dot"></div></div>
            ${guideRows}
          </div>
        </div>
      </div>
    </div>`;
  document.getElementById('pd-epg').innerHTML=content;
}

function renderSettings(){
  const icon=(content, viewBox='0 0 24 24')=>`<svg viewBox="${viewBox}" aria-hidden="true" focusable="false">${content}</svg>`;
  const iAdmin=icon('<path d="M17,11c0.34,0,0.67,0.04,1,0.09V7.58c0-0.8-0.47-1.52-1.2-1.83l-5.5-2.4c-0.51-0.22-1.09-0.22-1.6,0l-5.5,2.4 C3.47,6.07,3,6.79,3,7.58v3.6c0,4.54,3.2,8.79,7.5,9.82c0.55-0.13,1.08-0.32,1.6-0.55C11.41,19.47,11,18.28,11,17 C11,13.69,13.69,11,17,11z"/><path d="M17,13c-2.21,0-4,1.79-4,4c0,2.21,1.79,4,4,4s4-1.79,4-4C21,14.79,19.21,13,17,13z M17,14.38c0.62,0,1.12,0.51,1.12,1.12 s-0.51,1.12-1.12,1.12s-1.12-0.51-1.12-1.12S16.38,14.38,17,14.38z M17,19.75c-0.93,0-1.74-0.46-2.24-1.17 c0.05-0.72,1.51-1.08,2.24-1.08s2.19,0.36,2.24,1.08C18.74,19.29,17.93,19.75,17,19.75z"/>');
  const iLock=icon('<path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zM9 8V6c0-1.66 1.34-3 3-3s3 1.34 3 3v2H9z"/>');
  const iPalette=icon('<path d="M12,2C6.49,2,2,6.49,2,12s4.49,10,10,10c1.38,0,2.5-1.12,2.5-2.5c0-0.61-0.23-1.2-0.64-1.67c-0.08-0.1-0.13-0.21-0.13-0.33 c0-0.28,0.22-0.5,0.5-0.5H16c3.31,0,6-2.69,6-6C22,6.04,17.51,2,12,2z M17.5,13c-0.83,0-1.5-0.67-1.5-1.5c0-0.83,0.67-1.5,1.5-1.5 s1.5,0.67,1.5,1.5C19,12.33,18.33,13,17.5,13z M14.5,9C13.67,9,13,8.33,13,7.5C13,6.67,13.67,6,14.5,6S16,6.67,16,7.5 C16,8.33,15.33,9,14.5,9z M5,11.5C5,10.67,5.67,10,6.5,10S8,10.67,8,11.5C8,12.33,7.33,13,6.5,13S5,12.33,5,11.5z M11,7.5 C11,8.33,10.33,9,9.5,9S8,8.33,8,7.5C8,6.67,8.67,6,9.5,6S11,6.67,11,7.5z"/>');
  const iPlaylist=icon('<path d="M21 3H3c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h18c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-10 8H4c-.55 0-1-.45-1-1s.45-1 1-1h7c.55 0 1 .45 1 1s-.45 1-1 1zm0-4H4c-.55 0-1-.45-1-1s.45-1 1-1h7c.55 0 1 .45 1 1s-.45 1-1 1z"/>');
  const iPlayCircle=icon('<path d="M12,2C6.48,2,2,6.48,2,12s4.48,10,10,10s10-4.48,10-10S17.52,2,12,2z M9.5,14.67V9.33c0-0.79,0.88-1.27,1.54-0.84 l4.15,2.67c0.61,0.39,0.61,1.29,0,1.68l-4.15,2.67C10.38,15.94,9.5,15.46,9.5,14.67z"/>');
  const iHub=icon('<path d="M8.4,18.2C8.78,18.7,9,19.32,9,20c0,1.66-1.34,3-3,3s-3-1.34-3-3s1.34-3,3-3c0.44,0,0.85,0.09,1.23,0.26l1.41-1.77 c-0.92-1.03-1.29-2.39-1.09-3.69l-2.03-0.68C4.98,11.95,4.06,12.5,3,12.5c-1.66,0-3-1.34-3-3s1.34-3,3-3s3,1.34,3,3 c0,0.07,0,0.14-0.01,0.21l2.03,0.68c0.64-1.21,1.82-2.09,3.22-2.32l0-2.16C9.96,5.57,9,4.4,9,3c0-1.66,1.34-3,3-3s3,1.34,3,3 c0,1.4-0.96,2.57-2.25,2.91v2.16c1.4,0.23,2.58,1.11,3.22,2.32l2.03-0.68C18,9.64,18,9.57,18,9.5c0-1.66,1.34-3,3-3s3,1.34,3,3 s-1.34,3-3,3c-1.06,0-1.98-0.55-2.52-1.37l-2.03,0.68c0.2,1.29-0.16,2.65-1.09,3.69l1.41,1.77C17.15,17.09,17.56,17,18,17 c1.66,0,3,1.34,3,3s-1.34,3-3,3s-3-1.34-3-3c0-0.68,0.22-1.3,0.6-1.8l-1.41-1.77c-1.35,0.75-3.01,0.76-4.37,0L8.4,18.2z"/>');
  const iBrush=icon('<path d="M7 14c-1.66 0-3 1.34-3 3 0 1.31-1.16 2-2 2 .92 1.22 2.49 2 4 2 2.21 0 4-1.79 4-4 0-1.66-1.34-3-3-3zm13.71-9.37l-1.34-1.34c-.39-.39-1.02-.39-1.41 0L9 12.25 11.75 15l8.96-8.96c.39-.39.39-1.02 0-1.41z"/>');
  const iInfo=icon('<path d="M11 7h2v2h-2zm1 10c.55 0 1-.45 1-1v-4c0-.55-.45-1-1-1s-1 .45-1 1v4c0 .55.45 1 1 1zm0-15C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"/>');
  const iChev=icon('<path d="M9.29 6.71c-.39.39-.39 1.02 0 1.41L13.17 12l-3.88 3.88c-.39.39-.39 1.02 0 1.41.39.39 1.02.39 1.41 0l4.59-4.59c.39-.39.39-1.02 0-1.41L10.7 6.7c-.38-.38-1.02-.38-1.41.01z"/>');
  const entries=[
    {ic:iAdmin,t:'Administration',s:'Access the server administration panel'},
    {ic:iLock,t:'Account & Security',s:'Authentication, PIN code, and parental controls'},
    {ic:iPalette,t:'Personalization',s:'Theme, navigation, home rows, and library visibility'},
    {ic:iPlaylist,t:'Dynamic Content',s:'Media Bar and visual overlays'},
    {ic:iPlayCircle,t:'Playback & SyncPlay',s:'Audio/video settings, subtitles, downloads, and SyncPlay controls'},
    {ic:iHub,t:'Integrations',s:'Plugin sync, Seerr, ratings, and more'},
    {ic:iBrush,t:'Theme Editor',s:'Open the Moonfin Theme Editor in your browser'},
    {ic:iInfo,t:'About',s:'App version, legal information, and credits'},
  ];
  const content=`
    <div class="rx">
      <div class="rx-header"><div class="rx-header-title">Settings</div></div>
      <div class="rx-scroll">
        ${entries.map(e=>`<div class="rx-tile">
          <div class="rx-ic">${e.ic}</div>
          <div class="rx-text"><div class="rx-label">${e.t}</div><div class="rx-sub">${e.s}</div></div>
          <div class="rx-chev">${iChev}</div>
        </div>`).join('')}
      </div>
    </div>`;
  document.getElementById('pd-settings').innerHTML=content;
}

function renderAll(){ renderHome(); renderDetail(); renderPlayer(); renderSearch(); renderLibrary(); renderEpg(); renderSettings(); }

const TOKEN_META = {
  'colors.background': {label:'App Background', hint:'Main app canvas/background'},
  'colors.onBackground': {label:'Text on App Background', hint:'Primary text/icons over background'},
  'colors.surface': {label:'Card/Panel Surface', hint:'Cards, rails, and panel fills'},
  'colors.onSurface': {label:'Text on Surface', hint:'Text/icons shown on cards and panels'},
  'colors.surfaceVariant': {label:'Alternate Surface', hint:'Secondary panel/surface shade'},
  'colors.scrim': {label:'Overlay Scrim', hint:'Dim overlay for backdrops/modals'},
  'colors.accent': {label:'Accent Color', hint:'Primary highlight/action color'},
  'colors.onAccent': {label:'Text on Accent', hint:'Text/icons rendered on accent fills'},
  'colors.buttonNormal': {label:'Button Fill (Normal)', hint:'Default button background'},
  'colors.buttonFocused': {label:'Button Fill (Focused)', hint:'Focused state fill color'},
  'colors.buttonDisabled': {label:'Button Fill (Disabled)', hint:'Disabled state fill color'},
  'colors.buttonActive': {label:'Button Fill (Pressed)', hint:'Pressed/active state fill color'},
  'colors.onButtonNormal': {label:'Button Text (Normal)', hint:'Text/icons on normal buttons'},
  'colors.onButtonFocused': {label:'Button Text (Focused)', hint:'Text/icons on focused buttons'},
  'colors.onButtonDisabled': {label:'Button Text (Disabled)', hint:'Text/icons on disabled buttons'},
  'colors.inputBackground': {label:'Input Fill (Normal)', hint:'Default text field/input fill'},
  'colors.inputFocused': {label:'Input Fill (Focused)', hint:'Focused input fill color'},
  'colors.inputBorder': {label:'Input Border (Normal)', hint:'Default input border color'},
  'colors.inputBorderFocused': {label:'Input Border (Focused)', hint:'Focused input border color'},
  'colors.rangeTrack': {label:'Slider Background Track', hint:'The unfilled part of sliders and range controls'},
  'colors.rangeProgress': {label:'Slider Filled Progress', hint:'The filled/played part of sliders and range controls'},
  'colors.rangeThumb': {label:'Slider Handle (Knob)', hint:'The draggable knob users move on sliders'},
  'colors.seekbarBuffered': {label:'Seekbar Buffered Segment', hint:'Preloaded media portion shown ahead of playback position'},
  'colors.badgeBackground': {label:'Badge Fill', hint:'Generic badge background'},
  'colors.onBadge': {label:'Badge Text', hint:'Text/icons shown on badges'},
  'colors.badgeUnplayed': {label:'Unplayed Indicator', hint:'Unplayed dot/marker color'},
  'colors.badgeWatched': {label:'Watched Indicator', hint:'Watched/check badge color'},
  'colors.recordingActive': {label:'Recording (Live)', hint:'Live recording indicator color'},
  'colors.recordingScheduled': {label:'Recording (Scheduled)', hint:'Scheduled recording indicator color'},
  'semantic.statusAvailable': {label:'Status: Available', hint:'Available state semantic color'},
  'semantic.statusRequested': {label:'Status: Requested', hint:'Requested state semantic color'},
  'semantic.statusPending': {label:'Status: Pending', hint:'Pending state semantic color'},
  'semantic.statusDownloading': {label:'Status: Downloading', hint:'Downloading state semantic color'},
  'semantic.mediaTypeBadgeMovie': {label:'Media Badge: Movie', hint:'Movie media-type badge color'},
  'semantic.mediaTypeBadgeShow': {label:'Media Badge: Show', hint:'Series/show media-type badge color'},
  'book.background': {label:'Book View Background', hint:'Bookshelf/background tone'},
  'book.accent': {label:'Book Accent', hint:'Accent color in book surfaces'},
  'book.mutedText': {label:'Book Secondary Text', hint:'Lower-emphasis text in book UI'},
  'book.primaryText': {label:'Book Primary Text', hint:'Primary text in book UI'},
  'book.sectionTitle': {label:'Book Section Title', hint:'Section heading text color'},
  'book.divider': {label:'Book Divider', hint:'Section divider line color'},
  'book.placeholder': {label:'Placeholder Cover Fill', hint:'Fallback cover background color'},
  'book.shadow': {label:'Book Shadow Tint', hint:'Tint used for book card shadow'},
  'book.gradientTop': {label:'Book Gradient (Top)', hint:'Top gradient stop color'},
  'book.gradientBottom': {label:'Book Gradient (Bottom)', hint:'Bottom gradient stop color'},
  'book.inactiveChip': {label:'Inactive Chip', hint:'Unselected chip background in book UI'},
  'borders.cardBorder.color': {label:'Card Border Color', hint:'Border color around cards'},
  'borders.cardBorder.width': {label:'Card Border Thickness', hint:'How thick card outlines appear (px)'},
  'borders.chipBorder.color': {label:'Chip Border Color', hint:'Border color around chips'},
  'borders.chipBorder.width': {label:'Chip Border Thickness', hint:'How thick chip outlines appear (px)'},
  'borders.focusBorder.color': {label:'Focus Outline Color', hint:'Primary focus ring/outline color'},
  'borders.focusBorder.width': {label:'Focus Outline Thickness', hint:'How thick focused outlines appear (px)'},
  'borders.cardRadius': {label:'Card Corner Roundness', hint:'Overall roundness for card corners (px)'},
  'borders.cardRadius.topLeft': {label:'Card Corner: Top Left', hint:'Top-left corner roundness (px)'},
  'borders.cardRadius.topRight': {label:'Card Corner: Top Right', hint:'Top-right corner roundness (px)'},
  'borders.cardRadius.bottomLeft': {label:'Card Corner: Bottom Left', hint:'Bottom-left corner roundness (px)'},
  'borders.cardRadius.bottomRight': {label:'Card Corner: Bottom Right', hint:'Bottom-right corner roundness (px)'},
  'borders.chipRadius': {label:'Chip Corner Roundness', hint:'Overall roundness for chip corners (px)'},
  'borders.chipRadius.topLeft': {label:'Chip Corner: Top Left', hint:'Top-left corner roundness (px)'},
  'borders.chipRadius.topRight': {label:'Chip Corner: Top Right', hint:'Top-right corner roundness (px)'},
  'borders.chipRadius.bottomLeft': {label:'Chip Corner: Bottom Left', hint:'Bottom-left corner roundness (px)'},
  'borders.chipRadius.bottomRight': {label:'Chip Corner: Bottom Right', hint:'Bottom-right corner roundness (px)'},
  'borders.chipBackground': {label:'Chip Background', hint:'Default chip fill color'},
  'borders.navBorder.color': {label:'Navbar Border Color', hint:'Optional nav edge/border color'},
  'borders.navBorder.width': {label:'Navbar Border Thickness', hint:'How thick the optional nav edge appears (px)'},
  'borders.focusGlow.color': {label:'Focus Glow Color', hint:'Glow tint for focused elements'},
  'borders.focusGlow.blurRadius': {label:'Focus Glow Softness (Blur)', hint:'How soft or diffused the focus glow looks (px)'},
  'borders.focusGlow.spreadRadius': {label:'Focus Glow Size (Spread)', hint:'How far the focus glow expands outward (px)'},
  'borders.focusGlow.offsetX': {label:'Focus Glow Horizontal Shift', hint:'Move focus glow left/right relative to the element (px)'},
  'borders.focusGlow.offsetY': {label:'Focus Glow Vertical Shift', hint:'Move focus glow up/down relative to the element (px)'},
  'textGlow.color': {label:'Text Glow Color', hint:'Glow tint around text'},
  'textGlow.blurRadius': {label:'Text Glow Softness (Blur)', hint:'How soft the glow around text appears (px)'},
  'textGlow.offsetX': {label:'Text Glow Horizontal Shift', hint:'Move text glow left/right relative to text (px)'},
  'textGlow.offsetY': {label:'Text Glow Vertical Shift', hint:'Move text glow up/down relative to text (px)'},
  'navColorCycle': {label:'Navbar Gradient Color Slot', hint:'One color stop used in the navbar gradient cycle'},
  'book.placeholderPalette': {label:'Placeholder Palette Color Slot', hint:'Fallback cover color used when book art is missing'},
};

function tokenMeta(path, fallbackLabel){
  const key = String(path || '');
  const base = key.replace(/\.\d+(?=\.|$)/g, '');
  const mapped = TOKEN_META[key] || TOKEN_META[base] || null;
  const label = mapped && mapped.label ? mapped.label : fallbackLabel;
  const hint = mapped && mapped.hint ? mapped.hint : '';
  const keyLabel = key;
  return {label, hint, keyLabel};
}

function mkCrow(label,path){
  const id='c_'+path.replace(/\./g,'_');
  const meta=tokenMeta(path,label);
  const title=[meta.hint, 'JSON key: '+meta.keyLabel].filter(Boolean).join('\n');
  const opacityLabel='Opacity for '+meta.label;
  return `
    <div class="crow" data-cpath="${path}">
      <span class="clabel" title="${title}"><span class="clabel-main">${meta.label}</span><span class="clabel-sub">${meta.keyLabel}</span></span>
      <div class="swatch" id="sw_${id}" onclick="openPick('${id}','${path}')">
        <div class="swatch-inner" id="swi_${id}"></div>
      </div>
      <input class="hexin" id="hex_${id}" type="text" maxlength="9" placeholder="#AARRGGBB"
        oninput="onHex('${id}','${path}')" onblur="syncC('${id}',rpath('${path}'))">
      <input class="alphasl" id="asl_${id}" type="range" min="0" max="255"
        aria-label="${opacityLabel}" title="${opacityLabel}"
        oninput="onAsl('${id}','${path}')">
      <span class="alphalbl" id="albl_${id}">100%</span>
      <input type="color" class="cpick-hidden" id="cpk_${id}" oninput="onPick('${id}','${path}')">
    </div>`;
}
function mkNrow(label,path,min,max,step){
  const id='n_'+path.replace(/\./g,'_');
  const meta=tokenMeta(path,label);
  const title=[meta.hint, 'JSON key: '+meta.keyLabel].filter(Boolean).join('\n');
  return `
    <div class="nrow">
      <span class="clabel" title="${title}"><span class="clabel-main">${meta.label}</span><span class="clabel-sub">${meta.keyLabel}</span></span>
      <input class="ninput" id="${id}" data-npath="${path}" type="number"
        min="${min}" max="${max}" step="${step||1}" oninput="onN(this)">
    </div>`;
}
function mkBsub(title,pref){
  return `<div class="bsub">
    <div class="bsubt">${title}</div>
    ${mkCrow('Color',pref+'.color')}
    ${mkNrow('Width (px)',pref+'.width',0,16,.5)}
  </div>`;
}

const RADIUS_KEYS=['topLeft','topRight','bottomLeft','bottomRight'];
function radiusDefault(key){ return key==='chipRadius'?999:8; }
function isNum(v){ return typeof v==='number'&&Number.isFinite(v); }
function radiusModeOf(v){
  if(v&&typeof v==='object'&&!Array.isArray(v)) return 'corners';
  return 'uniform';
}
function toRadiusCorners(v,fallback){
  const base=isNum(v)?v:fallback;
  if(v&&typeof v==='object'&&!Array.isArray(v)){
    return {
      topLeft:isNum(v.topLeft)?v.topLeft:base,
      topRight:isNum(v.topRight)?v.topRight:base,
      bottomLeft:isNum(v.bottomLeft)?v.bottomLeft:base,
      bottomRight:isNum(v.bottomRight)?v.bottomRight:base,
    };
  }
  return {
    topLeft:base,
    topRight:base,
    bottomLeft:base,
    bottomRight:base,
  };
}
function toRadiusUniform(v,fallback){
  if(isNum(v)) return v;
  if(v&&typeof v==='object'&&!Array.isArray(v)){
    const picks=RADIUS_KEYS.map((k)=>v[k]).filter(isNum);
    return picks.length?picks[0]:fallback;
  }
  return fallback;
}

const SECTIONS=[
  {id:'bg',   title:'Background & Surface',open:true, tokens:[
    ['background','colors.background'],['onBackground','colors.onBackground'],
    ['surface','colors.surface'],['onSurface','colors.onSurface'],
    ['surfaceVariant','colors.surfaceVariant'],['scrim','colors.scrim'],
  ]},
  {id:'acc',  title:'Accent', open:true, tokens:[
    ['accent','colors.accent'],['onAccent','colors.onAccent'],
  ]},
  {id:'btn',  title:'Buttons', open:false, tokens:[
    ['buttonNormal','colors.buttonNormal'],['buttonFocused','colors.buttonFocused'],
    ['buttonDisabled','colors.buttonDisabled'],['buttonActive','colors.buttonActive'],
    ['onButtonNormal','colors.onButtonNormal'],['onButtonFocused','colors.onButtonFocused'],
    ['onButtonDisabled','colors.onButtonDisabled'],
  ]},
  {id:'inp',  title:'Input Fields', open:false, tokens:[
    ['inputBackground','colors.inputBackground'],['inputFocused','colors.inputFocused'],
    ['inputBorder','colors.inputBorder'],['inputBorderFocused','colors.inputBorderFocused'],
  ]},
  {id:'rng',  title:'Range & Seekbar', open:false, tokens:[
    ['rangeTrack','colors.rangeTrack'],['rangeProgress','colors.rangeProgress'],
    ['rangeThumb','colors.rangeThumb'],['seekbarBuffered','colors.seekbarBuffered'],
  ]},
  {id:'bdg',  title:'Badges', open:false, tokens:[
    ['badgeBackground','colors.badgeBackground'],['onBadge','colors.onBadge'],
    ['badgeUnplayed','colors.badgeUnplayed'],['badgeWatched','colors.badgeWatched'],
  ]},
  {id:'rec',  title:'Recording', open:false, tokens:[
    ['recordingActive','colors.recordingActive'],['recordingScheduled','colors.recordingScheduled'],
  ]},
  {id:'sem',  title:'Semantic / Status', open:false, tokens:[
    ['statusAvailable','semantic.statusAvailable'],['statusRequested','semantic.statusRequested'],
    ['statusPending','semantic.statusPending'],['statusDownloading','semantic.statusDownloading'],
    ['mediaTypeBadgeMovie','semantic.mediaTypeBadgeMovie'],['mediaTypeBadgeShow','semantic.mediaTypeBadgeShow'],
  ]},
  {id:'book', title:'Book Tokens', open:false, custom:'book'},
  {id:'brd',  title:'Borders & Radius', open:false, custom:'brd'},
  {id:'glow', title:'Focus Glow', open:false, custom:'glow'},
  {id:'adv',  title:'Advanced (Text Glow · Nav Cycle)', open:false, custom:'adv'},
];

function buildEditor(){
  const el=document.getElementById('escroll');
  el.innerHTML=SECTIONS.map(sec=>{
    let body='';
    if(sec.tokens){
      body=sec.tokens.map(([lb,p])=>mkCrow(lb,p)).join('');
    } else if(sec.custom==='brd'){
      body=`
        ${mkBsub('Card Border','borders.cardBorder')}
        ${mkBsub('Chip Border','borders.chipBorder')}
        ${mkBsub('Focus Border','borders.focusBorder')}
        <div class="bsub">
          <div class="bsubt">Card Radius</div>
          <div class="trow">
            <label for="radMode_cardRadius">Mode</label>
            <select id="radMode_cardRadius" onchange="onRadiusMode('cardRadius', this.value)">
              <option value="uniform">Uniform</option>
              <option value="corners">Per Corner</option>
            </select>
          </div>
          <div id="radBody_cardRadius"></div>
        </div>
        <div class="bsub">
          <div class="bsubt">Chip Radius</div>
          <div class="trow">
            <label for="radMode_chipRadius">Mode</label>
            <select id="radMode_chipRadius" onchange="onRadiusMode('chipRadius', this.value)">
              <option value="uniform">Uniform</option>
              <option value="corners">Per Corner</option>
            </select>
          </div>
          <div id="radBody_chipRadius"></div>
        </div>
        ${mkCrow('Chip Background','borders.chipBackground')}
        <div class="bsub" style="margin-top:4px">
          <div class="bsubt" style="display:flex;justify-content:space-between">Nav Border (optional)
            <input type="checkbox" id="navBEn" onchange="onNavBdr()">
          </div>
          <div id="navBFields" style="display:none;flex-direction:column;gap:3px">
            ${mkCrow('Nav Border Color','borders.navBorder.color')}
            ${mkNrow('Nav Border Width','borders.navBorder.width',0,8,.5)}
          </div>
        </div>`;
    } else if(sec.custom==='book'){
      body=`
        ${mkCrow('Background','book.background')}
        ${mkCrow('Accent','book.accent')}
        ${mkCrow('Muted Text','book.mutedText')}
        ${mkCrow('Primary Text','book.primaryText')}
        ${mkCrow('Section Title','book.sectionTitle')}
        ${mkCrow('Divider','book.divider')}
        ${mkCrow('Placeholder','book.placeholder')}
        ${mkCrow('Shadow','book.shadow')}
        ${mkCrow('Gradient Top','book.gradientTop')}
        ${mkCrow('Gradient Bottom','book.gradientBottom')}
        ${mkCrow('Inactive Chip','book.inactiveChip')}
        <div id="bookPaletteBody"></div>`;
    } else if(sec.custom==='glow'){
      body='<div id="glowBody"></div>';
    } else if(sec.custom==='adv'){
      body='<div id="advBody"></div>';
    }
    return `<div class="sec${sec.open?' open':''}" id="sec-${sec.id}">
      <div class="sec-hd" onclick="toggleSec('sec-${sec.id}')"><span>${sec.title}</span><span class="ch">▼</span></div>
      <div class="sec-bd" id="bd-${sec.id}">${body}</div>
    </div>`;
  }).join('');
  rebuildRadiusEditors();
  rebuildBook();
  rebuildGlow();
  rebuildAdv();
}

function rebuildRadiusEditors(){
  ['cardRadius','chipRadius'].forEach((key)=>{
    const modeEl=document.getElementById('radMode_'+key);
    const bodyEl=document.getElementById('radBody_'+key);
    if(!modeEl||!bodyEl) return;
    const mode=radiusModeOf(ST.borders[key]);
    modeEl.value=mode;
    if(mode==='corners'){
      ST.borders[key]=toRadiusCorners(ST.borders[key],radiusDefault(key));
      bodyEl.innerHTML=`
        ${mkNrow('Top Left','borders.'+key+'.topLeft',0,9999,1)}
        ${mkNrow('Top Right','borders.'+key+'.topRight',0,9999,1)}
        ${mkNrow('Bottom Left','borders.'+key+'.bottomLeft',0,9999,1)}
        ${mkNrow('Bottom Right','borders.'+key+'.bottomRight',0,9999,1)}`;
    } else {
      ST.borders[key]=toRadiusUniform(ST.borders[key],radiusDefault(key));
      bodyEl.innerHTML=mkNrow('Radius (px)','borders.'+key,0,9999,1);
    }
  });
}

function onRadiusMode(key,mode){
  if(mode==='corners'){
    ST.borders[key]=toRadiusCorners(ST.borders[key],radiusDefault(key));
  } else {
    ST.borders[key]=toRadiusUniform(ST.borders[key],radiusDefault(key));
  }
  rebuildRadiusEditors();
  populateAll();
  updateVars();
  queuePersist();
}

function rebuildBook(){
  const palette=Array.isArray(ST.book?.placeholderPalette)?ST.book.placeholderPalette:[];
  let html='<div class="bsub"><div class="bsubt">Placeholder Palette</div>';
  html+=palette.map((_,i)=>`
    <div class="shadow-entry">
      <div class="shadow-hd"><span>Color ${i+1}</span><button class="rmbtn" onclick="rmBookPalette(${i})">✕</button></div>
      ${mkCrow('Value','book.placeholderPalette.'+i)}
    </div>`).join('');
  if(palette.length<16) html+=`<button class="addbtn" onclick="addBookPalette()">+ Add Color</button>`;
  html+='</div>';
  const el=document.getElementById('bookPaletteBody');
  if(el) el.innerHTML=html;
}

function addBookPalette(){
  if(!ST.book) ST.book=cloneBookDefaults();
  if(!Array.isArray(ST.book.placeholderPalette)) ST.book.placeholderPalette=[];
  if(ST.book.placeholderPalette.length>=16) return;
  ST.book.placeholderPalette.push('#FF1A5C9A');
  rebuildBook(); populateAll(); updateVars(); queuePersist();
}

function rmBookPalette(i){
  if(!Array.isArray(ST.book?.placeholderPalette)) return;
  if(ST.book.placeholderPalette.length<=1){
    setStatus('Palette needs at least one color','warn');
    return;
  }
  ST.book.placeholderPalette.splice(i,1);
  rebuildBook(); populateAll(); updateVars(); queuePersist();
}

function rebuildGlow(){
  const shadows=ST.borders.focusGlow||[];
  let html=shadows.map((sh,i)=>`
    <div class="shadow-entry">
      <div class="shadow-hd"><span>Shadow ${i+1}</span><button class="rmbtn" onclick="rmGlow(${i})">✕</button></div>
      ${mkCrow('Color','borders.focusGlow.'+i+'.color')}
      ${mkNrow('Blur','borders.focusGlow.'+i+'.blurRadius',0,64,1)}
      ${mkNrow('Spread','borders.focusGlow.'+i+'.spreadRadius',-32,32,.5)}
      ${mkNrow('Offset X','borders.focusGlow.'+i+'.offsetX',-50,50,1)}
      ${mkNrow('Offset Y','borders.focusGlow.'+i+'.offsetY',-50,50,1)}
    </div>`).join('');
  if(shadows.length<8) html+=`<button class="addbtn" onclick="addGlow()">+ Add Shadow</button>`;
  const el=document.getElementById('glowBody');
  if(el) el.innerHTML=html;
}

function rebuildAdv(){
  const cyc=ST.navColorCycle||[], tg=ST.textGlow||[];
  let html=`<div class="bsubt">Nav Color Cycle</div>`;
  cyc.forEach((c,i)=>{ html+=mkCrow('Slot '+(i+1),'navColorCycle.'+i)+
    `<button class="rmbtn" onclick="rmCyc(${i})" style="border:1px solid #ef4444;border-radius:4px;padding:1px 5px;font-size:10px;margin:1px 0">✕ Remove</button>`; });
  if(cyc.length<16) html+=`<button class="addbtn" onclick="addCyc()">+ Add Color</button>`;
  html+=`<div class="bsubt" style="margin-top:10px">Text Glow</div>`;
  html+=`<div class="constraint-note">Text glow spread is fixed to 0 for cross-platform consistency.</div>`;
  tg.forEach((g,i)=>{ html+=`
    <div class="shadow-entry">
      <div class="shadow-hd"><span>Glow ${i+1}</span><button class="rmbtn" onclick="rmTG(${i})">✕</button></div>
      ${mkCrow('Color','textGlow.'+i+'.color')}
      ${mkNrow('Blur','textGlow.'+i+'.blurRadius',0,64,1)}
      ${mkNrow('Offset X','textGlow.'+i+'.offsetX',-20,20,1)}
      ${mkNrow('Offset Y','textGlow.'+i+'.offsetY',-20,20,1)}
    </div>`; });
  if(tg.length<8) html+=`<button class="addbtn" onclick="addTG()">+ Add Glow</button>`;
  const el=document.getElementById('advBody');
  if(el){
    el.innerHTML=html;
  }
}

function addGlow(){
  if(!ST.borders.focusGlow) ST.borders.focusGlow=[];
  ST.borders.focusGlow.push({color:'#99FF2E92',blurRadius:8,spreadRadius:.5,offsetX:0,offsetY:0});
  rebuildGlow(); populateAll(); updateVars(); queuePersist();
}
function rmGlow(i){ ST.borders.focusGlow.splice(i,1); rebuildGlow(); populateAll(); updateVars(); queuePersist(); }
function addCyc(){
  if(!ST.navColorCycle) ST.navColorCycle=[];
  if(ST.navColorCycle.length>=16) return;
  ST.navColorCycle.push('#FFFF2E92');
  rebuildAdv(); populateAll(); updateVars(); queuePersist();
}
function rmCyc(i){ ST.navColorCycle.splice(i,1); rebuildAdv(); populateAll(); updateVars(); queuePersist(); }
function addTG(){
  if(!ST.textGlow) ST.textGlow=[];
  if(ST.textGlow.length>=8) return;
  ST.textGlow.push({color:'#6600E5FF',blurRadius:8,offsetX:0,offsetY:0});
  rebuildAdv(); populateAll(); updateVars(); queuePersist();
}
function rmTG(i){ ST.textGlow.splice(i,1); rebuildAdv(); populateAll(); updateVars(); queuePersist(); }

function onNavBdr(){
  const on=document.getElementById('navBEn').checked;
  const f=document.getElementById('navBFields');
  if(on){ ST.borders.navBorder={color:'#FF404040',width:1}; f.style.display='flex'; }
  else{ ST.borders.navBorder=null; f.style.display='none'; }
  populateAll(); updateVars(); queuePersist();
}

function syncC(id,hex){
  if(!hex) return;
  const swi=document.getElementById('swi_'+id),
        hexEl=document.getElementById('hex_'+id),
        asl=document.getElementById('asl_'+id),
        albl=document.getElementById('albl_'+id),
        cpk=document.getElementById('cpk_'+id);
  if(!swi) return;
  swi.style.background=hex2css(hex);
  hexEl.value=hex;
  const a=hex2a(hex);
  asl.value=a;
  albl.textContent=Math.round(a/255*100)+'%';
  cpk.value=hex2rgb(hex);
}
function openPick(id,path){ document.getElementById('cpk_'+id).click(); }
function onPick(id,path){
  const cpk=document.getElementById('cpk_'+id), asl=document.getElementById('asl_'+id);
  const h=rgb_a_to_hex(cpk.value,parseInt(asl.value));
  spath(path,h); syncC(id,h); updateVars(); queuePersist();
}
function onHex(id,path){
  const v=document.getElementById('hex_'+id).value, p=parseHex(v);
  if(p){ spath(path,p); syncC(id,p); updateVars(); queuePersist(); }
}
function onAsl(id,path){
  const asl=document.getElementById('asl_'+id), cpk=document.getElementById('cpk_'+id);
  const h=rgb_a_to_hex(cpk.value,parseInt(asl.value));
  spath(path,h); syncC(id,h); updateVars(); queuePersist();
}
function onN(el){
  const raw=parseFloat(el.value);
  if(isNaN(raw)) return;

  let next=raw;
  const min=parseFloat(el.min);
  const max=parseFloat(el.max);
  const stepRaw=(el.step||'').trim();

  if(Number.isFinite(min)) next=Math.max(next,min);
  if(Number.isFinite(max)) next=Math.min(next,max);

  if(stepRaw&&stepRaw!=='any'){
    const step=parseFloat(stepRaw);
    if(Number.isFinite(step)&&step>0){
      next=Math.round(next/step)*step;
      const decimals=stepRaw.indexOf('.')>=0?stepRaw.split('.')[1].length:0;
      next=Number(next.toFixed(decimals));
      if(Number.isFinite(min)) next=Math.max(next,min);
      if(Number.isFinite(max)) next=Math.min(next,max);
    }
  }

  if(next!==raw){
    setStatus('Value clamped to allowed range','warn');
  }

  el.value=String(next);
  spath(el.dataset.npath,next);
  updateVars();
  queuePersist();
}

function populateAll(){
  document.querySelectorAll('[data-cpath]').forEach(row=>{
    const p=row.dataset.cpath, v=rpath(p);
    if(typeof v==='string'){
      const id='c_'+p.replace(/\./g,'_');
      syncC(id,v);
    }
  });
  document.querySelectorAll('input.ninput[data-npath]').forEach(el=>{
    const v=rpath(el.dataset.npath);
    if(typeof v==='number') el.value=v;
  });
  const nbEn=document.getElementById('navBEn');
  if(nbEn){
    nbEn.checked=ST.borders.navBorder!=null;
    const f=document.getElementById('navBFields');
    if(f) f.style.display=ST.borders.navBorder?'flex':'none';
  }
  document.getElementById('tId').value=ST.id;
  document.getElementById('tName').value=ST.displayName;
  document.getElementById('tDesc').value=ST.description||'';
  document.getElementById('pNavMode').value=ST.previewNavMode||'left';
  document.getElementById('pProfile').value=ST.previewProfile||'desktop';
}

function onMeta(){
  ST.id=document.getElementById('tId').value.trim()||'my-theme';
  ST.displayName=document.getElementById('tName').value.trim()||'My Theme';
  ST.description=document.getElementById('tDesc').value.trim();
  ST.previewNavMode=document.getElementById('pNavMode').value||'left';
  ST.previewProfile=document.getElementById('pProfile').value||'desktop';
  updateVars();
  renderAll();
  queuePersist();
}
function toggleSec(id){ document.getElementById(id).classList.toggle('open'); }

function setTab(name){
  const names=['home','detail','player','search','library','epg','settings'];
  document.querySelectorAll('.ptab').forEach((t,i)=>t.classList.toggle('on',names[i]===name));
  document.querySelectorAll('.pframe').forEach(f=>f.classList.toggle('on',f.id==='pf-'+name));
}

function loadPreset(name){
  const src=name==='neon'?NEON:{
    id:'my-theme',displayName:'My Theme',
    colors:{...{background:'#FF101010',onBackground:'#FFFFFFFF',surface:'#FF1A1A1A',
      onSurface:'#FFFFFFFF',surfaceVariant:'#FF252525',scrim:'#CC000000',
      accent:'#FF00A4DC',onAccent:'#FFFFFFFF',buttonNormal:'#FF2A2A2A',
      buttonFocused:'#FF00A4DC',buttonDisabled:'#FF1E1E1E',buttonActive:'#FF3A3A3A',
      onButtonNormal:'#FFFFFFFF',onButtonFocused:'#FFFFFFFF',onButtonDisabled:'#FF666666',
      inputBackground:'#FF2A2A2A',inputFocused:'#FF3A3A3A',inputBorder:'#FF404040',
      inputBorderFocused:'#FF00A4DC',rangeTrack:'#FF404040',rangeProgress:'#FF00A4DC',
      rangeThumb:'#FF00A4DC',seekbarBuffered:'#80FFFFFF',badgeBackground:'#FF00A4DC',
      onBadge:'#FFFFFFFF',badgeUnplayed:'#FF00A4DC',badgeWatched:'#FF4CAF50',
      recordingActive:'#FFEF4444',recordingScheduled:'#FFFF9800'}},
    borders:{cardBorder:{color:'#00000000',width:1},chipBorder:{color:'#558EC8F0',width:1},
      focusBorder:{color:'#FF00A4DC',width:2},cardRadius:8,chipRadius:999,
      chipBackground:'#1F8EC8F0',focusGlow:[],navBorder:null},
    semantic:{statusAvailable:'#FF22C55E',statusRequested:'#FF9333EA',statusPending:'#FFEAB308',
      statusDownloading:'#FF6366F1',mediaTypeBadgeMovie:'#FF3B82F6',mediaTypeBadgeShow:'#FF8B5CF6'},
    book:cloneBookDefaults(),
    textGlow:[],navColorCycle:[],
  };
  loadFromObj(src);
  setStatus('Preset loaded','ok');
}

function randInt(min,max){
  return min+Math.floor(Math.random()*(max-min+1));
}

function hslToArgb(h,s,l,alpha){
  s/=100; l/=100;
  const k=n=>(n+h/30)%12;
  const a=s*Math.min(l,1-l);
  const f=n=>l-a*Math.max(-1,Math.min(k(n)-3,9-k(n),1));
  const hex=v=>Math.max(0,Math.min(255,Math.round(v*255))).toString(16).padStart(2,'0').toUpperCase();
  const alphaHex=Math.max(0,Math.min(255,Math.round(alpha==null?255:alpha))).toString(16).padStart(2,'0').toUpperCase();
  return '#'+alphaHex+hex(f(0))+hex(f(8))+hex(f(4));
}

function buildRandomTheme(){
  const baseHue=randInt(0,359);
  const accentHue=(baseHue+[120,150,180,200,240][randInt(0,4)])%360;
  const accent=hslToArgb(accentHue,randInt(72,94),randInt(52,62));
  const accentAlpha=a=>hslToArgb(accentHue,randInt(72,94),randInt(52,62),a);
  const accentText=hslToArgb(accentHue,12,randInt(94,99));
  const text=hslToArgb(baseHue,randInt(4,12),randInt(93,98));
  const subtext=hslToArgb(baseHue,randInt(4,12),randInt(62,72));
  const surface=l=>hslToArgb(baseHue,randInt(14,30),l);
  return {
    colors:{
      background:surface(randInt(6,11)),
      onBackground:text,
      surface:surface(randInt(11,16)),
      onSurface:text,
      surfaceVariant:surface(randInt(16,22)),
      scrim:hslToArgb(baseHue,randInt(20,40),randInt(2,7),204),
      accent:accent,
      onAccent:accentText,
      buttonNormal:surface(randInt(16,24)),
      buttonFocused:accent,
      buttonDisabled:surface(randInt(12,17)),
      buttonActive:surface(randInt(24,30)),
      onButtonNormal:text,
      onButtonFocused:accentText,
      onButtonDisabled:subtext,
      inputBackground:surface(randInt(16,24)),
      inputFocused:surface(randInt(22,28)),
      inputBorder:surface(randInt(26,34)),
      inputBorderFocused:accent,
      rangeTrack:surface(randInt(24,32)),
      rangeProgress:accent,
      rangeThumb:accent,
      seekbarBuffered:hslToArgb(baseHue,6,94,128),
      badgeBackground:accent,
      onBadge:accentText,
      badgeUnplayed:accent,
      badgeWatched:hslToArgb(randInt(95,150),randInt(55,75),randInt(45,55)),
      recordingActive:hslToArgb(randInt(0,16),randInt(72,90),randInt(52,60)),
      recordingScheduled:hslToArgb(randInt(26,46),randInt(76,94),randInt(52,60)),
    },
    borders:{
      cardBorder:{color:accentAlpha(randInt(0,110)),width:randInt(0,2)},
      chipBorder:{color:accentAlpha(randInt(120,210)),width:1},
      focusBorder:{color:accent,width:randInt(1,3)},
      cardRadius:randInt(4,18),
      chipRadius:[8,12,999][randInt(0,2)],
      chipBackground:accentAlpha(randInt(20,64)),
      focusGlow:Math.random()<0.6?[{color:accentAlpha(randInt(120,180)),blurRadius:randInt(4,16),spreadRadius:0,offsetX:0,offsetY:0}]:[],
      navBorder:Math.random()<0.5?{color:accentAlpha(randInt(120,200)),width:1}:null,
    },
    semantic:{
      statusAvailable:hslToArgb(randInt(120,150),randInt(55,75),randInt(45,55)),
      statusRequested:hslToArgb(randInt(270,300),randInt(55,75),randInt(50,60)),
      statusPending:hslToArgb(randInt(40,55),randInt(72,92),randInt(50,58)),
      statusDownloading:hslToArgb(randInt(220,250),randInt(55,75),randInt(55,65)),
      mediaTypeBadgeMovie:hslToArgb(randInt(200,230),randInt(60,80),randInt(55,65)),
      mediaTypeBadgeShow:hslToArgb(randInt(255,285),randInt(55,75),randInt(58,68)),
    },
    book:{
      background:surface(randInt(7,12)),
      accent:accent,
      mutedText:subtext,
      primaryText:text,
      sectionTitle:text,
      divider:hslToArgb(baseHue,16,30,128),
      placeholder:surface(randInt(18,26)),
      shadow:hslToArgb(baseHue,30,4,180),
      gradientTop:surface(randInt(12,18)),
      gradientBottom:surface(randInt(5,10)),
      inactiveChip:surface(randInt(18,24)),
      placeholderPalette:[accent,hslToArgb((accentHue+40)%360,70,52),hslToArgb((accentHue+200)%360,68,50)],
    },
    textGlow:Math.random()<0.4?[{color:accentAlpha(110),blurRadius:randInt(4,12),offsetX:0,offsetY:0}]:[],
    navColorCycle:Math.random()<0.5?[accent,hslToArgb((accentHue+60)%360,randInt(70,90),randInt(52,60))]:[],
  };
}

function randomizeTheme(){
  const rnd=buildRandomTheme();
  rnd.id=ST.id;
  rnd.displayName=ST.displayName;
  rnd.description=ST.description;
  rnd.previewNavMode=ST.previewNavMode;
  rnd.previewProfile=ST.previewProfile;
  loadFromObj(rnd);
  setStatus('Random theme generated','ok');
}

function doImport(ev){
  const f=ev.target.files[0]; if(!f) return;
  const r=new FileReader();
  r.onload=e=>{ try{ loadFromObj(JSON.parse(e.target.result)); }
    catch(err){ alert('Invalid JSON: '+err.message); } ev.target.value=''; };
  r.readAsText(f);
}

function loadFromObj(j){
  const bookKeys=['background','accent','mutedText','primaryText','sectionTitle','divider',
    'placeholder','shadow','gradientTop','gradientBottom','inactiveChip'];
  if(j.id) ST.id=j.id;
  if(j.displayName) ST.displayName=j.displayName;
  ST.description=j.description||'';
  ST.previewNavMode=j.previewNavMode==='top'?'top':'left';
  ST.previewProfile=(j.previewProfile==='mobile')?'mobile':'desktop';
  if(j.colors) Object.keys(ST.colors).forEach(k=>{ if(j.colors[k]) ST.colors[k]=j.colors[k]; });
  if(j.borders){
    const b=j.borders;
    if(b.cardBorder)  ST.borders.cardBorder ={color:b.cardBorder.color||'#00000000',width:b.cardBorder.width??1};
    if(b.chipBorder)  ST.borders.chipBorder ={color:b.chipBorder.color||'#558EC8F0',width:b.chipBorder.width??1};
    if(b.focusBorder) ST.borders.focusBorder={color:b.focusBorder.color||'#FF00A4DC',width:b.focusBorder.width??2};
    if(b.cardRadius!=null) ST.borders.cardRadius=b.cardRadius;
    if(b.chipRadius!=null) ST.borders.chipRadius=b.chipRadius;
    if(b.chipBackground) ST.borders.chipBackground=b.chipBackground;
    ST.borders.focusGlow=b.focusGlow||[];
    ST.borders.navBorder=b.navBorder||null;
  }
  if(j.semantic) Object.keys(ST.semantic).forEach(k=>{ if(j.semantic[k]) ST.semantic[k]=j.semantic[k]; });
  ST.book=cloneBookDefaults();
  if(j.book&&typeof j.book==='object'){
    bookKeys.forEach((k)=>{ if(j.book[k]) ST.book[k]=j.book[k]; });
    if(Array.isArray(j.book.placeholderPalette)&&j.book.placeholderPalette.length){
      ST.book.placeholderPalette=[...j.book.placeholderPalette.slice(0,16)];
    }
  }
  ST.textGlow=Array.isArray(j.textGlow)?j.textGlow.slice(0,8).map(function(g){
    return {
      color:g&&g.color?g.color:'#6600E5FF',
      blurRadius:typeof g?.blurRadius==='number'?g.blurRadius:8,
      spreadRadius:0,
      offsetX:typeof g?.offsetX==='number'?g.offsetX:0,
      offsetY:typeof g?.offsetY==='number'?g.offsetY:0,
    };
  }):[];
  ST.navColorCycle=Array.isArray(j.navColorCycle)?j.navColorCycle.slice(0,16):[];
  normalizeStateForConstraints();
  rebuildRadiusEditors(); rebuildBook(); rebuildGlow(); rebuildAdv();
  populateAll(); updateVars(); renderAll();
  queuePersist();
}

function doExport(){
  normalizeStateForConstraints();
  if(!runValidation(false)){
    setStatus('Fix issues before export','err');
    alert('Theme has validation issues. Check the issue list in the editor footer.');
    return;
  }
  const id=document.getElementById('tId').value.trim()||'my-theme';
  const name=document.getElementById('tName').value.trim()||'My Theme';
  const desc=document.getElementById('tDesc').value.trim();
  const b=ST.borders;
  const out={
    schemaVersion:1,
    exportedByEditorVersion:EDITOR_EXPORT_VERSION,
    id,
    displayName:name,
    colors:{...ST.colors},
    borders:{
      cardBorder:{color:b.cardBorder.color,width:b.cardBorder.width},
      chipBorder:{color:b.chipBorder.color,width:b.chipBorder.width},
      focusBorder:{color:b.focusBorder.color,width:b.focusBorder.width},
      cardRadius:b.cardRadius, chipRadius:b.chipRadius,
      chipBackground:b.chipBackground,
      focusGlow:(b.focusGlow||[]).map(s=>({color:s.color,blurRadius:s.blurRadius||0,
        spreadRadius:s.spreadRadius||0,offsetX:s.offsetX||0,offsetY:s.offsetY||0})),
    },
    semantic:{...ST.semantic},
    book:{
      ...ST.book,
      placeholderPalette:[...(ST.book?.placeholderPalette||[])],
    },
  };
  if(b.navBorder) out.borders.navBorder={color:b.navBorder.color,width:b.navBorder.width};
  if(desc) out.description=desc;
  if(ST.textGlow&&ST.textGlow.length)
    out.textGlow=ST.textGlow.map(g=>({color:g.color,blurRadius:g.blurRadius||0,spreadRadius:0,offsetX:g.offsetX||0,offsetY:g.offsetY||0}));
  if(ST.navColorCycle&&ST.navColorCycle.length) out.navColorCycle=[...ST.navColorCycle];
  const json=JSON.stringify(out,null,2);
  const a=document.createElement('a');
  a.href=URL.createObjectURL(new Blob([json],{type:'application/json'}));
  a.download=(id||'theme')+'.theme.json';
  a.click();
  setStatus('Exported JSON','ok');
}

buildEditor();
populateAll();
loadEditorLayout();
initEditorResizer();
updateVars();
renderAll();
(() => {
  const raw=localStorage.getItem(DRAFT_KEY);
  if(raw){
    try{
      const d=JSON.parse(raw);
      if(d&&d.savedAt){
        const s=document.getElementById('draftStamp');
        if(s) s.textContent='Draft: '+new Date(d.savedAt).toLocaleString();
      }
    }catch(e){}
  }
  setStatus('Ready','ok');
  window.addEventListener('keydown',e=>{
    if((e.ctrlKey||e.metaKey)&&e.key.toLowerCase()==='s'){
      e.preventDefault();
      doExport();
    }
  });
})();

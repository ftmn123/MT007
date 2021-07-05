/*
此文件为Node.js专用。其他用户请忽略
 */
//此处填写京东账号cookie。
let CookieJDs = [
  'pt_key=AAJg38q7ADCgDPmdKM4YtvnDOJKIwv3PbIHlt9Asz7ywQ-N0pAzprxQGIXPQN75N0UonlteRFZY;pt_pin=ftmn123;',
  'pt_key=AAJg38zvADC59sQYlmM1yckEh1a5LxbtJqX4aMoLlHtuxrU38qHHi_RhKjaW2qUz_rr3OOf6sWw;pt_pin=jd_52ec557a686ec;',
  // 'pt_key=AAJgsMD3ADC9CanD68tqIzaLqZOI2a9RBhgrwglGG65pdym0ueNDrkfbueqVrPcphZuJ3PUEaWE;pt_pin=hayatee;',
    'pt_key=AAJg381UADBVopZ1CSf2846nThifSCMfn4KhsShnuxtP7x09_HOelOXMezXJEjOnWdEmS8xrEAQ;pt_pin=jd_LSrPEmCuZJOz;',
  'pt_key=AAJg3898ADAVy0ZhtfSjpYwpAD3-cV5Z5nRs0wnTSpvte9klyDyLFi-Hvv-8PLZw_LfzuiiWwzk;pt_pin=jd_qOluzcybAHzz;',
 //  'pt_key=AAJgyEziADDcwEOEy_1zIx4_jnUHi_CELC8nOI5R_LBQOSYn9bgzdvfSHQEPK3fuxB0-bLNocCo;pt_pin=jd_7b18b6c460c52;',
 //   'pt_key=AAJgxC1RADD-BxCZUT5YkUb9Ngc757Ewil3KYpydLIBGf-plY3qHLOHpY5j65GKiyD2YlYksoxw;pt_pin=jd_532079564a7f6;',
  //  'pt_key=AAJgsbi7ADAvYB2lXkWHWF8b_eDMZrGDoET-0Sa5zH-JBB9BJgFdFDyevOoYivT2bxVHSUXB_cI;pt_pin=lodlf1983;',
  //  'pt_key=AAJgsbhDADCDcdeq1bPLSzjalZoCXdlggb4S43v-5sFmZnX1gV5XKNT9KRRw80UDxoDvuZzJKvs;pt_pin=jd_dHCJgYjDIQAR;',
 //   'pt_key=AAJgvWU9ADCsP92EQtQi2QxhDnfUDUTNhxdq9nZT527jNhSNK4kn5ymZm6iHW2jBiCDgN0zzCB8;pt_pin=jd_5e47edeaef0e9;',
  //  'pt_key=AAJgxdq2ADBMO2f4qeGzoUiEfOvCriAKIqDMBhrrCWGVKIc8zkXESvA45tzECNDQPb5XpEclv1s;pt_pin=alohatt;',
]
let CookieNames = [
    '',
    '',
    ]
// 判断环境变量里面是否有京东ck
if (process.env.JD_COOKIE) {
  if (process.env.JD_COOKIE.indexOf('&') > -1) {
    CookieJDs = process.env.JD_COOKIE.split('&');
  } else if (process.env.JD_COOKIE.indexOf('\n') > -1) {
    CookieJDs = process.env.JD_COOKIE.split('\n');
  } else {
    CookieJDs = [process.env.JD_COOKIE];
  }
}

//console.log(`\n ${CookieJDs}========\n`);
//console.log(`\n ${CookieNames}========\n`);
if (JSON.stringify(process.env).indexOf('GITHUB')>-1) {
  console.log(`请勿使用github action运行此脚本,无论你是从你自己的私库还是其他哪里拉取的源代码，都会导致我被封号\n`);
  !(async () => {
    await require('./sendNotify').sendNotify('提醒', `请勿使用github action、滥用github资源会封我仓库以及账号`)
    await process.exit(0);
  })()
}
CookieJDs = [...new Set(CookieJDs.filter(item => !!item))]
CookieNames = [...new Set(CookieNames.filter(item => !!item))]

console.log(`\n====================共${CookieJDs.length}个京东账号Cookie=========\n`);
console.log(`==================脚本执行- 北京时间(UTC+8)：${new Date(new Date().getTime() + new Date().getTimezoneOffset()*60*1000 + 8*60*60*1000).toLocaleString()}=====================\n`)
if (process.env.JD_DEBUG && process.env.JD_DEBUG === 'false') console.log = () => {};
for (let i = 0; i < CookieJDs.length; i++) {
  if (!CookieJDs[i].match(/pt_pin=(.+?);/) || !CookieJDs[i].match(/pt_key=(.+?);/)) console.log(`\n提示:京东cookie 【${CookieJDs[i]}】填写不规范,可能会影响部分脚本正常使用。正确格式为: pt_key=xxx;pt_pin=xxx;（分号;不可少）\n`);
  const index = (i + 1 === 1) ? '' : (i + 1);
  exports['CookieJD' + index] = CookieJDs[i].trim();
}

//console.log(`\n====================共${CookieNames.length}个京东账号的名称=========\n`);
//console.log(`==================脚本执行- 北京时间(UTC+8)：${new Date(new Date().getTime() + new Date().getTimezoneOffset()*60*1000 + 8*60*60*1000).toLocaleString()}=====================\n`)
if (process.env.JD_DEBUG && process.env.JD_DEBUG === 'false') console.log = () => {};
for (let i = 0; i < CookieNames.length; i++) {
  //if (!CookieName[i].match(/pt_pin=(.+?);/) || !CookieName[i].match(/pt_key=(.+?);/)) console.log(`\n提示:京东cookie名称 【${CookieName[i]}】填写不规范,可能会影响部分脚本正常使用。正确格式为: pt_key=xxx;pt_pin=xxx;（分号;不可少）\n`);
  const index = (i + 1 === 1) ? '' : (i + 1);
  exports['CookieName' + index] = CookieNames[i].trim();
  console.log(`\n=账号${i} 的 名称 ${CookieNames[i]}========\n`);
}


async function getTxtRecords(domain) {
  if (!domain) throw new Error("域名不能为空");

  const url = `https://dns.alidns.com/resolve?name=${encodeURIComponent(domain)}&type=TXT`;
  const res = await fetch(url, {
    headers: { accept: 'application/dns-json' }
  });

  if (!res.ok) {
    throw new Error(`请求失败：${res.status} ${res.statusText}`);
  }

  const data = await res.json();
  if (!data.Answer || data.Answer.length === 0) {
    return [];
  }

  return data.Answer
    .filter(item => item.type === 16)
    .map(item => item.data.replace(/^"|"$/g, ''));
}

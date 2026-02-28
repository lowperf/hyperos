$roms = @(
    @{id="bahos"; name="BAHOS HyperOS"; version="OS 3.0.1"; filename="BAHOS_Chopin_Byshkshmzn_HyperOS3.0.1.zip"; icon="B"; color_start="#E65100"; color_end="#FF9800"; desc_id="ROM BAHOS berbasis HyperOS 3.0.1 dengan modifikasi Byshkshmzn untuk performa maksimal."; desc_en="BAHOS ROM based on HyperOS 3.0.1 with Byshkshmzn modifications for maximum performance."},
    @{id="bluearchive"; name="BLUEARCHIVE"; version="V3"; filename="BLUEARCHIVE_第三版等2个文件.zip"; icon="B"; color_start="#1976D2"; color_end="#42A5F5"; desc_id="Tema dan kustomisasi khusus Blue Archive, memberikan tampilan antarmuka ala game anime."; desc_en="Special Blue Archive theme and customization, providing an anime game-style interface."},
    @{id="miui_id"; name="MIUI Global ID"; version="V12.5.4.0"; filename="chopin_id_global_images_V12.5.4.0.RKPI.zip"; icon="M"; color_start="#F57C00"; color_end="#FFB74D"; desc_id="ROM MIUI Global resmi versi Indonesia (ID), sangat stabil untuk penggunaan sehari-hari."; desc_en="Official MIUI Global ROM Indonesian version (ID), highly stable for daily use."},
    @{id="hyperos_v2"; name="HyperOS V2"; version="OS3.0.18.1"; filename="chopin_images_OS3.0.18.1_16.0_V2.zip"; icon="H"; color_start="#0277BD"; color_end="#29B6F6"; desc_id="Sistem operasi HyperOS murni dengan berbagai penyempurnaan di V2."; desc_en="Pure HyperOS operating system with various refinements in V2."},
    @{id="hos22"; name="HOS 2.2 AXL"; version="8.03"; filename="HOS2.2_AXL_8.03_R4等1个文件.zip"; icon="H"; color_start="#00838F"; color_end="#26C6DA"; desc_id="Custom build HOS 2.2 AXL versi R4, ringan dan responsif."; desc_en="Custom build HOS 2.2 AXL version R4, lightweight and responsive."},
    @{id="miui_global"; name="MIUI Global"; version="V14.0.6.0"; filename="MIUI_v1.0_CHOPINGlobal_V14.0.6.0.TKPM.zip"; icon="M"; color_start="#E64A19"; color_end="#FF8A65"; desc_id="ROM Resmi MIUI 14 Global (TKPM) yang stabil dan minim bug."; desc_en="Official MIUI 14 Global ROM (TKPM), stable with minimal bugs."},
    @{id="miuint"; name="MIUINT v3.7"; version="V14.0.8.0"; filename="MIUINT_v3.7_CHOPIN_V14.0.8.0.TKPCNX.zip"; icon="M"; color_start="#C2185B"; color_end="#F06292"; desc_id="Portingan MIUINT yang difokuskan pada kelancaran dan manajemen RAM agresif."; desc_en="MIUINT port focused on smoothness and aggressive RAM management."},
    @{id="ml_miuitn"; name="ML MIUITN"; version="V3.0"; filename="ML_MIUITN_V3.0_Chopin_V14.0.8.0.TKPC.zip"; icon="M"; color_start="#00695C"; color_end="#4DB6AC"; desc_id="MIUITN Modifikasi ML edition, dioptimalkan untuk performa gaming kelas berat."; desc_en="ML Edition modified MIUITN, optimized for heavy gaming performance."},
    @{id="derpfest"; name="Revamp DerpFest"; version="A13"; filename="Revamp DERPFEST GSI A13.zip"; icon="D"; color_start="#4527A0"; color_end="#9575CD"; desc_id="GSI Revamp dari DerpFest, kustomisasi AOSP tanpa batas di Android 13."; desc_en="Revamp GSI of DerpFest, limitless AOSP customization on Android 13."},
    @{id="revamp1251"; name="REVAMP 12.5.1 CN"; version="12.5.1"; filename="REVAMP1251CN.zip"; icon="R"; color_start="#2E7D32"; color_end="#81C784"; desc_id="Basis MIUI 12.5 China yang direvamp total untuk performa ngebut."; desc_en="China MIUI 12.5 base totally revamped for blazing fast performance."},
    @{id="snowflights"; name="Snowflights"; version="OS1.0.11.0"; filename="Snowflights_chopin_images_OS1.0.11.0.T.zip"; icon="S"; color_start="#1565C0"; color_end="#64B5F6"; desc_id="Edition khusus Snowflights, membawa tema es dan tweak efisiensi baterai."; desc_en="Special Snowflights Edition, bringing ice themes and battery efficiency tweaks."},
    @{id="xiaomieu"; name="Xiaomi.eu"; version="V14.0.7.0"; filename="xiaomi.eu_multi_CHOPIN_V14.0.7.0.TKPC.zip"; icon="X"; color_start="#F9A825"; color_end="#FFF176"; desc_id="ROM kustom komunitas Xiaomi.eu terbaik tanpa bloatware dan bebas iklan."; desc_en="The best Xiaomi.eu community custom ROM without bloatware and ad-free."}
)

$index_path = "c:\Users\Louis\Documents\GitHub\hyperos\index.html"
$lang_path = "c:\Users\Louis\Documents\GitHub\hyperos\js\lang.js"
$base_dir = "c:\Users\Louis\Documents\GitHub\hyperos"

$index_content = Get-Content $index_path -Raw -Encoding UTF8

$rom_grid_html = ""
for ($i=0; $i -lt $roms.Length; $i++) {
    $r = $roms[$i]
    $idx = $i + 1
    $card = @"
            <!-- Card $idx -->
            <div class="rom-card">
                <div class="rom-icon" style="background: linear-gradient(135deg, $($r.color_start), $($r.color_end));">$($r.icon)</div>
                <div class="rom-info">
                    <h3>$($r.name)</h3>
                    <p data-lang="desc_$($r.id)">$($r.desc_id)</p>
                </div>
                <div class="card-footer">
                    <span class="version">$($r.version)</span>
                    <a href="$($r.id).html" class="btn-download" data-lang="btn_download">Download</a>
                </div>
            </div>
"@
    $rom_grid_html += $card + "`r`n"
}

$new_index_content = $index_content -replace '(?s)<div class="rom-grid">.*?</div>\s*</section>', "<div class=`"rom-grid`">`r`n$rom_grid_html        </div>`r`n    </section>"
Set-Content -Path $index_path -Value $new_index_content -Encoding UTF8

foreach ($r in $roms) {
    $page_content = @"
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$($r.name) | ROMVault</title>
    <meta name="description" content="Download $($r.name) custom ROM.">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <nav>
        <a href="index.html" class="logo">ROMVault.</a>
        <ul>
            <li><a href="index.html" data-lang="nav_home">Home</a></li>
            <li><a href="index.html#archive" data-lang="nav_archive">Archive</a></li>
            <li><a href="index.html#about" data-lang="nav_about">Tentang</a></li>
            <li>
                <select id="lang-switch" class="lang-switch">
                    <option value="id">🇮🇩 ID</option>
                    <option value="en">🇬🇧 EN</option>
                </select>
            </li>
        </ul>
    </nav>

    <div class="rom-detail-page">
        <header class="hero rom-hero">
            <div class="rom-icon-large" style="background: linear-gradient(135deg, $($r.color_start), $($r.color_end));">$($r.icon)</div>
            <h1>$($r.name)</h1>
            <p data-lang="$($r.id)_hero_desc">$($r.desc_id)</p>
            <div class="hero-actions">
                <a href="#download" class="btn-primary" data-lang="btn_download_now">Download Sekarang</a>
            </div>
        </header>

        <section id="download" class="archive-section download-section">
            <h2 class="section-title" data-lang="$($r.id)_download_title">Pilih File Anda</h2>
            <div class="download-list">
                <div class="download-item">
                    <div class="device-info">
                        <h3>$($r.filename)</h3>
                        <span class="version">$($r.version)</span>
                    </div>
                    <a href="#" class="btn-download" data-lang="btn_get_build">Dapatkan Build</a>
                </div>
            </div>
        </section>
    </div>

    <footer>
        <p data-lang="footer_text">&copy; 2026 ROMVault Archive. Desain UI Premium untuk Komunitas Android.</p>
    </footer>

    <script src="js/lang.js"></script>
</body>
</html>
"@
    $file_path = Join-Path -Path $base_dir -ChildPath "$($r.id).html"
    Set-Content -Path $file_path -Value $page_content -Encoding UTF8
}

$lang_js_content = @"
const translations = {
    id: {
        nav_home: "Home",
        nav_archive: "Archive",
        nav_about: "Tentang",
        hero_title: "Evolusikan Smartphone Anda",
        hero_desc: "Koleksi premium Custom ROM Android terbaik yang disesuaikan untuk memaksimalkan performa, ketahanan baterai, dan privasi perangkat Anda.",
        hero_btn: "Jelajahi ROM",
        archive_title: "Kumpulan Custom ROM",
        btn_download: "Download",
        footer_text: "© 2026 ROMVault Archive. Desain UI Premium untuk Komunitas Android.",
        btn_download_now: "Download Sekarang",
        btn_source: "Source Code",
        btn_get_build: "Dapatkan Build",
"@
$lang_js_content += "`r`n"
foreach ($r in $roms) {
    $lang_js_content += '        desc_' + $r.id + ': "' + $r.desc_id + '",' + "`r`n"
    $lang_js_content += '        ' + $r.id + '_hero_desc: "' + $r.desc_id + '",' + "`r`n"
    $lang_js_content += '        ' + $r.id + '_download_title: "Pilih File Anda",' + "`r`n"
}

$lang_js_content += @"
    },
    en: {
        nav_home: "Home",
        nav_archive: "Archive",
        nav_about: "About",
        hero_title: "Evolve Your Smartphone",
        hero_desc: "Premium collection of the best Custom Android ROMs tailored to maximize performance, battery life, and device privacy.",
        hero_btn: "Explore ROMs",
        archive_title: "Custom ROM Archive",
        btn_download: "Download",
        footer_text: "© 2026 ROMVault Archive. Premium UI Design for the Android Community.",
        btn_download_now: "Download Now",
        btn_source: "Source Code",
        btn_get_build: "Get Build",
"@
$lang_js_content += "`r`n"
foreach ($r in $roms) {
    $lang_js_content += '        desc_' + $r.id + ': "' + $r.desc_en + '",' + "`r`n"
    $lang_js_content += '        ' + $r.id + '_hero_desc: "' + $r.desc_en + '",' + "`r`n"
    $lang_js_content += '        ' + $r.id + '_download_title: "Choose Your File",' + "`r`n"
}

$lang_js_content += @"
    }
};

document.addEventListener('DOMContentLoaded', () => {
    const langSwitch = document.getElementById('lang-switch');
    
    // Check local storage for language preference or default to 'id'
    const currentLang = localStorage.getItem('site_lang') || 'id';
    if (langSwitch) {
        langSwitch.value = currentLang;
    }
    updateLanguage(currentLang);

    if (langSwitch) {
        langSwitch.addEventListener('change', (e) => {
            const newLang = e.target.value;
            localStorage.setItem('site_lang', newLang);
            updateLanguage(newLang);
        });
    }

    function updateLanguage(lang) {
        const elements = document.querySelectorAll('[data-lang]');
        elements.forEach(el => {
            const key = el.getAttribute('data-lang');
            if (translations[lang] && translations[lang][key]) {
                el.textContent = translations[lang][key];
            }
        });
        
        // Update document title and lang attribute
        document.documentElement.lang = lang;
        if (lang === 'en') {
            document.title = "ROMVault | Custom ROM Archive";
        } else {
            document.title = "ROMVault | Kumpulan Custom ROM HP";
        }
    }
});
"@

Set-Content -Path $lang_path -Value $lang_js_content -Encoding UTF8
Write-Output "Pages Generated Successfully!"

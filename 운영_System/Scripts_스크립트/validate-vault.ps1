param(
  [string]$VaultRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path,
  [switch]$Strict
)

$ErrorActionPreference = 'Stop'

$desiredFolders = @(
  '운영_System',
  '운영_System/Templates_템플릿',
  '운영_System/Bases_대시보드',
  '운영_System/Scripts_스크립트',
  '운영_System/Taxonomy_분류체계',
  '수집_Inbox',
  '수집_Inbox/ChatGPT_대화',
  '수집_Inbox/WebClips_웹클립',
  '수집_Inbox/Ideas_아이디어',
  '수집_Inbox/Raw_원본',
  '루틴_Periodic',
  '루틴_Periodic/Daily_일일',
  '루틴_Periodic/Weekly_주간',
  '루틴_Periodic/Monthly_월간',
  '루틴_Periodic/Quarterly_분기',
  '프로젝트_Projects',
  '프로젝트_Projects/portfolio-site_포트폴리오',
  '프로젝트_Projects/image-converter_이미지변환',
  '프로젝트_Projects/prestige_프레스티지',
  '프로젝트_Projects/graduate-school_대학원',
  '프로젝트_Projects/obsidian-automation_옵시디언자동화',
  '영역_Areas',
  '영역_Areas/market-analysis_시장분석',
  '영역_Areas/ai-interactive-media_AI미디어',
  '영역_Areas/study_공부',
  '영역_Areas/career_커리어',
  '영역_Areas/finance-business_금융비즈니스',
  '지식_Knowledge',
  '지식_Knowledge/Concepts_개념',
  '지식_Knowledge/People_인물',
  '지식_Knowledge/Organizations_조직',
  '지식_Knowledge/Technologies_기술',
  '지식_Knowledge/Methods_방법',
  '지식_Knowledge/Questions_질문',
  '자료_Sources',
  '자료_Sources/Articles_아티클',
  '자료_Sources/Papers_논문',
  '자료_Sources/Books_책',
  '자료_Sources/Videos_영상',
  '자료_Sources/Reports_리포트',
  '자료_Sources/Datasets_데이터셋',
  '결과물_Outputs',
  '결과물_Outputs/Essays_에세이',
  '결과물_Outputs/Reports_보고서',
  '결과물_Outputs/Presentations_발표',
  '결과물_Outputs/Product-Ideas_제품아이디어',
  '결과물_Outputs/Research-Proposals_연구제안',
  '보관_Archive'
)

$requiredFrontmatterFields = @(
  'type',
  'status',
  'created',
  'updated',
  'tags'
)

$allowedTypes = @(
  'note',
  'index',
  'template',
  'system-note',
  'system-guide',
  'system-index',
  'dashboard',
  'taxonomy',
  'chatgpt-log',
  'web-clip',
  'idea',
  'project',
  'source',
  'concept',
  'person',
  'organization',
  'technology',
  'method',
  'question',
  'daily-review',
  'weekly-review',
  'monthly-review',
  'output',
  'ai-image',
  'ai-image-gallery'
)

$allowedStatuses = @(
  'inbox',
  'to-process',
  'active',
  'draft',
  'evergreen',
  'reading',
  'waiting',
  'done',
  'archived'
)

$ignoredTopFolders = @('.git', '.obsidian', '.trash', '.smart-env')
$ignoredRelativePrefixes = @(
  'copilot/copilot-custom-prompts/'
)
$attachmentExtensions = @('.png', '.jpg', '.jpeg', '.gif', '.webp', '.pdf')
$issueCount = 0

function Get-RelativePath {
  param(
    [string]$Root,
    [string]$Path
  )

  return $Path.Substring($Root.Length).TrimStart('\', '/')
}

function Normalize-RelativePath {
  param(
    [string]$Path
  )

  return ($Path -replace '\\', '/').TrimStart('/')
}

function Test-IgnoredRelativePath {
  param(
    [string]$RelativePath
  )

  $normalized = Normalize-RelativePath -Path $RelativePath
  $parts = $RelativePath -split '[\\/]'
  if ($parts[0] -in $ignoredTopFolders) {
    return $true
  }

  foreach ($prefix in $ignoredRelativePrefixes) {
    if ($normalized.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) {
      return $true
    }
  }

  return $false
}

function Add-Issue {
  param(
    [string]$Title,
    [object[]]$Items
  )

  $itemsArray = @($Items)
  if ($itemsArray.Count -eq 0) {
    return
  }

  $script:issueCount += $itemsArray.Count
  Write-Warning $Title
  $itemsArray | Sort-Object | ForEach-Object { Write-Host "  - $_" }
}

function Get-FrontmatterText {
  param(
    [string]$Path
  )

  $lines = @(Get-Content -LiteralPath $Path -Encoding UTF8)
  if ($lines.Count -lt 2 -or $lines[0] -ne '---') {
    return $null
  }

  for ($i = 1; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -eq '---') {
      if ($i -eq 1) {
        return ''
      }
      return ($lines[1..($i - 1)] -join "`n")
    }
  }

  return $null
}

function Get-FrontmatterScalar {
  param(
    [string]$Frontmatter,
    [string]$Field
  )

  $match = [regex]::Match($Frontmatter, "(?m)^$([regex]::Escape($Field))\s*:\s*([^`r`n#]+)")
  if (-not $match.Success) {
    return ''
  }

  return $match.Groups[1].Value.Trim().Trim('"', "'")
}

$missingFolders = foreach ($folder in $desiredFolders) {
  $fullPath = Join-Path $VaultRoot $folder
  if (-not (Test-Path -LiteralPath $fullPath -PathType Container)) {
    $folder
  }
}

$allFiles = Get-ChildItem -LiteralPath $VaultRoot -Recurse -File |
  Where-Object {
    $relative = Get-RelativePath -Root $VaultRoot -Path $_.FullName
    -not (Test-IgnoredRelativePath -RelativePath $relative)
  }

$markdownFiles = $allFiles | Where-Object { $_.Extension -eq '.md' }

$missingFrontmatter = foreach ($file in $markdownFiles) {
  $relative = Get-RelativePath -Root $VaultRoot -Path $file.FullName
  $firstLine = Get-Content -LiteralPath $file.FullName -TotalCount 1 -Encoding UTF8
  if ($firstLine -ne '---') {
    $relative
  }
}

$missingRequiredFields = foreach ($file in $markdownFiles) {
  $relative = Get-RelativePath -Root $VaultRoot -Path $file.FullName
  $frontmatter = Get-FrontmatterText -Path $file.FullName
  if ($null -eq $frontmatter) {
    continue
  }

  foreach ($field in $requiredFrontmatterFields) {
    $hasField = [regex]::IsMatch($frontmatter, "(?m)^$([regex]::Escape($field))\s*:")
    if (-not $hasField) {
      "$relative missing $field"
      continue
    }

    if ($field -ne 'tags') {
      $hasValue = [regex]::IsMatch($frontmatter, "(?m)^$([regex]::Escape($field))\s*:\s*\S")
      if (-not $hasValue) {
        "$relative has blank $field"
      }
    }
  }
}

$invalidTypes = foreach ($file in $markdownFiles) {
  $relative = Get-RelativePath -Root $VaultRoot -Path $file.FullName
  $frontmatter = Get-FrontmatterText -Path $file.FullName
  if ($null -eq $frontmatter) {
    continue
  }

  $type = Get-FrontmatterScalar -Frontmatter $frontmatter -Field 'type'
  if ($type -and $type -notin $allowedTypes) {
    "$relative uses type '$type'"
  }
}

$invalidStatuses = foreach ($file in $markdownFiles) {
  $relative = Get-RelativePath -Root $VaultRoot -Path $file.FullName
  $frontmatter = Get-FrontmatterText -Path $file.FullName
  if ($null -eq $frontmatter) {
    continue
  }

  $status = Get-FrontmatterScalar -Frontmatter $frontmatter -Field 'status'
  if ($status -and $status -notin $allowedStatuses) {
    "$relative uses status '$status'"
  }
}

$pathKeys = @{}
$baseNameKeys = @{}

foreach ($file in $allFiles) {
  $relative = Normalize-RelativePath -Path (Get-RelativePath -Root $VaultRoot -Path $file.FullName)
  $relativeKey = $relative.ToLowerInvariant()
  $pathKeys[$relativeKey] = $true

  $relativeWithoutExtension = ($relative -replace '\.[^./]+$', '').ToLowerInvariant()
  $pathKeys[$relativeWithoutExtension] = $true

  $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name).ToLowerInvariant()
  $baseNameKeys[$baseName] = $true
}

$referencedTargets = @{}
$referencedBaseNames = @{}
$brokenWikiLinks = @()

foreach ($file in $markdownFiles) {
  $relativeFile = Get-RelativePath -Root $VaultRoot -Path $file.FullName
  $text = Get-Content -Raw -Encoding UTF8 -LiteralPath $file.FullName
  if ($null -eq $text) {
    continue
  }

  foreach ($match in [regex]::Matches($text, '!?\[\[([^\]|#]+)')) {
    $target = $match.Groups[1].Value.Trim()
    if (-not $target) {
      continue
    }

    $targetNormalized = Normalize-RelativePath -Path $target
    $targetKey = $targetNormalized.ToLowerInvariant()
    $targetWithoutExtension = ($targetNormalized -replace '\.[^./]+$', '').ToLowerInvariant()
    $targetBaseName = [System.IO.Path]::GetFileNameWithoutExtension($target).ToLowerInvariant()

    $referencedTargets[$targetKey] = $true
    $referencedTargets[$targetWithoutExtension] = $true
    $referencedBaseNames[$targetBaseName] = $true

    $targetExists = $pathKeys.ContainsKey($targetKey) -or
      $pathKeys.ContainsKey($targetWithoutExtension) -or
      $baseNameKeys.ContainsKey($targetBaseName)

    if (-not $targetExists) {
      $brokenWikiLinks += "$relativeFile -> $target"
    }
  }

  foreach ($match in [regex]::Matches($text, '!\[[^\]]*\]\(([^)]+)\)')) {
    $target = $match.Groups[1].Value.Trim().Trim('<', '>', '"', "'")
    if (-not $target -or $target -match '^(https?|data):') {
      continue
    }

    $targetNormalized = Normalize-RelativePath -Path $target
    $targetKey = $targetNormalized.ToLowerInvariant()
    $targetWithoutExtension = ($targetNormalized -replace '\.[^./]+$', '').ToLowerInvariant()
    $targetBaseName = [System.IO.Path]::GetFileNameWithoutExtension($target).ToLowerInvariant()

    $referencedTargets[$targetKey] = $true
    $referencedTargets[$targetWithoutExtension] = $true
    $referencedBaseNames[$targetBaseName] = $true
  }
}

$unreferencedAttachments = foreach ($file in $allFiles) {
  if ($file.Extension.ToLowerInvariant() -notin $attachmentExtensions) {
    continue
  }

  $relative = Normalize-RelativePath -Path (Get-RelativePath -Root $VaultRoot -Path $file.FullName)
  $relativeKey = $relative.ToLowerInvariant()
  $relativeWithoutExtension = ($relative -replace '\.[^./]+$', '').ToLowerInvariant()
  $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name).ToLowerInvariant()

  $isReferenced = $referencedTargets.ContainsKey($relativeKey) -or
    $referencedTargets.ContainsKey($relativeWithoutExtension) -or
    $referencedBaseNames.ContainsKey($baseName)

  if (-not $isReferenced) {
    $relative
  }
}

$emptyFolders = Get-ChildItem -LiteralPath $VaultRoot -Recurse -Directory |
  Where-Object {
    $relative = Get-RelativePath -Root $VaultRoot -Path $_.FullName
    -not (Test-IgnoredRelativePath -RelativePath $relative) -and
      -not (Get-ChildItem -LiteralPath $_.FullName -Force | Where-Object { $_.Name -ne '.gitkeep' })
  } |
  ForEach-Object { Get-RelativePath -Root $VaultRoot -Path $_.FullName }

Write-Host "Vault root: $VaultRoot"
Write-Host "Markdown files scanned: $($markdownFiles.Count)"
Write-Host "Files scanned: $($allFiles.Count)"

Add-Issue -Title "Missing desired folders:" -Items $missingFolders
if (@($missingFolders).Count -eq 0) {
  Write-Host "Folder skeleton: OK"
}

Add-Issue -Title "Markdown files without frontmatter:" -Items $missingFrontmatter
if (@($missingFrontmatter).Count -eq 0) {
  Write-Host "Markdown frontmatter: OK"
}

Add-Issue -Title "Markdown files with incomplete required metadata:" -Items $missingRequiredFields
if (@($missingRequiredFields).Count -eq 0) {
  Write-Host "Required metadata: OK"
}

Add-Issue -Title "Markdown files with unknown type values:" -Items $invalidTypes
if (@($invalidTypes).Count -eq 0) {
  Write-Host "Type vocabulary: OK"
}

Add-Issue -Title "Markdown files with unknown status values:" -Items $invalidStatuses
if (@($invalidStatuses).Count -eq 0) {
  Write-Host "Status vocabulary: OK"
}

Add-Issue -Title "Broken wikilinks:" -Items $brokenWikiLinks
if (@($brokenWikiLinks).Count -eq 0) {
  Write-Host "Wikilinks: OK"
}

if (@($unreferencedAttachments).Count -gt 0) {
  Write-Host "Potentially unreferenced attachments:"
  $unreferencedAttachments | Sort-Object | ForEach-Object { Write-Host "  - $_" }
} else {
  Write-Host "Attachment references: OK"
}

if (@($emptyFolders).Count -gt 0) {
  Write-Host "Empty folders: $(@($emptyFolders).Count) (expected while the vault structure is being staged)"
} else {
  Write-Host "Empty folders: none"
}

if ($issueCount -eq 0) {
  Write-Host "Validation result: OK"
} else {
  Write-Host "Validation result: $issueCount issue(s)"
}

if ($Strict -and $issueCount -gt 0) {
  exit 1
}

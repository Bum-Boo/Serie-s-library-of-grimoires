---
type: note
status: active
created: 2026-06-04
updated: 2026-06-04
project:
area: study
topics:
  - blender
  - shader
tags:
  - blender
summary:
related: []
---
#Shader #Blender 
# Principled BSDF
> ![[Pasted image 20260101165404.png]]
> **Base Color**: 재질의 고유 색
> **Metallic**: 비금속(0) <-> 금속(1)
> **Roughness**: 표면 거칠기
> **IOR**: 굴절률
> - 공기: 1.0
> - 물: ~1.33
> - 보통 유리: ~1.45
> - 플라스틱류: 대략 1.4~1.6
> 
> **Alpha**: 투명도(EEVEE에서는 별도의 추가 작업 필요)
> **Specular**: 비금속에서의 반사 강도
> **<font color="#ffc000">Normal</font>**: 표면의 미세한 굴곡 정보, Normal Map과 연결, Vector Data
> **Diffuse**: 난반사(매트 정도)
> **Subsurface**(SSS): 빛이 표면 아래로 들어갔다가 퍼져서 나오는 효과
> - **Weight/Amount**: SSS 강도
> - **Radius**: RGB 채널별로 얼마나 깊게 퍼지는지(피부는 붉은 계열이 더 깊게) 
> - **Scale**: 전체 산산 거리 스케일
> - **Color**: 산란되는 색
> - ※ 라이트/스케일에 민감하게 반응
>
> **Specular**: 비금속의 반사 성질(플라스틱 반짝임)
>  - Specular/Weight: 비금속 반사의 강도
>  - Tint: 반사 색에 Base Color가 얼마나 많이 섞여있는지
>  - Anisotropic Rotation: 그 방향 회전
>  - IOR Level: IOR 기반 반사량 스케일
>
>**Transmission**: 투명 재질(유리/액체)
>**Coat**(Clearcoat): 표면의 투명 코팅 레이어
>- Coat Weight: 코팅 강도
>- Coat Roughness: 코팅 표면 거칠기
>- Coat Normal: 코팅층에만 노멀 적용
>
>**Sheen**: 천, 벨벳, 스웨드의 보송한 재질
> - Sheen Weight: 섬유 강도
> - Sheen Roughness: 섬유 퍼짐 정도
> - Sheen Tint: 섬유광에 색 섞임
> 
> **Emission**: 자체 발광
> **Thin Film**: 얇은 오라빛 기름막
> - Thickness: 두께, 간섭 색 패턴 설정
> - IOR: 박막 재질의 굴절률
# Diffuse BSDF
> 표면 셰이더, 반사 계산 x
> Color: 고유색
> Roughness: 넓게 퍼짐(0) <-> 부드럽게 뿌연 느낌(1)
# Glossy BSDF
> 반사 전담 셰이더
> Color: 반사되는 빛의 색
> Roughness: 거울(0)<->흐릿한 반사(1)
> Distribution: 반사 계산 방식(GGX/Beckmann)
# Glass BSDF
> 반사, 굴절, Cycles에서 가장 발달, 메쉬의 두께 필요
> Color: 유리의 색
> Roughness: 유리의 거칠기
> IOR(Index of Refraction): 굴절률
> - 공기: 1.0
> - 물: ~1.33
> - 유리: ~1.45
> - 다이아몬드: 2.4~
# Refraction BSDF
> 굴절 값만 제어(가벼움)
> Color: 굴절된 빛의 색
> Roughness: 굴절의 흐림 정도
> IOR: 굴절률
# Transparent BSDF
> 반사 x, 굴절 x
> 용도: 알파 마스크, 나뭇잎, UI 평면, 게임리소스
> Color: 투과되는 빛의 색
# Emission
> 빛을 발산한다
> Color: 방출되는 빛의 색
> Strenth: 방출되는 빛의 양
> ※ 랜더러 차이
> - Cycles: 실제 조명
> - Eevee: Bloom으로 연출

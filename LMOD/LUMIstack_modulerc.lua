--
-- Synonyms for the partion modules that explain better what they do.
--
-- This is a manually maintained file.
--

module_version( 'partition/C', 'CPUcompute' )
module_version( 'partition/G', 'GPUcompute' )
module_version( 'partition/D', 'DataVisualisation' )
module_version( 'partition/L', 'login' )

--
-- Modules that should be hidden from regular users
--

if os.getenv( 'LUMI_LMOD_POWERUSER' ) == nil then
    hide_version( 'partition/common' )
    hide_version( 'partition/CrayEnv' )
    hide_version( 'partition/system' )
    hide_version(   'EasyBuild-unlock/LUMI' )
    module_version( 'EasyBuild-unlock/LUMI', 'default' )
    hide_version(   'EasyBuild-production/LUMI' )
    module_version( 'EasyBuild-production/LUMI', 'default' )
    hide_version(   'EasyBuild-infrastructure/LUMI' )
    module_version( 'EasyBuild-infrastructure/LUMI', 'default' )
end

--
--  Cray PE modules
--
if os.getenv( 'LUMI_LMOD_POWERUSER' ) == nil then
    hide_version( 'craype-accel-nvidia70' )
    hide_version( 'craype-x86-broadwell' )
    hide_version( 'craype-x86-skylake' )
    hide_version( 'craype-x86-cascadelake' )
    hide_version( 'craype-x86-icelake' )
    hide_version( 'craype-x86-icelake' )
    hide_version( 'craype-x86-milan-x' )
end

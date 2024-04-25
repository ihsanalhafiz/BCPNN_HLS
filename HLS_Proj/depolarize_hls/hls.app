<project xmlns="com.autoesl.autopilot.project" top="depolarize_hls" enableIndexer="true" name="depolarize_hls" projectType="C/C++">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" optimizeCompile="true" clean="true" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../src_hls/Prj.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../src_hls/Prj.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../../../src_hls/hls_depolarize.cpp" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>


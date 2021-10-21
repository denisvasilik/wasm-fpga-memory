import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

__tag__ = ""
__build__ = 0
__version__ = "{}".format(__tag__)
__commit__ = "0000000"

setuptools.setup(
    name="wasm-fpga-memory",
    version=__version__,
    author="Denis Vasilìk",
    author_email="contact@denisvasilik.com",
    url="https://github.com/denisvasilik/wasm-fpga-memory/",
    project_urls={
        "Bug Tracker": "https://github.com/denisvasilik/wasm-fpga/",
        "Documentation": "https://wasm-fpga.readthedocs.io/en/latest/",
        "Source Code": "https://github.com/denisvasilik/wasm-fpga-memory/",
    },
    description="WebAssembly FPGA Memory",
    long_description=long_description,
    long_description_content_type="text/markdown",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3.6",
        "Operating System :: OS Independent",
    ],
    dependency_links=[],
    package_dir={},
    package_data={},
    data_files=[(
        "wasm-fpga-memory/package", [
            "package/component.xml"
        ]),(
        "wasm-fpga-memory/package/bd", [
            "package/bd/bd.tcl"
        ]),(
        "wasm-fpga-memory/package/xgui", [
            "package/xgui/wasm_fpga_memory_v1_0.tcl"
        ]),(
        "wasm-fpga-memory/ip/WasmFpgaMemoryRam", [
            "ip/WasmFpgaMemoryRam/WasmFpgaMemoryRam.xci"
        ]),(
        "wasm-fpga-memory/resources", [
            "resources/debug.coe",
        ]),(
        "wasm-fpga-memory/src", [
            "src/WasmFpgaMemory.vhd",
            "src/WasmFpgaMemoryPackage.vhd",
        ]),(
        "wasm-fpga-memory/tb", [
            "tb/tb_FileIo.vhd",
            "tb/tb_pkg_helper.vhd",
            "tb/tb_pkg.vhd",
            "tb/tb_std_logic_1164_additions.vhd",
            "tb/tb_Types.vhd",
            "tb/tb_WasmFpgaMemory.vhd",
        ]),(
        'wasm-fpga-memory/simstm', [
            'simstm/Defines.stm',
            'simstm/WasmFpgaMemory.stm',
        ]),(
            "wasm-fpga-memory", [
                "CHANGELOG.md",
                "AUTHORS",
                "LICENSE"
        ])
    ],
    setup_requires=[],
    install_requires=[],
    entry_points={},
)

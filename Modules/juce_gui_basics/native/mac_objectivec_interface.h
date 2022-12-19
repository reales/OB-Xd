/*
 * Native Mac interface
 *
 * Interface from C++ to Objective C
 */

namespace juce
{
	// Mac Clipboard
	class macPasteboard
	{
	public:
		static void copyPresetDataToClipboard(void *data, size_t size);		// Copy Preset data to the clipboard
		static bool containsPresetData();									// Indicates if Preset data is on the clipboard
		static bool fetchPresetDataFromClipboard(juce::MemoryBlock& mb);	// Load Preset from the clipboard into a juce MemoryBlock
	};
} // namespace


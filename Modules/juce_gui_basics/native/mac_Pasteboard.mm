/*
 * Interactions with the Mac Pasteboard
 */

namespace juce
{


/// Copy the supplied Preset data to the clipboard
void macPasteboard::copyPresetDataToClipboard(void *data, size_t size)
{
	NSData *dataToCopy = [NSData dataWithBytes:data length:size];

	NSString *pasteboardType = @"com.discodsp.document.fxb";
	[[NSPasteboard generalPasteboard] declareTypes:@[pasteboardType] owner:nil];
	[[NSPasteboard generalPasteboard] setData:dataToCopy forType:pasteboardType];
}


/// Load a Preset from the clipboard into a juce MemoryBlock
bool macPasteboard::fetchPresetDataFromClipboard(juce::MemoryBlock& mb)
{
	NSString *pasteboardType = @"com.discodsp.document.fxb";
	NSData *data = [[NSPasteboard generalPasteboard] dataForType:pasteboardType];
	if (data != nil)
	{
		mb.replaceAll(data.bytes, data.length);
		return YES;
	}
	return NO;
}


/// Indicates if Preset data is available on the clipboard
bool macPasteboard::containsPresetData()
{
	return [[NSPasteboard generalPasteboard] canReadItemWithDataConformingToTypes:@[@"com.discodsp.document.fxb"]];
}
} // namespace


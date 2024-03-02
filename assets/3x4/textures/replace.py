"""
This script copies svg texture files from the source folder to the destination folder and replaces all the colors with the ones specified in the color dictionary.
"""

import os
import yaml


DEST_FOLDER = '../'

TAILWIND_COLORS = None
REPLACE_INSTRUCTIONS = None


# Load the color dictionary
with open('tailwind_colors.yml') as file:
	TAILWIND_COLORS = yaml.load(file, Loader=yaml.FullLoader)


# Create the destination folder if it doesn't exist
if not os.path.exists(DEST_FOLDER):
	os.makedirs(DEST_FOLDER)


def copy(source_folder, dest_folder, base_color, replace_instructions, inverted=False, marker=""):
	# Create the destination folder if it doesn't exist
	if not os.path.exists(dest_folder):
		os.makedirs(dest_folder)

	print(f'Processing{" "+marker if marker else ""}{" inverted" if inverted else ""} {source_folder} with base color {base_color}')

	# Iterate through all Tailwind colors
	for color in TAILWIND_COLORS:
		# print(f'Processing{" inverted" if inverted else ""} {source_folder} with base color {base_color} and Tailwind color {color}')
		# Copy the source file to the destination folder and replace the colors
		for filename in os.listdir(source_folder):
			id = filename.split('-')[1].split('.')[0]
			# Open the source file and read its content
			with open(f'{source_folder}/{filename}', 'r') as file:
				content = file.read()
				for old_color, new_color in replace_instructions.items():
					content = content.replace(old_color, TAILWIND_COLORS[color][new_color])
				if inverted:
					new_file_name = f'{source_folder}_{color}_{base_color}{"_"+marker if marker else ""}_invert_{id}.svg'
				else:
					new_file_name = f'{source_folder}_{color}_{base_color}{"_"+marker if marker else ""}_{id}.svg'
				with open(f'{dest_folder}/{new_file_name}', 'w') as new_file:
					new_file.write(content)


if __name__ == '__main__':

	# Load the replace instructions
	with open('replace_instructions.yml') as file:
		REPLACE_INSTRUCTIONS = yaml.load(file, Loader=yaml.FullLoader)

	# Iterate through all instruction sets
	for source_folder in REPLACE_INSTRUCTIONS:
		print(f'Processing source folder {source_folder}')

		default = REPLACE_INSTRUCTIONS[source_folder]['default']
		inverted = REPLACE_INSTRUCTIONS[source_folder]['inverted']

		for base_color in default:
			copy(source_folder, DEST_FOLDER, base_color, default[base_color], False, "")

		for base_color in inverted:
			copy(source_folder, DEST_FOLDER, base_color, inverted[base_color], True, "")

		# Load the replace instructions
	with open('replace_instructions_high-contrast.yml') as file:
		REPLACE_INSTRUCTIONS = yaml.load(file, Loader=yaml.FullLoader)

	# Iterate through all instruction sets
	for source_folder in REPLACE_INSTRUCTIONS:
		print(f'Processing source folder {source_folder}')

		default = REPLACE_INSTRUCTIONS[source_folder]['default']
		inverted = REPLACE_INSTRUCTIONS[source_folder]['inverted']

		for base_color in default:
			copy(source_folder, DEST_FOLDER, base_color, default[base_color], False, "hc")

		for base_color in inverted:
			copy(source_folder, DEST_FOLDER, base_color, inverted[base_color], True, "hc")